autowatch = 1;
inlets = 1;
outlets = 0;

mgraphics.init();
mgraphics.relative_coords = 0;
mgraphics.autofill = 0;

// ---------------------------------------------------------------------
// Same config shape as before. Colors stay as normalized RGBA arrays
// since that's what mgraphics.set_source_rgba() expects directly.
// ---------------------------------------------------------------------
var config = {
    params: {
        mod:      0,
        modPhase: 0,
        wet:      0.42,
        dry:      0.55,
        decay:    0.78,
        size:     0.65,
        predelay: 18,
        width:    1
    },
    colors: {
        bg:      [0.05, 0.06, 0.08, 1],
        fg:      [0.85, 0.90, 0.95, 1],
        LCD_bg:  [0.078, 0.651, 0.788, 1],
        LCD_bg2: [0.082, 0.71, 0.86, 1],
        LCD_fg:  [0.863, 0.933, 1.0,  1],
        active:  [0.30, 0.90, 0.98, 1],
        linetype1: [0.85, 0.90, 0.95, 1]
    },
    font: {
        // This must match a font family actually installed on the machine
        // running the patch — mgraphics has no equivalent of loading a
        // .ttf file at runtime the way a browser's FontFace API does.
        family: ["VCR-JP", "normal", "normal"],
        size:   8
    }
};

// Inlet 0: accept a list [paramName, value] to update the readout live
// e.g. sending "decay 1.20" from the patch updates that row and repaints.
function anything() {
    var name = messagename;
    if (config.params.hasOwnProperty(name) && arguments.length > 0) {
        config.params[name] = arguments[0];
        mgraphics.redraw();
    }
}

// ---------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------
function clamp(v, lo, hi) {
    return Math.max(lo, Math.min(hi, v));
}

function lerp(a, b, t) {
    return a + (b - a) * t;
}

// ---------------------------------------------------------------------
// Reverb tail
// ---------------------------------------------------------------------
function draw_reverb_tail(gfx, color, length, curve_amount, offsetX, offsetY) {
    // color        : [r, g, b, a]  (0–1 range)
    // length       : horizontal length of the tail in pixels
    // curve_amount : 0 → almost linear, 1 → strong early decay
    // offsetX/Y    : position of the start of the tail

    curve_amount = clamp(curve_amount, 0, 1);

    var h = mgraphics.size[1];
    var startY = h * 0.18;
    var endY   = h * 0.82;

    // Control points (relative to the start of the tail)
    var cp1x = length * (0.15 + 0.25 * curve_amount);
    var cp1y = startY + (endY - startY) * (0.55 + 0.35 * curve_amount);

    var cp2x = length * (0.55 + 0.25 * (1 - curve_amount));
    var cp2y = endY - (endY - startY) * 0.12 * (1 - curve_amount);

    gfx.set_source_rgba(...color);
    gfx.set_line_width(1.6);
    gfx.set_line_cap("round");
    gfx.set_line_join("round");

    gfx.move_to(offsetX, offsetY + startY);
    gfx.curve_to(
        offsetX + cp1x, offsetY + cp1y,
        offsetX + cp2x, offsetY + cp2y,
        offsetX + length, offsetY + endY
    );
    gfx.stroke();
}

// ---------------------------------------------------------------------
// LCD vignette
// ---------------------------------------------------------------------
function drawLcdVignette(gfx, w, h) {
    const p = gfx.pattern_create_radial(150, 0, 240, 0, 200, 0);
    p.add_color_stop_rgba(0, ...config.colors.LCD_bg2);
    p.add_color_stop_rgba(1, ...config.colors.LCD_bg);

    gfx.set_source(p);
    gfx.rectangle(0, 0, w, h);
    gfx.fill();
}

// ---------------------------------------------------------------------
// Main paint
// ---------------------------------------------------------------------
function paint() {
    var gfx = this.mgraphics;
    var [width, height] = gfx.size;

    // --- backlight fill ---
    drawLcdVignette(gfx, width, height);

    // --- text readout ---
    gfx.select_font_face(...config.font.family);
    gfx.set_font_size(config.font.size);
    gfx.set_source_rgba(...config.colors.LCD_fg);

    var rows = [
        ["WET",      config.params.wet.toFixed(2)],
        ["DRY",      config.params.dry.toFixed(2)],
        ["DECAY",    config.params.decay.toFixed(2) + " S"],
        ["SIZE",     config.params.size.toFixed(2) + " M"],
        ["PREDELAY", config.params.predelay.toFixed(0) + " MS"],
        ["WIDTH",    config.params.width.toFixed(2)]
    ];

    var lineH = config.font.size + 8;
    for (var i = 0; i < rows.length; i++) {
        var y = 16 + i * lineH;
        gfx.move_to(10, y);
        gfx.show_text(rows[i][0]);
        gfx.move_to(100, y);
        gfx.show_text(rows[i][1]);
    }

    // -----------------------------------------------------------------
    // Reactive reverb tail
    // -----------------------------------------------------------------
    var p = config.params;

    // map parameters → visual
    var tailLength   = lerp(90, width - 170, clamp(p.size * 0.65 + p.decay * 0.35, 0, 1));
    var curveAmt     = lerp(0.35, 0.92, clamp(p.decay, 0, 1));          // longer decay → slightly gentler curve
    var tailAlpha    = lerp(0.25, 0.95, clamp(p.wet, 0, 1));
    var predelayGap  = lerp(6, 55, clamp(p.predelay / 100, 0, 1));
    var stereoSpread = lerp(0, 14, clamp(p.width, 0, 1));

    // base colour from your LCD palette, with wet controlling alpha
    var colL = [
        config.colors.linetype1[0],
        config.colors.linetype1[1],
        config.colors.linetype1[2],
        tailAlpha * 0.95
    ];
    var colR = [
        config.colors.active[0],
        config.colors.active[1],
        config.colors.active[2],
        tailAlpha * 0.75
    ];

    var baseX = 150 + predelayGap;
    var baseY = 4;

    // Left channel tail
    draw_reverb_tail(gfx, colL, tailLength, curveAmt, baseX, baseY - stereoSpread * 0.5);

    // Right channel tail (slightly shorter + offset for width)
    draw_reverb_tail(gfx, colR, tailLength * 0.96, curveAmt * 0.97, baseX + 3, baseY + stereoSpread * 0.5);
}

function onresize() {
    mgraphics.redraw();
}