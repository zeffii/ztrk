// ztrk_buffer_viz.js
// jsui-based buffer~ visualizer for ztracker
// Renders one or more buffer~ contents as stacked rows via mgraphics,
// with sentinel-value color coding and a zoomable [start, end] frame
// window (shared across all rows) for debugging.
//
// Usage (inside a jsui object):
//   [set t1_buf(          -> attach to a single named buffer~ (row 0)
//   [buffer_range 0 2(    -> attach to t0_buf, t1_buf, t2_buf as stacked rows
//   [start 128(           -> sets left edge of the visible frame window
//   [end 384(             -> sets right edge of the visible frame window
//   [range 128 384(       -> sets start+end together
//   [zoomall(             -> resets window to the full (longest) buffer
//   [nudge 64(            -> pans the window, keeping its width
//   [playpos 512(         -> draws a playhead line at this frame
//   [chans_per_buffer 5(  -> only draw the first 5 channels of each buffer
//                            (0 = show all channels, the default)
//   [bang(                -> redraws
//
// Colors:
//   0.0            -> skipped entirely (not drawn, treated as "empty")
//   -1.0           -> EMPTY sentinel color
//   -0.75          -> "^^^" sentinel color
//   -0.5           -> "===" sentinel color
//   > 0.0          -> greyscale, scaled by value

inlets = 1;
outlets = 1;

autowatch = 1;
mgraphics.init();
mgraphics.relative_coords = 0;
mgraphics.autofill = 0;

// each row is {name, buf}
var rows = [];

// visible window into the buffer(s), in frames (samples), shared across rows
var start_frame = 0;
var end_frame = 0; // 0 means "not yet set" -> resolves to full length on first draw

// sentinel colors [r, g, b, a], 0-1 range
var COLOR_EMPTY = [0.15, 0.15, 0.15, 1.0];   // -1.0
var COLOR_CARET = [0.85, 0.25, 0.25, 1.0];   // -0.75  ("^^^")
var COLOR_EQUALS = [0.25, 0.55, 0.85, 1.0];  // -0.5   ("===")
var COLOR_BG = [0.05, 0.05, 0.05, 1.0];
var COLOR_ROWSEP = [0.0, 0.0, 0.0, 1.0];
var COLOR_PLAYHEAD = [1.0, 0.9, 0.2, 1.0];

var playhead = -1; // frame index, -1 = don't draw

// debug aid: cap how many channels of each buffer get drawn.
// 0/unset means "show all channels" (default behavior).
var max_channels_per_buffer = 0;
var display_channel_info = true;

function toggle_channel_info(){
	display_channel_info = !display_channel_info;
}

function toggle(command){
	switch (command){
		case 'info': toggle_channel_info();
	}
}

function chans_per_buffer(n) {
	n = Math.floor(n);
	if (n < 0) n = 0;
	max_channels_per_buffer = n;
	mgraphics.redraw();
}

// attach to a single named buffer~, replacing whatever rows were showing
function set(name) {
	rows = [{ name: name, buf: new Buffer(name) }];
	if (end_frame === 0) {
		zoomall();
	} else {
		mgraphics.redraw();
	}
}

// attach to t{a}_buf .. t{b}_buf as stacked rows, e.g. [buffer_range 0 2(
// shows t0_buf, t1_buf, t2_buf
function buffer_range(a, b) {
	a = Math.floor(a);
	b = Math.floor(b);
	if (b < a) { var tmp = a; a = b; b = tmp; }
	rows = [];
	for (var n = a; n <= b; n++) {
		var name = `t${n}_buf`;
		rows.push({ name: name, buf: new Buffer(name) });
	}
	if (end_frame === 0) {
		zoomall();
	} else {
		mgraphics.redraw();
	}
}

function longestFramecount() {
	var max = 0;
	for (var i = 0; i < rows.length; i++) {
		var fc = rows[i].buf.framecount();
		if (fc > max) max = fc;
	}
	return max;
}

function zoomall() {
	if (rows.length > 0) {
		start_frame = 0;
		end_frame = longestFramecount();
	}
	mgraphics.redraw();
}

function start(f) {
	f = Math.floor(f);
	if (f < 0) f = 0;
	if (rows.length > 0 && f >= end_frame) f = Math.max(0, end_frame - 1);
	start_frame = f;
	mgraphics.redraw();
}

function end(f) {
	f = Math.floor(f);
	if (rows.length > 0) {
		var maxf = longestFramecount();
		if (f > maxf) f = maxf;
	}
	if (f <= start_frame) f = start_frame + 1;
	end_frame = f;
	mgraphics.redraw();
}

// convenience: set both at once, e.g. [range 128 384(
function range(a, b) {
	start(a);
	end(b);
}

function nudge(amount) {
	// shift the window left/right by `amount` frames, keeping width constant
	amount = Math.floor(amount);
	var width = end_frame - start_frame;
	var new_start = start_frame + amount;
	if (new_start < 0) new_start = 0;
	var new_end = new_start + width;
	if (rows.length > 0) {
		var maxf = longestFramecount();
		if (new_end > maxf) {
			new_end = maxf;
			new_start = Math.max(0, new_end - width);
		}
	}
	start_frame = new_start;
	end_frame = new_end;
	mgraphics.redraw();
}

function playpos(f) {
	playhead = f;
	mgraphics.redraw();
}

function bang() {
	mgraphics.redraw();
}

function valueToColor(v) {
	if (v === -1.0) return COLOR_EMPTY;
	if (v === -0.75) return COLOR_CARET;
	if (v === -0.5) return COLOR_EQUALS;
	// greyscale for anything above 0; clamp to [0,1]
	var g = Math.max(0, Math.min(1, v));
	return [g, g, g, 1.0];
}

