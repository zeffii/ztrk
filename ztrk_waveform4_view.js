// waveform_display_full.js
// Cached mono waveform + zoom + selection + loop + equal xfade + playhead + mouse + dict
// Proper hybrid rendering (peak style vs true sample lines)

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
var xfade = 0;                  // single value – applied equally on both sides
var playhead = -1;

// mouse
var dragMode = "none";
var dragOriginSample = 0;
var origA = 0, origB = 0;
var HIT = 6;                    // pixel tolerance

// colors
var bg       = [0.12, 0.12, 0.12, 1];
var waveCol  = [0.82, 0.82, 0.82, 1];
var selCol   = [0.25, 0.45, 0.85, 0.35];
var loopCol  = [0.15, 0.65, 0.35, 0.25];
var xfadeCol = [0.9,  0.55, 0.15, 0.40];
var playCol  = [1.0,  0.25, 0.25, 1.0];
var linewidth = 1.0;

// dictionary
var d = new Dict();

function getType(obj) {
    return Object.prototype.toString.call(obj).slice(8, -1).toLowerCase();
}


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
    clampXfade();
    outputDict();
    mgraphics.redraw();
}

function clearloop() {
    loopStart = loopEnd = -1;
    xfade = 0;
    outputDict();
    mgraphics.redraw();
}

