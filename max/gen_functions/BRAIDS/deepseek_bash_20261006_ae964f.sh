#!/usr/bin/env bash
set -e

ROOT=braids_pack
rm -rf "$ROOT"
mkdir -p "$ROOT/js" "$ROOT/gen"

# ---------- README.md ----------
cat > "$ROOT/README.md" <<'EOF'
# Braids-style Wavetable Pack for Max/MSP

A minimal, hackable pack for building and displaying Braids-style
wavetable oscillators in Max, using JS for table generation and
visualization, and gen~ for audio-rate playback.

## Files

- js/braids_table.js   - builds a merged wavetable Data from curves
- js/braids_ui.js      - UI state, throttled rebuild, buffer~ push
- js/braids_view.js    - builds jit.gl.mesh vertex + color matrices
- gen/braids_osc.gendsp - gen~ codebox source for audio playback

## Data layout

[ W0[s0..s255], W1[s0..s255], ... W255[s0..s255] ]
- TABLE_SIZE = 256
- NUM_WAVES  = 256
- Total      = 65536 floats
EOF

# ---------- js/braids_table.js ----------
cat > "$ROOT/js/braids_table.js" <<'EOF'
autowatch = 1;

var TABLE_SIZE = 256;
var NUM_WAVES  = 256;

function lerp(a, b, t) { return a + (b - a) * t; }

function sampleCurve(curve, t) {
    var n = curve.length;
    if (n === 0) return 0;
    if (n === 1) return curve[0];
    var x = t * (n - 1);
    var i = Math.floor(x);
    var f = x - i;
    var a = curve[i]     !== undefined ? curve[i]     : curve[n - 1];
    var b = curve[i + 1] !== undefined ? curve[i + 1] : curve[n - 1];
    return lerp(a, b, f);
}

function sampleSpectrum(curve, phase, numHarmonics) {
    var s = 0, norm = 0;
    var n = numHarmonics !== undefined ? Math.min(numHarmonics, curve.length) : curve.length;
    for (var h = 0; h < n; h++) {
        var amp = curve[h];
        if (amp === 0) continue;
        s    += amp * Math.sin(2 * Math.PI * (h + 1) * phase);
        norm += Math.abs(amp);
    }
    return norm > 0 ? s / norm : 0;
}

function buildWave(curve, numHarmonics) {
    var wave = new Array(TABLE_SIZE);
    for (var i = 0; i < TABLE_SIZE; i++) {
        wave[i] = sampleSpectrum(curve, i / TABLE_SIZE, numHarmonics);
    }
    return wave;
}

function buildMergedTable(curveAt, numHarmonics) {
    var d = new Data(TABLE_SIZE * NUM_WAVES);
    for (var w = 0; w < NUM_WAVES; w++) {
        var curve = curveAt(w);
        var offset = w * TABLE_SIZE;
        for (var i = 0; i < TABLE_SIZE; i++) {
            d.setindex(offset + i, sampleSpectrum(curve, i / TABLE_SIZE, numHarmonics));
        }
    }
    return d;
}

function buildMorph(curveA, curveB, numHarmonics) {
    return buildMergedTable(function(w) {
        var t = NUM_WAVES > 1 ? w / (NUM_WAVES - 1) : 0;
        var n = Math.max(curveA.length, curveB.length);
        var blended = new Array(n);
        for (var h = 0; h < n; h++) {
            var a = curveA[h] !== undefined ? curveA[h] : 0;
            var b = curveB[h] !== undefined ? curveB[h] : 0;
            blended[h] = lerp(a, b, t);
        }
        return blended;
    }, numHarmonics);
}

function buildGridTable(curveAt, numHarmonics) {
    var d = new Data(TABLE_SIZE * NUM_WAVES);
    for (var y = 0; y < 16; y++) {
        for (var x = 0; x < 16; x++) {
            var w = y * 16 + x;
            var curve = curveAt(x, y);
            var offset = w * TABLE_SIZE;
            for (var i = 0; i < TABLE_SIZE; i++) {
                d.setindex(offset + i, sampleSpectrum(curve, i / TABLE_SIZE, numHarmonics));
            }
        }
    }
    return d;
}

