// ztrk_alb_ui_wrapper.js
// Reusable widget library for v8ui. One UI instance per Live device.
// Usage: const uilib = require("ztrk_alb_ui_wrapper.js");

const DEFAULT_THEME = {
  bg: "#2b2b2b", panel: "#343434", text: "#bdbdbd",
  accent: "#ffad32", track: "#4a4a4a", textOn: "#202020",
  font: "Arial", fontSize: 9, showHover: true, acronyms: [],
  dial: { arcStart: 2.356, arcSweep: 4.712, thickness: 3 },
};

// ---------- helpers ----------

const clamp = (v, lo, hi) => Math.min(hi, Math.max(lo, v));

// "osc_gain" / "oscGain" -> "Osc Gain" (acronyms upper-cased); toAttr reverses the snake_case form
const toLabel = (attr, acronyms = []) =>
  attr.replace(/([a-z0-9])([A-Z])/g, "$1 $2").split(/[_\s]+/).filter(Boolean)
    .map(w => (acronyms.includes(w.toLowerCase()) ? w.toUpperCase() : w[0].toUpperCase() + w.slice(1)))
    .join(" ");
const toAttr = label => label.trim().toLowerCase().split(/\s+/).join("_");

const rgba = (hex, a = 1) => {
  let h = hex.replace("#", "");
  if (h.length === 3) h = h.split("").map(c => c + c).join("");
  const n = parseInt(h, 16);
  return [((n >> 16) & 255) / 255, ((n >> 8) & 255) / 255, (n & 255) / 255, a];
};
const setColor = (g, hex, a = 1) => g.set_source_rgba(...rgba(hex, a));

// draw a clockwise arc between two angles regardless of order
const arcBetween = (g, cx, cy, r, a, b) => {
  if (a > b) [a, b] = [b, a];
  g.arc(cx, cy, r, a, b);
};

const fmtValue = (v, isInt, unit) => {
  const dec = v === 0 ? 0 : clamp(2 - Math.floor(Math.log10(Math.abs(v))), 0, 4); // ~3 significant figures
  const s = isInt ? `${Math.round(v)}` : `${+v.toFixed(dec)}`;
  return unit ? `${s} ${unit}` : s;
};

// hex readout of the normalised position scaled to the full n-digit range (2 -> 00..FF, 4 -> 0000..FFFF)
const fmtHex = (norm, digits) =>
  Math.round(norm * (16 ** digits - 1)).toString(16).toUpperCase().padStart(digits, "0");

// log mapping between a real value and a 0..1 position. lo > 0: true log; lo == 0: log shifted by
// hi/1000 so 0 maps to 0; lo < 0: falls back to linear.
const logNorm = (v, lo, hi) => {
  if (lo < 0) return clamp((v - lo) / (hi - lo), 0, 1);
  const off = lo > 0 ? 0 : hi / 1000;
  return clamp(Math.log(Math.max(v + off, lo + off) / (lo + off)) / Math.log((hi + off) / (lo + off)), 0, 1);
};
const logDenorm = (n, lo, hi) => {
  if (lo < 0) return lo + n * (hi - lo);
  const off = lo > 0 ? 0 : hi / 1000;
  return (lo + off) * ((hi + off) / (lo + off)) ** n - off;
};

// ---------- widget base ----------

class Widget {
  constructor(spec, ctx, ox = 0, oy = 0) {
    this.spec = spec;
    this.ctx = ctx;
    this.x = ox + (spec.x ?? 0);
    this.y = oy + (spec.y ?? 0);
    this.w = spec.w ?? 40;
    this.h = spec.h ?? 40;
    this.bind = spec.bind;
    this.interactive = false;
  }

  // lookup order: widget spec -> theme[type] -> theme -> fallback
  style(key, fallback) {
    const t = this.ctx.theme;
    const typed = typeof t[this.spec.type] === "object" ? t[this.spec.type][key] : undefined;
    return this.spec[key] ?? typed ?? t[key] ?? fallback;
  }

  get label() {
    return this.spec.label ?? (this.bind ? toLabel(this.bind, this.ctx.theme.acronyms) : "");
  }

  get hover() {
    return this.spec.hover ?? "";
  }

  contains(px, py) {
    return px >= this.x && px < this.x + this.w && py >= this.y && py < this.y + this.h;
  }

