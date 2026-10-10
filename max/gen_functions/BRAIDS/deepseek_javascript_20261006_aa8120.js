// braids_table.js
// Builds a merged Braids-style wavetable as a Max Data object.
// Layout: [ W0[s0..sN-1], W1[s0..sN-1], ... W255[s0..sN-1] ]
//
// Uses additive synthesis from harmonic curves so the wave shapes
// can be driven from UI. Everything is plain JS + Data.setindex().

autowatch = 1;

var TABLE_SIZE = 256;
var NUM_WAVES  = 256;

// ---------- math helpers ----------

function lerp(a, b, t) { return a + (b - a) * t; }

// Sample a 1D array curve at fractional position 0..1
function sampleCurve(curve, t) {
    var n = curve.length;
    if (n === 0) return 0;
    if (n === 1) return curve[0];
    var x = t * (n - 1);
    var i = Math.floor(x);
    var f = x - i;
    var a = curve[i]         !== undefined ? curve[i]         : curve[n - 1];
    var b = curve[i + 1]     !== undefined ? curve[i + 1]     : curve[n - 1];
    return lerp(a, b, f);
}

// Synthesize one sample from a harmonic amplitude curve.
// curve[0] = fundamental amplitude, curve[1] = 2nd harmonic, etc.
// phase is 0..1
function sampleSpectrum(curve, phase, numHarmonics) {
    var s = 0;
    var norm = 0;
    var n = numHarmonics !== undefined ? Math.min(numHarmonics, curve.length) : curve.length;
    for (var h = 0; h < n; h++) {
        var amp = curve[h];
        if (amp === 0) continue;
        s    += amp * Math.sin(2 * Math.PI * (h + 1) * phase);
        norm += Math.abs(amp);
    }
    return norm > 0 ? s / norm : 0;
}

// ---------- table builders ----------

// Build one wave (TABLE_SIZE samples) as a plain Array.
function buildWave(curve, numHarmonics) {
    var wave = new Array(TABLE_SIZE);
    for (var i = 0; i < TABLE_SIZE; i++) {
        wave[i] = sampleSpectrum(curve, i / TABLE_SIZE, numHarmonics);
    }
    return wave;
}

// Build the full merged table as a Data object.
// curveAt(w) should return the harmonic curve for wave index w.
// (Passing a function lets the caller do anything: morph, sweep, etc.)
function buildMergedTable(curveAt, numHarmonics) {
    var total = TABLE_SIZE * NUM_WAVES;
    var d = new Data(total);

    for (var w = 0; w < NUM_WAVES; w++) {
        var curve = curveAt(w);
        var offset = w * TABLE_SIZE;
        for (var i = 0; i < TABLE_SIZE; i++) {
            d.setindex(offset + i, sampleSpectrum(curve, i / TABLE_SIZE, numHarmonics));
        }
    }
    return d;
}

// Convenience: morph between two harmonic curves across the 256 waves.
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

// Convenience: build WMAP-style grid ordering.
// curveAt(x, y) returns the harmonic curve for grid cell (x,y).
// Grid is 16x16, row-major: offset = (y * 16 + x) * TABLE_SIZE
function buildGridTable(curveAt, numHarmonics) {
    var total = TABLE_SIZE * NUM_WAVES;
    var d = new Data(total);

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

// ---------- exports ----------

exports.TABLE_SIZE = TABLE_SIZE;
exports.NUM_WAVES  = NUM_WAVES;
exports.buildWave         = buildWave;
exports.buildMergedTable  = buildMergedTable;
exports.buildMorph        = buildMorph;
exports.buildGridTable    = buildGridTable;
exports.sampleCurve       = sampleCurve;
exports.sampleSpectrum    = sampleSpectrum;