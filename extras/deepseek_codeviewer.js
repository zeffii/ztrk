// code_editor.js
// A tiny syntax-highlighting code editor for mgraphics.
// Click to place cursor, type to edit, arrow keys to move, backspace/delete to remove.
// Enter inserts a newline, Tab inserts two spaces.

autowatch = 1;
inlets = 1;
outlets = 1;

mgraphics.init();
mgraphics.relative_coords = 0;
mgraphics.autofill = 0;

// ---------- Config ----------
var LINE_H       = 16;
var PAD_X        = 8;
var PAD_Y        = 8;
var GUTTER_W     = 32;
var FONT         = "Menlo";
var FONT_SIZE    = 12;
var CHAR_W       = FONT_SIZE * 0.6;   // estimated monospace advance
var TAB_STR      = "  ";

// ---------- Colors ----------
var COLOR_BG         = [0.12, 0.12, 0.14, 1.0];
var COLOR_GUTTER_BG  = [0.16, 0.16, 0.18, 1.0];
var COLOR_GUTTER_FG  = [0.45, 0.45, 0.50, 1.0];
var COLOR_DEFAULT    = [0.85, 0.85, 0.88, 1.0];
var COLOR_COMMENT    = [0.42, 0.55, 0.42, 1.0];
var COLOR_NUMBER     = [0.85, 0.65, 0.35, 1.0];
var COLOR_STRING     = [0.85, 0.55, 0.45, 1.0];
var COLOR_KEYWORD    = [0.55, 0.70, 0.95, 1.0];
var COLOR_TYPE       = [0.55, 0.85, 0.85, 1.0];
var COLOR_PARAM      = [0.90, 0.75, 0.55, 1.0];
var COLOR_OPERATOR   = [0.80, 0.60, 0.85, 1.0];
var COLOR_PUNCT      = [0.65, 0.65, 0.70, 1.0];
var COLOR_FUNCTION   = [0.95, 0.90, 0.55, 1.0];
var COLOR_CURSOR     = [0.95, 0.95, 1.00, 0.9];
var COLOR_SELECTION  = [0.30, 0.45, 0.75, 0.45];
var COLOR_STATUS_BG  = [0.10, 0.10, 0.12, 1.0];

// ---------- Lexer tables ----------
var KEYWORDS = words(
    "if", "else", "for", "while", "do", "return", "break", "continue",
    "switch", "case", "default", "true", "false", "null", "in", "of"
);
var TYPES = words(
    "Param", "History", "Data", "Buffer", "Delay",
    "float", "int", "double", "bool", "void"
);
var FUNCTIONS = words(
    "sin", "cos", "tan", "asin", "acos", "atan", "atan2",
    "exp", "log", "log10", "pow", "sqrt", "abs",
    "floor", "ceil", "round", "trunc", "min", "max", "clamp",
    "tanh", "sinh", "cosh", "sign", "wrap", "fold",
    "peek", "poke", "sample", "lookup",
    "pi", "e", "samplerate",
    "play", "history", "delay", "accum", "counter",
    "noise", "phasor", "cycle", "saw", "rect", "triangle"
);
var OPERATORS = [
    ">>>=", "<<=", ">>=", "===", "!==",
    ">>>", "==", "!=", "<=", ">=", "&&", "||", "++", "--",
    "+=", "-=", "*=", "/=", "%=", "&=", "|=", "^=", "->", "::",
    "+", "-", "*", "/", "%", "=", "<", ">", "!", "&", "|", "^", "~", "?", ":"
];

function words(s) {
    var obj = {};
    var parts = s.split(/\s+/);
    for (var i = 0; i < parts.length; i++) obj[parts[i]] = true;
    return obj;
}

// ---------- Document model ----------
// lines: array of strings
// cursor: { line, col }  — col is a character index into lines[line]
// selection: { line, col } or null (anchor)
// scrollY: pixel offset
// scrollX: pixel offset

var lines = ["// new file"];
var cursor = { line: 0, col: 0 };
var sel = null;                  // anchor of the current selection, or null
var scrollY = 0;
var scrollX = 0;

var tokenLines = [];             // re-lexed on every change
var dirty = true;