  // align: "c" (x is the centre), "l" (x is the left edge), "r" (x is the right edge)
  text(g, str, x, baseline, color, align = "c") {
    g.select_font_face(this.ctx.theme.font);
    g.set_font_size(this.ctx.theme.fontSize);
    const [tw] = g.text_measure(str);
    setColor(g, color);
    g.move_to(align === "c" ? x - tw / 2 : align === "r" ? x - tw : x, baseline);
    g.show_text(str);
  }

  accepts(attr) { return this.bind === attr; } // does this widget display this attribute?
  paint(g) {}
  setValue(v, attr) {}
  click(x, y, mods) {}
  drag(x, y, mods) {}
  release() {}
  dblclick() {}
  setMode(m) {}
  idle(x, y) { return false; } // hover inside the widget; return true if it needs a redraw
  idleout() {}
}

// ---------- built-in widgets ----------

class Panel extends Widget {
  paint(g) {
    const th = this.ctx.theme;
    setColor(g, this.style("panel"));
    g.rectangle(this.x, this.y, this.w, this.h);
    g.fill();
    if (this.spec.title) {
      g.select_font_face(th.font);
      g.set_font_size(th.fontSize - 1);
      setColor(g, th.text, 0.6);
      g.move_to(this.x + 6, this.y + 11);
      g.show_text(this.spec.title.toUpperCase());
    }
  }
}

// shared by dial and slider: range, drag, double-click reset, hex/real readout
class ValueWidget extends Widget {
  constructor(spec, ctx, ox, oy) {
    super(spec, ctx, ox, oy);
    this.interactive = true;
    this.min = spec.min ?? 0;
    this.max = spec.max ?? 1;
    this.isInt = !!spec.int;
    this.bipolar = !!spec.bipolar;
    this.def = spec.default ?? (this.bipolar ? (this.min + this.max) / 2 : this.min);
    this.value = this.def;
    this.dragging = false;
    this.pixels = spec.dragPixels ?? 200; // pixels of drag for full range
    this.mode = spec.readout ?? (spec.hex ? "both" : "real"); // "hex" | "real" | "both"
    this.log = !!spec.log; // log mapping of the range (hex readout follows the same position)
  }

  toNorm(v) {
    return this.log ? logNorm(v, this.min, this.max) : (v - this.min) / (this.max - this.min);
  }

  fromNorm(n) {
    return this.log ? logDenorm(n, this.min, this.max) : this.min + n * (this.max - this.min);
  }

  get norm() {
    return this.toNorm(this.value);
  }

  commit(n) {
    let v = this.fromNorm(clamp(n, 0, 1));
    if (this.isInt) v = Math.round(v);
    if (v === this.value) return;
    this.value = v;
    this.ctx.send(this.bind, v);
    this.ctx.redraw();
  }

  setValue(v) {
    this.value = clamp(v, this.min, this.max);
  }

  setMode(m) {
    if (this.spec.hex) this.mode = m;
  }

  // drag movement in "increase" direction; subclasses override for their axis
  axisDelta(x, y) {
    return this.lastY - y;
  }

  click(x, y, mods) {
    if (mods.option && this.spec.hex) { // option-click cycles the readout mode
      this.mode = { both: "hex", hex: "real", real: "both" }[this.mode];
      this.ctx.redraw();
      return;
    }
    this.dragging = true;
    this.lastX = x;
    this.lastY = y;
    this.cn = this.norm; // continuous position, so int widgets don't lose small drags to rounding
    this.ctx.redraw();
  }

  drag(x, y, mods) {
    if (!this.dragging) return;
    const factor = mods.shift ? 0.1 : 1;
    this.cn = clamp(this.cn + (this.axisDelta(x, y) / this.pixels) * factor, 0, 1);
    this.lastX = x;
    this.lastY = y;
    this.commit(this.cn);
  }

  release() {
    this.dragging = false;
    this.ctx.redraw();
  }

  dblclick() {
    this.commit(this.toNorm(this.def));
  }

  // display only; the value sent out is always the real range
  get readout() {
    const real = fmtValue(this.value, this.isInt, this.spec.unit);
    if (!this.spec.hex) return real;
    const hex = fmtHex(this.norm, this.spec.hex);
    return this.mode === "hex" ? hex : this.mode === "real" ? real : `${hex}  ${real}`;
  }

