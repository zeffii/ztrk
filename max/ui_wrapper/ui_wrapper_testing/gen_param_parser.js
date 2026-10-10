// gen_param_parser.js
// Finds genexpr codeboxes tagged with a first line `//#! MachineName` in a .maxpat / .gendsp
// (read as JSON), parses their Param declarations, and builds ui_wrapper layouts from them.
// Works in v8 (require) and as a Node CLI:  node gen_param_parser.js patch.maxpat [outDir]
//
// Param convention understood:
//   // --- SECTION ---                       groups the params that follow (one panel each)
//   Param cutoff(1200);   // (type=hz, default=1200, scale=[40,10000], log)
// Plain `Param name(default, min=.., max=..)` still works when there is no trailing comment.

const SHEBANG = /^\s*\/\/#!\s*(\S.*?)\s*$/;
const SECTION = /^\s*\/\/\s*-{2,}\s*(.+?)\s*-{2,}\s*$/;
const PARAM = /^\s*Param\s+([A-Za-z_]\w*)\s*\(([^)]*)\)\s*;?\s*(?:\/\/(.*))?$/;

// how each `type=` is shown. Edit here or pass opts.types to layoutFor / layoutsFromPatch.
//   hex: digits for the hex readout, unit, bipolar (fill from centre), int (whole numbers), widget
const TYPES = {
  coeff:     { hex: 2 },
  bipolar:   { hex: 2, bipolar: true },
  semitones: { hex: 2, bipolar: true, int: true, unit: "st" },
  hz:        { hex: 4, unit: "Hz" },
  s:         { hex: 2, unit: "s" },
  bool:      { widget: "toggle" },
};

// walk the whole patch JSON; any object whose `code` string starts with the shebang is a machine
const findMachines = patch => {
  const out = [];
  const walk = node => {
    if (Array.isArray(node)) return node.forEach(walk);
    if (!node || typeof node !== "object") return;
    if (typeof node.code === "string") {
      const first = node.code.split(/\r\n|\r|\n/, 1)[0];
      const m = SHEBANG.exec(first);
      if (m) out.push({ machine: m[1], code: node.code });
    }
    Object.values(node).forEach(walk);
  };
  walk(patch);
  return out;
};

// same, straight from the raw file text: no need to parse the whole patch as JSON first.
// Finds every "code": "<json string>" and unescapes just that string.
const findMachinesInText = text => {
  const out = [];
  const re = /"code"\s*:\s*("(?:[^"\\]|\\[\s\S])*")/g;
  let m;
  while ((m = re.exec(text))) {
    let code;
    try { code = JSON.parse(m[1]); } catch (e) { continue; }
    const hit = SHEBANG.exec(code.split(/\r\n|\r|\n/, 1)[0]);
    if (hit) out.push({ machine: hit[1], code });
  }
  return out;
};

// split on commas that aren't inside () or []
const splitArgs = s => {
  const parts = [];
  let depth = 0, cur = "";
  for (const ch of s) {
    if (ch === "(" || ch === "[") depth++;
    if (ch === ")" || ch === "]") depth--;
    if (ch === "," && depth === 0) { parts.push(cur); cur = ""; } else cur += ch;
  }
  if (cur.trim()) parts.push(cur);
  return parts;
};

const num = s => {
  const n = Number(s.trim());
  return s.trim() !== "" && Number.isFinite(n) ? n : undefined;
};

