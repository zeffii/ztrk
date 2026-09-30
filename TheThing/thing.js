// thing.js -- node-graph modular that writes genexpr.
// Target: [v8ui @filename thing.js]  (Max 9, modern JS).
// Two ways to get polyphony (STYLE.mode):
//   "unrolled"  all voices live inside ONE [gen~]; the voice-dependent nodes are written out once per voice.
//               Notes arrive as SIGNALS on the gen~ inlets and are allocated to voices inside the gen~, sample-accurately:
//               inlet 1 = pitch, inlet 2 = velocity (0 = note off), inlet 3 = trigger (one-sample impulse per event).
//   "mc"        the generated patch is ONE voice for [mc.gen~]; mc.noteallocator~ supplies the voices
//               (inlets: pitch, gate, velocity per voice).
//
// WHERE TO TWEAK
//   STYLE    fonts, colours, spacing, node widths (in characters), note-input conventions
//   MODULES  node types: ports, knobs (ranges, units, steps), and the genexpr each one emits
//   layout / drawNode   how a node is arranged and drawn
//
// MESSAGES  add <type> [x y] | remove <id> | connect <n> <out> <n> <in> | clear | rebuild | dump
//           setfont <family> [size]
//           setmode unrolled|mc | setvoices <n>        (unrolled: max 16)
//           undo | redo | history | revert <index>
//           autosave <path>   file written after EVERY change (loaded too, if it already exists)
//           commit [<path>]   file written ONLY when you send this (path is remembered)
//           loadpatch <path>  load a patch (does not change either save path)
//           outfile <path>    where the generated genexpr goes
//           sample <idx> <start> <len> <sr>   register a sample inside [buffer~ thingsamples] (frames)
// MOUSE     drag title = move | cmd-click title = delete | drag slider = value (shift = fine)
//           double-click slider = default | drag from an output dot = wire
//           drag from a connected input dot = pick the wire up (drop on empty space = remove)

autowatch = 1;
inlets = 1;
outlets = 1;
mgraphics.init();
mgraphics.relative_coords = 0;
mgraphics.autofill = 0;

const STYLE = {
	bufname: "thingparams", outfile: "thing_patch", rebuildMs: 300, mapBase: 1024, maxUndo: 200,
	mode: "unrolled",           // "unrolled" = all voices in one gen~ | "mc" = one voice, for [mc.gen~]
	voices: 8,                  // unrolled voice count (1..16)
	// note input conventions (both modes)
	pitchIsMidi: true,          // true: the pitch input is a MIDI note number, false: it is already Hz
	velScale: 1 / 127,          // the velocity input is multiplied by this to give 0..1
	// text + spacing (row height, label width and node width all follow the font)
	font: "Arial", fs: 9, lineH: 1.35, pad: 3, portR: 3, hitR: 6, wireW: 1.5,
	nodeChars: 20, labelChars: 6,   // default node width and knob-label width, in characters
	cBg: [0.10, 0.10, 0.11, 1], cNode: [0.17, 0.17, 0.19, 1],
	cTitle: [0.24, 0.24, 0.29, 1], cTitlePoly: [0.20, 0.32, 0.26, 1],
	cText: [0.86, 0.86, 0.89, 1], cDim: [0.56, 0.56, 0.62, 1],
	cBar: [0.28, 0.52, 0.74, 1], cBarBg: [0.11, 0.11, 0.13, 1], cAmt: [0.86, 0.56, 0.25, 1],
	cPort: [0.92, 0.92, 0.92, 1],
	cWire: [0.70, 0.70, 0.78, 0.9], cWirePoly: [0.42, 0.80, 0.56, 0.9], cWireDrag: [1, 1, 1, 0.5],
};

