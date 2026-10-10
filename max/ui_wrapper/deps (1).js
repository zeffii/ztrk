// deps.js -- [v8ui @filename deps.js]
// Finds which files a patcher depends on, by reading the files themselves.
//
//   scan <path to a .maxpat>    the folder containing it is indexed (all subfolders), then every file the patcher
//                               mentions by name is followed in turn: patchers, js, gendsp, genexpr, json, text
//   weak 0|1                    hide or show "maybe" links (a file's bare name, without extension, appears as a word)
//   unref 0|1                   also list/draw files nothing refers to (off by default: only what the patcher uses)
//   dump                        print the report to the Max console again
//
// Console: an indented tree of what the patcher uses, then any used filename that exists more than once
//          (a collision risk in a shared search path).
// Window: columns by depth, solid links = the filename appears, faint links = only the bare name appears.
//         Drag to pan, click a file to print who uses it and what it uses.
//
// require("x") and include("x") count as used even without the extension.
// What it cannot see: names built at runtime (for example "t" + n + "_buf"), and anything outside the folder.

autowatch = 1;
inlets = 1;
outlets = 1;
mgraphics.init();
mgraphics.relative_coords = 0;
mgraphics.autofill = 0;

const STYLE = {
	showUnref: false, font: "Menlo", fs: 10, rowH: 15, colW: 190, nodeW: 164, pad: 8, head: 20, weakMin: 4,
	cBg: [0.10, 0.10, 0.11, 1], cText: [0.88, 0.88, 0.90, 1], cDim: [0.52, 0.52, 0.58, 1], cSel: [1, 1, 1, 0.95],
	cPatcher: [0.25, 0.45, 0.70, 1], cCode: [0.70, 0.62, 0.25, 1], cGen: [0.30, 0.62, 0.40, 1],
	cMedia: [0.45, 0.45, 0.55, 1], cOther: [0.30, 0.30, 0.34, 1], cUnref: [0.62, 0.30, 0.30, 1],
	cEdge: [0.65, 0.65, 0.72, 0.45], cWeak: [0.65, 0.65, 0.72, 0.14],
};

const TEXT_EXT = new Set(["maxpat", "maxproj", "maxhelp", "js", "json", "gendsp", "genexpr", "txt", "md", "html", "css", "py"]);
const WEAK_EXT = new Set(["maxpat", "gendsp", "genexpr", "js"]);   // names that are used without their extension
const kindColor = ext => ["maxpat", "maxproj", "maxhelp"].includes(ext) ? STYLE.cPatcher
	: ["js", "json", "py", "txt", "md", "html", "css"].includes(ext) ? STYLE.cCode
	: ["gendsp", "genexpr"].includes(ext) ? STYLE.cGen
	: ["wav", "aif", "aiff", "mp3", "flac", "ogg", "png", "jpg", "jpeg", "gif", "svg", "mov", "mp4"].includes(ext) ? STYLE.cMedia
	: STYLE.cOther;

let files = [], byPath = new Map(), edges = [], nodes = [], unrefNodes = [], dupes = [], root = null;
let showWeak = true, sel = null, panX = 0, panY = 0, last = null, W = 900, H = 520, cw = 6;

// ---------------------------------------------------------------- reading
function walk(dir, out, depth = 0) {
	const f = new Folder(dir);
	while (!f.end) {
		const name = f.filename;
		if (name && !name.startsWith(".")) {
			if (f.filetype === "fold") { if (depth < 10) walk(`${dir}/${name}`, out, depth + 1); }
			else out.push({ name, path: `${dir}/${name}` });
		}
		f.next();
	}
	f.close();
}

function readText(path) {
	try {
		const f = new File(path, "read");
		if (!f.isopen) return "";
		let s = "";
		while (f.position < f.eof) s += f.readstring(4096);
		f.close();
		return s;
	} catch (e) { return ""; }
}

const esc = s => s.replace(/[.*+?^${}()|[\]\\]/g, "\\$&");

function hasWord(text, w) {   // whole-name match, so "a.js" is not found inside "data.js"
	if (!text.includes(w)) return false;
	return new RegExp(`(^|[^\\w.-])${esc(w)}($|[^\\w-])`).test(text);
}

