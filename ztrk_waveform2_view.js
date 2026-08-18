// waveform_display_cached.js
// Lightweight mono waveform with image cache
// Only recomputes when buffer or size changes

mgraphics.init();
mgraphics.relative_coords = 0;
mgraphics.autofill = 0;

var buf = null;
var bufname = "";
var cachedImage = null;
var lastW = 0;
var lastH = 0;
var dirty = true;               // force first draw

var bg    = [0.12, 0.12, 0.12, 1];
var wave  = [0.85, 0.85, 0.85, 1];
var linewidth = 1.0;

// -------------------------------------------------
function set(name) {
    if (name !== bufname) {
        bufname = name;
        buf = new Buffer(name);
        dirty = true;
    }
    mgraphics.redraw();
}

function bang() {
    dirty = true;               // force rebuild (e.g. after buffer content changed)
    mgraphics.redraw();
}

function onresize(w, h) {
    // size change will be detected in paint()
    mgraphics.redraw();
}

// -------------------------------------------------
function rebuildCache(w, h) {
    if (!buf || buf.framecount() === 0) {
        cachedImage = null;
        return;
    }

    // Create offscreen MGraphics context
    var off = new MGraphics(w, h);

    // Draw background
    off.set_source_rgba(bg);
    off.rectangle(0, 0, w, h);
    off.fill();

    // Draw waveform (peak style)
    var frames = buf.framecount();
    var samplesPerPixel = frames / w;
    var mid = h * 0.5;

    off.set_source_rgba(wave);
    off.set_line_width(linewidth);

    for (var x = 0; x < w; x++) {
        var start = Math.floor(x * samplesPerPixel);
        var end   = Math.min(Math.floor((x + 1) * samplesPerPixel), frames);
        if (end <= start) end = start + 1;

        var samps = buf.peek(1, start, end - start);   // channel 1 = mono
        var minv = 1, maxv = -1;

        for (var i = 0; i < samps.length; i++) {
            var v = samps[i];
            if (v < minv) minv = v;
            if (v > maxv) maxv = v;
        }

        var y1 = mid - maxv * mid;
        var y2 = mid - minv * mid;

        off.move_to(x + 0.5, y1);
        off.line_to(x + 0.5, y2);
    }
    off.stroke();

    // Convert offscreen context → cached Image
    cachedImage = new Image(off);

    lastW = w;
    lastH = h;
    dirty = false;
}

// -------------------------------------------------
function paint() {
    var w = mgraphics.size[0];
    var h = mgraphics.size[1];

    // Rebuild only when necessary
    if (dirty || w !== lastW || h !== lastH || !cachedImage) {
        rebuildCache(w, h);
    }

    // Fast path: just draw the cached image
    if (cachedImage) {
        mgraphics.image_surface_draw(cachedImage);
    } else {
        // empty / no buffer → just background
        mgraphics.set_source_rgba(bg);
        mgraphics.rectangle(0, 0, w, h);
        mgraphics.fill();
    }
}