exports.TABLE_SIZE = TABLE_SIZE;
exports.NUM_WAVES  = NUM_WAVES;
exports.buildWave        = buildWave;
exports.buildMergedTable = buildMergedTable;
exports.buildMorph       = buildMorph;
exports.buildGridTable   = buildGridTable;
exports.sampleCurve      = sampleCurve;
exports.sampleSpectrum   = sampleSpectrum;
EOF

# ---------- js/braids_ui.js ----------
cat > "$ROOT/js/braids_ui.js" <<'EOF'
autowatch = 1;

var tbl = require("braids_table");

var curveA = [1, 0.5, 0.25, 0.125];
var curveB = [1, 0.8, 0.6, 0.4, 0.25, 0.15, 0.1, 0.05];
var numHarmonics = 8;
var mode = "wlin";
var timbre = 0.5;
var color  = 0.5;

var dirty = true;
var lastRebuild = 0;
var REBUILD_INTERVAL_MS = 30;

var cachedData = null;

function rebuildNow() {
    if (mode === "wlin") {
        cachedData = tbl.buildMorph(curveA, curveB, numHarmonics);
    } else {
        cachedData = tbl.buildGridTable(function(x, y) {
            var t = ((x / 15) + (y / 15)) * 0.5;
            var n = Math.max(curveA.length, curveB.length);
            var blended = new Array(n);
            for (var h = 0; h < n; h++) {
                var a = curveA[h] !== undefined ? curveA[h] : 0;
                var b = curveB[h] !== undefined ? curveB[h] : 0;
                blended[h] = a + (b - a) * t;
            }
            return blended;
        }, numHarmonics);
    }
    outlet(0, cachedData);
    outlet(1, "bang");
    dirty = false;
    lastRebuild = Date.now();
}

function bang() {
    if (!dirty) return;
    if (Date.now() - lastRebuild < REBUILD_INTERVAL_MS) return;
    rebuildNow();
}

function setcurveA() { curveA = arrayfromargs(arguments); dirty = true; }
function setcurveB() { curveB = arrayfromargs(arguments); dirty = true; }
function harmonics(n) { numHarmonics = Math.max(1, n | 0); dirty = true; }

function mode_wlin() { mode = "wlin"; dirty = true; }
function mode_wmap() { mode = "wmap"; dirty = true; }
function wlin() { mode_wlin(); }
function wmap() { mode_wmap(); }

function rebuild() { dirty = true; rebuildNow(); }

function timbre(v) {
    timbre = Math.max(0, Math.min(1, v));
    outlet(1, "timbre", timbre);
}
function color(v) {
    color = Math.max(0, Math.min(1, v));
    outlet(1, "color", color);
}

function getvalueof() {}
EOF

# ---------- js/braids_view.js ----------
cat > "$ROOT/js/braids_view.js" <<'EOF'
autowatch = 1;

var TABLE_SIZE = 256;
var NUM_WAVES  = 256;

var wt = null;
var timbre = 0.5;
var color  = 0.5;
var scale  = 1.0;
var spacing = 1.0;

var colDim    = [0.25, 0.28, 0.35, 1.0];
var colBright = [1.00, 0.75, 0.20, 1.0];

var dirty = true;
var vertMat  = null;
var colorMat = null;

function init() {
    vertMat  = new JitterMatrix(3, "float32", TABLE_SIZE, NUM_WAVES);
    colorMat = new JitterMatrix(4, "float32", TABLE_SIZE, NUM_WAVES);
}
init();

