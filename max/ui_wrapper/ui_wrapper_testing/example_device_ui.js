// example_device_ui.js — per-device v8ui script
const uilib = require("ztrk_alb_ui_wrapper.js");
const genparser = require("gen_param_parser.js");

mgraphics.init();
mgraphics.relative_coords = 0;
mgraphics.autofill = 0;

const ui = uilib.create({
  send: (attr, v) => (Array.isArray(v) ? outlet(0, attr, ...v) : outlet(0, attr, v)), // lists (breakpoints) are spread
  redraw: () => mgraphics.redraw(),
});

// custom widgets: uilib.register("keyboard", KeyboardClass) before loadlayout

// whole text file as a string: File without the "TEXT" flag (it fails with it), read in chunks
function readText(file, chunk = 4096) {
  const f = new File(file, "read");
  if (!f.isopen) return null;
  let out = "";
  while (f.position < f.eof) {
    const s = f.readstring(chunk);
    if (!s) break; // never spin if a read comes back empty
    out += s;
  }
  f.close();
  return out;
}

// file -> object via Dict.import_json, or null
function readDict(file) {
  try {
    const d = new Dict();
    d.import_json(file);
    const s = d.stringify();
    return s && s !== "{}" ? JSON.parse(s) : null;
  } catch (e) {
    return null;
  }
}

// .json / .maxpat / .gendsp -> object: Dict first, chunked File read as the fallback
function readJson(file) {
  const viaDict = readDict(file);
  if (viaDict) return viaDict;
  const text = readText(file);
  return text ? JSON.parse(text) : null;
}

function loadlayout(file) {
  const layout = readJson(file);
  if (!layout) return post(`ui: couldn't read ${file}\n`);
  ui.load(layout);
  post(`ui: loaded ${file}, size ${ui.size[0]}x${ui.size[1]}\n`);
  mgraphics.redraw();
}

// build the UI straight from a tagged gen~ patch: loadgen <file.maxpat> [machine]
// Tries the raw file text first, then Dict, and posts what each route found so a miss is diagnosable.
function loadgen(file, machine) {
  const routes = [["File text", () => readText(file)], ["Dict", () => readDict(file)]];
  for (const [via, read] of routes) {
    const src = read();
    if (!src) {
      post(`ui: ${via}: couldn't read ${file}\n`);
      continue;
    }
    if (typeof src === "string") post(`ui: ${via}: ${src.length} chars, ${src.includes("#!") ? "has" : "no"} "#!"\n`);
    const found = genparser.layoutsFromPatch(src);
    post(`ui: ${via}: ${found.length} tagged machine(s) [${found.map(f => f.machine).join(", ")}]\n`);
    const hit = found.find(f => !machine || f.machine === machine);
    if (!hit) continue;
    hit.warnings.forEach(w => post(`ui: ${w}\n`));
    ui.load(hit.layout);
    post(`ui: ${hit.machine}, ${hit.params.length} params, size ${ui.size[0]}x${ui.size[1]}\n`);
    return mgraphics.redraw();
  }
  post(`ui: no //#! machine${machine ? ` named ${machine}` : ""} found in ${file}\n`);
}

function readout(mode) { ui.setReadout(mode); } // "hex" | "real" | "both"

function paint() { ui.paint(mgraphics); }
function onclick(...a) { ui.click(...a); }
function ondrag(...a) { ui.drag(...a); }
function ondblclick(...a) { ui.dblclick(...a); }
function onidle(x, y) { ui.idle(x, y); }
function onidleout() { ui.idleout(); }

// incoming "<attr> <value>" messages update the widgets
function anything(...args) { ui.setValue(messagename, args.length > 1 ? args : args[0]); } // lists stay lists
