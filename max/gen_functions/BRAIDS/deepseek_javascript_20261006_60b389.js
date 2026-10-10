// braids_ui.js
// Holds UI state, throttles rebuilds, and pushes the merged wavetable
// Data out to a buffer~.
//
// Wiring:
//   [js braids_ui.js]
//      outlet 0 --> Data (the merged wavetable)
//      outlet 1 --> bang (notify view to update)
//
// Inlet messages:
//   setcurveA <vals...>   set harmonic curve A
//   setcurveB <vals...>   set harmonic curve B
//   harmonics <n>         limit number of harmonics used
//   rebuild               force a rebuild now
//   wlin / wmap           choose table layout mode
//   timbre <0..1>         update timbre (view only, audio is in gen~)
//   color  <0..1>         update color  (view only)

autowatch = 1;

var tbl = require("braids_table");

// ---------- state ----------

var curveA = [1, 0.5, 0.25, 0.125];
var curveB = [1, 0.8, 0.6, 0.4, 0.25, 0.15, 0.1, 0.05];
var numHarmonics = 8;
var mode = "wlin";              // "wlin" or "wmap"
var timbre = 0.5;
var color  = 0.5;

var dirty = true;
var lastRebuild = 0;
var REBUILD_INTERVAL_MS = 30;   // throttle

// Cache the Data so we don't reallocate every frame
var cachedData = null;

// ---------- rebuild ----------

function rebuildNow() {
    if (mode === "wlin") {
        cachedData = tbl.buildMorph(curveA, curveB, numHarmonics);
    } else {
        // WMAP: interpolate curveA/curveB along both axes
        cachedData = tbl.buildGridTable(function(x, y) {
            var tx = x / 15;
            var ty = y / 15;
            var t  = (tx + ty) * 0.5;
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

// Called from a [metro] to drive throttled rebuilds
function bang() {
    if (!dirty) return;
    if (Date.now() - lastRebuild < REBUILD_INTERVAL_MS) return;
    rebuildNow();
}

// ---------- inlet handlers ----------

function setcurveA() {
    curveA = arrayfromargs(arguments);
    dirty = true;
}

function setcurveB() {
    curveB = arrayfromargs(arguments);
    dirty = true;
}

function harmonics(n) {
    numHarmonics = Math.max(1, n | 0);
    dirty = true;
}

function mode_wlin() { mode = "wlin"; dirty = true; }
function mode_wmap() { mode = "wmap"; dirty = true; }

// alternate spellings
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

function getvalueof() {
    // no-op, avoids errors from [pattr] probing
}