// ---------- Public: set code ----------
function setcode() {
    if (arguments.length === 0) return;
    if (arguments.length === 1 && typeof arguments[0] === "string") {
        lines = String(arguments[0]).split("\n");
    } else {
        lines = [];
        for (var i = 0; i < arguments.length; i++) {
            lines.push(String(arguments[i]));
        }
    }
    cursor = { line: 0, col: 0 };
    sel = null;
    scrollX = scrollY = 0;
    markDirty();
}

function text() { setcode.apply(null, arguments); }

// ---------- Public: get code ----------
function getcode() {
    outlet(0, lines.join("\n"));
}

// ---------- Dirty handling ----------
function markDirty() {
    dirty = true;
    mgraphics.redraw();
}

function relex() {
    tokenLines = [];
    var inBlockComment = false;
    for (var li = 0; li < lines.length; li++) {
        var res = tokenizeLine(lines[li], inBlockComment);
        inBlockComment = res.inBlock;
        tokenLines.push(res.tokens);
    }
    dirty = false;
}

// ---------- Tokenizer (same as viewer) ----------
function tokenizeLine(src, inBlockComment) {
    var tokens = [];
    var i = 0, n = src.length;

    while (i < n) {
        var c = src[i];

        if (inBlockComment) {
            var endIdx = src.indexOf("*/", i);
            if (endIdx === -1) {
                tokens.push({ type: "comment", text: src.substring(i) });
                i = n;
            } else {
                tokens.push({ type: "comment", text: src.substring(i, endIdx + 2) });
                i = endIdx + 2;
                inBlockComment = false;
            }
            continue;
        }
        if (c === " " || c === "\t") {
            var wsStart = i;
            while (i < n && (src[i] === " " || src[i] === "\t")) i++;
            tokens.push({ type: "whitespace", text: src.substring(wsStart, i) });
            continue;
        }
        if (c === "/" && src[i + 1] === "/") {
            tokens.push({ type: "comment", text: src.substring(i) });
            i = n;
            continue;
        }
        if (c === "/" && src[i + 1] === "*") {
            var endIdx = src.indexOf("*/", i + 2);
            if (endIdx === -1) {
                tokens.push({ type: "comment", text: src.substring(i) });
                i = n;
                inBlockComment = true;
            } else {
                tokens.push({ type: "comment", text: src.substring(i, endIdx + 2) });
                i = endIdx + 2;
            }
            continue;
        }
        if (c === "\"" || c === "'") {
            var quote = c, j = i + 1;
            while (j < n) {
                if (src[j] === "\\") { j += 2; continue; }
                if (src[j] === quote) { j++; break; }
                j++;
            }
            tokens.push({ type: "string", text: src.substring(i, j) });
            i = j;
            continue;
        }
        if (isDigit(c) || (c === "." && isDigit(src[i + 1]))) {
            var j = i;
            if (c === "0" && (src[i + 1] === "x" || src[i + 1] === "X")) {
                j = i + 2;
                while (j < n && isHex(src[j])) j++;
            } else {
                while (j < n && (isDigit(src[j]) || src[j] === ".")) j++;
                if (j < n && (src[j] === "e" || src[j] === "E")) {
                    j++;
                    if (j < n && (src[j] === "+" || src[j] === "-")) j++;
                    while (j < n && isDigit(src[j])) j++;
                }
            }
            if (j < n && (src[j] === "f" || src[j] === "F")) j++;
            tokens.push({ type: "number", text: src.substring(i, j) });
            i = j;
            continue;
        }
        if (isIdentStart(c)) {
            var j = i;
            while (j < n && isIdentPart(src[j])) j++;
            var word = src.substring(i, j);
            var k = j;
            while (k < n && src[k] === " ") k++;
            var isCall = src[k] === "(";
            var type;
            if (KEYWORDS[word]) type = "keyword";
            else if (TYPES[word]) type = "type";
            else if (word === "Param" || word === "History" || word === "Data") type = "param";
            else if (isCall) type = "function";
            else if (FUNCTIONS[word]) type = "function";
            else type = "ident";
            tokens.push({ type: type, text: word });
            i = j;
            continue;
        }
        var matchedOp = null;
        for (var oi = 0; oi < OPERATORS.length; oi++) {
            var op = OPERATORS[oi];
            if (src.substr(i, op.length) === op) { matchedOp = op; break; }
        }
        if (matchedOp) {
            tokens.push({ type: "operator", text: matchedOp });
            i += matchedOp.length;
            continue;
        }
        if ("(){}[];,".indexOf(c) !== -1) {
            tokens.push({ type: "punct", text: c });
            i++;
            continue;
        }
        tokens.push({ type: "ident", text: c });
        i++;
    }
    return { tokens: tokens, inBlock: inBlockComment };
}

