autowatch = 1;
inlets = 1;
outlets = 0;

mgraphics.init();
mgraphics.relative_coords = 0;
mgraphics.autofill = 0;

// ---------------------------------------------------------------------
// Same config shape as before. Colors stay as normalized RGBA arrays
// since that's what mgraphics.set_source_rgba() expects directly.
// ---------------------------------------------------------------------
var config = {
	params: {
		mod:      0,
		modPhase: 0,
		wet:      0.42,
		dry:      0.55,
		decay:    0.78,
		size:     0.65,
		predelay: 18,
		width:    1
	},
	colors: {
		bg:     [0.05, 0.06, 0.08, 1],
		fg:     [0.85, 0.90, 0.95, 1],
		LCD_bg: [0.078, 0.651, 0.788, 1],
		LCD_fg: [0.863, 0.933, 1.0,  1],
		active: [0.30, 0.90, 0.98, 1]
	},
	font: {
		// This must match a font family actually installed on the machine
		// running the patch — mgraphics has no equivalent of loading a
		// .ttf file at runtime the way a browser's FontFace API does.
		family: ["VCR-JP", "normal", "normal"], // VCR-JP",
		size:   11
	}
};

// Inlet 0: accept a list [paramName, value] to update the readout live
// e.g. sending "decay 1.20" from the patch updates that row and repaints.
function anything() {
	var name = messagename;
	if (config.params.hasOwnProperty(name) && arguments.length > 0) {
		config.params[name] = arguments[0];
		mgraphics.redraw();
	}
}

function paint() {
    var gfx = this.mgraphics;
    var [width, height] = gfx.size;

	with (gfx) {

		// --- backlight fill ---
		set_source_rgba(...config.colors.LCD_bg);
		rectangle(0, 0, width, height);
		fill();

		// --- soft vignette so it reads as backlit glass, not a flat rect ---
		// mgraphics doesn't have canvas-style radial gradients built in as
		// a single call, so this fakes it with a few translucent overlaid
		// rounded rects rather than a true gradient — cheap and close enough
		// at typical UI sizes.
		set_source_rgba(1, 1, 1, 0.06);
		rectangle(width * 0.15, height * 0.1, width * 0.7, height * 0.4);
		fill();
		set_source_rgba(0, 0, 0, 0.12);
		rectangle(0, height * 0.7, width, height * 0.3);
		fill();

		// --- text ---
		select_font_face(...config.font.family);
		set_font_size(config.font.size);
		set_source_rgba(...config.colors.LCD_fg);

		var rows = [
			["WET",      config.params.wet.toFixed(2)],
			["DRY",      config.params.dry.toFixed(2)],
			["DECAY",    config.params.decay.toFixed(2) + " S"],
			["SIZE",     config.params.size.toFixed(2) + " M"],
			["PREDELAY", config.params.predelay.toFixed(0) + " MS"],
			["WIDTH",    config.params.width.toFixed(2)]
		];

		var lineH = config.font.size + 8;
		for (var i = 0; i < rows.length; i++) {
			var y = 16 + i * lineH;
			move_to(10, y);
			show_text(rows[i][0]);
			move_to(100, y);
			show_text(rows[i][1]);
		}
	}
}