  get hover() {
    return this.spec.hover ?? `${this.label}: ${this.readout}`;
  }
}

class Dial extends ValueWidget {
  paint(g) {
    const th = this.ctx.theme;
    const thick = this.style("thickness", 3);
    const start = this.style("arcStart", 2.356);
    const sweep = this.style("arcSweep", 4.712);
    const accent = this.style("accent");
    const labelH = th.fontSize + 4;
    const d = Math.min(this.w, this.h - labelH);
    const cx = this.x + this.w / 2;
    const cy = this.y + d / 2;
    const r = d / 2 - thick;

    g.set_line_width(thick);
    g.set_line_cap("butt");

    // track
    setColor(g, this.style("track"));
    arcBetween(g, cx, cy, r, start, start + sweep);
    g.stroke();

    // value arc (from the centre for bipolar, from the start otherwise)
    const from = this.bipolar ? start + sweep / 2 : start;
    const to = start + sweep * this.norm;
    setColor(g, accent);
    if (Math.abs(to - from) > 0.001) {
      arcBetween(g, cx, cy, r, from, to);
      g.stroke();
    }

    // indicator
    g.set_line_width(2);
    g.move_to(cx + Math.cos(to) * r * 0.35, cy + Math.sin(to) * r * 0.35);
    g.line_to(cx + Math.cos(to) * r * 0.85, cy + Math.sin(to) * r * 0.85);
    g.stroke();

    // label, swapped for the value while dragging or hovered
    const showVal = this.dragging || this.ctx.hovered === this;
    const str = showVal ? this.readout : this.label;
    this.text(g, str, cx, this.y + d + th.fontSize + 1, th.text);
  }
}

// flat bar filled up to the value; orient "h" (default) or "v"
class Slider extends ValueWidget {
  constructor(spec, ctx, ox, oy) {
    super(spec, ctx, ox, oy);
    this.horiz = spec.orient !== "v";
    this.pixels = spec.dragPixels ?? (this.horiz ? this.w : this.h); // one bar length = full range
  }

  axisDelta(x, y) {
    return this.horiz ? x - this.lastX : this.lastY - y;
  }

  paint(g) {
    const th = this.ctx.theme;
    const { x, y, w, h } = this;

    setColor(g, this.style("track"));
    g.rectangle(x, y, w, h);
    g.fill();

    // fill from the centre for bipolar, from the low end otherwise
    const n = this.norm;
    const a = Math.min(this.bipolar ? 0.5 : 0, n);
    const b = Math.max(this.bipolar ? 0.5 : 0, n);
    setColor(g, this.style("accent"), 0.6);
    if (this.horiz) g.rectangle(x + a * w, y, (b - a) * w, h);
    else g.rectangle(x, y + h - b * h, w, (b - a) * h);
    g.fill();

    if (this.horiz) {
      const base = y + h / 2 + th.fontSize / 2 - 1;
      this.text(g, this.label, x + 4, base, th.text, "l");
      this.text(g, this.readout, x + w - 4, base, th.text, "r");
    } else {
      const showVal = this.dragging || this.ctx.hovered === this;
      this.text(g, showVal ? this.readout : this.label, x + w / 2, y + h / 2, th.text);
    }
  }
}

// on/off button, sends 0 / 1; optional labels: ["off text", "on text"]
class Toggle extends Widget {
  constructor(spec, ctx, ox, oy) {
    super(spec, ctx, ox, oy);
    this.interactive = true;
    this.value = spec.default ? 1 : 0;
  }

  setValue(v) {
    this.value = v ? 1 : 0;
  }

  click() {
    this.value = this.value ? 0 : 1;
    this.ctx.send(this.bind, this.value);
    this.ctx.redraw();
  }

  get hover() {
    return this.spec.hover ?? `${this.label}: ${this.value ? "on" : "off"}`;
  }

  paint(g) {
    const th = this.ctx.theme;
    const on = !!this.value;
    setColor(g, on ? this.style("accent") : this.style("track"));
    g.rectangle(this.x, this.y, this.w, this.h);
    g.fill();
    const str = this.spec.labels ? this.spec.labels[this.value] : this.label;
    this.text(g, str, this.x + this.w / 2, this.y + this.h / 2 + th.fontSize / 2 - 1,
      on ? this.style("textOn") : th.text);
  }
}

