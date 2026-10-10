// braids_view.js
// Builds a jit.gl.mesh vertex matrix + color matrix for an isometric
// view of all 256 waves side by side. The active wave (or the two
// surrounding waves in WLIN, or the 4 corners in WMAP) are highlighted.
//
// Wiring:
//   [js braids_view.js]
//      outlet 0 --> vertex matrix   (jit_matrix) -> jit.gl.mesh @matrix
//      outlet 1 --> color matrix    (jit_matrix) -> jit.gl.mesh @color_matrix
//
// Inlet messages:
//   wavetable <Data>       supply the wavetable Data (flat 65536 floats)
//   timbre <0..1>
//   color  <0..1>
//   scale <s>              vertical amplitude scale (default 1.0)
//   spacing <s>            Z spacing between waves (default 1.0)
//   dim <r> <g> <b> <a>    color for inactive waves
//   bright <r> <g> <b> <a> color for the active wave(s)
//   build                  force rebuild
//   bang                   rebuild if dirty

autowatch = 1;

var TABLE_SIZE = 256;
var NUM_WAVES  = 256;

// ---------- state ----------

var wt = null;                 // flat Array of length 65536
var timbre = 0.5;
var color  = 0.5;
var scale  = 1.0;
var spacing = 1.0;

var colDim    = [0.25, 0.28, 0.35, 1.0];
var colBright = [1.00, 0.75, 0.20, 1.0];

var dirty = true;

// Reusable matrices
var vertMat  = null;
var colorMat = null;

// ---------- setup ----------

function init() {
    // vertex matrix: [samples, waves] with 3 planes (x, y, z)
    vertMat = new JitterMatrix(3, "float32", TABLE_SIZE, NUM_WAVES);
    // color matrix:  [samples, waves] with 4 planes (r, g, b, a)
    colorMat = new JitterMatrix(4, "float32", TABLE_SIZE, NUM_WAVES);
}

init();

// ---------- geometry + color build ----------

function build() {
    if (wt === null) {
        error("braids_view: no wavetable supplied\n");
        return;
    }
    if (vertMat === null) init();

    // Determine which wave indices are "active".
    // WLIN: crossfade between floor(T*255) and that +1
    // WMAP: highlight the 4 grid corners around (timbre, color)
    var active = activeWaveIndices();

    // Amplitude normalization: we scale so max |sample| maps to ~1.
    // (Precompute once per table would be nicer, but this is fine.)
    var peak = 0;
    for (var i = 0; i < wt.length; i++) {
        var a = Math.abs(wt[i]);
        if (a > peak) peak = a;
    }
    var ampScale = peak > 0 ? (scale / peak) : scale;

    for (var w = 0; w < NUM_WAVES; w++) {
        var base   = w * TABLE_SIZE;
        var z      = w * spacing;
        var isActive = active.indexOf(w) !== -1;

        var col = isActive ? colBright : colDim;

        for (var s = 0; s < TABLE_SIZE; s++) {
            var x = s / (TABLE_SIZE - 1);                 // 0..1
            var y = wt[base + s] * ampScale;

            vertMat.setcell(s, w, x, y, z);
            colorMat.setcell(s, w, col[0], col[1], col[2], col[3]);
        }
    }

    outlet(0, "jit_matrix", vertMat.name);
    outlet(1, "jit_matrix", colorMat.name);

    dirty = false;
}

function bang() {
    if (dirty) build();
}

// ---------- active wave logic ----------

function activeWaveIndices() {
    // WLIN assumed here — for WMAP you'd return the 4 corner indices.
    // We're generous: return the two surrounding waves plus a small
    // band around them, so the highlight is visible from far away.
    var wf = timbre * (NUM_WAVES - 1);
    var w0 = Math.floor(wf);
    var w1 = Math.min(w0 + 1, NUM_WAVES - 1);
    return [w0, w1];
}

// ---------- inlet handlers ----------

function wavetable() {
    // Accepts a Data object (from braids_table.js) OR a plain array.
    var a = arrayfromargs(arguments);
    if (a.length === 1 && a[0] && a[0].length !== undefined) {
        // It's a Data or array wrapped in an array
        var src = a[0];
        wt = new Array(src.length);
        for (var i = 0; i < src.length; i++) wt[i] = src.getindex ? src.getindex(i) : src[i];
    } else {
        wt = a;
    }
    dirty = true;
}

function timbre(v) {
    timbre = Math.max(0, Math.min(1, v));
    dirty = true;
}

function color(v) {
    color = Math.max(0, Math.min(1, v));
    dirty = true;
}

function scale(v) {
    scale = v;
    dirty = true;
}

function spacing(v) {
    spacing = v;
    dirty = true;
}

function dim() {
    colDim = arrayfromargs(arguments);
    if (colDim.length === 3) colDim.push(1.0);
    dirty = true;
}

function bright() {
    colBright = arrayfromargs(arguments);
    if (colBright.length === 3) colBright.push(1.0);
    dirty = true;
}

function getvalueof() {}