function isDigit(c) { return c >= "0" && c <= "9"; }
function isHex(c) { return isDigit(c) || (c >= "a" && c <= "f") || (c >= "A" && c <= "F"); }
function isIdentStart(c) { return (c >= "a" && c <= "z") || (c >= "A" && c <= "Z") || c === "_"; }
function isIdentPart(c) { return isIdentStart(c) || isDigit(c); }

// ---------- Text mutation helpers ----------
function insertText(str) {
    // If there's a selection, delete it first.
    deleteSelection();

    var line = lines[cursor.line];
    var before = line.substring(0, cursor.col);
    var after = line.substring(cursor.col);

    // Handle newlines
    var parts = str.split("\n");
    if (parts.length === 1) {
        lines[cursor.line] = before + str + after;
        cursor.col += str.length;
    } else {
        var newLines = [];
        newLines.push(before + parts[0]);
        for (var i = 1; i < parts.length - 1; i++) newLines.push(parts[i]);
        newLines.push(parts[parts.length - 1] + after);
        // splice into lines
        var args = [cursor.line, 1].concat(newLines);
        Array.prototype.splice.apply(lines, args);
        cursor.line += parts.length - 1;
        cursor.col = parts[parts.length - 1].length;
    }
    markDirty();
}

function backspace() {
    if (sel) { deleteSelection(); markDirty(); return; }
    if (cursor.col > 0) {
        var line = lines[cursor.line];
        lines[cursor.line] = line.substring(0, cursor.col - 1) + line.substring(cursor.col);
        cursor.col--;
    } else if (cursor.line > 0) {
        var prevLen = lines[cursor.line - 1].length;
        lines[cursor.line - 1] += lines[cursor.line];
        lines.splice(cursor.line, 1);
        cursor.line--;
        cursor.col = prevLen;
    }
    markDirty();
}

function deleteForward() {
    if (sel) { deleteSelection(); markDirty(); return; }
    var line = lines[cursor.line];
    if (cursor.col < line.length) {
        lines[cursor.line] = line.substring(0, cursor.col) + line.substring(cursor.col + 1);
    } else if (cursor.line < lines.length - 1) {
        lines[cursor.line] += lines[cursor.line + 1];
        lines.splice(cursor.line + 1, 1);
    }
    markDirty();
}

function deleteSelection() {
    if (!sel) return;
    var a = sel, b = cursor;
    // Order so a is before b
    if (a.line > b.line || (a.line === b.line && a.col > b.col)) {
        var tmp = a; a = b; b = tmp;
    }
    if (a.line === b.line) {
        var line = lines[a.line];
        lines[a.line] = line.substring(0, a.col) + line.substring(b.col);
    } else {
        var first = lines[a.line].substring(0, a.col);
        var last  = lines[b.line].substring(b.col);
        lines[a.line] = first + last;
        lines.splice(a.line + 1, b.line - a.line);
    }
    cursor = { line: a.line, col: a.col };
    sel = null;
}

