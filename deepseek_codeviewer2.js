// code_editor.js
// A tiny syntax-highlighting code editor for mgraphics.
// Keys arrive via keys(a1, a2, a3, a4) — wire a [key] object into inlet 2.
//   a1 = virtual keycode
//   a2 = modifier bitmask (1=shift, 2=option/alt, 4=control, 8=command; plus
//        combined masks like 512/2048/4352/6400 that Max sends for chords)

autowatch = 1;
inlets = 2;
outlets = 1;

mgraphics.init();
mgraphics.relative_coords = 0;
mgraphics.autofill = 0;

// ---------- Config ----------
var g_mouse_on_rect = false;
var LINE_H       = 16;
var PAD_X        = 8;
var PAD_Y        = 8;
var GUTTER_W     = 32;
var FONT         = "Consolas";
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

// ---------- Virtual keycodes ----------
// const ASCII = (key) => String.fromCharCode(key).toUpperCase();
const ASCII = (key) => String.fromCharCode(key);

// macOS virtual keycodes (what Max sends on macOS)
var VK = {
    RETURN: 36, TAB: 48, SPACE: 49, DELETE: 51, ESCAPE: 53,
    LEFT: 123, RIGHT: 124, DOWN: 125, UP: 126,
    HOME: 115, END: 119, PGUP: 116, PGDN: 121,
    FWD_DELETE: 117,
    A: 0, S: 1, D: 2, F: 3, H: 4, G: 5, Z: 6, X: 7, C: 8, V: 9, B: 11,
    Q: 12, W: 13, E: 14, R: 15, Y: 16, T: 17,
    O: 31, U: 32, I: 34, P: 35, L: 37, J: 38, K: 40, N: 45, M: 46
};

// Windows virtual keycodes
var VKW = {
    RETURN: 13, TAB: 9, SPACE: 32, DELETE: 8, ESCAPE: 27,
    LEFT: 37, RIGHT: 39, DOWN: 40, UP: 38,
    HOME: 36, END: 35, PGUP: 33, PGDN: 34,
    FWD_DELETE: 46,
    A: 65, B: 66, C: 67, D: 68, E: 69, F: 70, G: 71, H: 72, I: 73,
    J: 74, K: 75, L: 76, M: 77, N: 78, O: 79, P: 80, Q: 81, R: 82,
    S: 83, T: 84, U: 85, V: 86, W: 87, X: 88, Y: 89, Z: 90,
    NUMPAD_ENTER: 10,   // Numpad Enter on Windows often sends 10, not 13
    BACKTICK: 192, MINUS: 189, EQUALS: 187,
    LBRACKET: 219, RBRACKET: 221, BACKSLASH: 220,
    SEMI: 186, QUOTE: 222, COMMA: 188, PERIOD: 190, SLASH: 191
};

var VK_LOWER = {
    0:"a", 1:"s", 2:"d", 3:"f", 4:"h", 5:"g", 6:"z", 7:"x", 8:"c", 9:"v", 11:"b",
    12:"q", 13:"w", 14:"e", 15:"r", 16:"y", 17:"t",
    31:"o", 32:"u", 34:"i", 35:"p", 37:"l", 38:"j", 40:"k", 45:"n", 46:"m",
    18:"1", 19:"2", 20:"3", 21:"4", 22:"6", 23:"5", 25:"9", 26:"7", 28:"8", 29:"0",
    27:"-", 24:"=", 33:"[", 30:"]", 42:"\\", 41:";", 39:"'", 43:",", 47:".", 44:"/", 50:"`",
    49:" "
};

var VK_SHIFTED = {
    18:"!", 19:"@", 20:"#", 21:"$", 22:"^", 23:"%", 25:"(", 26:"&", 28:"*", 29:")",
    27:"_", 24:"+", 33:"{", 30:"}", 42:"|", 41:":", 39:"\"", 43:"<", 47:">", 44:"?", 50:"~"
};



var VKCODE = (max.os === "windows") ? VKW : VK;

// Combined modifier masks Max may send
var SHIFT    = 512;
var ALT      = 2048;
var CTRL     = 4352;
var CTRL_ALT = 6400;

// ---------- Document model ----------
var lines = ["// new file"];
var cursor = { line: 0, col: 0 };
var sel = null;
var scrollX = 0;
var scrollY = 0;

var tokenLines = [];
var dirty = true;