// ---------------------------------------------------------------- modules
// ins:    signal inputs that have no knob        {n, def}   def = value when unwired
// outs:   output names
// params: knobs {n, min, max, def, exp, int, steps, unit}; add mod:"oct"|"lin" (+ amt, amax) to give a knob its own input port
// gen(c): returns genexpr lines.  c.out(name) c.in(name) c.p(name) c.has(name) c.sum("L"|"R", expr)
// "poly" means "derived from the note input" (green title, green wires). In unrolled mode those nodes are generated
// once per voice; in mc mode the whole patch is one voice.
const MODULES = {
	note: {
		label: "note", poly: "source", ins: [], outs: ["freq", "gate", "vel"], params: [],
		gen: c => c.mc ? [
			`${c.out("freq")} = ${STYLE.pitchIsMidi ? "440 * pow(2, (vpitch - 69) / 12)" : "vpitch"};`,
			`${c.out("gate")} = vgate;`,
			`${c.out("vel")} = vvel * ${STYLE.velScale};`,
		] : [
			`${c.out("freq")}, ${c.out("gate")}, ${c.out("vel")} = t_vslot(${c.v}, voice_tv, voice_ev, vpitch, vvel);`,
		],
	},
	osc: {
		label: "osc", ins: [{ n: "freq", def: "261.63" }], outs: ["out"],
		params: [
			{ n: "wave", min: 0, max: 3, def: 2, steps: ["sin", "tri", "saw", "sqr"] },
			{ n: "tune", min: -24, max: 24, def: 0, unit: "st", mod: "lin", amt: 1, amax: 24 },
			{ n: "pw", min: 0.05, max: 0.95, def: 0.5, mod: "lin", amt: 0.2, amax: 0.9 },
		],
		gen: c => [`${c.out("out")} = t_osc(${c.in("freq")}, ${c.p("wave")}, ${c.p("tune")}, ${c.p("pw")});`],
	},
	sampler: {
		label: "sampler", chars: 24,
		ins: [{ n: "freq", def: "261.63" }, { n: "gate", def: "0" }], outs: ["out"],
		params: [
			{ n: "idx", min: 0, max: 63, def: 0, int: true },
			{ n: "vol", min: 0, max: 2, def: 1, mod: "lin", amt: 0.5, amax: 2 },
			{ n: "offset", min: 0, max: 1, def: 0 },
			{ n: "loop", min: 0, max: 1, def: 0, steps: ["off", "on"] },
			{ n: "a", min: 0, max: 1, def: 0 },
			{ n: "b", min: 0, max: 1, def: 1 },
			{ n: "type", min: 0, max: 1, def: 0, steps: ["fwd", "ping"] },
			{ n: "xfade", min: 0, max: 0.5, def: 0 },
			{ n: "root", min: 0, max: 127, def: 60, int: true },
		],
		gen: c => [`${c.out("out")} = t_smp(P, S, ${c.in("gate")}, ${c.in("freq")}, ${c.p("idx")}, ${c.p("vol")}, ${c.p("offset")}, ${c.p("loop")}, ${c.p("a")}, ${c.p("b")}, ${c.p("type")}, ${c.p("xfade")}, ${c.p("root")});`],
	},
	filter: {
		label: "filter", ins: [{ n: "in", def: "0" }, { n: "key", def: "261.63" }], outs: ["out"],
		params: [
			{ n: "cutoff", min: 20, max: 18000, def: 1200, exp: true, unit: "Hz", mod: "oct", amt: 1, amax: 4 },
			{ n: "res", min: 0, max: 1, def: 0.2, mod: "lin", amt: 0.3, amax: 1 },
			{ n: "mode", min: 0, max: 2, def: 0, steps: ["lp", "bp", "hp"] },
			{ n: "track", min: 0, max: 1, def: 0 },
		],
		gen: c => [`${c.out("out")} = t_svf(${c.in("in")}, ${c.p("cutoff")}, ${c.p("res")}, ${c.p("mode")}, ${c.in("key")}, ${c.p("track")});`],
	},
	env: {
		label: "env", ins: [{ n: "gate", def: "0" }], outs: ["out"],
		params: [
			{ n: "a", min: 0.001, max: 4, def: 0.005, exp: true, unit: "s" },
			{ n: "d", min: 0.001, max: 4, def: 0.2, exp: true, unit: "s" },
			{ n: "s", min: 0, max: 1, def: 0.6 },
			{ n: "r", min: 0.001, max: 6, def: 0.3, exp: true, unit: "s" },
		],
		gen: c => [`${c.out("out")} = t_env(${c.in("gate")}, ${c.p("a")}, ${c.p("d")}, ${c.p("s")}, ${c.p("r")});`],
	},
	vca: {
		label: "vca", ins: [{ n: "in", def: "0" }, { n: "cv", def: "1" }, { n: "cv2", def: "1" }], outs: ["out"],
		params: [{ n: "gain", min: 0, max: 2, def: 1 }],
		gen: c => [`${c.out("out")} = ${c.in("in")} * ${c.in("cv")} * ${c.in("cv2")} * ${c.p("gain")};`],
	},
	lfo: {
		label: "lfo", ins: [], outs: ["out"],
		params: [
			{ n: "rate", min: 0.02, max: 40, def: 3, exp: true, unit: "Hz" },
			{ n: "shape", min: 0, max: 3, def: 0, steps: ["sin", "tri", "saw", "sqr"] },
		],
		gen: c => [`${c.out("out")} = t_osc(${c.p("rate")}, ${c.p("shape")}, 0, 0.5);`],
	},
	out: {
		label: "out", poly: "sink", ins: [{ n: "l", def: "0" }, { n: "r", def: null }], outs: [],
		params: [{ n: "level", min: 0, max: 1, def: 0.3 }],
		gen: c => {
			const L = c.in("l"), R = c.has("r") ? c.in("r") : L;
			c.sum("L", `${L} * ${c.p("level")}`);
			c.sum("R", `${R} * ${c.p("level")}`);
			return [];
		},
	},
};

