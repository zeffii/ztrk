// drift_ui.js — for a [v8] object. Messages: "bang" = clear + build, "build", "clear".
// Builds a Live-Drift-style panel around the object whose scripting name is TARGET.
// Coordinates are in screenshot pixels (device is ~906 x 224); OX/OY/SCALE place it in your patcher.
// Attribute names (2nd field) are GUESSES — mismatches get posted to the console.
// Ranges/items marked null or approximate need checking against the real attrs.

autowatch = 1;

const TARGET = "drift";
const OX = 20, OY = 20, SCALE = 1;

const U = { int: 0, float: 1, ms: 2, hz: 3, db: 4, pct: 5, st: 7 };
const BODY = [0.62, 0.62, 0.62, 1], DARK = [0.10, 0.10, 0.10, 1], MID = [0.17, 0.17, 0.17, 1];
const INK = [0.08, 0.08, 0.08, 1], PAPER = [0.88, 0.88, 0.88, 1];

// ["panel", x, y, w, h, color]
// ["label", text, cx, cy, color]
// ["dial",  attr, x, y, w, h, unitstyle, min, max]
// ["num",   attr, x, y, w, h, unitstyle, min, max]
// ["menu",  attr, x, y, w, h, items|null]
// ["btn",   attr, x, y, w, h, text]
const LAYOUT = [
  // backgrounds
  ["panel", 0, 0, 906, 224, BODY],
  ["panel", 12, 28, 293, 190, DARK],
  ["panel", 112, 153, 100, 58, MID],     // pitch mod display placeholder
  ["panel", 432, 95, 236, 55, DARK],     // envelope display placeholder
  ["panel", 668, 28, 112, 190, MID],
  ["panel", 672, 98, 108, 52, DARK],     // LFO display placeholder

  // titles
  ["label", "Drift", 35, 14, INK], ["label", "Osc Mix", 270, 14, INK],
  ["label", "Filter", 365, 14, INK], ["label", "Envelopes", 545, 14, INK],
  ["label", "LFO", 690, 14, PAPER], ["label", "Mod", 755, 14, PAPER],

  // osc 1
  ["label", "Osc 1", 50, 38, PAPER], ["label", "Oct", 92, 38, PAPER], ["label", "Shape", 140, 38, PAPER],
  ["menu", "osc1_type", 30, 52, 44, 16, null],
  ["dial", "osc1_oct", 74, 46, 36, 44, U.int, -3, 3],
  ["dial", "osc1_shape", 122, 46, 36, 44, U.float, 0, 1],
  ["menu", "osc1_shape_mod", 166, 28, 44, 16, null],
  ["num", "osc1_shape_mod_amt", 166, 48, 44, 14, U.pct, 0, 100],

  // osc 2
  ["label", "Osc 2", 50, 108, PAPER], ["label", "Oct", 100, 108, PAPER], ["label", "Detune", 160, 108, PAPER],
  ["menu", "osc2_type", 30, 122, 44, 16, null],
  ["dial", "osc2_oct", 82, 116, 36, 44, U.int, -3, 3],
  ["dial", "osc2_detune", 142, 116, 36, 44, U.float, 0, 1],

  // pitch mod
  ["label", "Pitch Mod", 40, 170, PAPER],
  ["menu", "pitchmod_src1", 14, 180, 48, 16, null], ["menu", "pitchmod_src2", 66, 180, 44, 16, null],
  ["num", "pitchmod_amt1", 14, 198, 48, 14, U.pct, -100, 100], ["num", "pitchmod_amt2", 66, 198, 44, 14, U.pct, -100, 100],

  // osc mix
  ["label", "Osc 1", 262, 38, PAPER], ["btn", "osc1_on", 222, 50, 18, 18, "1"],
  ["dial", "osc1_level", 244, 46, 36, 44, U.db, -70, 0], ["btn", "osc1_filter", 284, 50, 18, 18, ">"],
  ["btn", "osc_r", 222, 96, 18, 14, "R"],
  ["label", "Osc 2", 262, 108, PAPER], ["btn", "osc2_on", 222, 124, 18, 18, "2"],
  ["dial", "osc2_level", 244, 116, 36, 44, U.db, -70, 0], ["btn", "osc2_filter", 284, 124, 18, 18, ">"],
  ["label", "Noise", 262, 166, PAPER], ["btn", "noise_on", 222, 184, 18, 18, "N"],
  ["dial", "noise_level", 244, 172, 36, 44, U.db, -70, 0], ["btn", "noise_filter", 284, 184, 18, 18, ">"],

  // filter
  ["label", "Freq", 350, 42, INK], ["dial", "filter_freq", 324, 50, 52, 62, U.hz, 20, 20000],
  ["label", "Type", 395, 42, INK], ["btn", "filter_type", 380, 52, 30, 16, "I"],
  ["label", "Key", 395, 80, INK], ["num", "filter_key", 380, 88, 30, 14, U.float, 0, 1],
  ["label", "Res", 332, 122, INK], ["dial", "filter_res", 314, 130, 36, 44, U.float, 0, 1],
  ["label", "HP", 392, 122, INK], ["dial", "filter_hp", 374, 130, 36, 44, U.hz, 10, 20000],
  ["label", "Freq Mod", 340, 184, INK],
  ["menu", "filter_mod_src1", 318, 192, 46, 16, null], ["menu", "filter_mod_src2", 368, 192, 44, 16, null],
  ["num", "filter_mod_amt1", 318, 208, 46, 14, U.pct, -100, 100], ["num", "filter_mod_amt2", 368, 208, 44, 14, U.pct, -100, 100],

  // envelopes (env 1 top row, env 2 bottom row)
  ["label", "1", 440, 38, INK], ["label", "2", 440, 158, INK],
  ["label", "Attack", 468, 38, INK], ["label", "Decay", 523, 38, INK], ["label", "Sustain", 580, 38, INK], ["label", "Release", 635, 38, INK],
  ["dial", "env1_attack", 450, 46, 36, 44, U.ms, 0.1, 10000], ["dial", "env1_decay", 505, 46, 36, 44, U.ms, 1, 10000],
  ["dial", "env1_sustain", 562, 46, 36, 44, U.pct, 0, 100], ["dial", "env1_release", 617, 46, 36, 44, U.ms, 1, 10000],
  ["label", "Attack", 468, 158, INK], ["label", "Decay", 523, 158, INK], ["label", "Sustain", 580, 158, INK], ["label", "Release", 635, 158, INK],
  ["dial", "env2_attack", 450, 166, 36, 44, U.ms, 0.1, 10000], ["dial", "env2_decay", 505, 166, 36, 44, U.ms, 1, 10000],
  ["dial", "env2_sustain", 562, 166, 36, 44, U.pct, 0, 100], ["dial", "env2_release", 617, 166, 36, 44, U.ms, 1, 10000],
  ["btn", "env_view1", 432, 98, 16, 16, "1"], ["btn", "env_view2", 432, 130, 16, 16, "2"],
  ["btn", "env2_loop", 432, 190, 16, 16, "o"],

  // lfo
  ["label", "Rate", 698, 42, PAPER], ["dial", "lfo_rate", 680, 50, 36, 44, U.hz, 0.01, 30],
  ["btn", "lfo_hz", 735, 50, 22, 14, "Hz"], ["btn", "lfo_sync", 759, 50, 20, 14, "1:1"],
  ["btn", "lfo_ms", 735, 66, 22, 14, "ms"], ["btn", "lfo_beat", 759, 66, 20, 14, "note"],
  ["menu", "lfo_shape", 700, 100, 50, 16, null], ["btn", "lfo_retrig", 758, 100, 18, 16, "R"],
  ["label", "Amount", 698, 160, PAPER], ["dial", "lfo_amount", 680, 168, 36, 44, U.pct, 0, 100],
  ["label", "Mod", 748, 160, PAPER], ["menu", "lfo_mod_src", 728, 170, 46, 16, null],
  ["num", "lfo_mod_amt", 728, 188, 46, 14, U.pct, -100, 100],

  // global
  ["label", "Mode", 800, 38, INK], ["menu", "voice_mode", 788, 48, 56, 16, null],
  ["label", "Volume", 868, 38, INK], ["dial", "volume", 850, 46, 36, 44, U.db, -70, 6],
  ["label", "Voices", 800, 76, INK], ["menu", "voices", 788, 86, 56, 16, null],
  ["label", "Vel > Vol", 872, 94, INK], ["num", "vel_vol", 850, 102, 52, 14, U.pct, 0, 100],
  ["label", "Drift", 800, 118, INK], ["num", "drift", 788, 126, 56, 14, U.pct, 0, 100],
  ["label", "Transpose", 872, 118, INK], ["num", "transpose", 850, 126, 52, 14, U.st, -48, 48],
  ["btn", "legato", 788, 158, 56, 16, "Legato"], ["btn", "note_pb", 850, 158, 52, 16, "Note PB"],
  ["label", "Glide", 800, 180, INK], ["num", "glide", 788, 188, 56, 14, U.ms, 0, 5000],
  ["label", "PB Range", 872, 180, INK], ["num", "pb_range", 850, 188, 52, 14, U.st, 0, 24]
];