// enum selector: value is the item index (or values[index] if "values" is given).
// The list opens as an overlay drawn above everything else.
class Menu extends Widget {
  constructor(spec, ctx, ox, oy) {
    super(spec, ctx, ox, oy);
    this.interactive = true;
    this.items = spec.items ?? [];
    this.values = spec.values;
    this.index = clamp(spec.default ?? 0, 0, Math.max(0, this.items.length - 1));
    this.hoverIdx = -1;
  }

  setValue(v) {
    const i = this.values ? this.values.indexOf(v) : Math.round(v);
    if (i >= 0 && i < this.items.length) this.index = i;
  }

  get hover() {
    return this.spec.hover ?? `${this.label}: ${this.items[this.index] ?? ""}`;
  }

  click() {
    this.hoverIdx = this.index;
    this.ctx.overlay = this;
    this.ctx.redraw();
  }

  // list opens below the box, or above it if there's no room
  listRect() {
    const lh = this.items.length * this.h;
    const below = this.y + this.h + lh <= this.ctx.size[1];
    return { x: this.x, y: below ? this.y + this.h : Math.max(0, this.y - lh), w: this.w, h: lh };
  }

  rowAt(px, py) {
    const r = this.listRect();
    if (px < r.x || px >= r.x + r.w || py < r.y || py >= r.y + r.h) return -1;
    return Math.floor((py - r.y) / this.h);
  }

  overlayClick(px, py) {
    const i = this.rowAt(px, py);
    if (i < 0) return;
    this.index = i;
    this.ctx.send(this.bind, this.values ? this.values[i] : i);
  }

  overlayHover(px, py) {
    const i = this.rowAt(px, py);
    if (i !== this.hoverIdx) {
      this.hoverIdx = i;
      this.ctx.redraw();
    }
  }

  paint(g) {
    const th = this.ctx.theme;
    setColor(g, this.style("track"));
    g.rectangle(this.x, this.y, this.w, this.h);
    g.fill();
    const base = this.y + this.h / 2 + th.fontSize / 2 - 1;
    this.text(g, this.items[this.index] ?? "", this.x + 4, base, th.text, "l");
    // small down triangle
    const tx = this.x + this.w - 9, ty = this.y + this.h / 2 - 2;
    setColor(g, th.text, 0.7);
    g.move_to(tx, ty);
    g.line_to(tx + 6, ty);
    g.line_to(tx + 3, ty + 4);
    g.close_path();
    g.fill();
  }

  paintOverlay(g) {
    const th = this.ctx.theme;
    const r = this.listRect();
    setColor(g, th.panel);
    g.rectangle(r.x, r.y, r.w, r.h);
    g.fill();
    this.items.forEach((item, i) => {
      const ry = r.y + i * this.h;
      if (i === this.hoverIdx) {
        setColor(g, this.style("accent"), 0.5);
        g.rectangle(r.x, ry, r.w, this.h);
        g.fill();
      }
      this.text(g, item, r.x + 4, ry + this.h / 2 + th.fontSize / 2 - 1,
        i === this.index ? this.style("accent") : th.text, "l");
    });
  }
}

// ADSR envelope with draggable handles.
//   bind:   { attack, decay, sustain, release } -> attribute names
//   ranges: { attack: [lo, hi], ... } real ranges (default 0..1)
//   power:  skews the time axis, higher = more room for short times (default 3)
//   logs:   { attack: true, ... } log mapping for those stages instead of the power skew
//   defaults (optional): restored on double-click
// Each stage owns a quarter of the width, so dragging one handle never moves another.
class Envelope extends Widget {
  constructor(spec, ctx, ox, oy) {
    super(spec, ctx, ox, oy);
    this.interactive = true;
    this.keys = ["attack", "decay", "sustain", "release"];
    this.ranges = { attack: [0, 1], decay: [0, 1], sustain: [0, 1], release: [0, 1], ...(spec.ranges || {}) };
    this.power = spec.power ?? 3;
    this.logs = spec.logs ?? {};
    this.v = {};
    this.keys.forEach(k => { this.v[k] = spec.defaults?.[k] ?? this.ranges[k][0]; });
    this.hot = null;  // handle under the mouse
    this.grab = null; // handle being dragged
  }

