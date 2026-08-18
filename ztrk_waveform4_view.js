// waveform_display_full.js
// Cached mono waveform + zoom + selection + loop + xfade + playhead + mouse + dict out

mgraphics.init();
mgraphics.relative_coords = 0;
mgraphics.autofill = 0;

inlets = 1;
outlets = 1;

// -------------------- state --------------------
var buf = null;
var bufname = "";
var cachedImage = null;
var lastW = 0, lastH = 0;
var dirty = true;

var viewStart = 0;
var viewEnd   = 0;

var selStart = -1, selEnd = -1;
var loopStart = -1, loopEnd = -1;
var xfadeIn  = 0;
var xfadeOut = 0;
var playhead = -1;

// mouse
var dragMode = "none";
var dragOriginSample = 0;
var origA = 0, origB = 0;          // original values when drag started
var HIT = 6;                       // pixel tolerance for edges

// colors
var bg       = [0.12, 0.12, 0.12, 1];
var waveCol  = [0.82, 0.82, 0.82, 1];
var selCol   = [0.25, 0.45, 0.85, 0.35];
var loopCol  = [0.15, 0.65, 0.35, 0.25];
var xfadeCol = [0.9,  0.55, 0.15, 0.40];
var playCol  = [1.0,  0.25, 0.25, 1.0];
var linewidth = 1.0;

// dictionary for output
var d = new Dict();

// -------------------- public messages --------------------
function set(name) {
    if (name !== bufname) {
        bufname = name;
        buf = new Buffer(name);
        if (buf && buf.framecount() > 0) {
            viewStart = 0;
            viewEnd   = buf.framecount();
        }
        dirty = true;
    }
    outputDict();
    mgraphics.redraw();
}

function bang() {
    dirty = true;
    outputDict();
    mgraphics.redraw();
}

function setview(start, end) {
    viewStart = Math.max(0, start|0);
    viewEnd   = Math.max(viewStart + 1, end|0);
    if (buf) viewEnd = Math.min(viewEnd, buf.framecount());
    dirty = true;
    outputDict();
    mgraphics.redraw();
}

function setselection(start, end) {
    selStart = start|0;
    selEnd   = end|0;
    outputDict();
    mgraphics.redraw();
}

function clearselection() {
    selStart = selEnd = -1;
    outputDict();
    mgraphics.redraw();
}

function setloop(start, end) {
    loopStart = start|0;
    loopEnd   = end|0;
    outputDict();
    mgraphics.redraw();
}

function clearloop() {
    loopStart = loopEnd = -1;
    outputDict();
    mgraphics.redraw();
}

function setxfade(xin, xout) {
    xfadeIn  = Math.max(0, xin|0);
    xfadeOut = Math.max(0, xout|0);
    outputDict();
    mgraphics.redraw();
}