let P, DRIFT, N = 0;
const s = v => Math.round(v * SCALE);

function make(cls, tag, x, y, w, h, msgs) {
  const obj = P.newdefault(OX + s(x), OY + s(y), cls);
  obj.varname = `dui_${tag}`;
  Object.entries(msgs || {}).forEach(([k, v]) => obj.message(k, ...[].concat(v)));
  obj.rect = [OX + s(x), OY + s(y), OX + s(x + w), OY + s(y + h)];
  return obj;
}

function wire(ctl, attr, x, y) {
  const pp = P.newdefault(OX + s(x), OY + s(y), "prepend", attr);
  pp.varname = `dui_pp_${attr}`;
  pp.hidden = 1;
  P.connect(ctl, 0, pp, 0);
  P.connect(pp, 0, DRIFT, 0);
  //P.connect(ctl, 0, pp, 0).hidden = 1;
  //P.connect(pp, 0, DRIFT, 0).hidden = 1;  
  // this.patcher.message("script", "hidden", "connect", "varname1", 0, "varname2", 0);
}

const BUILD = {
  panel: (x, y, w, h, col) =>
    make("panel", `panel_${N++}`, x, y, w, h, { bgcolor: col, border: 0, rounded: 6, background: 1 }),

  label: (text, cx, cy, col) => {
    const w = text.length * 6 + 6;
    const obj = make("comment", `label_${N++}`, cx - w / 2, cy - 8, w, 16, { fontsize: 9, textcolor: col });
    obj.message("set", text);
  },

  dial: (attr, x, y, w, h, unit, min, max) => {
    const ctl = make("live.dial", attr, x, y, w, h, {
      showname: 0, shownumber: 1, _parameter_longname: attr,
      _parameter_unitstyle: unit, _parameter_range: [min, max],
    });
    wire(ctl, attr, x, y);
  },

  num: (attr, x, y, w, h, unit, min, max) => {
    const ctl = make("live.numbox", attr, x, y, w, h, {
      _parameter_longname: attr, _parameter_unitstyle: unit, _parameter_range: [min, max],
    });
    wire(ctl, attr, x, y);
  },

  menu: (attr, x, y, w, h, items) => {
    const msgs = { _parameter_longname: attr };
    if (items) Object.assign(msgs, { _parameter_type: 2, _parameter_range: items });
    wire(make("live.menu", attr, x, y, w, h, msgs), attr, x, y);
  },

  btn: (attr, x, y, w, h, text) => {
    const ctl = make("live.text", attr, x, y, w, h, {
      mode: 1, text, texton: text, _parameter_longname: attr,
    });
    wire(ctl, attr, x, y);
  },
};