  accepts(attr) {
    return Object.values(this.bind || {}).includes(attr);
  }

  setValue(v, attr) {
    const k = this.keys.find(key => this.bind[key] === attr);
    if (k) this.v[k] = clamp(v, ...this.ranges[k]);
  }

  // real value <-> position fraction (time stages are skewed, sustain is linear)
  frac(k) {
    const [lo, hi] = this.ranges[k];
    if (this.logs[k]) return logNorm(this.v[k], lo, hi);
    const n = clamp((this.v[k] - lo) / (hi - lo), 0, 1);
    return k === "sustain" ? n : n ** (1 / this.power);
  }

  fromFrac(k, f) {
    const [lo, hi] = this.ranges[k];
    const n = clamp(f, 0, 1);
    if (this.logs[k]) return logDenorm(n, lo, hi);
    return lo + (hi - lo) * (k === "sustain" ? n : n ** this.power);
  }

  geom() {
    const pad = 8;
    const x0 = this.x + pad, y0 = this.y + pad;
    const iw = this.w - 2 * pad, ih = this.h - 2 * pad, seg = iw / 4;
    const yS = y0 + ih * (1 - this.frac("sustain"));
    const p = [
      { x: x0, y: y0 + ih },
      { x: x0 + this.frac("attack") * seg, y: y0 },
      { x: x0 + seg + this.frac("decay") * seg, y: yS },
      { x: x0 + 3 * seg, y: yS },
      { x: x0 + 3 * seg + this.frac("release") * seg, y: y0 + ih },
    ];
    return { x0, y0, iw, ih, seg, p };
  }

  handles() {
    const { p } = this.geom();
    return [{ key: "attack", ...p[1] }, { key: "decay", ...p[2] }, { key: "release", ...p[4] }];
  }

  pick(px, py) {
    let best = null, bd = 10;
    this.handles().forEach(h => {
      const d = Math.hypot(h.x - px, h.y - py);
      if (d < bd) { bd = d; best = h.key; }
    });
    return best;
  }

  idle(px, py) {
    const k = this.pick(px, py);
    const changed = k !== this.hot;
    this.hot = k;
    return changed;
  }

  idleout() {
    this.hot = null;
  }

  click(px, py) {
    this.grab = this.pick(px, py);
    this.hot = this.grab;
    this.ctx.redraw();
  }

  set(k, v) {
    if (v === this.v[k]) return;
    this.v[k] = v;
    this.ctx.send(this.bind[k], v);
  }

  drag(px, py) {
    if (!this.grab) return;
    const { x0, y0, ih, seg } = this.geom();
    if (this.grab === "attack") {
      this.set("attack", this.fromFrac("attack", (px - x0) / seg));
    } else if (this.grab === "decay") {
      this.set("decay", this.fromFrac("decay", (px - x0 - seg) / seg));
      this.set("sustain", this.fromFrac("sustain", 1 - (py - y0) / ih));
    } else {
      this.set("release", this.fromFrac("release", (px - x0 - 3 * seg) / seg));
    }
    this.ctx.redraw();
  }

  release() {
    this.grab = null;
    this.ctx.redraw();
  }

  dblclick() {
    if (!this.spec.defaults) return;
    this.keys.forEach(k => { if (k in this.spec.defaults) this.set(k, this.spec.defaults[k]); });
    this.ctx.redraw();
  }

  fmtKey(k) {
    return fmtValue(this.v[k], false, k === "sustain" ? this.spec.sustainUnit : (this.spec.timeUnit ?? "ms"));
  }

  get hover() {
    const k = this.grab ?? this.hot;
    if (!k) return this.spec.hover ?? "";
    const name = key => `${toLabel(this.bind[key], this.ctx.theme.acronyms)}: ${this.fmtKey(key)}`;
    return k === "decay" ? `${name("decay")}   ${name("sustain")}` : name(k);
  }