function setxfade(len) {
    xfade = Math.max(0, len|0);
    clampXfade();
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

function clampXfade() {
    if (loopStart >= 0 && loopEnd > loopStart) {
        var maxX = Math.floor((loopEnd - loopStart) / 2);
        xfade = Math.min(xfade, maxX);
    } else {
        xfade = 0;
    }
}

// -------------------- dictionary --------------------
function outputDict() {
    d.clear();
    d.set("buffer", bufname);
    d.set("viewStart", viewStart);
    d.set("viewEnd", viewEnd);
    d.set("selStart", selStart);
    d.set("selEnd", selEnd);
    d.set("loopStart", loopStart);
    d.set("loopEnd", loopEnd);
    d.set("xfade", xfade);
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
    var framesInView = viewEnd - viewStart;
    var mid = h * 0.5;

    // ---------------------------------------------------------
    // Background
    // ---------------------------------------------------------
    off.set_source_rgba(0, 0, 0, 1);
    off.rectangle(0, 0, w, h);
    off.fill();

    // ---------------------------------------------------------
    // Waveform
    // ---------------------------------------------------------
    off.set_source_rgba(1, 1, 1, 1);

    if (framesInView >= (2.0 * w)) {

        // PEAK MODE

        var samplesPerPixel = framesInView / w;

        for (var x = 0; x < w; x++) {

            // Exact source-frame range corresponding to this destination pixel.
            var start = Math.floor(viewStart + x * samplesPerPixel);
            var end   = Math.floor(viewStart + (x + 1) * samplesPerPixel);

            // Clamp to the visible view / buffer.
            start = Math.max(viewStart, start);
            end   = Math.min(viewEnd, end);

            if (end <= start)
                continue;

            var samps = buf.peek(1, start, end - start);

            if (!samps || samps.length === 0)
                continue;

            var minv = 1.0;
            var maxv = -1.0;

            for (var i = 0; i < samps.length; i++) {
                var v = samps[i];

                if (v < minv)
                    minv = v;

                if (v > maxv)
                    maxv = v;
            }

            var y1 = mid - maxv * mid;
            var y2 = mid - minv * mid;

            var top    = Math.min(y1, y2);
            var height = Math.abs(y2 - y1);

            // Always occupy at least one device pixel vertically.
            if (height < 1){
                height = 1;
            }

            off.rectangle(x, top, 1, height);
            off.fill();
        }

    } else {

        // TRUE SAMPLE MODE
        var first = true;

        off.set_line_width(1.2);
        for (var i = viewStart; i < viewEnd; i++) {

            var v = buf.peek(1, i, 1);
            var x = ((i - viewStart) / framesInView) * w;
            var y = mid - v * mid;
            
            if (first) {
                off.move_to(x, y);
                first = false;
            } else {
                off.line_to(x, y);
            }
        }

        if (!first){
            off.stroke();
        }

    }

    // ---------------------------------------------------------
    // Create cached image
    // ---------------------------------------------------------
    cachedImage = new Image(off);

    lastW = w;
    lastH = h;
    dirty = false;
}

// -------------------- paint --------------------
function paint() {
    var w = mgraphics.size[0];
    var h = mgraphics.size[1];
    // post(`width ${w}, height ${h}`);

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

    // loop + equal xfade
    if (loopStart >= 0 && loopEnd > loopStart) {
        var lx1 = sampleToX(loopStart, w);
        var lx2 = sampleToX(loopEnd, w);

        mgraphics.set_source_rgba(loopCol);
        mgraphics.rectangle(lx1, 0, lx2 - lx1, h);
        mgraphics.fill();

        if (xfade > 0) {
            // left xfade
            var xin2 = sampleToX(loopStart + xfade, w);
            mgraphics.set_source_rgba(xfadeCol);
            mgraphics.rectangle(lx1, 0, xin2 - lx1, h);
            mgraphics.fill();

            // right xfade (same length)
            var xout1 = sampleToX(loopEnd - xfade, w);
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
    var s = xToSample(x, w);

    if (playhead >= 0 && Math.abs(sampleToX(playhead, w) - x) <= HIT)
        return "playhead";

    if (loopStart >= 0) {
        if (Math.abs(sampleToX(loopStart, w) - x) <= HIT) return "loopstart";
        if (Math.abs(sampleToX(loopEnd, w) - x) <= HIT)   return "loopend";

        if (xfade > 0) {
            if (Math.abs(sampleToX(loopStart + xfade, w) - x) <= HIT) return "xfade";
            if (Math.abs(sampleToX(loopEnd   - xfade, w) - x) <= HIT) return "xfade";
        }
    }

    if (selStart >= 0) {
        if (Math.abs(sampleToX(selStart, w) - x) <= HIT) return "selstart";
        if (Math.abs(sampleToX(selEnd, w) - x) <= HIT)   return "selend";
    }

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
    else if (mode === "xfade") {
        origA = xfade;
    }

    outputDict();
    mgraphics.redraw();
}

function ondrag(x, y, button, mod1, shift, caps, opt, mod2) {
    if (button === 0) {
        dragMode = "none";
        outputDict();
        return;
    }

    var w = mgraphics.size[0];
    var s = xToSample(x, w);
    var delta = s - dragOriginSample;
    if (shift) delta *= 0.15;

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
                selEnd = clamp(Math.round(origB + delta), selStart + 1, frames);
            }
            break;

        case "loopstart":
            loopStart = clamp(Math.round(origA + delta), 0, loopEnd - 1);
            clampXfade();
            break;

        case "loopend":
            loopEnd = clamp(Math.round(origB + delta), loopStart + 1, frames);
            clampXfade();
            break;

        case "moveloop":
            var len = origB - origA;
            loopStart = clamp(Math.round(origA + delta), 0, frames - len);
            loopEnd   = loopStart + len;
            clampXfade();
            break;

        case "movesel":
            var len = origB - origA;
            selStart = clamp(Math.round(origA + delta), 0, frames - len);
            selEnd   = selStart + len;
            break;

        case "xfade":
            var center = (loopStart + loopEnd) * 0.5;
            var newXfade = Math.round(Math.abs(s - (s < center ? loopStart : loopEnd)));
            var maxX = Math.floor((loopEnd - loopStart) / 2);
            xfade = clamp(newXfade, 0, maxX);
            break;

        case "playhead":
            playhead = clamp(Math.round(s), 0, frames - 1);
            break;
    }

    outputDict();
    mgraphics.redraw();
}

function onidle(x, y) {
    var w = mgraphics.size[0];
    var mode = hitTest(x, w);

    if (mode === "playhead" || mode === "loopstart" || mode === "loopend" ||
        mode === "selstart" || mode === "selend" || mode === "xfade") {
        setcursor(8);               // left-right resize
    } else if (mode === "insideloop" || mode === "insidesel") {
        setcursor(7);               // dragging hand
    } else {
        setcursor(1);               // arrow
    }
}

function onidleout(x, y) {
    setcursor(1);
}