// node_editor.js
// A tiny mgraphics node editor inspired by modular synth UIs.
// Drag the top bar of any node to move it. Cables redraw live.

autowatch = 1;
inlets = 1;
outlets = 1;

mgraphics.init();
mgraphics.relative_coords = 0;
mgraphics.autofill = 0;

// ---------------------------------------------------------------
// Data model
// ---------------------------------------------------------------

var NODE_W = 180;
var NODE_HEADER_H = 18;
var NODE_ROW_H = 18;
var NODE_PAD = 4;

// Each node: { id, x, y, title, color, rows:[{label, value, type}] }
var nodes = [
    {
        id: "lfo",
        x: 20, y: 20,
        title: "LFO",
        header: [0.85, 0.92, 0.98],   // pale blue
        body:   [0.96, 0.96, 0.96],
        rows: [
            { label: "Frequency:", value: "1.72Hz" },
            { label: "Amp:",       value: "10%"   }
        ]
    },
    {
        id: "env",
        x: 20, y: 160,
        title: "Envelope",
        header: [0.80, 0.86, 0.94],
        body:   [0.96, 0.96, 0.96],
        rows: [
            { label: "Attack:",   value: "815ms"  },
            { label: "Decay:",    value: "47ms"   },
            { label: "Sustain:",  value: "4.08%"  },
            { label: "Release:",  value: "445ms"  },
            { label: "Velocity:", value: "100%"   }
        ]
    },
    {
        id: "osc",
        x: 280, y: 20,
        title: "Osc",
        header: [0.98, 0.82, 0.82],   // pale red
        body:   [0.96, 0.96, 0.96],
        rows: [
            { label: "",      value: "+0"     },  // fake knob row
            { label: "Amp:",  value: "-12dB"  }
        ]
    },
    {
        id: "out",
        x: 520, y: 60,
        title: "Output",
        header: [0.85, 0.98, 0.82],   // pale green
        body:   [0.96, 0.96, 0.96],
        rows: [
            { label: "Volume:", value: "-12dB" }
        ]
    }
];

// Cables: { from: nodeId, fromSide: "r", to: nodeId, toSide: "l", color }
var cables = [
    { from: "lfo", to: "osc", color: [0.30, 0.45, 0.85] },
    { from: "env", to: "osc", color: [0.30, 0.45, 0.85] },
    { from: "osc", to: "out", color: [0.85, 0.25, 0.25] }
];

// ---------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------

function findNode(id) {
    for (var i = 0; i < nodes.length; i++) {
        if (nodes[i].id === id) return nodes[i];
    }
    return null;
}

function nodeWidth(n) { return NODE_W; }

function nodeHeight(n) {
    return NODE_HEADER_H + n.rows.length * NODE_ROW_H + NODE_PAD * 2;
}

// Output port position (right edge, vertical middle of header)
function outPort(n) {
    return { x: n.x + nodeWidth(n), y: n.y + NODE_HEADER_H * 0.5 + 8 };
}
// Input port position (left edge, vertical middle of header)
function inPort(n) {
    return { x: n.x, y: n.y + NODE_HEADER_H * 0.5 + 8 };
}

// ---------------------------------------------------------------
// Drawing
// ---------------------------------------------------------------

function paint() {
    var w = mgraphics.size[0];
    var h = mgraphics.size[1];

    // Background
    mgraphics.set_source_rgba(0.18, 0.18, 0.20, 1.0);
    mgraphics.rectangle(0, 0, w, h);
    mgraphics.fill();

    // Cables (drawn first so nodes sit on top)
    drawCables();

    // Nodes
    for (var i = 0; i < nodes.length; i++) {
        drawNode(nodes[i]);
    }
}

function drawCables() {
    for (var i = 0; i < cables.length; i++) {
        var c = cables[i];
        var a = findNode(c.from);
        var b = findNode(c.to);
        if (!a || !b) continue;

        var p0 = outPort(a);
        var p1 = inPort(b);

        // Bezier with horizontal control points
        var dx = Math.max(40, Math.abs(p1.x - p0.x) * 0.5);
        var cp0x = p0.x + dx;
        var cp0y = p0.y;
        var cp1x = p1.x - dx;
        var cp1y = p1.y;

        // Shadow
        mgraphics.set_source_rgba(0, 0, 0, 0.35);
        mgraphics.set_line_width(4);
        mgraphics.move_to(p0.x, p0.y);
        mgraphics.curve_to(cp0x, cp0y, cp1x, cp1y, p1.x, p1.y);
        mgraphics.stroke();

        // Colored cable
        mgraphics.set_source_rgba(c.color[0], c.color[1], c.color[2], 1.0);
        mgraphics.set_line_width(2.2);
        mgraphics.move_to(p0.x, p0.y);
        mgraphics.curve_to(cp0x, cp0y, cp1x, cp1y, p1.x, p1.y);
        mgraphics.stroke();

        // Arrow head near destination
        drawArrow(p1.x, p1.y, c.color);
    }
}

