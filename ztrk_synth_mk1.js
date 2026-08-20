/*
  synth_mk1_v8ui.js
  v8ui / jsui port of air_tracker synth_mk1 generate_wavetable + helpers
*/

mgraphics.init();
mgraphics.relative_coords = 0;
mgraphics.autofill = 0;

outlets = 2;   // 0: list of sample values, 1: param dump / debug
inlets  = 1;

// ---------------------------------------------------------------------------
// Constants / state
// ---------------------------------------------------------------------------
var NUM_SAMPLES = 256;          // wavetable resolution (matches display width ideally)
var WT_HEIGHT   = 120;          // pixel height of the waveform area
var SLIDER_H    = 14;
var SLIDER_GAP  = 3;
var SPACER_H    = 6;
var LEFT_MARGIN = 8;
var RIGHT_MARGIN = 50;          // room for shortname labels

var params = [
    // idx, real, min, max, name, short
    {i:0,  real:0.2,   min:0.0, max:6.0,   name:"Attack",        short:"A"},
    {i:1,  real:0.6,   min:0.0, max:6.0,   name:"Decay",         short:"D"},
    {i:2,  real:0.5,   min:0.0, max:1.0,   name:"Sustain",       short:"S"},
    {i:3,  real:0.2,   min:0.0, max:6.0,   name:"Release",       short:"R"},

    {i:4,  real:0.2,   min:0.0, max:6.0,   name:"Filter Attack", short:"FA"},
    {i:5,  real:0.6,   min:0.0, max:6.0,   name:"Filter Decay",  short:"FD"},
    {i:6,  real:0.5,   min:0.0, max:1.0,   name:"Filter Sustain",short:"FS"},
    {i:7,  real:0.2,   min:0.0, max:6.0,   name:"Filter Release",short:"FR"},

    {i:8,  real:1.0,   min:0.0, max:4.0,   name:"Amplifier",     short:"Amp"},
    {i:9,  real:0.5,   min:0.0, max:4.0,   name:"Osc 1 Amp",     short:"A01"},
    {i:10, real:0.25,  min:0.0, max:4.0,   name:"Osc 2 Amp",     short:"A02"},
    {i:11, real:0.123, min:0.0, max:4.0,   name:"Osc 3 Amp",     short:"A03"},
    {i:12, real:0.0625,min:0.0, max:4.0,   name:"Osc 4 Amp",     short:"A04"},
    {i:13, real:0.0,   min:0.0, max:1.0,   name:"Noise Mix",     short:"NMix"},
    {i:14, real:1.0,   min:0.0, max:255.0, name:"Noise Seed",    short:"Seed"},
    {i:15, real:0.0,   min:0.0, max:1.0,   name:"Noise Rot",     short:"Shift"},
    {i:16, real:0.0,   min:0.0, max:1.0,   name:"Smoothing",     short:"Sm"}
];

var active_slider = 8;          // start on Amp (wavetable-relevant)
var nfsamples = [];             // {x, y}  y in -1..1
var drag_slider = -1;
var box_w = 320;
var box_h = 420;

// spacer locations (after ADSR and after Filter ADSR) – same as C++
var spacer_after = {4:true, 8:true};

// ---------------------------------------------------------------------------
// Ported helpers from functions.cpp
// ---------------------------------------------------------------------------
function float_constrain(x, xmin, xmax) {
    if (x <= xmin) return xmin;
    if (x >= xmax) return xmax;
    return x;
}

function float_fold_constrain(x, xmin, xmax) {
    if (x < xmin) {
        var diff = Math.abs(x - xmin);
        x = xmin + diff;
    } else if (x > xmax) {
        var diff = Math.abs(x - xmax);
        x = xmax - diff;
    }
    return float_constrain(x, xmin, xmax);
}

function float_lerp(a, b, mix) {
    mix = float_constrain(mix, 0.0, 1.0);
    if (mix === 0.0) return a;
    if (mix === 1.0) return b;
    return a + mix * (b - a);
}