// genexpr helpers, always emitted at the top of the generated file.
// History lives inside the functions, so every call site gets its own state.
const CORELIB = `
t_osc(f, shape, tune, pw) {
	History ph(0);
	nph = wrap(ph + f * pow(2, tune / 12) / samplerate, 0, 1);
	ph = nph;
	s = sin(twopi * nph);
	t = 4 * abs(nph - 0.5) - 1;
	w = 2 * nph - 1;
	q = nph < pw ? 1 : -1;
	return shape < 0.5 ? s : (shape < 1.5 ? t : (shape < 2.5 ? w : q));
}

t_svf(x, fc, res, mode, key, track) {
	History lp(0);
	History bp(0);
	fr = clamp(fc * pow(key / 261.63, track), 10, samplerate * 0.15);
	f = 2 * sin(pi * fr / samplerate);
	d = mix(2, 0.05, clamp(res, 0, 1));
	hp = x - lp - d * bp;
	nbp = bp + f * hp;
	nlp = lp + f * nbp;
	bp = nbp;
	lp = nlp;
	return mode < 0.5 ? nlp : (mode < 1.5 ? nbp : hp);
}

t_env(gate, a, d, s, r) {
	History lvl(0);
	History stg(0);
	History gp(0);
	on = gate > 0.5;
	if (on && gp < 0.5) { stg = 1; }
	if (!on) { stg = 0; }
	gp = on;
	st = stg;
	l = lvl;
	if (st == 1) {
		l = lvl + 1 / (max(a, 0.0005) * samplerate);
		if (l >= 1) { l = 1; stg = 2; }
	}
	if (st == 2) {
		l = lvl - (1 - s) / (max(d, 0.0005) * samplerate);
		if (l <= s) { l = s; stg = 3; }
	}
	if (st == 3) { l = s; }
	if (st == 0) { l = lvl * exp(-5 / (max(r, 0.001) * samplerate)); }
	lvl = l;
	return l;
}

t_rd(S, base, p) {
	i0 = floor(p);
	fr = p - i0;
	return mix(peek(S, base + i0), peek(S, base + i0 + 1), fr);
}

// sample map lives in the parameter buffer: slot ${STYLE.mapBase} + idx * 4 = start frame, +1 = length, +2 = sample rate
// loop crossfade (forward loops): the last xl frames before B are blended with the frames after A,
// and playback wraps to A + xl, so the join is continuous without needing audio before A
t_smp(P, S, gate, freq, idx, vol, off, loop, la, lb, lty, xf, root) {
	History pos(0);
	History dir(1);
	History gp(0);
	History run(0);
	i = clamp(floor(idx), 0, 63);
	base = peek(P, ${STYLE.mapBase} + i * 4);
	len = peek(P, ${STYLE.mapBase} + i * 4 + 1);
	rate = freq / (440 * pow(2, (root - 69) / 12)) * peek(P, ${STYLE.mapBase} + i * 4 + 2) / samplerate;
	on = gate > 0.5;
	trig = on && gp < 0.5;
	gp = on;
	a = la * len;
	b = min(max(lb * len, a + 4), len - 2);
	xl = min(xf * (b - a), (b - a) * 0.5);
	np = pos + dir * rate;
	nd = dir;
	nr = run;
	if (trig) { np = off * len; nd = 1; nr = 1; }
	if (loop > 0.5 && nr > 0.5) {
		if (lty < 0.5) {
			if (np >= b) { np = a + xl + (np - b); }
		} else {
			if (np >= b) { np = 2 * b - np; nd = -1; }
			if (np <= a && nd < 0) { np = 2 * a - np; nd = 1; }
		}
	}
	if (loop < 0.5 && np >= len - 1) { nr = 0; }
	if (len < 4) { nr = 0; }
	x = t_rd(S, base, clamp(np, 0, max(len - 2, 0)));
	if (loop > 0.5 && lty < 0.5 && xl > 1 && np >= b - xl && np < b) {
		x = mix(x, t_rd(S, base, a + np - (b - xl)), (np - (b - xl)) / xl);
	}
	pos = np;
	dir = nd;
	run = nr;
	return nr > 0.5 ? x * vol : 0;
}
`;

// unrolled mode only: allocator + one slot per voice, both generated for STYLE.voices voices.
// t_alloc watches the note event stream and picks a voice (free voices first, then the oldest note).
// t_vslot is called once per voice; it holds that voice's pitch/gate/velocity and reacts to note-off by matching pitch.
function voiceLib() {
	const ids = [...Array(STYLE.voices).keys()];
	const each = f => ids.map(f).join("\n");
	const hz = p => STYLE.pitchIsMidi ? `440 * pow(2, (${p} - 69) / 12)` : p;
	return `
t_alloc(pitch, vel, trig) {
	History ck(0);
${each(i => `\tHistory bz${i}(0);\n\tHistory ag${i}(0);\n\tHistory pt${i}(0);`)}
	ev = 0;
	if (trig > 0.5) { ev = vel > 0 ? 1 : 2; }
	nck = ck + (ev == 1 ? 1 : 0);
	ck = nck;
	best = ag0 + bz0 * 1000000000;
	bi = 0;
${ids.slice(1).map(i => `\tsc = ag${i} + bz${i} * 1000000000;\n\tif (sc < best) { best = sc; bi = ${i}; }`).join("\n")}
	tv = ev == 1 ? bi : -1;
${each(i => `\tif (ev == 1 && bi == ${i}) { bz${i} = 1; ag${i} = nck; pt${i} = pitch; }\n\tif (ev == 2 && bz${i} > 0.5 && pt${i} == pitch) { bz${i} = 0; }`)}
	return tv, ev;
}

t_vslot(i, tv, ev, pitch, vel) {
	History g(0);
	History p(0);
	History f(0);
	History v(0);
	non = ev == 1 && tv == i;
	noff = ev == 2 && g > 0.5 && p == pitch;
	og, ng, np, nf, nv = g, g, p, f, v;
	if (non) {
		np, nf, nv, ng = pitch, ${hz("pitch")}, vel * ${STYLE.velScale}, 1;
		og = g > 0.5 ? 0 : 1;
	}
	if (noff) { og, ng = 0, 0; }
	g, p, f, v = ng, np, nf, nv;
	return nf, og, nv;
}
`;
}

