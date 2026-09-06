autowatch = 1;
inlets = 1;
outlets = 0;

mgraphics.init();
mgraphics.relative_coords = 0;
mgraphics.autofill = 0;

// ---------- config ----------
var numTracks = 8;
var buffers = [];
var rowGap = 3;       // gap between tracks
var chanGap = 1;       // gap between channel-strips within a track
var bgColor = [0.05, 0.05, 0.06, 1];

// ---------- Max message handlers ----------
function numtracks(n) {
    numTracks = Math.max(1, n);
    rebuildBuffers();
    mgraphics.redraw();
}

function refresh() { mgraphics.redraw(); }

// ---------- buffer setup ----------
function rebuildBuffers() {
    buffers = [];
    for (var i = 0; i < numTracks; i++) {
        buffers.push(new Buffer(`t${i}_buf`));
    }
}
rebuildBuffers();

// ---------- color mapping ----------
function colorForValue(v) {
    if (v === -1)    return [0.15, 0.15, 0.18, 1];   // empty
    if (v === -0.75) return [0.9, 0.2, 0.3, 1];      // ^^^
    if (v === -0.5)  return [0.2, 0.6, 0.9, 1];      // ===
    if (v === 0)     return null;                    // skip
    var g = Math.min(1, Math.max(0, v));
    return [g, g, g, 1];                             // >0 greyscale
}

// ---------- paint every channel of one track, stacked in [y, y+h] ----------
function paintTrack(buf, x, y, w, h) {
    if (!buf || buf.framecount() === 0) return;

    var frames = buf.framecount();
    var chans = (typeof buf.channelcount === "function") ? buf.channelcount() : 1;
    var cellW = w / frames;
    var chanH = (h - chanGap * (chans - 1)) / chans;

    for (var c = 0; c < chans; c++) {
        var samples = (typeof buf.peekchannel === "function") ? buf.peekchannel(c) : null;
        var chanY = y + c * (chanH + chanGap);

        for (var i = 0; i < frames; i++) {
            var v = samples ? samples[i] : buf.peek(c + 1, i, 1); // peek() chan arg is 1-indexed
            var col = colorForValue(v);
            if (col === null) continue;
            mgraphics.set_source_rgba(col[0], col[1], col[2], col[3]);
            mgraphics.rectangle(x + i * cellW, chanY, Math.max(1, cellW), chanH);
            mgraphics.fill();
        }
    }
}

// ---------- paint ----------
function paint() {
    var w = box.rect[2] - box.rect[0];
    var h = box.rect[3] - box.rect[1];

    mgraphics.set_source_rgba(bgColor[0], bgColor[1], bgColor[2], bgColor[3]);
    mgraphics.rectangle(0, 0, w, h);
    mgraphics.fill();

    if (numTracks < 1) return;

    var rowH = (h - rowGap * (numTracks - 1)) / numTracks;
    for (var t = 0; t < numTracks; t++) {
        var y = t * (rowH + rowGap);
        paintTrack(buffers[t], 0, y, w, rowH);
    }
}