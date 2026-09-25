// Generates a gendsp Buffer-decoder Codebox body from a params spec array.
// Each param entry: [type, "Name |(t:..., d:default, s:[lo,hi], dval:...)", group]
// Behavior is driven by the meta t: field, not the leading type string:
//   t:trigger -> one-sample pulse on edge, no History
//   t:note    -> event passthrough (raw>=0 -> round(raw*127), else raw), no History
//   t:cc14    -> two-channel event passthrough (coarse*255, fine*65535, -1 = no data), no History
//   anything else (t:coeff, t:m, ...) -> latched value, held in History, scaled from raw [0,1] to [lo,hi]
 
function parseMeta(metaPart, leadingType) {
	if (!metaPart) {
		// entries like ['b', 'Trigger', 0] carry no |(...) block at all
		return { t: leadingType === 'b' ? 'trigger' : '', def: 0, scale: [0, 1], log: false };
	}
	const s = metaPart.trim().replace(/^\(|\)$/, '').replace(/\)$/, '');
	const t = (s.match(/t:([^,]+)/) || [, '']) [1].trim();
	const dRaw = (s.match(/d:([-\d.]+)/) || [, '0']) [1];
	const sMatch = s.match(/s:\[([^\]]+)\]/);
	const scale = sMatch ? sMatch[1].split(',').map(Number) : [0, 1];
	const log = /log:true/.test(s);
	return { t, def: parseFloat(dRaw), scale, log };
}
 
function toVarName(name) {
	return '_' + name.trim().replace(/[^a-zA-Z]/g, '').toUpperCase();
}
 
// how many buffer channels each kind consumes
const CHANNELS_FOR = { trigger: 1, note: 1, cc14: 2 };
const channelsFor = t => CHANNELS_FOR[t] || 1; // default: plain scaled coeff/m param
 
function generateDecoder(params, opts = {}) {
	const { bufferName = 'buf', chParam = 'chIndex' } = opts;
 
	let chCursor = 0;
	const parsed = params.map((p, i) => {
		const [type, desc] = p;
		const [namePart, metaPart] = desc.split('|');
		const name = namePart.trim();
		const meta = parseMeta(metaPart, type);
		const channel = chCursor;
		chCursor += channelsFor(meta.t);
		return { index: i, type, name, varName: toVarName(name), channel, ...meta };
	});
 
	const lines = [];
	lines.push(`Buffer ${bufferName};`);
	lines.push(`Param ${chParam}(0, min=0, max=${chCursor});`);
	lines.push('');
	lines.push(`History _GATEPREV(0);`);
	parsed.forEach(p => {
		if (p.t === 'trigger' || p.t === 'note' || p.t === 'cc14') return; // event-driven, not held state
		lines.push(`History ${p.varName}(${p.def});`);
	});
 
	lines.push('');
	lines.push(`pindex = in1;`);
	lines.push(`trig = (in2 > 0.0);`);
	lines.push(`edge = trig && !_GATEPREV;`);
	lines.push(`_GATEPREV = trig;`);
	lines.push('');
 
	const fmt = n => parseFloat(n.toFixed(6));
	const OUTLETS_FOR = { cc14: 2 };
	let outCursor = 0;
 
	parsed.forEach((p) => {
		const outN = outCursor + 1;
		outCursor += OUTLETS_FOR[p.t] || 1;
		lines.push(`// ${p.index} ${p.name}`);
 
		if (p.t === 'trigger') {
			lines.push(`raw = peek(buf, pindex, ${chParam}+${p.channel});`);
			lines.push(`out${outN} = (edge && raw > 0.5) ? 1.0 : 0.0;`);
 
		} else if (p.t === 'note') {
			lines.push(`raw = peek(buf, pindex, ${chParam}+${p.channel});`);
			lines.push(`out${outN} = (raw >= 0.0) ? round(raw * 127.0) : raw;`);
 
		} else if (p.t === 'cc14') {
			const outFine = outN + 1; // consumes two consecutive Codebox outlets, like the params index
			lines.push(`coarse = peek(buf, pindex, ${chParam}+${p.channel});`);
			lines.push(`fine   = peek(buf, pindex, ${chParam}+${p.channel + 1});`);
			lines.push(`out${outN} = (coarse == -1.0) ? -1.0 : round(coarse * 255.0);`);
			lines.push(`out${outFine} = (fine == -1.0) ? -1.0 : round(fine * 65535.0);`);
 
		} else {
			const [lo, hi] = p.scale;
			let expr;
			if (p.log) {
				// exponential interpolation: lo * (hi/lo)^raw, raw in [0,1]
				expr = `${fmt(lo)} * pow(${fmt(hi / lo)}, raw)`;
			} else {
				const span = fmt(hi - lo);
				if (lo === 0 && hi === 1) expr = 'raw';
				else if (lo === 0) expr = `raw * ${span}`;
				else expr = `${fmt(lo)} + raw * ${span}`;
			}
 
			lines.push(`raw = peek(buf, pindex, ${chParam}+${p.channel});`);
			lines.push(`${p.varName} = (edge && raw >= 0.0) ? (${expr}) : ${p.varName};`);
			lines.push(`out${outN} = ${p.varName};`);
		}
		lines.push('');
	});
 
	return lines.join('\n');
}
 