// ---------------------------------------------------------------- graph state
let G = { nodes: {}, wires: [], samples: {}, idc: 0, next: 0 };
let patchPath = "", savePath = "", outPath = "";
let buf = null, warned = false, W = 640, H = 300, drag = null, polyMemo = {};
let hist = { list: [], i: -1 };
let M = { key: "" };
const rebuildTask = new Task(rebuild);

const clamp01 = t => Math.min(1, Math.max(0, t));
const wireTo = (id, port) => G.wires.find(w => w.to.node === id && w.to.port === port);
const slots = n => MODULES[n.type].params.length * 2;   // value slots then amount slots
const clampNode = n => { n.x = Math.max(0, Math.round(n.x)); n.y = Math.max(0, Math.round(n.y)); };

function changed() {
	rebuildTask.cancel();
	rebuildTask.schedule(STYLE.rebuildMs);
	mgraphics.redraw();
}

function bufPoke(i, v) {
	try {
		if (!buf) buf = new Buffer(STYLE.bufname);
		buf.poke(1, i, v);
	} catch (e) {
		buf = null;
		if (!warned) { warned = true; post(`thing: cannot write buffer ${STYLE.bufname}\n`); }
	}
}

function pushNode(n) {
	const ps = MODULES[n.type].params;
	ps.forEach((p, i) => {
		bufPoke(n.base + i, n.vals[p.n]);
		if (p.mod) bufPoke(n.base + ps.length + i, n.vals[`${p.n}_amt`]);
	});
}

function pushSample(i) {
	(G.samples[i] ?? []).forEach((v, k) => bufPoke(STYLE.mapBase + i * 4 + k, v));
}

function pushAll() {
	Object.values(G.nodes).forEach(pushNode);
	Object.keys(G.samples).forEach(pushSample);
}

function fillDefaults(n) {
	MODULES[n.type].params.forEach(p => {
		n.vals[p.n] ??= p.def;
		if (p.mod) n.vals[`${p.n}_amt`] ??= p.amt;
	});
}

// ---------------------------------------------------------------- undo history (named, revertible)
function record(name) {
	const s = JSON.stringify(G);
	if (hist.i >= 0 && hist.list[hist.i].s === s) return;
	hist.list.length = hist.i + 1;
	hist.list.push({ name, s });
	if (hist.list.length > STYLE.maxUndo) hist.list.shift();
	hist.i = hist.list.length - 1;
}

function restore(i) {
	if (i < 0 || i >= hist.list.length) return false;
	hist.i = i;
	G = JSON.parse(hist.list[i].s);
	Object.values(G.nodes).forEach(clampNode);
	drag = null;
	pushAll();
	changed();
	return true;
}

function undo() {
	const e = hist.list[hist.i];
	if (restore(hist.i - 1)) post(`thing: undid "${e.name}"\n`);
}

function redo() {
	if (restore(hist.i + 1)) post(`thing: redid "${hist.list[hist.i].name}"\n`);
}

function revert(i) {
	if (restore(i | 0)) post(`thing: reverted to #${hist.i} "${hist.list[hist.i].name}"\n`);
}

function history() {
	hist.list.forEach((e, k) => post(`${k === hist.i ? ">" : " "} ${k}  ${e.name}\n`));
}

// ---------------------------------------------------------------- graph edits
function addNode(type, x, y) {
	if (!MODULES[type]) { post(`thing: unknown module ${type}\n`); return null; }
	const n = { id: `n${++G.idc}`, type, x: x ?? 10, y: y ?? 10, base: G.next, vals: {} };
	G.next += slots(n);
	clampNode(n);
	fillDefaults(n);
	G.nodes[n.id] = n;
	pushNode(n);
	record(`add ${type} ${n.id}`);
	changed();
	return n;
}

function removeNode(id) {
	const type = G.nodes[id]?.type;
	delete G.nodes[id];
	G.wires = G.wires.filter(w => w.from.node !== id && w.to.node !== id);
	record(`remove ${type} ${id}`);
	changed();
}