function drawArrow(x, y, col) {
    mgraphics.set_source_rgba(col[0], col[1], col[2], 1.0);
    mgraphics.move_to(x, y);
    mgraphics.line_to(x - 8, y - 4);
    mgraphics.line_to(x - 8, y + 4);
    mgraphics.close_path();
    mgraphics.fill();
}

function drawNode(n) {
    var w = nodeWidth(n);
    var h = nodeHeight(n);

    // Drop shadow
    mgraphics.set_source_rgba(0, 0, 0, 0.35);
    mgraphics.rectangle(n.x + 2, n.y + 2, w, h);
    mgraphics.fill();

    // Body
    mgraphics.set_source_rgba(n.body[0], n.body[1], n.body[2], 1.0);
    mgraphics.rectangle(n.x, n.y, w, h);
    mgraphics.fill();

    // Border
    mgraphics.set_source_rgba(0.25, 0.25, 0.28, 1.0);
    mgraphics.set_line_width(1);
    mgraphics.rectangle(n.x + 0.5, n.y + 0.5, w - 1, h - 1);
    mgraphics.stroke();

    // Header
    mgraphics.set_source_rgba(n.header[0], n.header[1], n.header[2], 1.0);
    mgraphics.rectangle(n.x, n.y, w, NODE_HEADER_H);
    mgraphics.fill();

    // Header border
    mgraphics.set_source_rgba(0.25, 0.25, 0.28, 1.0);
    mgraphics.rectangle(n.x + 0.5, n.y + 0.5, w - 1, NODE_HEADER_H - 0.5);
    mgraphics.stroke();

    // Title
    mgraphics.set_source_rgba(0.05, 0.05, 0.05, 1.0);
    mgraphics.select_font_face("Arial");
    mgraphics.set_font_size(11);
    mgraphics.move_to(n.x + 6, n.y + 13);
    mgraphics.show_text(n.title);

    // Rows
    for (var i = 0; i < n.rows.length; i++) {
        var row = n.rows[i];
        var ry = n.y + NODE_HEADER_H + NODE_PAD + i * NODE_ROW_H;

        // Row background (alternating)
        if (i % 2 === 0) {
            mgraphics.set_source_rgba(0.90, 0.90, 0.92, 1.0);
            mgraphics.rectangle(n.x + 2, ry, w - 4, NODE_ROW_H - 1);
            mgraphics.fill();
        }

        // Label
        mgraphics.set_source_rgba(0.10, 0.10, 0.10, 1.0);
        mgraphics.set_font_size(10);
        mgraphics.move_to(n.x + 6, ry + 13);
        mgraphics.show_text(row.label);

        // Value (right aligned)
        mgraphics.move_to(n.x + w - 6 - textWidth(row.value, 10), ry + 13);
        mgraphics.show_text(row.value);
    }

    // Ports
    var ip = inPort(n);
    var op = outPort(n);
    drawPort(ip.x, ip.y);
    drawPort(op.x, op.y);
}

function drawPort(x, y) {
    mgraphics.set_source_rgba(0.15, 0.15, 0.18, 1.0);
    mgraphics.arc(x, y, 4, 0, Math.PI * 2);
    mgraphics.fill();
    mgraphics.set_source_rgba(0.75, 0.75, 0.80, 1.0);
    mgraphics.arc(x, y, 2, 0, Math.PI * 2);
    mgraphics.fill();
}

function textWidth(str, size) {
    // Rough estimate; mgraphics has no direct measure in old APIs.
    return str.length * size * 0.55;
}

// ---------------------------------------------------------------
// Mouse interaction: drag a node by its header
// ---------------------------------------------------------------

var dragging = null;
var dragDX = 0;
var dragDY = 0;

function onclick(x, y, button, cmd, shift, capslock, option, ctrl) {
    // Hit test headers (reverse order so topmost wins)
    for (var i = nodes.length - 1; i >= 0; i--) {
        var n = nodes[i];
        var w = nodeWidth(n);
        if (x >= n.x && x <= n.x + w &&
            y >= n.y && y <= n.y + NODE_HEADER_H) {
            dragging = n;
            dragDX = x - n.x;
            dragDY = y - n.y;
            return;
        }
    }
}

function ondrag(x, y, button, cmd, shift, capslock, option, ctrl) {
    if (!dragging) return;
    dragging.x = x - dragDX;
    dragging.y = y - dragDY;
    mgraphics.redraw();
}

function onrelease(x, y, button, cmd, shift, capslock, option, ctrl) {
    dragging = null;
}

function onresize(w, h) {
    mgraphics.redraw();
}