// Undo/redo stacks of {lines, cursor, sel}
var undoStack = [];
var redoStack = [];
var UNDO_LIMIT = 200;

// Keyboard state holder
var g_key_codes = [0, 0, 0, 0];

// ---------- Public: set / get code ----------
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
    undoStack = [];
    redoStack = [];
    markDirty();
}

function text() { setcode.apply(null, arguments); }

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

// ---------- Undo ----------
function pushUndo() {
    undoStack.push({
        lines: lines.slice(),
        cursor: { line: cursor.line, col: cursor.col },
        sel: sel ? { line: sel.line, col: sel.col } : null
    });
    if (undoStack.length > UNDO_LIMIT) undoStack.shift();
    redoStack = [];
}

function undo() {
    if (undoStack.length === 0) return;
    var snap = undoStack.pop();
    redoStack.push({
        lines: lines.slice(),
        cursor: { line: cursor.line, col: cursor.col },
        sel: sel ? { line: sel.line, col: sel.col } : null
    });
    lines = snap.lines;
    cursor = snap.cursor;
    sel = snap.sel;
    ensureCursorVisible();
    markDirty();
}

function redo() {
    if (redoStack.length === 0) return;
    var snap = redoStack.pop();
    undoStack.push({
        lines: lines.slice(),
        cursor: { line: cursor.line, col: cursor.col },
        sel: sel ? { line: sel.line, col: sel.col } : null
    });
    lines = snap.lines;
    cursor = snap.cursor;
    sel = snap.sel;
    ensureCursorVisible();
    markDirty();
}

// ---------- Tokenizer ----------
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

// ---------- Text mutation ----------
function insertText(str) {
    pushUndo();
    deleteSelection();
    var line = lines[cursor.line];
    var before = line.substring(0, cursor.col);
    var after = line.substring(cursor.col);
    var parts = str.split("\n");
    if (parts.length === 1) {
        lines[cursor.line] = before + str + after;
        cursor.col += str.length;
    } else {
        var newLines = [];
        newLines.push(before + parts[0]);
        for (var i = 1; i < parts.length - 1; i++) newLines.push(parts[i]);
        newLines.push(parts[parts.length - 1] + after);
        var args = [cursor.line, 1].concat(newLines);
        Array.prototype.splice.apply(lines, args);
        cursor.line += parts.length - 1;
        cursor.col = parts[parts.length - 1].length;
    }
    ensureCursorVisible();
    markDirty();
}

function backspace() {
    if (sel) { pushUndo(); deleteSelection(); ensureCursorVisible(); markDirty(); return; }
    pushUndo();
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
    ensureCursorVisible();
    markDirty();
}

function deleteForward() {
    if (sel) { pushUndo(); deleteSelection(); ensureCursorVisible(); markDirty(); return; }
    pushUndo();
    var line = lines[cursor.line];
    if (cursor.col < line.length) {
        lines[cursor.line] = line.substring(0, cursor.col) + line.substring(cursor.col + 1);
    } else if (cursor.line < lines.length - 1) {
        lines[cursor.line] += lines[cursor.line + 1];
        lines.splice(cursor.line + 1, 1);
    }
    ensureCursorVisible();
    markDirty();
}