  paint(g) {
    const th = this.ctx.theme;
    const { x0, y0, iw, ih, seg, p } = this.geom();
    const accent = this.style("accent");

    setColor(g, this.style("bg"));
    g.rectangle(this.x, this.y, this.w, this.h);
    g.fill();

    // faint grid
    g.set_line_width(1);
    setColor(g, th.text, 0.08);
    for (let i = 1; i < 4; i++) {
      g.move_to(x0 + i * seg, y0);
      g.line_to(x0 + i * seg, y0 + ih);
      g.move_to(x0, y0 + (i * ih) / 4);
      g.line_to(x0 + iw, y0 + (i * ih) / 4);
    }
    g.stroke();

    // translucent area, then the curve on top
    const trace = () => p.forEach((pt, i) => (i ? g.line_to(pt.x, pt.y) : g.move_to(pt.x, pt.y)));
    setColor(g, accent, 0.2);
    trace();
    g.close_path();
    g.fill();
    g.set_line_width(1.5);
    setColor(g, accent);
    trace();
    g.stroke();

    // handles
    const active = this.grab ?? this.hot;
    this.handles().forEach(h => {
      setColor(g, h.key === active ? th.text : accent);
      g.rectangle(h.x - 3, h.y - 3, 6, 6);
      g.fill();
    });
  }
}

// Free-form breakpoint envelope. Sends the whole point list on every change as
// `<bind> x1 y1 x2 y2 ...` in real units; the same message sets the points from outside.
//   xRange / yRange: real ranges (default 0..1);  xPower / yPower: axis skew (default 1)
//   points: initial [[x, y], ...];  fixedEnds (default true): first/last x pinned to the range ends
//   minPoints (default 2) / maxPoints (default 32);  xUnit / yUnit for the hover readout
// Click empty space to add a point, drag to move, option-click a point to delete it.
class Breakpoints extends Widget {
  constructor(spec, ctx, ox, oy) {
    super(spec, ctx, ox, oy);
    this.interactive = true;
    this.xr = spec.xRange ?? [0, 1];
    this.yr = spec.yRange ?? [0, 1];
    this.xp = spec.xPower ?? 1;
    this.yp = spec.yPower ?? 1;
    this.fixedEnds = spec.fixedEnds ?? true;
    this.minPts = spec.minPoints ?? 2;
    this.maxPts = spec.maxPoints ?? 32;
    const [x0, x1] = this.xr, [y0, y1] = this.yr;
    this.pts = (spec.points ?? [[x0, y0], [x0 + (x1 - x0) / 2, y1], [x1, y0]]).map(([px, py]) => [px, py]);
    this.hot = null;  // point index under the mouse
    this.grab = null; // point index being dragged
  }

  // real value <-> position fraction
  fx(x) { return clamp((x - this.xr[0]) / (this.xr[1] - this.xr[0]), 0, 1) ** (1 / this.xp); }
  fy(y) { return clamp((y - this.yr[0]) / (this.yr[1] - this.yr[0]), 0, 1) ** (1 / this.yp); }
  rx(f) { return this.xr[0] + (this.xr[1] - this.xr[0]) * clamp(f, 0, 1) ** this.xp; }
  ry(f) { return this.yr[0] + (this.yr[1] - this.yr[0]) * clamp(f, 0, 1) ** this.yp; }

  geom() {
    const pad = 8;
    return { x0: this.x + pad, y0: this.y + pad, iw: this.w - 2 * pad, ih: this.h - 2 * pad };
  }

  screen(pt) {
    const { x0, y0, iw, ih } = this.geom();
    return { x: x0 + this.fx(pt[0]) * iw, y: y0 + ih * (1 - this.fy(pt[1])) };
  }

  fromScreen(px, py) {
    const { x0, y0, iw, ih } = this.geom();
    return [this.rx((px - x0) / iw), this.ry(1 - (py - y0) / ih)];
  }

  pick(px, py) {
    let best = -1, bd = 10;
    this.pts.forEach((pt, i) => {
      const s = this.screen(pt);
      const d = Math.hypot(s.x - px, s.y - py);
      if (d < bd) { bd = d; best = i; }
    });
    return best;
  }

  // incoming flat list: x1 y1 x2 y2 ...
  setValue(v) {
    if (!Array.isArray(v) || v.length < 2) return;
    const out = [];
    for (let i = 0; i + 1 < v.length; i += 2) out.push([clamp(v[i], ...this.xr), clamp(v[i + 1], ...this.yr)]);
    out.sort((a, b) => a[0] - b[0]);
    this.pts = out;
    this.hot = this.grab = null;
  }

