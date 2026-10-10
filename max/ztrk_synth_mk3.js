/*
  synth_mk1_buffer_v8ui.js
  Writes a 2048-sample wavetable into buffer~ "synth_wt"
  Ready for gen~ / wave~ / cycle~ oscillators.

  ## Create a gen~ with this code:gen

  // gen~ wavetable oscillator (2048 samples)
  Buffer wt("synth_wt");

  in1 = in1;          // frequency in Hz
  phase = phasor(in1, 0);

  // sample the buffer (linear interpolation)
  out1 = sample(wt, phase * 2048, 0, 0, 1);

  ## Or the classic Max way (no gen~ needed):

  [phasor~ 220] → [wave~ synth_wt] → [*~ 0.3] → [dac~]

*/

mgraphics.init();
mgraphics.relative_coords = 0;
mgraphics.autofill = 0;

outlets = 2;   // 0: bang when buffer updated, 1: param / debug
inlets  = 1;

config_colors = {
    background_all: [0.1, 0.12, 0.12, 1],
    background_waveform: [0.02, 0.14, 0.02, 1],
    stems: [0.08, 0.2, 0.08, 1],
    waveform_line: [0.6, 0.98, 0.6, 1],
    title: [0.7, 0.9, 0.7, 1]

}

// ---------------------------------------------------------------------------
// Config
// ---------------------------------------------------------------------------
var BUFFER_NAME   = "synth_wt";
var NUM_SAMPLES   = 2048;
var DISPLAY_PTS   = 512;        // how many points we draw (downsampled)
var WT_HEIGHT     = 120;
var SLIDER_H      = 14;
var SLIDER_GAP    = 3;
var SPACER_H      = 6;
var LEFT_MARGIN   = 8;
var RIGHT_MARGIN  = 50;

var params = [
    {i:0, real:1.0,   min:0.0, max:4.0,   name:"Amplifier",      short:"Amp"},
    {i:1, real:0.5,   min:0.0, max:4.0,   name:"Osc 1 Amp",      short:"A01"},
    {i:2, real:0.25,  min:0.0, max:4.0,   name:"Osc 2 Amp",      short:"A02"},
    {i:3, real:0.123, min:0.0, max:4.0,   name:"Osc 3 Amp",      short:"A03"},
    {i:4, real:0.0625,min:0.0, max:4.0,   name:"Osc 4 Amp",      short:"A04"},
    {i:5, real:0.0,   min:0.0, max:1.0,   name:"Noise Mix",      short:"NMix"},
    {i:6, real:1.0,   min:0.0, max:255.0, name:"Noise Seed",     short:"Seed"},
    {i:7, real:0.0,   min:0.0, max:1.0,   name:"Noise Rot",      short:"Shift"},
    {i:8, real:0.0,   min:0.0, max:1.0,   name:"Smoothing",      short:"Sm"}
];

var active_slider = 0;
var nfsamples     = [];          // full 2048 {x,y}
var display_y     = [];          // downsampled for drawing
var drag_slider   = -1;
var box_w = 400, box_h = 370;
var spacer_after  = {1:true, 5:true};

var buf = null;                  // Max Buffer object

