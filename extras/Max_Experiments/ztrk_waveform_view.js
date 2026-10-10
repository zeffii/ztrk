// lightweight mono waveform display for jsui
// usage: send "set buffername" then bang (or just bang if buffer already set)

mgraphics.init();
mgraphics.relative_coords = 0;   // pixel coordinates (easier)
mgraphics.autofill = 0;

var buf = null;
var bufname = "";
var bg = [0.15, 0.15, 0.15, 1];
var wave = [0.9, 0.9, 0.9, 1];
var linewidth = 1;

function set(name) {
    bufname = name;
    buf = new Buffer(name);
    mgraphics.redraw();
}

function bang() {
    mgraphics.redraw();
}

function paint() {
    var w = mgraphics.size[0];
    var h = mgraphics.size[1];
    var mid = h * 0.5;

    // background
    mgraphics.set_source_rgba(bg);
    mgraphics.rectangle(0, 0, w, h);
    mgraphics.fill();

    if (!buf || buf.framecount() === 0) return;

    var frames = buf.framecount();
    var samplesPerPixel = frames / w;

    mgraphics.set_source_rgba(wave);
    mgraphics.set_line_width(linewidth);

    // peak-style drawing (min/max per column) – looks good and is fast
    for (var x = 0; x < w; x++) {
        var start = Math.floor(x * samplesPerPixel);
        var end   = Math.min(Math.floor((x + 1) * samplesPerPixel), frames);
        if (end <= start) end = start + 1;

        var minv =  1;
        var maxv = -1;

        // peek a small range (channel 1 = mono left)
        var samps = buf.peek(1, start, end - start);
        for (var i = 0; i < samps.length; i++) {
            var v = samps[i];
            if (v < minv) minv = v;
            if (v > maxv) maxv = v;
        }

        var y1 = mid - (maxv * mid);
        var y2 = mid - (minv * mid);

        mgraphics.move_to(x + 0.5, y1);
        mgraphics.line_to(x + 0.5, y2);
    }
    mgraphics.stroke();
}

// optional: force redraw when the jsui is resized
function onresize(w, h) {
    mgraphics.redraw();
}