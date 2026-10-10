// syntax_theme: Dictionary mapping token types to [r, g, b, a]
//   Types emitted: "key", "string", "number", "bool", "null",
//                  "paren", "bracket", "curly", "comma", "semicolon",
//                  "colon", "whitespace"
//   Note: "key" is detected contextually (a string immediately followed by ':').

var  syntax_theme = {
      "key":       [0.55, 0.75, 1.00, 1.0],
      "string":    [0.95, 0.75, 0.45, 1.0],
      "number":    [0.65, 0.90, 0.65, 1.0],
      "bool":      [0.90, 0.60, 0.90, 1.0],
      "null":      [0.60, 0.60, 0.60, 1.0],
      "paren":     [0.85, 0.85, 0.85, 1.0],
      "bracket":   [0.85, 0.85, 0.85, 1.0],
      "curly":     [0.85, 0.85, 0.85, 1.0],
      "comma":     [0.70, 0.70, 0.70, 1.0],
      "semicolon": [0.70, 0.70, 0.70, 1.0],
      "colon":     [0.70, 0.70, 0.70, 1.0]
  };

function tokenize_json(src) {
    // Returns array of {type, text}
    var tokens = [];
    var i = 0;
    var n = src.length;

    function isDigit(c) { return c >= '0' && c <= '9'; }
    function isWS(c) { return c === ' ' || c === '\t' || c === '\n' || c === '\r'; }

    while (i < n) {
        var c = src[i];

        // Whitespace
        if (isWS(c)) {
            var start = i;
            while (i < n && isWS(src[i])) i++;
            tokens.push({ type: "whitespace", text: src.slice(start, i) });
            continue;
        }

        // Punctuation
        if (c === '{' || c === '}') {
            tokens.push({ type: "curly", text: c }); i++; continue;
        }
        if (c === '[' || c === ']') {
            tokens.push({ type: "bracket", text: c }); i++; continue;
        }
        if (c === '(' || c === ')') {
            tokens.push({ type: "paren", text: c }); i++; continue;
        }
        if (c === ',') {
            tokens.push({ type: "comma", text: c }); i++; continue;
        }
        if (c === ';') {
            tokens.push({ type: "semicolon", text: c }); i++; continue;
        }
        if (c === ':') {
            tokens.push({ type: "colon", text: c }); i++; continue;
        }

        // String
        if (c === '"') {
            var sstart = i;
            i++;
            while (i < n) {
                var ch = src[i];
                if (ch === '\\') {
                    i += 2; // skip escape
                    continue;
                }
                if (ch === '"') { i++; break; }
                i++;
            }
            var text = src.slice(sstart, i);

            // Lookahead: skip whitespace to check for ':' → this is a key
            var j = i;
            while (j < n && isWS(src[j])) j++;
            var type = (j < n && src[j] === ':') ? "key" : "string";
            tokens.push({ type: type, text: text });
            continue;
        }

        // Number: -?digits(.digits)?([eE][+-]?digits)?
        if (c === '-' || isDigit(c)) {
            var nstart = i;
            if (src[i] === '-') i++;
            while (i < n && isDigit(src[i])) i++;
            if (i < n && src[i] === '.') {
                i++;
                while (i < n && isDigit(src[i])) i++;
            }
            if (i < n && (src[i] === 'e' || src[i] === 'E')) {
                i++;
                if (i < n && (src[i] === '+' || src[i] === '-')) i++;
                while (i < n && isDigit(src[i])) i++;
            }
            tokens.push({ type: "number", text: src.slice(nstart, i) });
            continue;
        }

        // Literals: true / false / null
        if (src.startsWith("true", i)) {
            tokens.push({ type: "bool", text: "true" }); i += 4; continue;
        }
        if (src.startsWith("false", i)) {
            tokens.push({ type: "bool", text: "false" }); i += 5; continue;
        }
        if (src.startsWith("null", i)) {
            tokens.push({ type: "null", text: "null" }); i += 4; continue;
        }

        // Unknown — emit as-is with a neutral type
        tokens.push({ type: "unknown", text: c });
        i++;
    }

    return tokens;
}


// Render a JSON string with syntax highlighting.
// Returns the bottom y (useful for scrolling / sizing).
function draw_json_string(gfx, src, x, y, syntax_theme) {
    var tokens = tokenize_json(src);

    var cx = x;
    var cy = y;
    var max_x = gfx.size[0]; // for optional wrapping

    function color_for(type) {
        var c = syntax_theme[type];
        if (!c) c = [0.9, 0.9, 0.9, 1.0];
        return c;
    }

    for (var t = 0; t < tokens.length; t++) {
        var tok = tokens[t];
        var text = tok.text;

        // Whitespace: handle newlines manually so we reset x
        if (tok.type === "whitespace") {
            for (var k = 0; k < text.length; k++) {
                var ch = text[k];
                if (ch === '\n') {
                    cx = x;
                    cy += charheight;
                } else if (ch === '\t') {
                    cx += charwidth * 4;
                } else {
                    cx += charwidth;
                }
            }
            continue;
        }

        // Optional: wrap on overflow
        // if (cx + text.length * charwidth > max_x) {
        //     cx = x;
        //     cy += charheight;
        // }

        var c = color_for(tok.type);
        gfx.set_source_rgba(c[0], c[1], c[2], c[3]);
        gfx.move_to(cx, cy);
        gfx.show_text(text);
        cx += text.length * charwidth;
    }

    return cy + charheight;
}

function paint() {
    const gfx = mgraphics;
    var [w, h] = gfx.size;

    gfx.set_font_size(settings_font_size);
    gfx.select_font_face("Consolas", "normal", "normal");
    var [charwidth, charheight] = gfx.text_measure('/');

    // Background
    gfx.set_source_rgba(0.1, 0.1, 0.12, 1.0);
    gfx.rectangle(0, 0, w, h);
    gfx.fill();

    var src = JSON.stringify(my_dictionary, null, 4);
    draw_json_string(gfx, src, 8, charheight, syntax_theme);
}