const params = [
	['b', 'Trigger |(t:trigger, dval:.)', 0],
	["hh", "Drum Radius |(t:m, d:0.18, s:[0.05,0.4], dval:5F)", 1],
	["hh", "Drum Depth |(t:m, d:0.15, s:[0.03,0.5], dval:41)", 1],
	["hh", "Hit Radius |(t:m, d:0.09, s:[0,0.4], dval:39)", 1],
	["hh", "Vellum Thickness |(t:coeff, d:1.0, s:[0.2,2], dval:71)", 2],
	["hh", "Tightness |(t:coeff, d:0.6, s:[0,1], dval:99)", 2],
	["hh", "Tightness Env |(t:coeff, d:0.15, s:[0,1], dval:26)", 2],
	["hh", "Inflection |(t:coeff, d:0.5, s:[0,1], dval:80)", 2],
	["hh", "Membrane Damp |(t:coeff, d:0.35, s:[0,1], dval:59)", 2],
	["hh", "Stroke Intensity |(t:coeff, d:0.8, s:[0,1], dval:CC)", 3],
	["hh", "Stroke Linger |(t:coeff, d:0.12, s:[0,1], dval:1F)", 3],
	["hh", "Stroke Material |(t:coeff, d:0.5, s:[0,1], dval:80)", 3],
	["hh", "Beater Size |(t:coeff, d:0.3, s:[0,1], dval:4D)", 3],
	["hh", "Cavity Damp |(t:coeff, d:0.5, s:[0,1], dval:80)", 4],
	["hh", "Coupling |(t:coeff, d:0.3, s:[0,1], dval:4D)", 4],
	["hh", "Loudness |(t:coeff, d:0.7, s:[0,1], dval:B3)", 5]
];

var transpile_state = 0;

function paint(){

	var gfx = this.mgraphics;
	var w = gfx.size[0];
	var h = gfx.size[1];

	gfx.set_font_size(12); //  ztrk_get_font_size());   //this.settings_font_size);
	gfx.select_font_face("Consolas");   // ...ztrk_get_font_family());  //"Consolas", "normal", "normal");
	// this.charwidth = gfx.text_measure('_')[0];

	gfx.set_source_rgba(0.1, 0.2, 0.4, 1);  // this.ui_bg_color
	//gfx.set_source_rgba(...this.theme_colors.ui_bg_color);
	gfx.rectangle(0, 0, w, h);
	gfx.fill();
}

function onwheel(x, y, scrollx, scrolly, mod1, shift, caps, opt, mod2) {
    post("wheel scroll at " + x + ", " + y + ": " + scrolly + "\n");
}

function msg_dictionary(dictName){
    var d = new Dict(dictName);
    var data = JSON.parse(d.stringify());
    d.freepeer();  // free now that we own our own copy of thet passed dict
	post(JSON.stringify(data.MACHINE, null, 2));
	// output = generateDecoder(params); // data.MACHINE);
	output = generateDecoder(data.MACHINE);
	outlet(0, output);  
}