  emit() {
    this.ctx.send(this.bind, this.pts.flat());
  }

  insert(px, py) {
    const [x, y] = this.fromScreen(px, py);
    let i = this.pts.findIndex(p => p[0] > x);
    if (i < 0) i = this.pts.length;
    if (this.fixedEnds) i = clamp(i, 1, this.pts.length - 1); // never before the first or after the last end
    this.pts.splice(i, 0, [x, y]);
    this.emit();
    return i;
  }

  remove(i) {
    const isEnd = i === 0 || i === this.pts.length - 1;
    if (this.pts.length <= this.minPts || (this.fixedEnds && isEnd)) return;
    this.pts.splice(i, 1);
    this.hot = null;
    this.emit();
  }

  click(px, py, mods) {
    const i = this.pick(px, py);
    this.grab = null;
    if (i >= 0 && mods.option) this.remove(i);
    else if (i >= 0) this.grab = i;
    else if (!mods.option && this.pts.length < this.maxPts) this.grab = this.insert(px, py);
    this.hot = this.grab;
    this.ctx.redraw();
  }

  drag(px, py) {
    if (this.grab === null) return;
    const i = this.grab, last = this.pts.length - 1;
    let [x, y] = this.fromScreen(px, py);
    // keep the points ordered by x
    x = clamp(x, i > 0 ? this.pts[i - 1][0] : this.xr[0], i < last ? this.pts[i + 1][0] : this.xr[1]);
    if (this.fixedEnds && i === 0) x = this.xr[0];
    if (this.fixedEnds && i === last) x = this.xr[1];
    this.pts[i] = [x, y];
    this.emit();
    this.ctx.redraw();
  }

  release() {
    this.grab = null;
    this.ctx.redraw();
  }

  idle(px, py) {
    const i = this.pick(px, py);
    const next = i >= 0 ? i : null;
    const changed = next !== this.hot;
    this.hot = next;
    return changed;
  }

  idleout() {
    this.hot = null;
  }

  get hover() {
    const i = this.grab ?? this.hot;
    if (i === null || !this.pts[i]) return this.spec.hover ?? "";
    const [x, y] = this.pts[i];
    return `Point ${i + 1}: ${fmtValue(x, false, this.spec.xUnit)}, ${fmtValue(y, false, this.spec.yUnit)}`;
  }

  paint(g) {
    const th = this.ctx.theme;
    const { x0, y0, iw, ih } = this.geom();
    const accent = this.style("accent");
    const sp = this.pts.map(p => this.screen(p));

    setColor(g, this.style("bg"));
    g.rectangle(this.x, this.y, this.w, this.h);
    g.fill();

    // faint grid
    g.set_line_width(1);
    setColor(g, th.text, 0.08);
    for (let i = 1; i < 4; i++) {
      g.move_to(x0 + (i * iw) / 4, y0);
      g.line_to(x0 + (i * iw) / 4, y0 + ih);
      g.move_to(x0, y0 + (i * ih) / 4);
      g.line_to(x0 + iw, y0 + (i * ih) / 4);
    }
    g.stroke();

    // translucent area down to the baseline, then the line on top
    const trace = () => sp.forEach((pt, i) => (i ? g.line_to(pt.x, pt.y) : g.move_to(pt.x, pt.y)));
    setColor(g, accent, 0.2);
    trace();
    g.line_to(sp[sp.length - 1].x, y0 + ih);
    g.line_to(sp[0].x, y0 + ih);
    g.close_path();
    g.fill();
    g.set_line_width(1.5);
    setColor(g, accent);
    trace();
    g.stroke();

    // handles
    const active = this.grab ?? this.hot;
    sp.forEach((pt, i) => {
      setColor(g, i === active ? th.text : accent);
      g.rectangle(pt.x - 3, pt.y - 3, 6, 6);
      g.fill();
    });
  }
}

// placeholder for unknown types so a bad layout entry is visible, not fatal
class Missing extends Widget {
  paint(g) {
    setColor(g, "#aa3333", 0.5);
    g.rectangle(this.x, this.y, this.w, this.h);
    g.fill();
    this.text(g, `? ${this.spec.type}`, this.x + this.w / 2, this.y + this.h / 2, "#ffffff");
  }
}