function map(x, in_min, in_max, out_min, out_max) {
    return (x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min;
}

function sum_of_floats(arr) {
    var s = 0.0;
    for (var i = 0; i < arr.length; i++) s += arr[i];
    return s;
}

function get_denominator_for_multipliers(width) {
    var upmid = Math.ceil(width / 2.0);
    var sumval = 0;
    for (var i = 1; i < upmid; i++) sumval += (2 * i);
    sumval += upmid;
    return sumval;
}

// simple seeded PRNG (mulberry32) so noise is reproducible
function mulberry32(a) {
    return function() {
        var t = a += 0x6D2B79F5;
        t = Math.imul(t ^ t >>> 15, t | 1);
        t ^= t + Math.imul(t ^ t >>> 7, t | 61);
        return ((t ^ t >>> 14) >>> 0) / 4294967296;
    };
}

function generate_noise(numsamples, seed) {
    var rng = mulberry32(seed | 0);
    var out = new Array(numsamples);
    for (var i = 0; i < numsamples; i++) {
        out[i] = -1.0 + rng() * 2.0;
    }
    return out;
}

function shift_float_array(arr, numspaces) {
    var n = arr.length;
    if (numspaces === 0 || numspaces === n) return arr.slice();
    numspaces = ((numspaces % n) + n) % n;   // positive modulo

    var remapped = new Array(n);
    if (numspaces > 0) {
        for (var i = 0; i < n; i++) {
            var offset_i = (i - numspaces >= 0) ? (i - numspaces) : n - numspaces + i;
            remapped[i] = arr[offset_i];
        }
    } else {
        for (var i = 0; i < n; i++) {
            remapped[i] = arr[(i + numspaces + n) % n];
        }
    }
    return remapped;
}

function mix_signal_into_nfsamples(samples, noise, mix) {
    for (var i = 0; i < samples.length; i++) {
        samples[i].y = float_lerp(samples[i].y, noise[i], mix);
    }
}

function unweighted_sliding_average(samples, width, mix) {
    var n = samples.length;
    var smoothed = new Array(n);

    if (width === 3) {
        for (var i = 0; i < n; i++) {
            var A = samples[((i - 1) + n) % n].y;
            var B = samples[i].y;
            var C = samples[(i + 1) % n].y;
            smoothed[i] = (A + B + C) / 3.0;
        }
    } else if (width === 9) {
        var midpoint = Math.ceil(width / 2.0);
        var lowermid = Math.floor(width / 2);
        var denom = get_denominator_for_multipliers(width);

        for (var i = 0; i < n; i++) {
            var tmp = new Array(width);
            for (var j = 0; j < width; j++) {
                if (j === lowermid) {
                    tmp[j] = samples[i].y * midpoint;
                } else if (j < lowermid) {
                    var amp = j + 1;
                    var offset = lowermid - j;
                    var idx = ((i - offset) + n) % n;
                    tmp[j] = samples[idx].y * amp;
                } else {
                    var amp = width - j;
                    var offset = j - lowermid;
                    var idx = (i + offset) % n;
                    tmp[j] = samples[idx].y * amp;
                }
            }
            smoothed[i] = sum_of_floats(tmp) / denom;
        }
    } else {
        return; // unsupported width
    }

    for (var i = 0; i < n; i++) {
        samples[i].y = float_lerp(samples[i].y, smoothed[i], mix);
    }
}

// ---------------------------------------------------------------------------
// generate_wavetable  (core of Synth_mk1::generate_wavetable)
// ---------------------------------------------------------------------------
function generate_wavetable() {
    var numsamples = NUM_SAMPLES;
    var fi = Math.PI * 2.0 / numsamples;

    // constrain wavetable-relevant params
    for (var i = 8; i < params.length; i++) {
        params[i].real = float_constrain(params[i].real, params[i].min, params[i].max);
    }

    nfsamples = [];
    for (var i = 0; i < numsamples; i++) {
        var fy = params[9].real  * Math.sin(fi * i) +
                 params[10].real * Math.sin(2 * fi * i) +
                 params[11].real * Math.sin(3 * fi * i) +
                 params[12].real * Math.sin(4 * fi * i);
        fy *= params[8].real;
        fy = float_fold_constrain(fy, -1.0, 1.0);
        nfsamples.push({x: i, y: fy});
    }

    // noise
    if (params[13].real > 0.0) {
        var mix   = params[13].real;
        var seed  = params[14].real | 0;
        var shift = params[15].real;
        var numspaces = Math.round(map(shift, 0.0, 1.0, 0, numsamples));

        var noise = generate_noise(numsamples, seed);
        noise = shift_float_array(noise, numspaces);
        mix_signal_into_nfsamples(nfsamples, noise, mix);
    }

    // smoothing
    if (params[16].real > 0.0) {
        unweighted_sliding_average(nfsamples, 9, params[16].real);
    }
}

// ---------------------------------------------------------------------------
// UI helpers
// ---------------------------------------------------------------------------
function param_to_slider_x(p, track_w) {
    var t = (p.real - p.min) / (p.max - p.min);
    return t * track_w;
}

function slider_x_to_real(p, x, track_w) {
    var t = float_constrain(x / track_w, 0, 1);
    return p.min + t * (p.max - p.min);
}

function get_slider_rects() {
    // returns array of {idx, x, y, w, h, track_w}
    var rects = [];
    var y = WT_HEIGHT + 28;
    var track_w = box_w - LEFT_MARGIN - RIGHT_MARGIN - 4;

    for (var i = 0; i < params.length; i++) {
        if (spacer_after[i]) y += SPACER_H;
        rects.push({
            idx: i,
            x: LEFT_MARGIN,
            y: y,
            w: track_w + 4,
            h: SLIDER_H,
            track_w: track_w
        });
        y += SLIDER_H + SLIDER_GAP;
    }
    return rects;
}

// ---------------------------------------------------------------------------
// paint
// ---------------------------------------------------------------------------
function paint() {
    var size = mgraphics.size;
    box_w = size[0];
    box_h = size[1];

    // background
    mgraphics.set_source_rgba(0.04, 0.12, 0.04, 1);
    mgraphics.rectangle(0, 0, box_w, box_h);
    mgraphics.fill();

    // --- waveform area ---
    var wt_w = box_w - 2;
    var wt_h = WT_HEIGHT;
    mgraphics.set_source_rgba(0.02, 0.14, 0.02, 1);
    mgraphics.rectangle(1, 1, wt_w, wt_h);
    mgraphics.fill();

    if (nfsamples.length === 0) generate_wavetable();

    var y_mult = wt_h / 2;
    var y_off  = wt_h / 2 + 1;
    var x_scale = wt_w / (NUM_SAMPLES - 1);

    // vertical stems
    mgraphics.set_source_rgba(0.08, 0.2, 0.08, 1);
    mgraphics.set_line_width(1);
    for (var i = 0; i < nfsamples.length; i++) {
        var px = 1 + i * x_scale;
        var py = y_off + nfsamples[i].y * y_mult;
        mgraphics.move_to(px, py);
        mgraphics.line_to(px, wt_h + 1);
        mgraphics.stroke();
    }

    // waveform points / line
    mgraphics.set_source_rgba(0.6, 0.98, 0.6, 1);
    mgraphics.set_line_width(1.5);
    mgraphics.move_to(1, y_off + nfsamples[0].y * y_mult);
    for (var i = 1; i < nfsamples.length; i++) {
        var px = 1 + i * x_scale;
        var py = y_off + nfsamples[i].y * y_mult;
        mgraphics.line_to(px, py);
    }
    mgraphics.stroke();

    // title
    mgraphics.set_source_rgba(0.7, 0.9, 0.7, 1);
    mgraphics.select_font_face("Arial");
    mgraphics.set_font_size(11);
    mgraphics.move_to(6, wt_h + 16);
    mgraphics.show_text("synth_mk1  (v8ui port)");

    // --- sliders ---
    var rects = get_slider_rects();
    for (var r = 0; r < rects.length; r++) {
        var rc = rects[r];
        var p  = params[rc.idx];
        var is_active = (rc.idx === active_slider);

        // track bg
        var bg = is_active ? 0.31 : 0.20;
        mgraphics.set_source_rgba(0.08, bg, 0.08, 1);
        mgraphics.rectangle(rc.x, rc.y, rc.w, rc.h);
        mgraphics.fill();

        // knob
        var kx = rc.x + 2 + param_to_slider_x(p, rc.track_w);
        var knob_g = is_active ? 0.47 : 0.35;
        mgraphics.set_source_rgba(0.2, knob_g, 0.2, 1);
        mgraphics.rectangle(kx, rc.y, SLIDER_H, SLIDER_H);
        mgraphics.fill();

        if (is_active) {
            mgraphics.set_source_rgba(0.05, 0.05, 0.05, 1);
            mgraphics.rectangle(kx - 1, rc.y, 1, SLIDER_H);
            mgraphics.rectangle(kx + SLIDER_H, rc.y, 1, SLIDER_H);
            mgraphics.fill();
        }

        // short name
        mgraphics.set_source_rgba(is_active ? 0.85 : 0.55, is_active ? 0.85 : 0.55, is_active ? 0.85 : 0.55, 1);
        mgraphics.set_font_size(10);
        mgraphics.move_to(rc.x + rc.w + 6, rc.y + 11);
        mgraphics.show_text(p.short);
    }
}

// ---------------------------------------------------------------------------
// interaction
// ---------------------------------------------------------------------------
function onclick(x, y, but, cmd, shift, capslock, option, ctrl) {
    var rects = get_slider_rects();
    drag_slider = -1;
    for (var i = 0; i < rects.length; i++) {
        var rc = rects[i];
        if (x >= rc.x && x <= rc.x + rc.w && y >= rc.y && y <= rc.y + rc.h) {
            active_slider = rc.idx;
            drag_slider = rc.idx;
            // jump to click position
            var local_x = x - (rc.x + 2);
            params[rc.idx].real = slider_x_to_real(params[rc.idx], local_x, rc.track_w);
            if (rc.idx >= 8) generate_wavetable();
            mgraphics.redraw();
            outlet(1, "param", rc.idx, params[rc.idx].real);
            break;
        }
    }
}
onclick.local = 1;

function ondrag(x, y, but, cmd, shift, capslock, option, ctrl) {
    if (drag_slider < 0) return;
    var rects = get_slider_rects();
    var rc = rects[drag_slider];
    var local_x = x - (rc.x + 2);
    params[drag_slider].real = slider_x_to_real(params[drag_slider], local_x, rc.track_w);
    if (drag_slider >= 8) generate_wavetable();
    mgraphics.redraw();
    outlet(1, "param", drag_slider, params[drag_slider].real);
}
ondrag.local = 1;

function onidleout() {
    drag_slider = -1;
}
onidleout.local = 1;

// keyboard-style nudging (send “up” / “down” / “left” / “right” or ints)
function anything() {
    var a = arrayfromargs(messagename, arguments);
    if (a[0] === "up" || a[0] === 1) {
        active_slider = Math.max(0, active_slider - 1);
        mgraphics.redraw();
    } else if (a[0] === "down" || a[0] === 2) {
        active_slider = Math.min(params.length - 1, active_slider + 1);
        mgraphics.redraw();
    } else if (a[0] === "left" || a[0] === 3) {
        var p = params[active_slider];
        var step = (p.max - p.min) / 128;
        p.real = float_constrain(p.real - step, p.min, p.max);
        if (active_slider >= 8) generate_wavetable();
        mgraphics.redraw();
        outlet(1, "param", active_slider, p.real);
    } else if (a[0] === "right" || a[0] === 4) {
        var p = params[active_slider];
        var step = (p.max - p.min) / 128;
        p.real = float_constrain(p.real + step, p.min, p.max);
        if (active_slider >= 8) generate_wavetable();
        mgraphics.redraw();
        outlet(1, "param", active_slider, p.real);
    } else if (a[0] === "dump") {
        var list = [];
        for (var i = 0; i < nfsamples.length; i++) list.push(nfsamples[i].y);
        outlet(0, list);
    } else if (a[0] === "set") {
        // set <idx> <value>
        var idx = a[1] | 0;
        if (idx >= 0 && idx < params.length) {
            params[idx].real = float_constrain(+a[2], params[idx].min, params[idx].max);
            if (idx >= 8) generate_wavetable();
            mgraphics.redraw();
        }
    } else if (a[0] === "bang") {
        generate_wavetable();
        mgraphics.redraw();
        var list = [];
        for (var i = 0; i < nfsamples.length; i++) list.push(nfsamples[i].y);
        outlet(0, list);
    }
}

// initial generation
generate_wavetable();