// "(type=hz, default=40, scale=[20,2000], log)" -> { type, default, min, max, log }
const parseMeta = text => {
  const t = text.trim();
  if (!t.startsWith("(") || !t.endsWith(")")) return {};
  const out = {};
  splitArgs(t.slice(1, -1)).forEach(arg => {
    const a = arg.trim();
    const kv = /^(\w+)\s*=\s*(.+)$/.exec(a);
    if (!kv) { if (a) out[a] = true; return; } // bare flag, e.g. log
    const [, k, v] = kv;
    if (k === "scale") {
      const m = /^\[\s*([^,\]]+?)\s*,\s*([^\]]+?)\s*\]$/.exec(v.trim());
      if (m && num(m[1]) !== undefined && num(m[2]) !== undefined) { out.min = num(m[1]); out.max = num(m[2]); }
    } else if (k === "type") {
      out.type = v.trim();
    } else if (num(v) !== undefined) {
      out[k] = num(v);
    }
  });
  return out;
};

// -> [{ title, note, params: [{ name, type?, default?, min?, max?, log? }] }]
// params before any `// --- X ---` header go into a section titled fallbackTitle
const parseSections = (code, fallbackTitle = "Params") => {
  const src = code.replace(/\/\*[\s\S]*?\*\//g, m => m.replace(/[^\n\r]/g, " ")); // blank block comments
  const sections = [];
  let cur = null;
  src.split(/\r\n|\r|\n/).forEach(line => {
    const sec = SECTION.exec(line);
    if (sec) {
      const [title, ...rest] = sec[1].split(/\s*\(/);
      cur = { title: title.trim(), note: rest.join("(").replace(/\)\s*$/, ""), params: [] };
      sections.push(cur);
      return;
    }
    const pm = PARAM.exec(line);
    if (!pm) return;
    const p = { name: pm[1] };
    splitArgs(pm[2]).forEach((arg, i) => {
      const kv = /^\s*(\w+)\s*=\s*(.+)$/.exec(arg);
      if (kv) {
        const n = num(kv[2]);
        if (n !== undefined) p[kv[1]] = n;
      } else if (i === 0) {
        const n = num(arg);
        if (n !== undefined) p.default = n;
      }
    });
    Object.assign(p, parseMeta(pm[3] || "")); // the trailing comment wins
    if (!cur) {
      cur = { title: fallbackTitle, note: "", params: [] };
      sections.push(cur);
    }
    cur.params.push(p);
  });
  return sections;
};

const parseParams = code => parseSections(code).flatMap(s => s.params);

// attack / decay* / sustain / release in one section -> drawn as a single envelope widget
const findAdsr = ps => {
  const pick = re => ps.find(p => re.test(p.name));
  const a = pick(/^attack/i), d = pick(/^decay/i), s = pick(/^sustain/i), r = pick(/^release/i);
  return a && d && s && r ? { attack: a, decay: d, sustain: s, release: r } : null;
};

// first-pass layout: a panel per section, dials in a grid (toggles for bool, an envelope for ADSR),
// panels packed left to right and wrapped at maxWidth.
// opts: cols, cellW, cellH, pad, maxWidth, theme, envelopes (default true), types, overrides: { name: {...} }
const layoutFor = ({ machine, sections }, opts = {}) => {
  const { cols = 6, cellW = 72, cellH = 64, pad = 8, maxWidth = 620,
    theme = {}, envelopes = true, overrides = {} } = opts;
  const types = { ...TYPES, ...(opts.types || {}) };
  const warnings = [];

  const widgetFor = (p, x, y) => {
    const t = types[p.type] ?? {};
    if (p.min === undefined || p.max === undefined) warnings.push(`${machine}.${p.name}: no scale, using ${p.min ?? 0}..${p.max ?? 1}`);
    const min = p.min ?? 0, max = p.max ?? 1, def = p.default ?? min;
    const ov = overrides[p.name] || {};
    if (t.widget === "toggle") return { type: "toggle", bind: p.name, x: x + 3, y: y + 14, w: cellW - 6, h: 18, default: def, ...ov };
    // untyped whole-number params with a small multi-step range become int dials
    const isInt = t.int ?? (!p.type && [min, max, def].every(Number.isInteger) && max - min >= 2 && max - min <= 64);
    return {
      type: "dial", bind: p.name, x, y, w: cellW, h: cellH, min, max, default: def,
      ...(p.log ? { log: true } : {}), ...(t.bipolar ? { bipolar: true } : {}), ...(isInt ? { int: true } : {}),
      ...(t.unit ? { unit: t.unit } : {}), ...(t.hex ? { hex: t.hex } : {}), ...ov,
    };
  };

  const panels = sections.filter(s => s.params.length).map(sec => {
    const adsr = envelopes ? findAdsr(sec.params) : null;
    const taken = new Set(adsr ? Object.values(adsr) : []);
    const rest = sec.params.filter(p => !taken.has(p));
    const innerW = Math.max(Math.min(cols, rest.length) * cellW, adsr ? 240 : 0);
    const children = [];
    let y = 18;
    if (adsr) {
      const ks = Object.keys(adsr);
      const fromKeys = (pred, f) => Object.fromEntries(ks.filter(pred).map(k => [k, f(adsr[k])]));
      children.push({
        type: "envelope", x: 10, y, w: innerW, h: 90,
        bind: fromKeys(() => true, p => p.name),
        ranges: fromKeys(() => true, p => [p.min ?? 0, p.max ?? 1]),
        logs: fromKeys(k => adsr[k].log, () => true),
        defaults: fromKeys(k => adsr[k].default !== undefined, p => p.default),
        timeUnit: types[adsr.attack.type]?.unit ?? "ms",
        ...(overrides[sec.title] || {}),
      });
      y += 96;
    }
    rest.forEach((p, i) => children.push(widgetFor(p, 10 + (i % cols) * cellW, y + Math.floor(i / cols) * cellH)));
    const rows = Math.ceil(rest.length / cols);
    return { title: sec.title, w: innerW + 20, h: y + rows * cellH + (rest.length ? 6 : 0), children };
  });

  let x = pad, y = pad, rowH = 0, totalW = 0;
  const widgets = panels.map(p => {
    if (x > pad && x + p.w > maxWidth) { x = pad; y += rowH + pad; rowH = 0; }
    const spec = { type: "panel", title: p.title, x, y, w: p.w, h: p.h, children: p.children };
    x += p.w + pad;
    rowH = Math.max(rowH, p.h);
    totalW = Math.max(totalW, x);
    return spec;
  });
  return { layout: { machine, size: [totalW, y + rowH + pad], theme, widgets }, warnings };
};

// every tagged machine in a patch -> [{ machine, params, sections, layout, warnings }]
// `patch` is either the parsed JSON object or the raw file text
const layoutsFromPatch = (patch, opts = {}) =>
  (typeof patch === "string" ? findMachinesInText(patch) : findMachines(patch)).map(({ machine, code }) => {
    const sections = parseSections(code, machine);
    return { machine, sections, params: sections.flatMap(s => s.params), ...layoutFor({ machine, sections }, opts) };
  });

module.exports = { SHEBANG, TYPES, findMachines, findMachinesInText, parseMeta, parseSections, parseParams, layoutFor, layoutsFromPatch };

// CLI: writes <outDir>/<machine>_layout.json for every tagged machine
if (typeof process !== "undefined" && typeof require !== "undefined" && require.main === module) {
  const fs = require("fs");
  const [file, outDir = "."] = process.argv.slice(2);
  if (!file) {
    console.log("usage: node gen_param_parser.js patch.maxpat [outDir]");
    process.exit(1);
  }
  const found = layoutsFromPatch(JSON.parse(fs.readFileSync(file, "utf8")));
  if (!found.length) console.log("no //#! machines found");
  found.forEach(f => {
    const out = `${outDir}/${f.machine}_layout.json`;
    fs.writeFileSync(out, JSON.stringify(f.layout, null, 2));
    console.log(`${f.machine}: ${f.params.length} params, ${f.sections.length} sections -> ${out}`);
    f.warnings.forEach(w => console.log(`  warning: ${w}`));
  });
}