// ---------- Rendering ----------
function paint() {
    var w = mgraphics.size[0];
    var h = mgraphics.size[1];

    if (dirty) relex();

    // BG
    mgraphics.set_source_rgba(COLOR_BG[0], COLOR_BG[1], COLOR_BG[2], COLOR_BG[3]);
    mgraphics.rectangle(0, 0, w, h);
    mgraphics.fill();

    // Gutter
    mgraphics.set_source_rgba(COLOR_GUTTER_BG[0], COLOR_GUTTER_BG[1],
                              COLOR_GUTTER_BG[2], COLOR_GUTTER_BG[3]);
    mgraphics.rectangle(0, 0, GUTTER_W, h - 18);
    mgraphics.fill();

    mgraphics.select_font_face(FONT);
    mgraphics.set_font_size(FONT_SIZE);

    // Draw selection background first
    if (sel) drawSelection(w, h);

    var lineY = PAD_Y - scrollY;
    for (var li = 0; li < tokenLines.length; li++) {
        if (lineY > h + LINE_H) break;
        if (lineY < -LINE_H) { lineY += LINE_H; continue; }

        // Line number
        mgraphics.set_source_rgba(COLOR_GUTTER_FG[0], COLOR_GUTTER_FG[1],
                                  COLOR_GUTTER_FG[2], COLOR_GUTTER_FG[3]);
        var numStr = String(li + 1);
        var numW = textWidth(numStr, FONT_SIZE);
        mgraphics.move_to(GUTTER_W - 6 - numW, lineY + FONT_SIZE);
        mgraphics.show_text(numStr);

        // Tokens
        var x = GUTTER_W + PAD_X - scrollX;
        var toks = tokenLines[li];
        for (var ti = 0; ti < toks.length; ti++) {
            var t = toks[ti];
            var col = colorFor(t.type);
            mgraphics.set_source_rgba(col[0], col[1], col[2], col[3]);
            mgraphics.move_to(x, lineY + FONT_SIZE);
            mgraphics.show_text(t.text);
            x += textWidth(t.text, FONT_SIZE);
        }

        lineY += LINE_H;
    }

    // Cursor
    drawCursor();

    // Status bar
    drawStatus(w, h);
}

function drawCursor() {
    var cy = PAD_Y - scrollY + cursor.line * LINE_H;
    var cx = GUTTER_W + PAD_X - scrollX + colToX(cursor.line, cursor.col);

    var h = mgraphics.size[1];
    if (cy + LINE_H < 0 || cy > h) return;

    mgraphics.set_source_rgba(COLOR_CURSOR[0], COLOR_CURSOR[1],
                              COLOR_CURSOR[2], COLOR_CURSOR[3]);
    mgraphics.rectangle(cx, cy, 1.5, LINE_H);
    mgraphics.fill();
}

function drawSelection(w, h) {
    var a = sel, b = cursor;
    if (a.line > b.line || (a.line === b.line && a.col > b.col)) {
        var tmp = a; a = b; b = tmp;
    }
    mgraphics.set_source_rgba(COLOR_SELECTION[0], COLOR_SELECTION[1],
                              COLOR_SELECTION[2], COLOR_SELECTION[3]);
    if (a.line === b.line) {
        var x1 = GUTTER_W + PAD_X - scrollX + colToX(a.line, a.col);
        var x2 = GUTTER_W + PAD_X - scrollX + colToX(a.line, b.col);
        var y = PAD_Y - scrollY + a.line * LINE_H;
        mgraphics.rectangle(x1, y, x2 - x1, LINE_H);
        mgraphics.fill();
    } else {
        // First partial line
        var yA = PAD_Y - scrollY + a.line * LINE_H;
        var xA = GUTTER_W + PAD_X - scrollX + colToX(a.line, a.col);
        mgraphics.rectangle(xA, yA, w - xA, LINE_H);
        mgraphics.fill();
        // Middle full lines
        for (var li = a.line + 1; li < b.line; li++) {
            var y = PAD_Y - scrollY + li * LINE_H;
            mgraphics.rectangle(GUTTER_W + PAD_X - scrollX, y, w, LINE_H);
            mgraphics.fill();
        }
        // Last partial line
        var yB = PAD_Y - scrollY + b.line * LINE_H;
        var xB = GUTTER_W + PAD_X - scrollX + colToX(b.line, b.col);
        mgraphics.rectangle(GUTTER_W + PAD_X - scrollX, yB, xB - (GUTTER_W + PAD_X - scrollX), LINE_H);
        mgraphics.fill();
    }
}