// ---------------------------------------------------------------------------
// Math helpers (same as before)
// ---------------------------------------------------------------------------
function float_constrain(x, xmin, xmax) {
    if (x <= xmin) return xmin;
    if (x >= xmax) return xmax;
    return x;
}
function float_fold_constrain(x, xmin, xmax) {
    if (x < xmin) x = xmin + Math.abs(x - xmin);
    else if (x > xmax) x = xmax - Math.abs(x - xmax);
    return float_constrain(x, xmin, xmax);
}
function float_lerp(a, b, mix) {
    mix = float_constrain(mix, 0, 1);
    return a + mix * (b - a);
}
function map(x, in_min, in_max, out_min, out_max) {
    return (x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min;
}
function sum_of_floats(arr) {
    var s = 0;
    for (var i = 0; i < arr.length; i++) s += arr[i];
    return s;
}
function get_denominator_for_multipliers(width) {
    var upmid = Math.ceil(width / 2);
    var sumval = 0;
    for (var i = 1; i < upmid; i++) sumval += 2 * i;
    return sumval + upmid;
}
function mulberry32(a) {
    return function() {
        var t = a += 0x6D2B79F5;
        t = Math.imul(t ^ t >>> 15, t | 1);
        t ^= t + Math.imul(t ^ t >>> 7, t | 61);
        return ((t ^ t >>> 14) >>> 0) / 4294967296;
    };
}
function generate_noise(n, seed) {
    var rng = mulberry32(seed | 0);
    var out = new Array(n);
    for (var i = 0; i < n; i++) out[i] = -1 + rng() * 2;
    return out;
}
function shift_float_array(arr, numspaces) {
    var n = arr.length;
    numspaces = ((numspaces % n) + n) % n;
    if (numspaces === 0) return arr.slice();
    var remapped = new Array(n);
    for (var i = 0; i < n; i++) {
        remapped[i] = arr[(i - numspaces + n) % n];
    }
    return remapped;
}
function mix_signal_into_nfsamples(samples, noise, mix) {
    for (var i = 0; i < samples.length; i++)
        samples[i].y = float_lerp(samples[i].y, noise[i], mix);
}
function unweighted_sliding_average(samples, width, mix) {
    var n = samples.length;
    var smoothed = new Array(n);
    if (width === 9) {
        var midpoint = Math.ceil(width / 2);
        var lowermid = Math.floor(width / 2);
        var denom = get_denominator_for_multipliers(width);
        for (var i = 0; i < n; i++) {
            var tmp = new Array(width);
            for (var j = 0; j < width; j++) {
                if (j === lowermid) {
                    tmp[j] = samples[i].y * midpoint;
                } else if (j < lowermid) {
                    var amp = j + 1;
                    var idx = (i - (lowermid - j) + n) % n;
                    tmp[j] = samples[idx].y * amp;
                } else {
                    var amp = width - j;
                    var idx = (i + (j - lowermid)) % n;
                    tmp[j] = samples[idx].y * amp;
                }
            }
            smoothed[i] = sum_of_floats(tmp) / denom;
        }
    } else return;
    for (var i = 0; i < n; i++)
        samples[i].y = float_lerp(samples[i].y, smoothed[i], mix);
}

// ---------------------------------------------------------------------------
// Core generation + buffer write
// ---------------------------------------------------------------------------
function ensure_buffer() {
    if (!buf) {
        buf = new Buffer(BUFFER_NAME);
    }
    // make sure size is correct
    if (buf.framecount() !== NUM_SAMPLES) {
        buf.send("sizeinsamps", NUM_SAMPLES);
    }
}

function write_to_buffer() {
    ensure_buffer();
    // poke the whole table in one go (channel 1)
    var samples = new Array(NUM_SAMPLES);
    for (var i = 0; i < NUM_SAMPLES; i++) samples[i] = nfsamples[i].y;
    buf.poke(1, 0, samples);
}

function build_display() {
    display_y = [];
    var step = NUM_SAMPLES / DISPLAY_PTS;
    for (var i = 0; i < DISPLAY_PTS; i++) {
        var idx = Math.floor(i * step);
        display_y.push(nfsamples[idx].y);
    }
}

function generate_wavetable() {
    var fi = Math.PI * 2 / NUM_SAMPLES;

    for (var i = 0; i < params.length; i++)
        params[i].real = float_constrain(params[i].real, params[i].min, params[i].max);

    nfsamples = [];
    for (var i = 0; i < NUM_SAMPLES; i++) {
        var fy = params[1].real * Math.sin(fi * i) +
                 params[2].real * Math.sin(2 * fi * i) +
                 params[3].real * Math.sin(3 * fi * i) +
                 params[4].real * Math.sin(4 * fi * i);
        fy *= params[0].real;
        fy = float_fold_constrain(fy, -1, 1);
        nfsamples.push({x: i, y: fy});
    }

    if (params[5].real > 0) {
        var mix  = params[5].real;
        var seed = params[6].real | 0;
        var numspaces = Math.round(map(params[7].real, 0, 1, 0, NUM_SAMPLES));
        var noise = generate_noise(NUM_SAMPLES, seed);
        noise = shift_float_array(noise, numspaces);
        mix_signal_into_nfsamples(nfsamples, noise, mix);
    }

    if (params[8].real > 0)
        unweighted_sliding_average(nfsamples, 9, params[8].real);

    build_display();
    write_to_buffer();
    outlet(0, "bang");          // notify that buffer is ready
}

// ---------------------------------------------------------------------------
// UI
// ---------------------------------------------------------------------------
function param_to_slider_x(p, track_w) {
    return ((p.real - p.min) / (p.max - p.min)) * track_w;
}
function slider_x_to_real(p, x, track_w) {
    var t = float_constrain(x / track_w, 0, 1);
    return p.min + t * (p.max - p.min);
}
function get_slider_rects() {
    var rects = [];
    var y = WT_HEIGHT + 28;
    var track_w = box_w - LEFT_MARGIN - RIGHT_MARGIN - 4;
    for (var i = 0; i < params.length; i++) {
        if (spacer_after[i]) y += SPACER_H;
        rects.push({idx:i, x:LEFT_MARGIN, y:y, w:track_w+4, h:SLIDER_H, track_w:track_w});
        y += SLIDER_H + SLIDER_GAP;
    }
    return rects;
}

function paint() {
    mgraphics.size = [box_w, box_h];
    var size = mgraphics.size;
    // box_w = size[0]; box_h = size[1];

    mgraphics.set_source_rgba(...config_colors.background_all);
    mgraphics.rectangle(0, 0, box_w, box_h);
    mgraphics.fill();

    // waveform background
    mgraphics.set_source_rgba(...config_colors.background_waveform);
    mgraphics.rectangle(1, 1, box_w-2, WT_HEIGHT);
    mgraphics.fill();

    if (display_y.length === 0) generate_wavetable();

    var y_mult = WT_HEIGHT / 2;
    var y_off  = WT_HEIGHT / 2 + 1;
    var x_scale = (box_w - 2) / (DISPLAY_PTS - 1);

    // stems
    mgraphics.set_source_rgba(...config_colors.stems);
    mgraphics.set_line_width(1);
    for (var i = 0; i < display_y.length; i++) {
        var px = 1 + i * x_scale;
        var py = y_off - display_y[i] * y_mult;
        mgraphics.move_to(px, py);
        mgraphics.line_to(px, WT_HEIGHT + 1);
        mgraphics.stroke();
    }

    // waveform line
    mgraphics.set_source_rgba(...config_colors.waveform_line);
    mgraphics.set_line_width(1.5);
    mgraphics.move_to(1, y_off - display_y[0] * y_mult);
    for (var i = 1; i < display_y.length; i++)
        mgraphics.line_to(1 + i * x_scale, y_off - display_y[i] * y_mult);
    mgraphics.stroke();

    // title
    mgraphics.set_source_rgba(...config_colors.title);
    mgraphics.select_font_face("Arial");
    mgraphics.set_font_size(11);
    mgraphics.move_to(6, WT_HEIGHT + 16);
    mgraphics.show_text("synth_mk1 → buffer~ " + BUFFER_NAME + " (" + NUM_SAMPLES + ")");

    // sliders
    var rects = get_slider_rects();
    for (var r = 0; r < rects.length; r++) {
        var rc = rects[r];
        var p  = params[rc.idx];
        var act = (rc.idx === active_slider);

        mgraphics.set_source_rgba(0.08, act ? 0.31 : 0.20, 0.08, 1);
        mgraphics.rectangle(rc.x, rc.y, rc.w, rc.h);
        mgraphics.fill();

        var kx = rc.x + 2 + param_to_slider_x(p, rc.track_w);
        mgraphics.set_source_rgba(0.2, act ? 0.47 : 0.35, 0.2, 1);
        mgraphics.rectangle(kx, rc.y, SLIDER_H, SLIDER_H);
        mgraphics.fill();

        mgraphics.set_source_rgba(act ? 0.85 : 0.55, act ? 0.85 : 0.55, act ? 0.85 : 0.55, 1);
        mgraphics.set_font_size(10);
        mgraphics.move_to(rc.x + rc.w + 6, rc.y + 11);
        mgraphics.show_text(p.short);
    }
}

// ---------------------------------------------------------------------------
// Interaction
// ---------------------------------------------------------------------------
function onclick(x, y) {
    var rects = get_slider_rects();
    drag_slider = -1;
    for (var i = 0; i < rects.length; i++) {
        var rc = rects[i];
        if (x >= rc.x && x <= rc.x+rc.w && y >= rc.y && y <= rc.y+rc.h) {
            active_slider = rc.idx;
            drag_slider = rc.idx;
            params[rc.idx].real = slider_x_to_real(params[rc.idx], x-(rc.x+2), rc.track_w);
            if (rc.idx >= 8) generate_wavetable();
            mgraphics.redraw();
            outlet(1, "param", rc.idx, params[rc.idx].real);
            break;
        }
    }
}
onclick.local = 1;

function ondrag(x, y) {
    if (drag_slider < 0) return;
    var rects = get_slider_rects();
    var rc = rects[drag_slider];
    params[drag_slider].real = slider_x_to_real(params[drag_slider], x-(rc.x+2), rc.track_w);
    if (drag_slider >= 0) generate_wavetable();
    mgraphics.redraw();
    outlet(1, "param", drag_slider, params[drag_slider].real);
}
ondrag.local = 1;

function onidleout() { drag_slider = -1; }
onidleout.local = 1;

// ---------------------------------------------------------------------------
// Messages
// ---------------------------------------------------------------------------
function anything() {
    var a = arrayfromargs(messagename, arguments);

    if (a[0] === "bang" || a[0] === "generate") {
        generate_wavetable();
        mgraphics.redraw();
    }
    else if (a[0] === "set") {               // set <idx> <value>
        var idx = a[1]|0;
        if (idx >= 0 && idx < params.length) {
            params[idx].real = float_constrain(+a[2], params[idx].min, params[idx].max);
            if (idx >= 8) generate_wavetable();
            mgraphics.redraw();
        }
    }
    else if (a[0] === "buffer") {            // change buffer name
        BUFFER_NAME = a[1];
        buf = null;
        generate_wavetable();
        mgraphics.redraw();
    }
    else if (a[0] === "up") {
        active_slider = Math.max(0, active_slider-1);
        mgraphics.redraw();
    }
    else if (a[0] === "down") {
        active_slider = Math.min(params.length-1, active_slider+1);
        mgraphics.redraw();
    }
    else if (a[0] === "left" || a[0] === "right") {
        var p = params[active_slider];
        var step = (p.max - p.min) / 128;
        p.real = float_constrain(p.real + (a[0]==="right" ? step : -step), p.min, p.max);
        if (active_slider >= 8) generate_wavetable();
        mgraphics.redraw();
        outlet(1, "param", active_slider, p.real);
    }
}

// boot
generate_wavetable();