// ---------- registry ----------

const registry = { panel: Panel, dial: Dial, slider: Slider, toggle: Toggle, menu: Menu, envelope: Envelope, breakpoints: Breakpoints };
const register = (type, cls) => { registry[type] = cls; };

// ---------- UI instance (one per device) ----------

class UI {
  constructor({ send, redraw }) {
    this.send = send || (() => {});
    this.redraw = redraw || (() => {});
    this.theme = DEFAULT_THEME;
    this.size = [300, 200];
    this.widgets = [];
    this.hovered = null;
    this.active = null;
    this.overlay = null; // widget with an open popup (menu list)
  }

  load(layout) {
    const t = layout.theme || {};
    this.theme = { ...DEFAULT_THEME, ...t, dial: { ...DEFAULT_THEME.dial, ...(t.dial || {}) } };
    this.size = layout.size || this.size;
    this.widgets = [];
    this.hovered = this.active = this.overlay = null;
    (layout.widgets || []).forEach(spec => this.add(spec, 0, 0));
  }

  // panels flatten: children are stored with absolute coords, drawn after the panel
  add(spec, ox, oy) {
    const key = spec.type === "custom" ? spec.kind : spec.type;
    let Cls = registry[key];
    if (!Cls) {
      post(`ui: unknown widget type "${key}"\n`);
      Cls = Missing;
    }
    const w = new Cls(spec, this, ox, oy);
    this.widgets.push(w);
    (spec.children || []).forEach(c => this.add(c, w.x, w.y));
  }

  paint(g) {
    setColor(g, this.theme.bg);
    g.rectangle(0, 0, this.size[0], this.size[1]);
    g.fill();
    this.widgets.forEach(w => w.paint(g));
    if (this.theme.showHover && this.hovered && this.hovered.hover) {
      g.select_font_face(this.theme.font);
      g.set_font_size(this.theme.fontSize);
      setColor(g, this.theme.text, 0.8);
      g.move_to(6, this.size[1] - 4);
      g.show_text(this.hovered.hover);
    }
    if (this.overlay) this.overlay.paintOverlay(g);
  }

  // front-to-back: last drawn widget wins
  hit(x, y) {
    for (let i = this.widgets.length - 1; i >= 0; i--) {
      const w = this.widgets[i];
      if (w.interactive && w.contains(x, y)) return w;
    }
    return null;
  }

  click(x, y, but, cmd, shift, caps, option, ctrl) {
    if (this.overlay) { // an open popup swallows the next click
      const o = this.overlay;
      this.overlay = null;
      this.active = null;
      o.overlayClick(x, y);
      this.redraw();
      return;
    }
    this.active = this.hit(x, y);
    if (this.active) this.active.click(x, y, { cmd, shift, option, ctrl });
  }

  drag(x, y, but, cmd, shift, caps, option, ctrl) {
    if (!this.active) return;
    if (!but) {
      this.active.release();
      this.active = null;
      return;
    }
    this.active.drag(x, y, { cmd, shift, option, ctrl });
  }

  dblclick(x, y) {
    if (this.overlay) return;
    const w = this.hit(x, y);
    if (w) w.dblclick();
  }

  idle(x, y) {
    if (this.overlay) {
      this.overlay.overlayHover(x, y);
      return;
    }
    const w = this.hit(x, y);
    let dirty = w !== this.hovered;
    if (dirty && this.hovered) this.hovered.idleout();
    this.hovered = w;
    if (w && w.idle(x, y)) dirty = true;
    if (dirty) this.redraw();
  }

  idleout() {
    if (this.hovered) this.hovered.idleout();
    this.hovered = null;
    this.redraw();
  }

  // incoming value from the Ableton object / patcher (does not send back out)
  setValue(attr, v) {
    this.widgets.forEach(w => { if (w.accepts(attr)) w.setValue(v, attr); });
    this.redraw();
  }

  // switch every hex-capable widget: "hex" | "real" | "both"
  setReadout(mode) {
    this.widgets.forEach(w => w.setMode(mode));
    this.redraw();
  }
}

const create = opts => new UI(opts);

module.exports = { create, register, Widget, ValueWidget, toLabel, toAttr, DEFAULT_THEME };