// draws a single channel's content into the rect [0, y, w, chH],
// using the shared [s, e) frame window.
function drawChannel(buf, channel, y, w, chH, s, e) {
	var framecount = buf.framecount();
	var rs = Math.min(s, framecount);
	var re = Math.min(e, framecount);
	var visible = e - s; // keep shared visible width for consistent px mapping across rows

	var framesPerPixel = visible / w;
	var pixelsPerFrame = w / visible;

	if (re <= rs) return;

	if (pixelsPerFrame >= 2) {
		for (var f = rs; f < re; f++) {
			var v = buf.peek(channel, f, 1);
			if (v === 0.0) continue;
			var x = (f - s) * pixelsPerFrame;
			var col = valueToColor(v);
			mgraphics.set_source_rgba(col);
			mgraphics.rectangle(x, y, Math.ceil(pixelsPerFrame), chH);
			mgraphics.fill();
		}
	} else {
		for (var px = 0; px < w; px++) {
			var f0 = s + Math.floor(px * framesPerPixel);
			var f1 = s + Math.floor((px + 1) * framesPerPixel);
			if (f1 <= f0) f1 = f0 + 1;
			if (f0 >= re) continue;
			if (f1 > re) f1 = re;
			if (f0 < rs) f0 = rs;
			if (f1 <= f0) continue;

			var chosen = null;
			var chosenIsSentinel = false;
			var maxAbs = 0;

			for (var i = f0; i < f1; i++) {
				var vv = buf.peek(channel, i, 1);
				if (vv === 0.0) continue;
				var isSentinel = (vv === -1.0 || vv === -0.75 || vv === -0.5);
				if (isSentinel) {
					chosen = vv;
					chosenIsSentinel = true;
					break;
				}
				if (!chosenIsSentinel && Math.abs(vv) > maxAbs) {
					maxAbs = Math.abs(vv);
					chosen = vv;
				}
			}

			if (chosen === null) continue;
			var col2 = valueToColor(chosen);
			mgraphics.set_source_rgba(col2);
			mgraphics.rectangle(px, y, 1, chH);
			mgraphics.fill();
		}
	}
}

// draws one buffer (all of its channels, stacked as sub-rows) into the
// row rect [0, y, w, rowH], using the shared [s, e) frame window.
function drawRow(bufObj, name, y, w, rowH, s, e) {
	var buf = bufObj;
	var framecount = buf.framecount();
	var numChannels = buf.channelcount();
	if (!numChannels || numChannels < 1) numChannels = 1;
	var drawnChannels = numChannels;
	if (max_channels_per_buffer > 0) {
		drawnChannels = Math.min(numChannels, max_channels_per_buffer);
	}
	var chH = rowH / drawnChannels;

	for (var c = 1; c <= drawnChannels; c++) {
		var chy = y + (c - 1) * chH;
		drawChannel(buf, c, chy, w, chH, s, e);

		// faint separator between channels within the same buffer
		if (c > 1) {
			mgraphics.set_source_rgba([0.0, 0.0, 0.0, 0.5]);
			mgraphics.rectangle(0, chy, w, 1);
			mgraphics.fill();
		}
	}

	if (!display_channel_info) return;

	// row label (buffer name, framecount, channel count)
	mgraphics.set_source_rgba([0.7, 0.7, 0.7, 1.0]);
	mgraphics.select_font_face("Arial");
	mgraphics.set_font_size(10);
	mgraphics.move_to(4, y + 12);
	var chLabel = (drawnChannels < numChannels)
		? (drawnChannels + "/" + numChannels + "ch")
		: (numChannels + "ch");
	mgraphics.show_text(name + "  (" + framecount + " fr, " + chLabel + ")");
}

function paint() {
	var w = box.rect[2] - box.rect[0];
	var h = box.rect[3] - box.rect[1];

	mgraphics.set_source_rgba(COLOR_BG);
	mgraphics.rectangle(0, 0, w, h);
	mgraphics.fill();

	if (rows.length === 0) {
		mgraphics.set_source_rgba([0.6, 0.6, 0.6, 1.0]);
		mgraphics.select_font_face("Arial");
		mgraphics.set_font_size(12);
		mgraphics.move_to(6, h / 2);
		mgraphics.show_text("no buffer(s) set");
		return;
	}

	var framecount = longestFramecount();
	if (end_frame === 0) end_frame = framecount;

	var s = Math.max(0, Math.min(start_frame, framecount - 1));
	var e = Math.max(s + 1, Math.min(end_frame, framecount));

	var rowH = h / rows.length;

	for (var i = 0; i < rows.length; i++) {
		var y = i * rowH;
		drawRow(rows[i].buf, rows[i].name, y, w, rowH, s, e);

		// row separator
		if (i > 0) {
			mgraphics.set_source_rgba(COLOR_ROWSEP);
			mgraphics.rectangle(0, y, w, 1);
			mgraphics.fill();
		}
	}

	// playhead spans the full stack, drawn once on top
	var visible = e - s;
	var pixelsPerFrame = w / visible;
	if (playhead >= s && playhead < e) {
		var px2 = (playhead - s) * pixelsPerFrame;
		mgraphics.set_source_rgba(COLOR_PLAYHEAD);
		mgraphics.rectangle(px2, 0, Math.max(1, pixelsPerFrame), h);
		mgraphics.fill();
	}

	// window readout, top-right-ish
	mgraphics.set_source_rgba([0.7, 0.7, 0.7, 1.0]);
	mgraphics.select_font_face("Arial");
	mgraphics.set_font_size(10);
	mgraphics.move_to(4, h - 4);
	mgraphics.show_text("[" + s + " - " + e + "] / " + framecount);
}