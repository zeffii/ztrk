// syntax_theme: Dictionary mapping token types to [r, g, b, a]
//   Keys: "key", "string", "number", "bool", "null",
//         "paren", "bracket", "curly", "comma", "semicolon", "colon"
// Example:
//   syntax_theme = {
//       "key":       [0.55, 0.75, 1.00, 1.0],
//       "string":    [0.95, 0.75, 0.45, 1.0],
//       "number":    [0.65, 0.90, 0.65, 1.0],
//       "bool":      [0.90, 0.60, 0.90, 1.0],
//       "null":      [0.60, 0.60, 0.60, 1.0],
//       "paren":     [0.85, 0.85, 0.85, 1.0],
//       "bracket":   [0.85, 0.85, 0.85, 1.0],
//       "curly":     [0.85, 0.85, 0.85, 1.0],
//       "comma":     [0.70, 0.70, 0.70, 1.0],
//       "semicolon": [0.70, 0.70, 0.70, 1.0],
//       "colon":     [0.70, 0.70, 0.70, 1.0]
//   };

function draw_json(gfx, obj, x, y, syntax_theme) {
    var indent_level = 0;
    var indent_str = "    "; // 4 spaces
    var line = 0;

    // Helper: pick color for a token type, with fallback
    function color_for(type) {
        var c = syntax_theme[type];
        if (!c) c = [0.9, 0.9, 0.9, 1.0];
        return c;
    }

    // Helper: draw a token at current cursor, returns new cursor x
    function draw_token(text, type, cx, cy) {
        var c = color_for(type);
        gfx.set_source_rgba(c[0], c[1], c[2], c[3]);
        gfx.move_to(cx, cy);
        gfx.show_text(text);
        return cx + text.length * charwidth;
    }

    // Helper: newline
    function newline(cx, cy) {
        line++;
        return [indent_level * indent_str.length * charwidth, y + line * charheight];
    }

    // Recursive renderer
    function render(value, cx, cy, is_last, is_value) {
        var t = typeof value;

        if (value === null) {
            cx = draw_token("null", "null", cx, cy);
        } else if (t === "number") {
            cx = draw_token(String(value), "number", cx, cy);
        } else if (t === "boolean") {
            cx = draw_token(value ? "true" : "false", "bool", cx, cy);
        } else if (t === "string") {
            cx = draw_token("\"" + value + "\"", "string", cx, cy);
        } else if (Array.isArray(value)) {
            cx = draw_token("[", "bracket", cx, cy);
            if (value.length === 0) {
                cx = draw_token("]", "bracket", cx, cy);
            } else {
                indent_level++;
                var pos = newline(cx, cy);
                cx = pos[0]; cy = pos[1];
                for (var i = 0; i < value.length; i++) {
                    cx = render(value[i], cx, cy, i === value.length - 1, true);
                    if (i < value.length - 1) {
                        cx = draw_token(",", "comma", cx, cy);
                        var p = newline(cx, cy);
                        cx = p[0]; cy = p[1];
                    }
                }
                indent_level--;
                var p2 = newline(cx, cy);
                cx = p2[0]; cy = p2[1];
                cx = draw_token("]", "bracket", cx, cy);
            }
        } else if (t === "object") {
            cx = draw_token("{", "curly", cx, cy);
            var keys = Object.keys(value);
            if (keys.length === 0) {
                cx = draw_token("}", "curly", cx, cy);
            } else {
                indent_level++;
                var pos3 = newline(cx, cy);
                cx = pos3[0]; cy = pos3[1];
                for (var k = 0; k < keys.length; k++) {
                    var key = keys[k];
                    cx = draw_token("\"" + key + "\"", "key", cx, cy);
                    cx = draw_token(":", "colon", cx, cy);
                    cx = draw_token(" ", "colon", cx, cy);
                    cx = render(value[key], cx, cy, k === keys.length - 1, true);
                    if (k < keys.length - 1) {
                        cx = draw_token(",", "comma", cx, cy);
                        var p3 = newline(cx, cy);
                        cx = p3[0]; cy = p3[1];
                    }
                }
                indent_level--;
                var p4 = newline(cx, cy);
                cx = p4[0]; cy = p4[1];
                cx = draw_token("}", "curly", cx, cy);
            }
        }

        // Optional trailing semicolon at the very end handled by caller
        return cx;
    }

    // Kick off rendering at (x, y)
    var end_x = render(obj, x, y, true, false);
    // draw a trailing semicolon
    draw_token(";", "semicolon", end_x, y + line * charheight);

    // Return bottom y so caller can size things
    return y + (line + 1) * charheight;
}

function paint() {
    const gfx = mgraphics;
    var [w, h] = gfx.size;

    gfx.set_font_size(settings_font_size);
    gfx.select_font_face("Consolas", "normal", "normal");
    var [charwidth, charheight] = gfx.text_measure('/');

    // background
    gfx.set_source_rgba(0.1, 0.1, 0.12, 1.0);
    gfx.rectangle(0, 0, w, h);
    gfx.fill();

    draw_json(gfx, my_dictionary, 8, charheight, syntax_theme);
}