// names inside require("...") / include("...") count as strong, with or without the extension; the optional
// backslashes let it match inside .gendsp and .maxpat files, where quotes are stored escaped
const CALL = /(?:require|include)\s*\(\s*\\*["']([^"'\\]+)/g;

function findRefs(text, self) {
	const out = new Map(), called = new Set([...text.matchAll(CALL)].map(m => m[1].split(/[\/\\]/).pop().toLowerCase()));
	for (const f of files) {
		if (f === self) continue;
		if (called.has(f.name.toLowerCase()) || called.has(f.stem.toLowerCase()) || hasWord(text, f.name)) out.set(f, "strong");
		else if (WEAK_EXT.has(f.ext) && f.stem.length >= STYLE.weakMin && hasWord(text, f.stem)) out.set(f, "weak");
	}
	return out;
}

// ---------------------------------------------------------------- scan
function scan(path) {
	const dir = path.replace(/[\/\\][^\/\\]*$/, ""), name = path.split(/[\/\\]/).pop();
	files = [];
	walk(dir, files);
	files.forEach(f => {
		f.ext = f.name.includes(".") ? f.name.split(".").pop().toLowerCase() : "";
		f.stem = f.name.replace(/\.[^.]*$/, "");
	});
	byPath = new Map(files.map(f => [f.path, f]));
	root = files.find(f => f.name === name);
	post(`deps: indexed ${files.length} files under ${dir}\n`);
	if (!root) { post(`deps: ${name} was not found under that folder\n`); return; }

	// pass 1: follow every link (strong and weak), recording depth, so nothing reachable is missed
	const seen = new Map([[root.path, { f: root, depth: 0, maybe: false }]]), queue = [root];
	edges = [];
	while (queue.length) {
		const cur = queue.shift();
		if (!TEXT_EXT.has(cur.ext)) continue;
		for (const [to, kind] of findRefs(readText(cur.path), cur)) {
			edges.push({ from: cur.path, to: to.path, kind });
			if (!seen.has(to.path)) { seen.set(to.path, { f: to, depth: seen.get(cur.path).depth + 1, maybe: false }); queue.push(to); }
		}
	}
	// pass 2: whatever strong links alone can reach is "used"; the rest of what was reached is "maybe"
	const sure = new Set([root.path]), todo = [root.path];
	while (todo.length) {
		const p = todo.pop();
		edges.filter(e => e.from === p && e.kind === "strong" && !sure.has(e.to)).forEach(e => { sure.add(e.to); todo.push(e.to); });
	}
	seen.forEach((n, p) => { n.maybe = !sure.has(p); });
	nodes = [...seen.values()];
	unrefNodes = files.filter(f => !seen.has(f.path)).map(f => ({ f, depth: 0, maybe: false, unref: true }));
	const byName = {};
	files.forEach(f => (byName[f.name.toLowerCase()] ??= []).push(f));
	dupes = Object.entries(byName).filter(([, list]) => list.length > 1);
	files.forEach(f => { f.label = f.name; });
	dupes.forEach(([, list]) => list.forEach(f => { f.label = `${f.path.split("/").slice(-2).join("/")}`; }));   // folder/name when ambiguous
	sel = null; panX = 0; panY = 0;
	report();
	mgraphics.redraw();
}

function report() {
	if (!root) return;
	const kids = new Map();
	edges.filter(e => e.kind === "strong").forEach(e => { if (!kids.has(e.from)) kids.set(e.from, []); kids.get(e.from).push(e.to); });
	const printed = new Set();
	const show = (p, d) => {
		const again = printed.has(p);
		post(`${"  ".repeat(d)}${byPath.get(p).label}${again ? "  (shown above)" : ""}\n`);
		if (again) return;
		printed.add(p);
		(kids.get(p) ?? []).forEach(c => show(c, d + 1));
	};
	post("\n--- used (tree of filename matches) ---\n");
	show(root.path, 0);
	const maybes = nodes.filter(n => n.maybe);
	if (maybes.length) post(`\n--- maybe (only the bare name appears) ---\n${maybes.map(n => `  ${n.f.label}`).join("\n")}\n`);
	if (STYLE.showUnref) {
		post(`\n--- unreferenced: ${unrefNodes.length} files ---\n`);
		unrefNodes.slice(0, 300).forEach(n => post(`  ${n.f.path}\n`));
		if (unrefNodes.length > 300) post(`  ... and ${unrefNodes.length - 300} more\n`);
	}
	const live = new Set(nodes.map(n => n.f.path)), clash = dupes.filter(([, list]) => list.some(f => live.has(f.path)));
	if (clash.length) {
		post(`\n--- used filenames that exist more than once ---\n`);
		clash.forEach(([name, list]) => post(`  ${name}\n${list.map(f => `      ${f.path}\n`).join("")}`));
	}
	post("\n");
}

function dump() { report(); }
function weak(on) { showWeak = !!on; mgraphics.redraw(); }
function unref(on) { STYLE.showUnref = !!on; report(); mgraphics.redraw(); }
const extra = () => STYLE.showUnref ? unrefNodes : [];

// ---------------------------------------------------------------- drawing
function place() {   // assign each node a screen position from its depth column and row, plus the current pan
	const S = STYLE, cols = new Map();
	const maxDepth = Math.max(0, ...nodes.map(n => n.depth));
	nodes.forEach(n => { if (!cols.has(n.depth)) cols.set(n.depth, []); cols.get(n.depth).push(n); });
	cols.forEach(list => list.sort((a, b) => a.f.label.localeCompare(b.f.label)));
	cols.forEach((list, depth) => list.forEach((n, i) => { n.x = S.pad + depth * S.colW + panX; n.y = S.pad + S.head + i * S.rowH + panY; }));
	unrefNodes.sort((a, b) => a.f.label.localeCompare(b.f.label));
	unrefNodes.forEach((n, i) => { n.x = S.pad + (maxDepth + 1) * S.colW + panX; n.y = S.pad + S.head + i * S.rowH + panY; });
}

const fillRect = (x, y, w, h, c) => { mgraphics.set_source_rgba(...c); mgraphics.rectangle(x, y, w, h); mgraphics.fill(); };

function label(s, x, y, c) {
	const room = Math.floor((STYLE.nodeW - 8) / cw);
	mgraphics.set_source_rgba(...c);
	mgraphics.move_to(x, y);
	mgraphics.show_text(s.length > room ? `${s.slice(0, room - 1)}…` : s);
}

function paint() {
	const S = STYLE, sz = mgraphics.size;
	if (sz) { W = sz[0]; H = sz[1]; }
	mgraphics.select_font_face(S.font);
	mgraphics.set_font_size(S.fs);
	try { cw = mgraphics.text_measure("M")[0] || cw; } catch (e) { /* keep */ }
	fillRect(0, 0, W, H, S.cBg);
	if (!root) { label("send:  scan <path to a .maxpat>", S.pad, S.pad + 12, S.cDim); return; }
	place();
	const at = new Map([...nodes, ...extra()].map(n => [n.f.path, n]));
	mgraphics.set_line_width(1);
	edges.forEach(e => {
		if (e.kind === "weak" && !showWeak) return;
		const a = at.get(e.from), b = at.get(e.to);
		if (!a || !b) return;
		const hot = sel && (e.from === sel.f.path || e.to === sel.f.path);
		mgraphics.set_source_rgba(...(hot ? S.cSel : e.kind === "weak" ? S.cWeak : S.cEdge));
		const x1 = a.x + S.nodeW, y1 = a.y + S.rowH / 2, x2 = b.x, y2 = b.y + S.rowH / 2, dx = Math.max(20, Math.abs(x2 - x1) / 2);
		mgraphics.move_to(x1, y1);
		mgraphics.curve_to(x1 + dx, y1, x2 - dx, y2, x2, y2);
		mgraphics.stroke();
	});
	[...nodes, ...extra()].forEach(n => {
		if (n.y < -S.rowH || n.y > H || n.x > W) return;   // off screen
		if (n.maybe && !showWeak) return;
		const base = n.unref ? S.cUnref : kindColor(n.f.ext);
		fillRect(n.x, n.y + 1, S.nodeW, S.rowH - 2, [base[0], base[1], base[2], n.maybe ? 0.4 : n.unref ? 0.5 : 0.9]);
		if (sel && sel.f.path === n.f.path) fillRect(n.x, n.y + 1, 2, S.rowH - 2, S.cSel);
		label(n.f.label, n.x + 5, n.y + S.rowH - 4, S.cText);
	});
	fillRect(0, 0, W, S.head, S.cBg);
	mgraphics.set_source_rgba(...S.cDim);
	mgraphics.move_to(S.pad, 14);
	mgraphics.show_text(`${root.name}   used ${nodes.filter(n => !n.maybe).length}   maybe ${nodes.filter(n => n.maybe).length}${STYLE.showUnref ? `   unreferenced ${unrefNodes.length}` : ""}`);
}

function onresize(w, h) { W = w; H = h; mgraphics.redraw(); }

// ---------------------------------------------------------------- mouse
function onclick(x, y) {
	last = { x, y };
	sel = [...nodes, ...extra()].find(n => n.x !== undefined && x >= n.x && x <= n.x + STYLE.nodeW && y >= n.y && y <= n.y + STYLE.rowH) ?? null;
	if (sel) {
		const usedBy = edges.filter(e => e.to === sel.f.path).map(e => byPath.get(e.from).label);
		const uses = edges.filter(e => e.from === sel.f.path).map(e => byPath.get(e.to).label);
		post(`${sel.f.path}\n  used by: ${usedBy.join(", ") || "-"}\n  uses:    ${uses.join(", ") || "-"}\n`);
	}
	mgraphics.redraw();
}

function ondrag(x, y, but) {
	if (!but) { last = null; return; }
	if (last) { panX += x - last.x; panY += y - last.y; last = { x, y }; mgraphics.redraw(); }
}