function deleteSelection() {
    if (!sel) return;
    var a = sel, b = cursor;
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

    mgraphics.set_source_rgba(COLOR_BG[0], COLOR_BG[1], COLOR_BG[2], COLOR_BG[3]);
    mgraphics.rectangle(0, 0, w, h);
    mgraphics.fill();

    mgraphics.set_source_rgba(COLOR_GUTTER_BG[0], COLOR_GUTTER_BG[1],
                              COLOR_GUTTER_BG[2], COLOR_GUTTER_BG[3]);
    mgraphics.rectangle(0, 0, GUTTER_W, h - 18);
    mgraphics.fill();

    mgraphics.select_font_face(FONT);
    mgraphics.set_font_size(FONT_SIZE);

    if (sel) drawSelection(w, h);

    var lineY = PAD_Y - scrollY;
    for (var li = 0; li < tokenLines.length; li++) {
        if (lineY > h + LINE_H) break;
        if (lineY < -LINE_H) { lineY += LINE_H; continue; }

        mgraphics.set_source_rgba(COLOR_GUTTER_FG[0], COLOR_GUTTER_FG[1],
                                  COLOR_GUTTER_FG[2], COLOR_GUTTER_FG[3]);
        var numStr = String(li + 1);
        var numW = textWidth(numStr, FONT_SIZE);
        mgraphics.move_to(GUTTER_W - 6 - numW, lineY + FONT_SIZE);
        mgraphics.show_text(numStr);

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

    drawCursor();
    drawStatus(w, h);
}

function drawCursor() {
    var cy = PAD_Y - scrollY + cursor.line * LINE_H;
    var cx = GUTTER_W + PAD_X - scrollX + colToX(cursor.line, cursor.col);
    var h = mgraphics.size[1];
    if (cy + LINE_H < 0 || cy > h - 18) return;
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
    var textLeft = GUTTER_W + PAD_X - scrollX;
    if (a.line === b.line) {
        var x1 = textLeft + colToX(a.line, a.col);
        var x2 = textLeft + colToX(a.line, b.col);
        var y = PAD_Y - scrollY + a.line * LINE_H;
        mgraphics.rectangle(x1, y, x2 - x1, LINE_H);
        mgraphics.fill();
    } else {
        var yA = PAD_Y - scrollY + a.line * LINE_H;
        var xA = textLeft + colToX(a.line, a.col);
        mgraphics.rectangle(xA, yA, w - xA, LINE_H);
        mgraphics.fill();
        for (var li = a.line + 1; li < b.line; li++) {
            var y = PAD_Y - scrollY + li * LINE_H;
            mgraphics.rectangle(textLeft, y, w - textLeft, LINE_H);
            mgraphics.fill();
        }
        var yB = PAD_Y - scrollY + b.line * LINE_H;
        var xB = textLeft + colToX(b.line, b.col);
        mgraphics.rectangle(textLeft, yB, xB - textLeft, LINE_H);
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

function colToX(lineIdx, col) {
    var s = lines[lineIdx] || "";
    var x = 0;
    for (var i = 0; i < col && i < s.length; i++) {
        x += (s[i] === "\t") ? CHAR_W * TAB_STR.length : CHAR_W;
    }
    return x;
}

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

// ---------- Mouse ----------
var mouseDown = false;
var mouseDownPos = null;

function onclick(x, y, button, cmd, shift, capslock, option, ctrl) {
    if (button === 2) { sel = null; markDirty(); return; }
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
    if (!sel && mouseDownPos) sel = mouseDownPos;
    cursor = hitTest(x, y);
    ensureCursorVisible();
    markDirty();
}

function onrelease() { mouseDown = false; }

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
    var cy = cursor.line * LINE_H;
    var viewH = h - 18 - PAD_Y * 2;
    if (cy - scrollY < 0) scrollY = cy;
    else if (cy + LINE_H - scrollY > viewH) scrollY = cy + LINE_H - viewH;

    var cx = colToX(cursor.line, cursor.col);
    var viewW = w - GUTTER_W - PAD_X * 2;
    if (cx - scrollX < 0) scrollX = cx;
    else if (cx - scrollX > viewW) scrollX = cx - viewW + CHAR_W;

    if (scrollX < 0) scrollX = 0;
    if (scrollY < 0) scrollY = 0;
}

// ---------- Keyboard entry ----------
function keys(a1, a2, a3, a4) {
    if (inlet !== 1) return;      // must arrive on the cold inlet
    g_key_codes = [a1, a2, a3, a4];
    post("KEYS:", a1, a2, a3, a4, "\n");
    key_handler();
}

function key() {
    // Fallback if a `key <code> <sel> <a3> <a4>` message arrives on the hot inlet.
    if (inlet !== 0) return;
    var a = arrayfromargs(arguments);
    g_key_codes = [a[0] || 0, a[1] || 0, a[2] || 0, a[3] || 0];
    key_handler();
}

// Modifier selectors — these are *categories*, not bitflags.
var SHIFT    = 512;
var ALT      = 2048;
var CTRL     = 4352;
var CTRL_ALT = 6400;

// Special keycodes (same as your working file)
var ENTER   = 13;
var ESCAPE  = 27;
var SPACE   = 32;
var TAB_VK  = 9;
var BKSP    = 8;
var DEL_VK  = 46;
var [UP_KEY, DOWN_KEY] = [30, 31];
var [LEFT_KEY, RIGHT_KEY] = [28, 29];

function key_handler() {
    var USER_KEY = g_key_codes[0];
    var SELECTOR = g_key_codes[2];

    // If you want this editor to only respond when its view is active, keep this.
    // if (get_active_view() !== "editor") return;
    if (!g_mouse_on_rect) return;

    // -------- Ctrl / Ctrl+Alt combos --------
    // These arrive with SELECTOR === CTRL (or CTRL_ALT) AND with a
    // possibly remapped USER_KEY for combos. Handle shortcuts here.
    if (SELECTOR === CTRL) {
        // On Windows, Ctrl+letter usually keeps USER_KEY as the letter VK.
        // On macOS, Ctrl+letter is often still the letter code.
        var lc = ASCII(USER_KEY);
        if (lc) lc = lc.toUpperCase();
        if (lc === "Z") { undo(); return; }
        if (lc === "A") { selectAll(); return; }
        if (lc === "C") { copySelection(); return; }
        if (lc === "X") { cutSelection(); return; }
        if (lc === "V") { pasteFromClipboard(); return; }
    }
    if (SELECTOR === CTRL_ALT) {
        // Ctrl+Alt remaps USER_KEY (e.g. 223/243 in your file). If you want
        // shortcuts on this combo, add them here with the observed values.
        return;
    }
    if (SELECTOR === ALT) {
        return;
    }
    if (SELECTOR === SHIFT) {
        // Bare shift press — ignore for this editor. Shift+letter arrives
        // with SELECTOR !== SHIFT and USER_KEY being the letter's VK,
        // with ASCII() returning the uppercase/shifted character.
        return;
    }

    // -------- Navigation --------
    if (USER_KEY === LEFT_KEY)  { moveLeft(false);  return; }
    if (USER_KEY === RIGHT_KEY) { moveRight(false); return; }
    if (USER_KEY === UP_KEY)    { moveUp(false);    return; }
    if (USER_KEY === DOWN_KEY)  { moveDown(false);  return; }

    // -------- Editing keys --------
    if (USER_KEY === ENTER)  { insertText("\n"); return; }
    if (USER_KEY === TAB_VK) { insertText(TAB_STR); return; }
    if (USER_KEY === BKSP)   { backspace(); return; }
    if (USER_KEY === DEL_VK) { deleteForward(); return; }
    if (USER_KEY === ESCAPE) { sel = null; markDirty(); return; }

    // -------- Printable characters --------
    // This is the important part: use ASCII(USER_KEY) to get the actual
    // character, which respects the keyboard layout and Shift state.
    var ch = ASCII(USER_KEY);
    if (typeof ch === "string" && ch.length > 0) {
        // Filter out control characters that ASCII() may return
        var code = ch.charCodeAt(0);
        if (code >= 32 && code !== 127) {
            insertText(ch);
            return;
        }
    }
}

// ---------- VK → character ----------

function charFromKey(USER_KEY, SELECTOR) {
    // Windows: [key] sends ASCII codes for printable keys.
    if (isWindows()) {
        if (USER_KEY >= 32 && USER_KEY <= 126) {
            return String.fromCharCode(USER_KEY);
        }
        return null;
    }

    // macOS: [key] sends virtual keycodes. Map them to characters.
    return vkToCharMac(USER_KEY, SELECTOR === SHIFT);
}

function isWindows() {
    return String(max.os).toLowerCase().indexOf("win") === 0;
}


function shiftedChar(ch) {
    var map = {
        "1":"!", "2":"@", "3":"#", "4":"$", "5":"%",
        "6":"^", "7":"&", "8":"*", "9":"(", "0":")",
        "-":"_", "=":"+", "[":"{", "]":"}", "\\":"|",
        ";":":", "'":"\"", ",":"<", ".":">", "/":"?",
        "`":"~"
    };
    if (map[ch]) return map[ch];
    return ch.toUpperCase();
}

function vkToCharWindows(vk, shift) {
    if (vk >= 65 && vk <= 90) {
        var c = String.fromCharCode(vk);
        return shift ? c : c.toLowerCase();
    }
    if (vk >= 48 && vk <= 57) {
        var base = String.fromCharCode(vk);
        var shifted = { "1":"!", "2":"@", "3":"#", "4":"$", "5":"%",
                        "6":"^", "7":"&", "8":"*", "9":"(", "0":")" };
        return shift ? (shifted[base] || base) : base;
    }
    var punct = {
        32: " ",
        186: shift ? ":" : ";", 187: shift ? "+" : "=",
        188: shift ? "<" : ",", 189: shift ? "_" : "-",
        190: shift ? ">" : ".", 191: shift ? "?" : "/",
        192: shift ? "~" : "`",
        219: shift ? "{" : "[", 220: shift ? "|" : "\\",
        221: shift ? "}" : "]", 222: shift ? "\"" : "'"
    };
    if (punct[vk] !== undefined) return punct[vk];
    return null;
}

function vkToCharMac(vk, shift) {
    if (shift) {
        if (VK_SHIFTED[vk] !== undefined) return VK_SHIFTED[vk];
        if (VK_LOWER[vk] !== undefined) {
            var c = VK_LOWER[vk];
            return (c >= "a" && c <= "z") ? c.toUpperCase() : c;
        }
        return null;
    }
    if (VK_LOWER[vk] !== undefined) return VK_LOWER[vk];
    return null;
}

function vkToChar(vk, shift) {
    if (max.os === "windows") return vkToCharWindows(vk, shift);
    if (shift) {
        if (VK_SHIFTED[vk] !== undefined) return VK_SHIFTED[vk];
        if (VK_LOWER[vk] !== undefined) {
            var c = VK_LOWER[vk];
            return (c >= "a" && c <= "z") ? c.toUpperCase() : c;
        }
        return null;
    }
    if (VK_LOWER[vk] !== undefined) return VK_LOWER[vk];
    return null;
}

// ---------- Movement ----------
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

function moveHome(shift) {
    if (shift && !sel) sel = { line: cursor.line, col: cursor.col };
    cursor.col = 0;
    if (!shift) sel = null;
    ensureCursorVisible();
    markDirty();
}

function moveEnd(shift) {
    if (shift && !sel) sel = { line: cursor.line, col: cursor.col };
    cursor.col = lines[cursor.line].length;
    if (!shift) sel = null;
    ensureCursorVisible();
    markDirty();
}

function movePage(dir, shift) {
    if (shift && !sel) sel = { line: cursor.line, col: cursor.col };
    var h = mgraphics.size[1];
    var viewLines = Math.max(1, Math.floor((h - 18 - PAD_Y * 2) / LINE_H));
    cursor.line = Math.max(0, Math.min(lines.length - 1, cursor.line + dir * viewLines));
    cursor.col = Math.min(cursor.col, lines[cursor.line].length);
    if (!shift) sel = null;
    ensureCursorVisible();
    markDirty();
}

// ---------- Clipboard / selection ----------
function selectAll() {
    sel = { line: 0, col: 0 };
    cursor = { line: lines.length - 1, col: lines[lines.length - 1].length };
    ensureCursorVisible();
    markDirty();
}

function getSelectedText() {
    if (!sel) return null;
    var a = sel, b = cursor;
    if (a.line > b.line || (a.line === b.line && a.col > b.col)) {
        var t = a; a = b; b = t;
    }
    if (a.line === b.line) {
        return lines[a.line].substring(a.col, b.col);
    }
    var parts = [lines[a.line].substring(a.col)];
    for (var li = a.line + 1; li < b.line; li++) parts.push(lines[li]);
    parts.push(lines[b.line].substring(0, b.col));
    return parts.join("\n");
}

function copySelection() {
    var txt = getSelectedText();
    if (txt === null) return;
    try {
        var cl = new Clipboard("text");
        cl.settext(txt);
    } catch (e) {
        post("clipboard copy failed:", e, "\n");
    }
}

function cutSelection() {
    if (!sel) return;
    copySelection();
    pushUndo();
    deleteSelection();
    ensureCursorVisible();
    markDirty();
}

function pasteFromClipboard() {
    try {
        var cl = new Clipboard("text");
        var txt = cl.gettext();
        if (txt && txt.length) insertText(txt);
    } catch (e) {
        post("clipboard paste failed:", e, "\n");
    }
}

// ---------- Scroll ----------
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
    "// code_editor.js — click to place caret, then type.\n" +
    "// Wire [key] into inlet 2 (cold inlet) to feed keystrokes.\n" +
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

function onidle(x, y, button, mod1, shift, caps, opt, mod2){
    g_mouse_on_rect = true;
}

function onidleout(x, y, button, mod1, shift, caps, opt, mod2){
    g_mouse_on_rect = false;
}