function dropWire(w) { G.wires = G.wires.filter(q => q !== w); changed(); }

function dependsOn(a, b, seen = {}) {   // does node a (transitively) take input from node b?
	if (a === b) return true;
	if (seen[a]) return false;
	seen[a] = true;
	return G.wires.some(w => w.to.node === a && dependsOn(w.from.node, b, seen));
}

function connect(fromId, fromPort, toId, toPort, label) {
	const a = G.nodes[fromId], b = G.nodes[toId];
	if (!a || !b) return false;
	if (!layout(b).ports.some(p => p.dir === "in" && p.name === toPort)) return false;
	if (!MODULES[a.type].outs.includes(fromPort)) return false;
	if (dependsOn(fromId, toId)) { post("thing: that wire would make a loop\n"); return false; }
	G.wires = G.wires.filter(w => !(w.to.node === toId && w.to.port === toPort));
	G.wires.push({ from: { node: fromId, port: fromPort }, to: { node: toId, port: toPort } });
	record(`${label ?? "connect"} ${fromId}.${fromPort} > ${toId}.${toPort}`);
	changed();
	return true;
}

// ---------------------------------------------------------------- generator
function isPoly(n, memo) {   // true when the node is derived from the note input
	if (memo[n.id] !== undefined) return memo[n.id];
	memo[n.id] = false;
	let p = MODULES[n.type].poly === "source";
	if (!p) p = G.wires.some(w => w.to.node === n.id && isPoly(G.nodes[w.from.node], memo));
	return (memo[n.id] = p);
}

function topo() {
	const order = [], seen = {};
	const visit = id => {
		if (seen[id]) return;
		seen[id] = true;
		G.wires.filter(w => w.to.node === id).forEach(w => visit(w.from.node));
		order.push(G.nodes[id]);
	};
	Object.keys(G.nodes).forEach(visit);
	return order;
}

function ctxFor(n, m, v, sums, memo) {
	const sfx = v === null ? "" : `_${v}`;
	const inExpr = name => {
		const w = wireTo(n.id, name);
		if (!w) return m.ins.find(i => i.n === name)?.def ?? "0";
		const src = G.nodes[w.from.node];
		return `${src.id}_${w.from.port}${isPoly(src, memo) && v !== null ? sfx : ""}`;   // mono sources are shared by every voice
	};
	return {
		v,
		mc: STYLE.mode === "mc",
		out: name => `${n.id}_${name}${sfx}`,
		has: name => !!wireTo(n.id, name),
		in: inExpr,
		p: name => {
			const pd = m.params.find(q => q.n === name), k = `${n.id}_k_${name}`;
			if (!pd.mod || !wireTo(n.id, name)) return k;
			const a = `${n.id}_a_${name}`;
			return pd.mod === "oct" ? `(${k} * pow(2, ${inExpr(name)} * ${a}))` : `(${k} + ${inExpr(name)} * ${a})`;
		},
		sum: (ch, expr) => sums[ch].push(expr),
	};
}

function generate() {
	const mc = STYLE.mode === "mc", memo = {}, sums = { L: [], R: [] }, body = [];
	if (!mc) body.push("\tvoice_tv, voice_ev = t_alloc(vpitch, vvel, vtrig);");
	topo().forEach(n => {
		const m = MODULES[n.type], np = m.params.length;
		body.push(`\t// ${n.id} ${m.label}`);
		m.params.forEach((p, i) => {
			body.push(`\t${n.id}_k_${p.n} = peek(P, ${n.base + i});`);
			if (p.mod && wireTo(n.id, p.n)) body.push(`\t${n.id}_a_${p.n} = peek(P, ${n.base + np + i});`);
		});
		const vs = !mc && isPoly(n, memo) ? [...Array(STYLE.voices).keys()] : [null];
		vs.forEach(v => m.gen(ctxFor(n, m, v, sums, memo)).forEach(l => body.push(`\t${l}`)));
	});
	return [
		"// generated by thing.js -- do not edit",
		CORELIB,
		...(mc ? [] : [voiceLib()]),
		mc ? "thing_patch(P, S, vpitch, vgate, vvel) {" : "thing_patch(P, S, vpitch, vvel, vtrig) {",
		...body,
		`\tmixL = ${sums.L.join(" + ") || "0"};`,
		`\tmixR = ${sums.R.join(" + ") || "0"};`,
		"\treturn mixL, mixR;",
		"}",
		"",
	].join("\n");
}

// ---------------------------------------------------------------- files
function writeText(path, text) {
	try {
		const f = new File(path, "write");
		if (!f.isopen) { post(`thing: cannot open ${path}\n`); return false; }
		try { f.eof = 0; } catch (e) { /* older builds: append */ }
		f.writestring(text);
		f.close();
		return true;
	} catch (e) {
		post(`thing: write failed ${path}: ${e}\n`);
		return false;
	}
}

