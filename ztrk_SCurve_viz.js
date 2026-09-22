// s-curve-viz.js
// Fixed version – endpoints stay locked, proper Y mapping

mgraphics.init();
mgraphics.relative_coords = 0;
mgraphics.autofill = 0;

var intensity = 2.0;
var inflection = 0.5;
var outMin = 0.0;
var outMax = 1.0;
var width, height;

declareattribute("intensity",  {type:"float", default:2.0, min:-8, max:8, setter:"setIntensity"});
declareattribute("inflection", {type:"float", default:0.5, min:0, max:1, setter:"setInflection"});
declareattribute("outMin",     {type:"float", default:0.0, setter:"setMin"});
declareattribute("outMax",     {type:"float", default:1.0, setter:"setMax"});

function setIntensity(v)  { intensity = v; mgraphics.redraw(); }
function setInflection(v) { inflection = Math.max(0, Math.min(1, v)); mgraphics.redraw(); }
function setMin(v)        { outMin = v; mgraphics.redraw(); }
function setMax(v)        { outMax = v; mgraphics.redraw(); }

// Classic logistic + endpoint normalization
function sCurve(t, intensity, inflection) {
    var k = intensity * 8.0;
    var inf = Math.max(0.001, Math.min(0.999, inflection));

    function logistic(x) {
        return 1.0 / (1.0 + Math.exp(-k * (x - inf)));
    }

    var raw  = logistic(t);
    var raw0 = logistic(0);
    var raw1 = logistic(1);

    return (raw - raw0) / (raw1 - raw0 + 1e-12);
}

function paint() {
    width  = box.rect[2] - box.rect[0];
    height = box.rect[3] - box.rect[1];

    // Background
    mgraphics.set_source_rgba(0.12, 0.12, 0.12, 1);
    mgraphics.rectangle(0, 0, width, height);
    mgraphics.fill();

    // Grid
    mgraphics.set_source_rgba(0.25, 0.25, 0.25, 1);
    mgraphics.set_line_width(1);
    for (var i = 1; i < 4; i++) {
        var y = height * i / 4;
        mgraphics.move_to(0, y);
        mgraphics.line_to(width, y);
        mgraphics.stroke();

        var x = width * i / 4;
        mgraphics.move_to(x, 0);
        mgraphics.line_to(x, height);
        mgraphics.stroke();
    }

    // S-Curve (always drawn normalized 0→1 for clear visualization)
    mgraphics.set_source_rgba(1.0, 0.65, 0.1, 1);
    mgraphics.set_line_width(2);

    var first = true;
    for (var x = 0; x <= width; x++) {
        var t = x / width;
        var s = sCurve(t, intensity, inflection);   // 0 → 1

        // Map 0→1 to the full height of the box
        var y = height - s * height;

        if (first) {
            mgraphics.move_to(x, y);
            first = false;
        } else {
            mgraphics.line_to(x, y);
        }
    }
    mgraphics.stroke();

    // Inflection marker
    mgraphics.set_source_rgba(0.4, 0.8, 1.0, 0.7);
    mgraphics.set_line_width(1);
    var ix = inflection * width;
    mgraphics.move_to(ix, 0);
    mgraphics.line_to(ix, height);
    mgraphics.stroke();
}

function bang()     { mgraphics.redraw(); }
function onresize() { mgraphics.redraw(); }

/*
// latest scurve
// Fixed-endpoint classic S-Curve
// in1 = x (0→1)
// in2 = Intensity
// in3 = Inflection (0→1)

k = in2 * 8.0;
inf = clip(in3, 0.001, 0.999);
t = clip(in1, 0, 1);

// Classic logistic
raw  = 1.0 / (1.0 + exp(-k * (t   - inf)));
raw0 = 1.0 / (1.0 + exp(-k * (0.0 - inf)));
raw1 = 1.0 / (1.0 + exp(-k * (1.0 - inf)));

// Normalize endpoints
out1 = (raw - raw0) / (raw1 - raw0 + 1e-9);

/////// AND 

// Geometry
drumRadius          // metres (e.g. 0.22 → 22")
drumDepth           // metres
hitRadius           // 0 → drumRadius (distance from centre)

// Vellum
vellumThickness     // relative 0.2–2.0
tightness           // base tension 0–1
tightnessEnv        // optional envelope amount
inflection          // S-curve inflection point 0–1
membraneDamp        // 0–1

// Stroke
strokeIntensity     // 0–1
strokeLinger        // contact time 0–1
strokeMaterial      // 0 = soft, 1 = hard
beaterSize          // relative contact radius

// Cavity
cavityDamp          // 0–1
coupling            // membrane ↔ cavity 0–1

// Global
loudness            // 0–1

// Scaled S-curve with configurable inflection
scurve(x, inflection) {
    // x expected 0–1
    float k = 8.0;               // steepness
    float c = inflection;
    return 1.0 / (1.0 + exp(-k * (x - c)));
}

float tens = tightness;
if (tightnessEnv > 0) {
    // example: use a short envelope triggered on hit
    tens += tightnessEnv * (scurve(env, inflection) - 0.5);
}
tens = clip(tens, 0.05, 1.5);

// Triggered impulse / short burst
float excite = 0;

if (trigger) {
    // Contact duration shaped by linger + material
    float contact = 0.002 + strokeLinger * 0.015;
    contact *= (1.2 - 0.6 * strokeMaterial);   // harder = shorter

    // Simple raised-cosine or noise burst
    excite = strokeIntensity * (1.0 - strokeMaterial * 0.4) 
           * window(contact) 
           + strokeMaterial * noise() * 0.3 * strokeIntensity;
}

float baseFreq = (tensionFactor * sqrt(tens / vellumThickness)) / drumRadius;

// Normalised hit position 0 = centre, 1 = edge
float r = hitRadius / drumRadius;

// Bessel-related approximate gain for mode (m,n)
float gain_01 = besselGain(0, 1, r);
float gain_11 = besselGain(1, 1, r);
// etc.

float cavityFreq = 40 + 80 * (drumRadius / drumDepth);   // rough
// or more accurate volume-based formula

// One-pole or bandpass resonator
// Driven by membrane velocity or displacement
cavity = resonator(membraneOut * coupling, cavityFreq, cavityDamp);

// Pitch glide / spectral densification on hard hits
float nonlin = strokeIntensity * strokeIntensity;
modeFreq *= 1.0 + nonlin * 0.08 * currentAmplitude;

// Soft saturation on the membrane sum
membraneSum = tanh(membraneSum * (1.0 + nonlin));

float out = (membraneSum + cavity * 0.7) * loudness;
out = lowpass(out, 6000);          // mild speaker / radiation filter
out = tanh(out * 1.3);             // pleasant glue
out1 = out;


// Example: tightness control
tightnessBase = ...;               // 0–1 from a dial
tightnessEnv  = ...;               // short envelope 0–1 on hit

// Apply S-curve shaping to the envelope
shapedEnv = // S-Curve code above with x = tightnessEnv ;

// Final tension
tension = tightnessBase + shapedEnv * envAmount;
tension = clip(tension, 0.05, 1.8);

// Soft clamping of inflection so it never explodes
Inflection = clip(Inflection, 0.02, 0.98);

// Or make intensity bipolar more intuitive
// (negative = inverted S-curve)

*/