function build() {
  P = this.patcher;
  DRIFT = P.getnamed(TARGET);
  if (!DRIFT) { post(`no object with scripting name '${TARGET}'\n`); return; }
  const have = new Set(DRIFT.getattrnames());
  N = 0;
  LAYOUT.forEach(([type, ...args]) => {
    if (["dial", "num", "menu", "btn"].includes(type) && !have.has(args[0]))
      post(`attr not found on ${TARGET}: ${args[0]}\n`);
    BUILD[type](...args);
  });
}

function clear() {
  P = this.patcher;
  const doomed = [];
  for (let b = P.firstobject; b; b = b.nextobject)
    if (String(b.varname).startsWith("dui_")) doomed.push(b);
  doomed.forEach(b => P.remove(b));
}

function bang() { clear(); build(); }

// "wires 1" shows the prepend objects and their cords, "wires 0" hides them again.
// A toggle into the v8 inlet works too.
function wires(on) {
  const P = this.patcher;
  for (let b = P.firstobject; b; b = b.nextobject)
    if (String(b.varname).startsWith("dui_pp_")) b.hidden = on ? 0 : 1;
  for (let l = P.firstline; l; l = l.nextline)
    if ([l.box1, l.box2].some(b => String(b.varname).startsWith("dui_pp_"))) l.hidden = on ? 0 : 1;

}

function msg_int(v) { wires(v); }