function drawStatus(w, h) {
    mgraphics.set_source_rgba(COLOR_STATUS_BG[0], COLOR_STATUS_BG[1],
                              COLOR_STATUS_BG[2], COLOR_STATUS_BG[3]);
    mgraphics.rectangle(0, h - 18, w, 18);
    mgraphics.fill();

    mgraphics.set_source_rgba(COLOR_GUTTER_FG[0], COLOR_GUTTER_FG[1],
                              COLOR_GUTTER_FG[2], 0.9);
    mgraphics.set_font_size(10);
    var status = "ln " + (cursor.line + 1) + ", col " + (cursor.col + 1) +
                 "  |  " + lines.length + " lines";
    mgraphics.move_to(GUTTER_W + PAD_X, h - 5);
    mgraphics.show_text(status);
}

function colorFor(type) {
    switch (type) {
        case "comment":  return COLOR_COMMENT;
        case "string":   return COLOR_STRING;
        case "number":   return COLOR_NUMBER;
        case "keyword":  return COLOR_KEYWORD;
        case "type":     return COLOR_TYPE;
        case "param":    return COLOR_PARAM;
        case "function": return COLOR_FUNCTION;
        case "operator": return COLOR_OPERATOR;
        case "punct":    return COLOR_PUNCT;
        default:         return COLOR_DEFAULT;
    }
}

function textWidth(str, size) { return str.length * size * 0.6; }

// Convert a (line, col) into an x-offset within the text area.
// Tabs count as TAB_STR.length columns.
function colToX(lineIdx, col) {
    var s = lines[lineIdx] || "";
    var x = 0;
    for (var i = 0; i < col && i < s.length; i++) {
        x += (s[i] === "\t") ? CHAR_W * TAB_STR.length : CHAR_W;
    }
    return x;
}

// Inverse of colToX: convert an x-offset into a column index.
function xToCol(lineIdx, x) {
    var s = lines[lineIdx] || "";
    var acc = 0;
    for (var i = 0; i < s.length; i++) {
        var step = (s[i] === "\t") ? CHAR_W * TAB_STR.length : CHAR_W;
        if (x < acc + step / 2) return i;
        acc += step;
    }
    return s.length;
}

// ---------- Interaction ----------
var mouseDown = false;
var mouseDownPos = null;

function onclick(x, y, button, cmd, shift, capslock, option, ctrl) {
    if (button === 2) {
        // right-click: clear selection
        sel = null;
        markDirty();
        return;
    }
    var hit = hitTest(x, y);
    cursor = hit;
    if (shift && mouseDownPos) {
        sel = mouseDownPos;
    } else {
        sel = null;
        mouseDownPos = { line: hit.line, col: hit.col };
    }
    mouseDown = true;
    ensureCursorVisible();
    markDirty();
}

function ondrag(x, y, button, cmd, shift, capslock, option, ctrl) {
    if (!mouseDown) return;
    // Ensure drag extends selection from the original click point.
    if (!sel && mouseDownPos) sel = mouseDownPos;
    cursor = hitTest(x, y);
    ensureCursorVisible();
    markDirty();
}

function onrelease() {
    mouseDown = false;
}

function hitTest(x, y) {
    var lineIdx = Math.floor((y - PAD_Y + scrollY) / LINE_H);
    lineIdx = Math.max(0, Math.min(lines.length - 1, lineIdx));
    var textX = x - (GUTTER_W + PAD_X) + scrollX;
    var col = xToCol(lineIdx, textX);
    return { line: lineIdx, col: col };
}

function ensureCursorVisible() {
    var w = mgraphics.size[0];
    var h = mgraphics.size[1];

    // Vertical
    var cy = cursor.line * LINE_H;
    var viewH = h - 18 - PAD_Y * 2;
    if (cy - scrollY < 0) scrollY = cy;
    else if (cy + LINE_H - scrollY > viewH) scrollY = cy + LINE_H - viewH;

    // Horizontal
    var cx = colToX(cursor.line, cursor.col);
    var viewW = w - GUTTER_W - PAD_X * 2;
    if (cx - scrollX < 0) scrollX = cx;
    else if (cx - scrollX > viewW) scrollX = cx - viewW + CHAR_W;
}

// ---------- Keyboard ----------
// Max sends `key` messages for key presses when the js object has focus.
// keycode numbers are from the OS; we use `key` string when available.
// Also handle `keyup`/`keydown` in case you wire them from a key/keyup object.