function readText(path) {
	try {
		const f = new File(path, "read");
		if (!f.isopen) return null;
		let s = "";
		while (f.position < f.eof) s += f.readstring(4096);
		f.close();
		return s;
	} catch (e) { return null; }
}

function defaultOut() {
	try {
		const fp = this.patcher.filepath;
		if (fp) return fp.replace(/[^\/\\:]*$/, "") + `${STYLE.outfile}.genexpr`;
	} catch (e) { /* fall through */ }
	return `${STYLE.outfile}.genexpr`;
}

const writePatch = path => writeText(path, JSON.stringify(G, null, 1));

function rebuild() {   // runs a moment after every change: generated genexpr + the autosave file
	if (!outPath) outPath = defaultOut();
	writeText(outPath, generate());
	if (patchPath) writePatch(patchPath);
	mgraphics.redraw();
}

function loadText(s) {
	const j = JSON.parse(s);
	G = { nodes: j.nodes || {}, wires: j.wires || [], samples: j.samples || {}, idc: 0, next: 0 };
	Object.values(G.nodes).forEach(n => {
		n.vals ??= {};
		fillDefaults(n);
		clampNode(n);
		G.idc = Math.max(G.idc, parseInt(n.id.slice(1), 10) || 0);
		G.next = Math.max(G.next, n.base + slots(n));
	});
	hist = { list: [], i: -1 };
	record("load");
	pushAll();
	rebuild();
}

function loadpatch(path) {
	const s = readText(path);
	if (s === null) post(`thing: cannot read ${path}\n`);
	else loadText(s);
}

function autosave(path) {   // the always-current file; if it already exists it is loaded first
	patchPath = path;
	const s = readText(path);
	if (s) loadText(s);
	else rebuild();
}

function commit(path) {     // the deliberate save
	if (path) savePath = path;
	if (!savePath) { post("thing: no save file yet, send: commit <path>\n"); return; }
	if (writePatch(savePath)) post(`thing: saved ${savePath}\n`);
}

function savefile(path) { savePath = path; }
function outfile(path) { outPath = path; }
function save() {
	if (patchPath) embedmessage("autosave", patchPath);
	if (savePath) embedmessage("savefile", savePath);
	if (outPath) embedmessage("outfile", outPath);
	embedmessage("setfont", STYLE.font, STYLE.fs);
	embedmessage("setmode", STYLE.mode, STYLE.voices);
}
function loadbang() { pushAll(); }

// ---------------------------------------------------------------- messages
function add(type, x, y) { addNode(type, x, y); }
function remove(id) { if (G.nodes[id]) removeNode(id); }
function clear() { G = { nodes: {}, wires: [], samples: G.samples, idc: 0, next: 0 }; record("clear"); changed(); }
function dump() { generate().split("\n").forEach(l => post(`${l}\n`)); }
function bang() { rebuild(); }

function setfont(family, size) {
	if (family) STYLE.font = String(family);
	if (size) STYLE.fs = Number(size);
	M = { key: "" };
	mgraphics.redraw();
}

function setmode(mode, voices) {
	STYLE.mode = mode === "mc" ? "mc" : "unrolled";
	if (voices) STYLE.voices = Math.max(1, Math.min(16, voices | 0));
	changed();
}

function setvoices(n) { setmode(STYLE.mode, n); }

function sample(i, start, len, sr) {
	G.samples[i] = [start, len, sr];
	pushSample(i);
	record(`sample ${i}`);
	changed();
}

// ---------------------------------------------------------------- layout + drawing
function metrics() {   // everything that depends on the font, measured once per font/size
	const S = STYLE, key = `${S.font}|${S.fs}`;
	if (M.key !== key) {
		let cw = S.fs * 0.6;
		try {
			mgraphics.select_font_face(S.font);
			mgraphics.set_font_size(S.fs);
			cw = mgraphics.text_measure("M")[0] || cw;
		} catch (e) { /* keep the estimate */ }
		const rowH = Math.ceil(S.fs * S.lineH);
		M = { key, cw, rowH, base: rowH - Math.max(2, Math.round(rowH * 0.25)) };
	}
	return M;
}

function layout(n) {
	const S = STYLE, k = metrics(), m = MODULES[n.type], rows = [], ports = [];
	const w = Math.ceil(k.cw * (m.chars ?? S.nodeChars));
	const lw = Math.ceil(k.cw * S.labelChars) + S.portR + 3;
	const nio = Math.max(m.ins.length, m.outs.length);
	let y = n.y + k.rowH;   // title bar is one row tall
	for (let i = 0; i < nio; i++, y += k.rowH) {
		const r = { kind: "io", y, inp: m.ins[i]?.n, out: m.outs[i] };
		if (r.inp) ports.push({ name: r.inp, dir: "in", x: n.x, y: y + k.rowH / 2 });
		if (r.out) ports.push({ name: r.out, dir: "out", x: n.x + w, y: y + k.rowH / 2 });
		rows.push(r);
	}
	m.params.forEach((p, pi) => {
		const wired = !!p.mod && !!wireTo(n.id, p.n);
		const sx = n.x + lw, sw = w - lw - S.pad;
		rows.push({ kind: "par", y, pi, p, wired, sx, sw, bw: wired ? Math.round(sw * 0.62) : sw });
		if (p.mod) ports.push({ name: p.n, dir: "in", x: n.x, y: y + k.rowH / 2 });
		y += k.rowH;
	});
	return { w, h: y - n.y + S.pad, rows, ports };
}

