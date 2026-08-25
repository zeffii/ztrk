// waveform_display_full.js
// Cached mono waveform + zoom + selection + loop + xfade + playhead

mgraphics.init();
mgraphics.relative_coords = 0;
mgraphics.autofill = 0;

// -------------------- state --------------------
var buf = null;
var bufname = "";
var cachedImage = null;
var lastW = 0, lastH = 0;
var dirty = true;               // waveform needs rebuild

// view (in samples)
var viewStart = 0;
var viewEnd   = 0;              // exclusive

// regions (in samples)
var selStart = -1, selEnd = -1;
var loopStart = -1, loopEnd = -1;
var xfadeIn  = 0;               // samples after loopStart
var xfadeOut = 0;               // samples before loopEnd

var playhead = -1;              // samples

// colors
var bg       = [0.12, 0.12, 0.12, 1];
var waveCol  = [0.82, 0.82, 0.82, 1];
var selCol   = [0.25, 0.45, 0.85, 0.35];
var loopCol  = [0.15, 0.65, 0.35, 0.25];
var xfadeCol = [0.9,  0.55, 0.15, 0.40];
var playCol  = [1.0,  0.25, 0.25, 1.0];
var linewidth = 1.0;

// -------------------- public messages --------------------
function set(name) {
    if (name !== bufname) {
        bufname = name;
        buf = new Buffer(name);
        // reset view to full buffer
        if (buf && buf.framecount() > 0) {
            viewStart = 0;
            viewEnd   = buf.framecount();
        }
        dirty = true;
    }
    mgraphics.redraw();
}

function bang() {
    dirty = true;
    mgraphics.redraw();
}

// view (zoom / scroll)
function setview(start, end) {
    viewStart = Math.max(0, start|0);
    viewEnd   = Math.max(viewStart + 1, end|0);
    if (buf) viewEnd = Math.min(viewEnd, buf.framecount());
    dirty = true;
    mgraphics.redraw();
}

// selection
function setselection(start, end) {
    selStart = start|0;
    selEnd   = end|0;
    mgraphics.redraw();
}

function clearselection() {
    selStart = selEnd = -1;
    mgraphics.redraw();
}

// loop region
function setloop(start, end) {
    loopStart = start|0;
    loopEnd   = end|0;
    mgraphics.redraw();
}

function clearloop() {
    loopStart = loopEnd = -1;
    mgraphics.redraw();
}

// xfade lengths (in samples)
function setxfade(xin, xout) {
    xfadeIn  = Math.max(0, xin|0);
    xfadeOut = Math.max(0, xout|0);
    mgraphics.redraw();
}

// playhead
function setplayhead(pos) {
    playhead = pos|0;
    mgraphics.redraw();
}

function onresize(w, h) {
    mgraphics.redraw();
}

// -------------------- helpers --------------------
function sampleToX(sample, w) {
    if (viewEnd <= viewStart) return 0;
    return (sample - viewStart) / (viewEnd - viewStart) * w;
}

function xToSample(x, w) {
    return viewStart + (x / w) * (viewEnd - viewStart);
}

// -------------------- cache rebuild --------------------
function rebuildCache(w, h) {
    if (!buf || buf.framecount() === 0 || viewEnd <= viewStart) {
        cachedImage = null;
        return;
    }

    var off = new MGraphics(w, h);

    // background
    off.set_source_rgba(bg);
    off.rectangle(0, 0, w, h);
    off.fill();

    // waveform (only the visible range)
    var framesInView = viewEnd - viewStart;
    var samplesPerPixel = framesInView / w;
    var mid = h * 0.5;

    off.set_source_rgba(waveCol);
    off.set_line_width(linewidth);

    for (var x = 0; x < w; x++) {
        var start = Math.floor(viewStart + x * samplesPerPixel);
        var end   = Math.min(Math.floor(viewStart + (x + 1) * samplesPerPixel), viewEnd);
        if (end <= start) end = start + 1;

        var samps = buf.peek(1, start, end - start);
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

    cachedImage = new Image(off);
    lastW = w;
    lastH = h;
    dirty = false;
}

// -------------------- paint --------------------
function paint() {
    var w = mgraphics.size[0];
    var h = mgraphics.size[1];

    // rebuild waveform cache only when needed
    if (dirty || w !== lastW || h !== lastH || !cachedImage) {
        rebuildCache(w, h);
    }

    // 1. cached waveform
    if (cachedImage) {
        mgraphics.image_surface_draw(cachedImage);
    } else {
        mgraphics.set_source_rgba(bg);
        mgraphics.rectangle(0, 0, w, h);
        mgraphics.fill();
        return;
    }

    // 2. selection
    if (selStart >= 0 && selEnd > selStart) {
        var x1 = sampleToX(selStart, w);
        var x2 = sampleToX(selEnd, w);
        mgraphics.set_source_rgba(selCol);
        mgraphics.rectangle(x1, 0, x2 - x1, h);
        mgraphics.fill();
    }

    // 3. loop region
    if (loopStart >= 0 && loopEnd > loopStart) {
        var lx1 = sampleToX(loopStart, w);
        var lx2 = sampleToX(loopEnd, w);
        mgraphics.set_source_rgba(loopCol);
        mgraphics.rectangle(lx1, 0, lx2 - lx1, h);
        mgraphics.fill();

        // 4. xfade regions (inside the loop)
        if (xfadeIn > 0) {
            var xin2 = sampleToX(loopStart + xfadeIn, w);
            mgraphics.set_source_rgba(xfadeCol);
            mgraphics.rectangle(lx1, 0, xin2 - lx1, h);
            mgraphics.fill();
        }
        if (xfadeOut > 0) {
            var xout1 = sampleToX(loopEnd - xfadeOut, w);
            mgraphics.set_source_rgba(xfadeCol);
            mgraphics.rectangle(xout1, 0, lx2 - xout1, h);
            mgraphics.fill();
        }

        // optional: thin border around loop
        mgraphics.set_source_rgba(0.2, 0.9, 0.4, 0.8);
        mgraphics.set_line_width(1);
        mgraphics.rectangle(lx1 + 0.5, 0.5, lx2 - lx1 - 1, h - 1);
        mgraphics.stroke();
    }

    // 5. playhead
    if (playhead >= 0) {
        var px = sampleToX(playhead, w);
        mgraphics.set_source_rgba(playCol);
        mgraphics.set_line_width(1.5);
        mgraphics.move_to(px + 0.5, 0);
        mgraphics.line_to(px + 0.5, h);
        mgraphics.stroke();
    }
}