function key() {
    var args = arrayfromargs(arguments);
    // First arg: character (string) OR keycode (number)
    var ch = args[0];
    var mods = {
        shift:   args[2] === 1 || args[4] === 1,
        caps:    args[3] === 1,
        option:  args[5] === 1,
        control: args[6] === 1
    };

    if (typeof ch === "number") {
        // Keycode mode — handle special keys by code.
        handleKeycode(ch, mods);
        return;
    }
    if (typeof ch === "string") {
        if (ch.length === 0) return;
        var code = ch.charCodeAt(0);
        if (code === 8)  { backspace(); return; }             // backspace
        if (code === 127) { deleteForward(); return; }        // delete
        if (code === 13 || code === 10) { insertText("\n"); return; }
        if (code === 9)  { insertText(TAB_STR); return; }     // tab
        if (code === 27) { sel = null; markDirty(); return; } // escape
        if (code < 32) return;                                // other control chars
        insertText(ch);
        return;
    }
}

// Max keycode table (macOS/Windows numeric codes vary).
// We cover the common ones used for navigation.
function handleKeycode(code, mods) {
    // Arrow keys
    if (code === 123 || code === 37) { moveLeft(mods.shift); return; }   // left
    if (code === 124 || code === 39) { moveRight(mods.shift); return; }  // right
    if (code === 125 || code === 40) { moveDown(mods.shift); return; }   // down
    if (code === 126 || code === 38) { moveUp(mods.shift); return; }     // up
    if (code === 36 || code === 13) { insertText("\n"); return; }        // return
    if (code === 51 || code === 8)  { backspace(); return; }             // backspace
    if (code === 117) { deleteForward(); return; }                       // forward delete
}

function moveLeft(shift) {
    if (shift && !sel) sel = { line: cursor.line, col: cursor.col };
    if (cursor.col > 0) cursor.col--;
    else if (cursor.line > 0) {
        cursor.line--;
        cursor.col = lines[cursor.line].length;
    }
    if (!shift) sel = null;
    ensureCursorVisible();
    markDirty();
}

function moveRight(shift) {
    if (shift && !sel) sel = { line: cursor.line, col: cursor.col };
    var line = lines[cursor.line];
    if (cursor.col < line.length) cursor.col++;
    else if (cursor.line < lines.length - 1) {
        cursor.line++;
        cursor.col = 0;
    }
    if (!shift) sel = null;
    ensureCursorVisible();
    markDirty();
}

function moveUp(shift) {
    if (shift && !sel) sel = { line: cursor.line, col: cursor.col };
    if (cursor.line > 0) {
        var desiredX = colToX(cursor.line, cursor.col);
        cursor.line--;
        cursor.col = xToCol(cursor.line, desiredX);
    }
    if (!shift) sel = null;
    ensureCursorVisible();
    markDirty();
}

function moveDown(shift) {
    if (shift && !sel) sel = { line: cursor.line, col: cursor.col };
    if (cursor.line < lines.length - 1) {
        var desiredX = colToX(cursor.line, cursor.col);
        cursor.line++;
        cursor.col = xToCol(cursor.line, desiredX);
    }
    if (!shift) sel = null;
    ensureCursorVisible();
    markDirty();
}

// ---------- Wheel scrolling ----------
function onwheel(x, y, button, cmd, shift, capslock, option, ctrl) {
    // Max reports wheel as button 1 (up) / 2 (down) in some versions.
    // Also accepts explicit scroll delta via a `scroll` message.
}

function scroll() {
    var dy = arguments[0] || 0;
    scrollY += dy * LINE_H;
    if (scrollY < 0) scrollY = 0;
    markDirty();
}

// ---------- Resize ----------
function onresize(w, h) {
    mgraphics.redraw();
}

// ---------- Demo content ----------
setcode(
    "// code_editor.js — try clicking and typing\n" +
    "Param freq(440, 20, 20000);\n" +
    "History prev;\n" +
    "Data buf(64, 1);\n" +
    "\n" +
    "theta = 2 * pi * freq / samplerate;\n" +
    "y = sin(theta) * 0.5 + prev * 0.5;\n" +
    "prev = y;\n" +
    "poke(buf, y, 0, 0);\n" +
    "out1 = y * 0.8;   // trim\n"
);