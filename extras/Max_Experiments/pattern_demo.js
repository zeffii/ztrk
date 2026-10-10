// pattern_demo.js -- [v8ui @filename pattern_demo.js]   needs Max 9.2+ (setInterval / clearInterval are built in)
// Two timers: a step timer at tempo (moves the playhead, sends the row out) and a 30 fps animation timer
// that fades each row's highlight, so the playhead leaves a trail.
// messages: play | stop | bpm <n> | rpb <rows per beat>      mouse: click a cell to toggle a note

autowatch = 1;
inlets = 1;
outlets = 1;
mgraphics.init();
mgraphics.relative_coords = 0;
mgraphics.autofill = 0;

const CH = 4, ROWS = 16;
const S = { font: "Menlo", fs: 10, rowH: 14, colW: 44, left: 24, pad: 4, bpm: 125, rpb: 4 };
const NOTES = ["C-", "C#", "D-", "D#", "E-", "F-", "F#", "G-", "G#", "A-", "A#", "B-"];
const noteName = n => n < 0 ? "---" : `${NOTES[n % 12]}${Math.floor(n / 12)}`;

const cells = Array.from({ length: ROWS }, (_, r) => Array.from({ length: CH }, (_, c) => r % (c + 2) === 0 ? 48 + c * 7 + (r % 5) * 2 : -1));
const heat = new Array(ROWS).fill(0);
let row = -1, stepTimer = null, W = 220, H = 260;

const fillRect = (x, y, w, h, c) => { mgraphics.set_source_rgba(...c); mgraphics.rectangle(x, y, w, h); mgraphics.fill(); };
const txt = (s, x, y, c) => { mgraphics.set_source_rgba(...c); mgraphics.move_to(x, y); mgraphics.show_text(s); };

function tick() {
	row = (row + 1) % ROWS;
	heat[row] = 1;
	outlet(0, row);   // e.g. into a [route] or your sequencer
}

// the animation timer runs all the time but only redraws while something is still fading
setInterval(() => {
	let moving = false;
	for (let r = 0; r < ROWS; r++) {
		if (heat[r] > 0) { heat[r] = Math.max(0, heat[r] - 0.06); moving = true; }
	}
	if (moving) mgraphics.redraw();
}, 33);

function restart() {
	if (stepTimer === null) return;
	clearInterval(stepTimer);
	stepTimer = setInterval(tick, 60000 / (S.bpm * S.rpb));
}

function play() { if (stepTimer === null) { row = -1; stepTimer = setInterval(tick, 60000 / (S.bpm * S.rpb)); } }
function stop() { clearInterval(stepTimer); stepTimer = null; row = -1; mgraphics.redraw(); }
function bpm(n) { S.bpm = Math.max(20, Math.min(400, n)); restart(); mgraphics.redraw(); }
function rpb(n) { S.rpb = Math.max(1, n | 0); restart(); }

function paint() {
	const sz = mgraphics.size;
	if (sz) { W = sz[0]; H = sz[1]; }
	fillRect(0, 0, W, H, [0.10, 0.10, 0.11, 1]);
	mgraphics.select_font_face(S.font);
	mgraphics.set_font_size(S.fs);
	txt(`${S.bpm} bpm  ${stepTimer === null ? "stopped" : `row ${row}`}`, S.pad, S.rowH - 3, [0.56, 0.56, 0.62, 1]);
	for (let r = 0; r < ROWS; r++) {
		const y = S.rowH * (r + 1) + S.pad;
		if (heat[r] > 0) fillRect(0, y, W, S.rowH, [0.28, 0.52, 0.74, heat[r] * 0.7]);
		const beat = r % S.rpb === 0, base = y + S.rowH - 3;
		txt(r.toString(16).toUpperCase().padStart(2, "0"), S.pad, base, beat ? [0.9, 0.9, 0.9, 1] : [0.5, 0.5, 0.55, 1]);
		for (let c = 0; c < CH; c++) txt(noteName(cells[r][c]), S.left + c * S.colW, base, cells[r][c] < 0 ? [0.4, 0.4, 0.45, 1] : [0.86, 0.86, 0.89, 1]);
	}
}

function onclick(x, y) {
	const r = Math.floor((y - S.pad) / S.rowH) - 1, c = Math.floor((x - S.left) / S.colW);
	if (r < 0 || r >= ROWS || c < 0 || c >= CH) return;
	cells[r][c] = cells[r][c] < 0 ? 60 : -1;
	mgraphics.redraw();
}

function onresize(w, h) { W = w; H = h; mgraphics.redraw(); }
