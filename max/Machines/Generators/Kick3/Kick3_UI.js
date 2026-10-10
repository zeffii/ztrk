// jsui – Bezier Pitch Curve Visualizer (modern style)
// Inlet 1: curve value (0. → 1.)

mgraphics.init();
mgraphics.relative_coords = 0;
mgraphics.autofill = 0;

var curve = 0.65;
var width, height;

function paint() {
    width  = box.rect[2] - box.rect[0];
    height = box.rect[3] - box.rect[1];

    // background
    mgraphics.set_source_rgba(0.12, 0.12, 0.14, 1);
    mgraphics.rectangle(0, 0, width, height);
    mgraphics.fill();

    // grid lines
    mgraphics.set_source_rgba(0.25, 0.25, 0.28, 1);
    mgraphics.set_line_width(1);
    for (var i = 1; i < 4; i++) {
        var y = height * i / 4;
        mgraphics.move_to(0, y);
        mgraphics.line_to(width, y);
        mgraphics.stroke();
    }

    // === Bezier curve ===
    mgraphics.set_source_rgba(0.3, 0.85, 1.0, 1);
    mgraphics.set_line_width(2.5);

    var steps = 120;
    for (var i = 0; i <= steps; i++) {
        var p = i / steps;

        // same math as the genexpr
        var cp = mix(0.5, 0.15, curve);
        var shaped = (1 - p) * (1 - p) * 0 + 2 * (1 - p) * p * cp + p * p * 1;

        var x = p * width;
        var y = height - (shaped * height);

        if (i === 0) {
            mgraphics.move_to(x, y);
        } else {
            mgraphics.line_to(x, y);
        }
    }
    mgraphics.stroke();

    // start / end markers
    mgraphics.set_source_rgba(1, 0.4, 0.3, 1);
    mgraphics.arc(4, 4, 3.5, 0, 6.28);
    mgraphics.fill();
    mgraphics.arc(width - 4, height - 4, 3.5, 0, 6.28);
    mgraphics.fill();

    // label
    mgraphics.set_source_rgba(0.7, 0.7, 0.75, 1);
    mgraphics.select_font_face("Arial");
    mgraphics.set_font_size(11);
    mgraphics.move_to(8, 16);
    mgraphics.show_text("curve " + curve.toFixed(2));
}

function msg_float(v) {
    curve = clamp(v, 0, 1);
    mgraphics.redraw();
}

function bang() {
    mgraphics.redraw();
}

function clamp(x, min, max) {
    return Math.min(Math.max(x, min), max);
}

function mix(a, b, t) {
    return a + (b - a) * t;
}

function onresize(w, h) {
    mgraphics.redraw();
}