function build() {
    if (wt === null) { error("braids_view: no wavetable supplied\n"); return; }
    if (vertMat === null) init();

    var active = activeWaveIndices();

    var peak = 0;
    for (var i = 0; i < wt.length; i++) {
        var a = Math.abs(wt[i]);
        if (a > peak) peak = a;
    }
    var ampScale = peak > 0 ? (scale / peak) : scale;

    for (var w = 0; w < NUM_WAVES; w++) {
        var base = w * TABLE_SIZE;
        var z    = w * spacing;
        var isActive = active.indexOf(w) !== -1;
        var col = isActive ? colBright : colDim;

        for (var s = 0; s < TABLE_SIZE; s++) {
            var x = s / (TABLE_SIZE - 1);
            var y = wt[base + s] * ampScale;
            vertMat.setcell(s, w, x, y, z);
            colorMat.setcell(s, w, col[0], col[1], col[2], col[3]);
        }
    }

    outlet(0, "jit_matrix", vertMat.name);
    outlet(1, "jit_matrix", colorMat.name);
    dirty = false;
}

function bang() { if (dirty) build(); }

function activeWaveIndices() {
    var wf = timbre * (NUM_WAVES - 1);
    var w0 = Math.floor(wf);
    var w1 = Math.min(w0 + 1, NUM_WAVES - 1);
    return [w0, w1];
}

function wavetable() {
    var a = arrayfromargs(arguments);
    if (a.length === 1 && a[0] && a[0].length !== undefined) {
        var src = a[0];
        wt = new Array(src.length);
        for (var i = 0; i < src.length; i++) {
            wt[i] = src.getindex ? src.getindex(i) : src[i];
        }
    } else {
        wt = a;
    }
    dirty = true;
}

function timbre(v) { timbre = Math.max(0, Math.min(1, v)); dirty = true; }
function color(v)  { color  = Math.max(0, Math.min(1, v)); dirty = true; }
function scale(v)  { scale  = v; dirty = true; }
function spacing(v){ spacing = v; dirty = true; }

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
EOF

# ---------- gen/braids_osc.gendsp ----------
cat > "$ROOT/gen/braids_osc.gendsp" <<'EOF'
// Paste this into a gen~ codebox.
// Data param `wt` must be bound to the merged wavetable buffer.
// WLIN variant.

Param timbre(0.5);
Param color(0.5);
Param freq(220);

Data wt;

TABLE_SIZE = 256;

Phase = wrap(Phase + freq / samplerate);

WaveIdx = timbre * 255;
W0 = floor(WaveIdx);
W1 = min(W0 + 1, 255);
Frac = WaveIdx - W0;

StartA = W0 * TABLE_SIZE;
StartB = W1 * TABLE_SIZE;

SampleA = wave(wt, Phase, StartA, StartA + TABLE_SIZE, interp="linear");
SampleB = wave(wt, Phase, StartB, StartB + TABLE_SIZE, interp="linear");

Out1 = SampleA * (1 - Frac) + SampleB * Frac;

// ---- WMAP variant (replace the WLIN block above to use) ----
// GX = timbre * 15;  GY = color * 15;
// X0 = floor(GX); Y0 = floor(GY);
// XF = GX - X0;   YF = GY - Y0;
// idx(c, r) = (r * 16 + c) * TABLE_SIZE;
// A = wave(wt, Phase, idx(X0,     Y0),     idx(X0,     Y0)     + TABLE_SIZE, interp="linear");
// B = wave(wt, Phase, idx(X0 + 1, Y0),     idx(X0 + 1, Y0)     + TABLE_SIZE, interp="linear");
// C = wave(wt, Phase, idx(X0,     Y0 + 1), idx(X0,     Y0 + 1) + TABLE_SIZE, interp="linear");
// D = wave(wt, Phase, idx(X0 + 1, Y0 + 1), idx(X0 + 1, Y0 + 1) + TABLE_SIZE, interp="linear");
// Top    = A * (1 - XF) + B * XF;
// Bottom = C * (1 - XF) + D * XF;
// Out1   = Top * (1 - YF) + Bottom * YF;
EOF

# ---------- zip it ----------
zip -r "${ROOT}.zip" "$ROOT" > /dev/null
echo "Created ${ROOT}.zip"