function setplayhead(pos) {
    playhead = pos|0;
    outputDict();
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

function clamp(v, lo, hi) {
    return Math.max(lo, Math.min(hi, v));
}

// -------------------- dictionary output --------------------
function outputDict() {
    d.clear();
    d.set("buffer", bufname);
    d.set("viewStart", viewStart);
    d.set("viewEnd", viewEnd);
    d.set("selStart", selStart);
    d.set("selEnd", selEnd);
    d.set("loopStart", loopStart);
    d.set("loopEnd", loopEnd);
    d.set("xfadeIn", xfadeIn);
    d.set("xfadeOut", xfadeOut);
    d.set("playhead", playhead);
    if (buf) {
        d.set("frames", buf.framecount());
        d.set("length_ms", buf.length());
    }
    outlet(0, "dictionary", d.name);
}

// -------------------- cache --------------------
function rebuildCache(w, h) {
    if (!buf || buf.framecount() === 0 || viewEnd <= viewStart) {
        cachedImage = null;
        return;
    }

    var off = new MGraphics(w, h);
    off.set_source_rgba(bg);
    off.rectangle(0, 0, w, h);
    off.fill();

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

    if (dirty || w !== lastW || h !== lastH || !cachedImage) {
        rebuildCache(w, h);
    }

    if (cachedImage) {
        mgraphics.image_surface_draw(cachedImage);
    } else {
        mgraphics.set_source_rgba(bg);
        mgraphics.rectangle(0, 0, w, h);
        mgraphics.fill();
        return;
    }

    // selection
    if (selStart >= 0 && selEnd > selStart) {
        var x1 = sampleToX(selStart, w);
        var x2 = sampleToX(selEnd, w);
        mgraphics.set_source_rgba(selCol);
        mgraphics.rectangle(x1, 0, x2 - x1, h);
        mgraphics.fill();
    }

    // loop + xfade
    if (loopStart >= 0 && loopEnd > loopStart) {
        var lx1 = sampleToX(loopStart, w);
        var lx2 = sampleToX(loopEnd, w);

        mgraphics.set_source_rgba(loopCol);
        mgraphics.rectangle(lx1, 0, lx2 - lx1, h);
        mgraphics.fill();

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

        // loop border
        mgraphics.set_source_rgba(0.2, 0.9, 0.4, 0.8);
        mgraphics.set_line_width(1);
        mgraphics.rectangle(lx1 + 0.5, 0.5, lx2 - lx1 - 1, h - 1);
        mgraphics.stroke();
    }

    // playhead
    if (playhead >= 0) {
        var px = sampleToX(playhead, w);
        mgraphics.set_source_rgba(playCol);
        mgraphics.set_line_width(1.5);
        mgraphics.move_to(px + 0.5, 0);
        mgraphics.line_to(px + 0.5, h);
        mgraphics.stroke();
    }
}

// -------------------- mouse --------------------
function hitTest(x, w) {
    // returns the mode string
    var s = xToSample(x, w);

    // playhead first (highest priority)
    if (playhead >= 0 && Math.abs(sampleToX(playhead, w) - x) <= HIT)
        return "playhead";

    // loop edges
    if (loopStart >= 0) {
        if (Math.abs(sampleToX(loopStart, w) - x) <= HIT) return "loopstart";
        if (Math.abs(sampleToX(loopEnd, w) - x) <= HIT)   return "loopend";

        // xfade edges
        if (xfadeIn > 0 && Math.abs(sampleToX(loopStart + xfadeIn, w) - x) <= HIT)
            return "xfadein";
        if (xfadeOut > 0 && Math.abs(sampleToX(loopEnd - xfadeOut, w) - x) <= HIT)
            return "xfadeout";
    }

    // selection edges
    if (selStart >= 0) {
        if (Math.abs(sampleToX(selStart, w) - x) <= HIT) return "selstart";
        if (Math.abs(sampleToX(selEnd, w) - x) <= HIT)   return "selend";
    }

    // inside regions
    if (loopStart >= 0 && s >= loopStart && s <= loopEnd) return "insideloop";
    if (selStart >= 0 && s >= selStart && s <= selEnd)     return "insidesel";

    return "empty";
}

function onclick(x, y, button, mod1, shift, caps, opt, mod2) {
    var w = mgraphics.size[0];
    var mode = hitTest(x, w);
    dragMode = mode;
    dragOriginSample = xToSample(x, w);

    if (mode === "empty") {
        // start new selection
        selStart = selEnd = Math.round(dragOriginSample);
        dragMode = "selecting";
    }
    else if (mode === "insideloop" && opt) {
        dragMode = "moveloop";
        origA = loopStart;
        origB = loopEnd;
    }
    else if (mode === "insidesel" && opt) {
        dragMode = "movesel";
        origA = selStart;
        origB = selEnd;
    }
    else if (mode === "loopstart" || mode === "loopend") {
        origA = loopStart;
        origB = loopEnd;
    }
    else if (mode === "selstart" || mode === "selend") {
        origA = selStart;
        origB = selEnd;
    }
    else if (mode === "xfadein") {
        origA = xfadeIn;
    }
    else if (mode === "xfadeout") {
        origA = xfadeOut;
    }

    outputDict();
    mgraphics.redraw();
}

function ondrag(x, y, button, mod1, shift, caps, opt, mod2) {
    if (button === 0) {          // mouse up
        dragMode = "none";
        outputDict();
        return;
    }

    var w = mgraphics.size[0];
    var s = xToSample(x, w);
    var delta = s - dragOriginSample;
    if (shift) delta *= 0.15;    // fine control

    var frames = buf ? buf.framecount() : 0;

    switch (dragMode) {
        case "selecting":
        case "selstart":
        case "selend":
            if (dragMode === "selecting") {
                selStart = Math.round(Math.min(dragOriginSample, s));
                selEnd   = Math.round(Math.max(dragOriginSample, s));
            } else if (dragMode === "selstart") {
                selStart = clamp(Math.round(origA + delta), 0, selEnd - 1);
            } else {
                selEnd   = clamp(Math.round(origB + delta), selStart + 1, frames);
            }
            break;

        case "loopstart":
            loopStart = clamp(Math.round(origA + delta), 0, loopEnd - 1);
            // keep xfade legal
            xfadeIn  = Math.min(xfadeIn,  loopEnd - loopStart);
            xfadeOut = Math.min(xfadeOut, loopEnd - loopStart);
            break;

        case "loopend":
            loopEnd = clamp(Math.round(origB + delta), loopStart + 1, frames);
            xfadeIn  = Math.min(xfadeIn,  loopEnd - loopStart);
            xfadeOut = Math.min(xfadeOut, loopEnd - loopStart);
            break;

        case "moveloop":
            var len = origB - origA;
            loopStart = clamp(Math.round(origA + delta), 0, frames - len);
            loopEnd   = loopStart + len;
            break;

        case "movesel":
            var len = origB - origA;
            selStart = clamp(Math.round(origA + delta), 0, frames - len);
            selEnd   = selStart + len;
            break;

        case "xfadein":
            xfadeIn = clamp(Math.round(origA + delta), 0, loopEnd - loopStart);
            break;

        case "xfadeout":
            xfadeOut = clamp(Math.round(origA - delta), 0, loopEnd - loopStart);
            break;

        case "playhead":
            playhead = clamp(Math.round(s), 0, frames - 1);
            break;
    }

    outputDict();
    mgraphics.redraw();
}

function onidle(x, y) {}