const amtMax = p => p.amax ?? (p.mod === "oct" ? 4 : p.max - p.min);

function toNorm(p, v, amt) {
	if (amt) return (v / amtMax(p) + 1) / 2;
	return p.exp ? Math.log(v / p.min) / Math.log(p.max / p.min) : (v - p.min) / (p.max - p.min);
}

function fromNorm(p, t, amt) {
	t = clamp01(t);
	if (amt) return (t * 2 - 1) * amtMax(p);
	const v = p.exp ? p.min * Math.pow(p.max / p.min, t) : p.min + t * (p.max - p.min);
	return p.steps || p.int ? Math.round(v) : v;
}

function fmt(p, v, amt) {
	if (p.steps && !amt) return p.steps[Math.round(v)];
	if (p.int && !amt) return `${Math.round(v)}`;
	const a = Math.abs(v);
	const s = a >= 1000 ? `${(a / 1000).toFixed(1)}k` : a >= 100 ? a.toFixed(0) : a >= 10 ? a.toFixed(1) : a.toFixed(2);
	if (amt) return `${v < 0 ? "-" : "+"}${s}`;
	return `${v < 0 ? "-" : ""}${s}${p.unit ?? ""}`;
}

function setVal(n, p, key, v) {
	n.vals[key] = v;
	const i = MODULES[n.type].params.indexOf(p);
	bufPoke(key === p.n ? n.base + i : n.base + MODULES[n.type].params.length + i, v);
}

const col = c => mgraphics.set_source_rgba(c[0], c[1], c[2], c[3]);

function text(s, x, y, c, right) {
	col(c);
	mgraphics.select_font_face(STYLE.font);
	mgraphics.set_font_size(STYLE.fs);
	if (right) x -= mgraphics.text_measure(s)[0];
	mgraphics.move_to(x, y);
	mgraphics.show_text(s);
}

function fillRect(x, y, w, h, c) {
	col(c);
	mgraphics.rectangle(x, y, w, h);
	mgraphics.fill();
}

function wire(x1, y1, x2, y2, c) {
	const dx = Math.max(24, Math.abs(x2 - x1) * 0.5);
	col(c);
	mgraphics.set_line_width(STYLE.wireW);
	mgraphics.move_to(x1, y1);
	mgraphics.curve_to(x1 + dx, y1, x2 - dx, y2, x2, y2);
	mgraphics.stroke();
}

function portPos(id, name, dir) {
	const n = G.nodes[id];
	return n && layout(n).ports.find(p => p.dir === dir && p.name === name);
}

function drawNode(n) {
	const S = STYLE, k = metrics(), m = MODULES[n.type], L = layout(n), poly = isPoly(n, polyMemo);
	fillRect(n.x, n.y, L.w, L.h, S.cNode);
	fillRect(n.x, n.y, L.w, k.rowH, poly ? S.cTitlePoly : S.cTitle);
	text(m.label, n.x + S.portR + 3, n.y + k.base, S.cText);
	text(n.id, n.x + L.w - S.portR - 3, n.y + k.base, S.cDim, true);
	L.rows.forEach(r => {
		const ty = r.y + k.base, lx = n.x + S.portR + 3;
		if (r.kind === "io") {
			if (r.inp) text(r.inp, lx, ty, S.cText);
			if (r.out) text(r.out, n.x + L.w - S.portR - 3, ty, S.cText, true);
			return;
		}
		const p = r.p, v = n.vals[p.n];
		text(p.n, lx, ty, S.cDim);
		fillRect(r.sx, r.y + 1, r.bw, k.rowH - 2, S.cBarBg);
		fillRect(r.sx, r.y + 1, r.bw * clamp01(toNorm(p, v, false)), k.rowH - 2, S.cBar);
		text(fmt(p, v, false), r.sx + r.bw - 2, ty, S.cText, true);
		if (r.wired) {
			const ax = r.sx + r.bw + 1, aw = r.sw - r.bw - 1, av = n.vals[`${p.n}_amt`], an = toNorm(p, av, true);
			fillRect(ax, r.y + 1, aw, k.rowH - 2, S.cBarBg);
			fillRect(an >= 0.5 ? ax + aw / 2 : ax + aw * an, r.y + 1, Math.abs(an - 0.5) * aw, k.rowH - 2, S.cAmt);
			text(fmt(p, av, true), ax + aw - 2, ty, S.cText, true);
		}
	});
	L.ports.forEach(pt => {
		const used = pt.dir === "in" ? !!wireTo(n.id, pt.name) : G.wires.some(w => w.from.node === n.id && w.from.port === pt.name);
		col(S.cPort);
		mgraphics.ellipse(pt.x - S.portR, pt.y - S.portR, S.portR * 2, S.portR * 2);
		if (used) mgraphics.fill();
		else { mgraphics.set_line_width(1); mgraphics.stroke(); }
	});
}

function paint() {
	const S = STYLE, sz = mgraphics.size;
	if (sz) { W = sz[0]; H = sz[1]; }
	polyMemo = {};
	fillRect(0, 0, W, H, S.cBg);
	G.wires.forEach(w => {
		const a = portPos(w.from.node, w.from.port, "out"), b = portPos(w.to.node, w.to.port, "in");
		if (a && b) wire(a.x, a.y, b.x, b.y, isPoly(G.nodes[w.from.node], polyMemo) ? S.cWirePoly : S.cWire);
	});
	Object.values(G.nodes).forEach(drawNode);
	if (drag && drag.t === "wire") {
		const a = portPos(drag.from.node, drag.from.port, "out");
		if (a) wire(a.x, a.y, drag.x, drag.y, S.cWireDrag);
	}
}

function onresize(w, h) { W = w; H = h; mgraphics.redraw(); }

// ---------------------------------------------------------------- mouse
function hit(x, y) {
	const S = STYLE, k = metrics();
	for (const n of Object.values(G.nodes)) {
		const L = layout(n);
		const pt = L.ports.find(q => Math.hypot(x - q.x, y - q.y) <= S.hitR);
		if (pt) return { t: "port", n, pt };
		if (x < n.x || x > n.x + L.w || y < n.y || y > n.y + L.h) continue;
		if (y < n.y + k.rowH) return { t: "title", n };
		const r = L.rows.find(q => q.kind === "par" && y >= q.y && y < q.y + k.rowH);
		if (r && x >= r.sx) return { t: r.wired && x >= r.sx + r.bw + 1 ? "amt" : "par", n, r };
		return { t: "body", n };
	}
	return null;
}

function onclick(x, y, but, cmd) {
	drag = null;
	const h = hit(x, y);
	if (!h) return;
	if (h.t === "title") {
		if (cmd) removeNode(h.n.id);
		else drag = { t: "node", n: h.n, dx: x - h.n.x, dy: y - h.n.y, x0: h.n.x, y0: h.n.y };
	} else if (h.t === "port") {
		if (h.pt.dir === "out") drag = { t: "wire", from: { node: h.n.id, port: h.pt.name }, x, y };
		else {
			const w = wireTo(h.n.id, h.pt.name);
			if (w) { dropWire(w); drag = { t: "wire", from: w.from, picked: w.to, x, y }; }
		}
	} else if (h.t === "par" || h.t === "amt") {
		const amt = h.t === "amt", p = h.r.p, key = amt ? `${p.n}_amt` : p.n;
		drag = { t: h.t, n: h.n, p, key, x0: x, v0: h.n.vals[key], norm0: toNorm(p, h.n.vals[key], amt), wpx: amt ? h.r.sw - h.r.bw - 1 : h.r.bw };
	}
	mgraphics.redraw();
}

function ondrag(x, y, but, cmd, shift) {
	if (!drag) return;
	if (drag.t === "node") { drag.n.x = Math.max(0, Math.round(x - drag.dx)); drag.n.y = Math.max(0, Math.round(y - drag.dy)); }
	else if (drag.t === "wire") { drag.x = x; drag.y = y; }
	else setVal(drag.n, drag.p, drag.key, fromNorm(drag.p, drag.norm0 + (x - drag.x0) / drag.wpx * (shift ? 0.1 : 1), drag.t === "amt"));
	if (!but) {   // mouse released: this is where changes become named history entries
		const d = drag;
		drag = null;
		if (d.t === "node") {
			if (d.n.x !== d.x0 || d.n.y !== d.y0) { record(`move ${d.n.id}`); changed(); }
		} else if (d.t === "wire") {
			const h = hit(x, y);
			const ok = h && h.t === "port" && h.pt.dir === "in" && connect(d.from.node, d.from.port, h.n.id, h.pt.name, d.picked ? "rewire" : "connect");
			if (!ok && d.picked) { record(`disconnect ${d.picked.node}.${d.picked.port}`); changed(); }
		} else if (d.n.vals[d.key] !== d.v0) {
			const dv = d.t === "amt";
			record(`${d.n.id}.${d.p.n}${dv ? " amt" : ""} ${fmt(d.p, d.v0, dv)} > ${fmt(d.p, d.n.vals[d.key], dv)}`);
		}
	}
	mgraphics.redraw();
}

function ondblclick(x, y) {
	const h = hit(x, y);
	if (!h || (h.t !== "par" && h.t !== "amt")) return;
	const p = h.r.p;
	if (h.t === "par") setVal(h.n, p, p.n, p.def);
	else setVal(h.n, p, `${p.n}_amt`, p.amt);
	record(`reset ${h.n.id}.${p.n}${h.t === "amt" ? " amt" : ""}`);
	mgraphics.redraw();
}

record("start");
