// node_view_poc.js
// Proof-of-concept modular "node view" for Max, using v8ui + mgraphics.
// Loosely inspired by Blok Modular's node-graph interaction model:
// draggable nodes, click-drag port-to-port connections, right-click
// context menu (with submenus) to spawn new node types.
//
// USAGE: create a [v8ui] object in Max, point it at this file
// (or drop this code into the v8ui code editor). Resize the box —
// the node view fills it.
//
// CAVEAT: an earlier version of this file called a native v8 "Menu"
// class that doesn't actually exist -- there's no documented popup-menu
// API exposed to v8/v8ui JavaScript. The "Add Node" menu is now drawn
// entirely with mgraphics and hit-tested like the nodes themselves, so
// it has no dependency on unverified Max API surface. Everything else
// below (paint/mouse handling) is plain mgraphics + event callbacks.

autowatch = 1;
inlets = 1;
outlets = 1;

mgraphics.init();

// ---------------------------------------------------------------
// Data model
// ---------------------------------------------------------------

var NODE_TYPES = {
	"Oscillators": {
		"Sine":     { inputs: ["freq"],           outputs: ["out"] },
		"Saw":      { inputs: ["freq"],           outputs: ["out"] },
		"Square":   { inputs: ["freq", "pw"],     outputs: ["out"] }
	},
	"Filters": {
		"Lowpass":  { inputs: ["in", "cutoff"],   outputs: ["out"] },
		"Highpass": { inputs: ["in", "cutoff"],   outputs: ["out"] },
		"Resonant": { inputs: ["in", "cutoff", "q"], outputs: ["out"] }
	},
	"Utilities": {
		"Gain":     { inputs: ["in", "amount"],   outputs: ["out"] },
		"Mix2":     { inputs: ["a", "b"],         outputs: ["out"] },
		"Constant": { inputs: [],                 outputs: ["out"] }
	}
};

var NODE_W = 120;
var NODE_H = 60;
var PORT_R = 5;
var HEADER_H = 18;

var nodes = [];        // { id, x, y, w, h, title, type, inputs:[names], outputs:[names] }
var connections = [];  // { fromNode, fromPort, toNode, toPort }
var nextId = 1;

var dragNode = null;
var dragOffsetX = 0, dragOffsetY = 0;

var connectDrag = null; // { fromNode, fromPort, x, y } while dragging a wire
var selectedNode = null;

// self-drawn "Add Node" menu state (no native menu API available in v8ui)
var menuState = null; // { x, y, categoryIndex } -- categoryIndex -1 = none expanded
var MENU_ROW_H = 20;
var MENU_W = 140;

// ---------------------------------------------------------------
// Node helpers
// ---------------------------------------------------------------

function makeNode(typeCategory, typeName, x, y) {
	var def = NODE_TYPES[typeCategory][typeName];
	var n = {
		id: nextId++,
		x: x, y: y,
		w: NODE_W, h: Math.max(NODE_H, HEADER_H + Math.max(def.inputs.length, def.outputs.length) * 16 + 10),
		title: typeName,
		category: typeCategory,
		inputs: def.inputs.slice(),
		outputs: def.outputs.slice()
	};
	nodes.push(n);
	return n;
}

function nodeAt(px, py) {
	for (var i = nodes.length - 1; i >= 0; i--) {
		var n = nodes[i];
		if (px >= n.x && px <= n.x + n.w && py >= n.y && py <= n.y + n.h) return n;
	}
	return null;
}

function portPos(node, isOutput, index, count) {
	var spacing = (node.h - HEADER_H) / (count + 1);
	var py = node.y + HEADER_H + spacing * (index + 1);
	var px = isOutput ? node.x + node.w : node.x;
	return [px, py];
}

function hitPort(px, py, node) {
	// returns { isOutput, index, name } or null
	for (var i = 0; i < node.outputs.length; i++) {
		var p = portPos(node, true, i, node.outputs.length);
		if (dist(px, py, p[0], p[1]) <= PORT_R + 3) return { isOutput: true, index: i, name: node.outputs[i] };
	}
	for (var i = 0; i < node.inputs.length; i++) {
		var p = portPos(node, false, i, node.inputs.length);
		if (dist(px, py, p[0], p[1]) <= PORT_R + 3) return { isOutput: false, index: i, name: node.inputs[i] };
	}
	return null;
}

function dist(x1, y1, x2, y2) {
	var dx = x2 - x1, dy = y2 - y1;
	return Math.sqrt(dx * dx + dy * dy);
}

// ---------------------------------------------------------------
// Drawing
// ---------------------------------------------------------------

function paint() {
	var mg = mgraphics; // v8ui exposes drawing as the global `mgraphics` object, not a paint() argument
	var w = this.box.rect[2] - this.box.rect[0];
	var h = this.box.rect[3] - this.box.rect[1];

	// background
	mg.set_source_rgba(0.13, 0.13, 0.15, 1);
	mg.rectangle(0, 0, w, h);
	mg.fill();

	drawGrid(mg, w, h);

	// connections (draw first, under nodes)
	for (var i = 0; i < connections.length; i++) {
		drawConnection(mg, connections[i]);
	}

	// in-progress connection drag
	if (connectDrag) {
		var fromPos = portPos(connectDrag.fromNode, true, connectDrag.fromPort, connectDrag.fromNode.outputs.length);
		drawWire(mg, fromPos[0], fromPos[1], connectDrag.x, connectDrag.y);
	}

	// nodes
	for (var i = 0; i < nodes.length; i++) {
		drawNode(mg, nodes[i]);
	}

	// add-node menu, drawn last so it's on top
	if (menuState) drawMenu(mg);
}

function drawMenuList(mg, x, y, items, highlightIndex) {
	for (var i = 0; i < items.length; i++) {
		var ry = y + i * MENU_ROW_H;
		mg.rectangle(x, ry, MENU_W, MENU_ROW_H);
		mg.set_source_rgba(i === highlightIndex ? 0.30 : 0.18, i === highlightIndex ? 0.45 : 0.18, i === highlightIndex ? 0.55 : 0.20, 0.97);
		mg.fill();
		mg.rectangle(x, ry, MENU_W, MENU_ROW_H);
		mg.set_line_width(1);
		mg.set_source_rgba(0.5, 0.5, 0.55, 1);
		mg.stroke();
		mg.set_source_rgba(1, 1, 1, 0.95);
		mg.select_font_face("Arial");
		mg.set_font_size(11);
		mg.move_to(x + 8, ry + 14);
		mg.show_text(items[i]);
	}
}

function drawMenu(mg) {
	var categories = Object.keys(NODE_TYPES);
	drawMenuList(mg, menuState.x, menuState.y, categories, menuState.categoryIndex);

	if (menuState.categoryIndex >= 0) {
		var cat = categories[menuState.categoryIndex];
		var types = Object.keys(NODE_TYPES[cat]);
		var subX = menuState.x + MENU_W;
		var subY = menuState.y + menuState.categoryIndex * MENU_ROW_H;
		drawMenuList(mg, subX, subY, types, -1);
	}
}

function drawGrid(mg, w, h) {
	var step = 20;
	mg.set_source_rgba(1, 1, 1, 0.04);
	mg.set_line_width(1);
	for (var x = 0; x < w; x += step) {
		mg.move_to(x, 0);
		mg.line_to(x, h);
	}
	for (var y = 0; y < h; y += step) {
		mg.move_to(0, y);
		mg.line_to(w, y);
	}
	mg.stroke();
}

function drawNode(mg, n) {
	var selected = (n === selectedNode);

	// body
	roundedRect(mg, n.x, n.y, n.w, n.h, 6);
	mg.set_source_rgba(0.20, 0.21, 0.24, 1);
	mg.fill();

	// header
	roundedRectTop(mg, n.x, n.y, n.w, HEADER_H, 6);
	mg.set_source_rgba(0.30, 0.45, 0.55, 1);
	mg.fill();

	// border
	roundedRect(mg, n.x, n.y, n.w, n.h, 6);
	mg.set_line_width(selected ? 2 : 1);
	mg.set_source_rgba(selected ? 1 : 0.5, selected ? 0.8 : 0.5, selected ? 0.2 : 0.55, 1);
	mg.stroke();

	// title
	mg.set_source_rgba(1, 1, 1, 0.95);
	mg.select_font_face("Arial Bold");
	mg.set_font_size(11);
	mg.move_to(n.x + 6, n.y + 13);
	mg.show_text(n.title);

	// ports + labels
	mg.set_font_size(9);
	for (var i = 0; i < n.inputs.length; i++) {
		var p = portPos(n, false, i, n.inputs.length);
		drawPort(mg, p[0], p[1], [0.4, 0.8, 1.0]);
		mg.set_source_rgba(0.85, 0.85, 0.85, 1);
		mg.move_to(p[0] + 8, p[1] + 3);
		mg.show_text(n.inputs[i]);
	}
	for (var i = 0; i < n.outputs.length; i++) {
		var p = portPos(n, true, i, n.outputs.length);
		drawPort(mg, p[0], p[1], [1.0, 0.7, 0.3]);
		var tw = n.outputs[i].length * 5.5;
		mg.set_source_rgba(0.85, 0.85, 0.85, 1);
		mg.move_to(p[0] - 8 - tw, p[1] + 3);
		mg.show_text(n.outputs[i]);
	}
}

function drawPort(mg, x, y, color) {
	mg.arc(x, y, PORT_R, 0, Math.PI * 2);
	mg.set_source_rgba(color[0], color[1], color[2], 1);
	mg.fill();
}

function drawConnection(mg, c) {
	var from = portPos(c.fromNode, true, c.fromPort, c.fromNode.outputs.length);
	var to = portPos(c.toNode, false, c.toPort, c.toNode.inputs.length);
	drawWire(mg, from[0], from[1], to[0], to[1]);
}

function drawWire(mg, x1, y1, x2, y2) {
	var midx = (x1 + x2) / 2;
	mg.move_to(x1, y1);
	mg.curve_to(midx, y1, midx, y2, x2, y2);
	mg.set_line_width(2);
	mg.set_source_rgba(0.9, 0.9, 0.3, 0.85);
	mg.stroke();
}

function roundedRect(mg, x, y, w, h, r) {
	mg.move_to(x + r, y);
	mg.line_to(x + w - r, y);
	mg.arc(x + w - r, y + r, r, -Math.PI / 2, 0);
	mg.line_to(x + w, y + h - r);
	mg.arc(x + w - r, y + h - r, r, 0, Math.PI / 2);
	mg.line_to(x + r, y + h);
	mg.arc(x + r, y + h - r, r, Math.PI / 2, Math.PI);
	mg.line_to(x, y + r);
	mg.arc(x + r, y + r, r, Math.PI, Math.PI * 1.5);
	mg.close_path();
}

function roundedRectTop(mg, x, y, w, h, r) {
	mg.move_to(x, y + h);
	mg.line_to(x, y + r);
	mg.arc(x + r, y + r, r, Math.PI, Math.PI * 1.5);
	mg.line_to(x + w - r, y);
	mg.arc(x + w - r, y + r, r, -Math.PI / 2, 0);
	mg.line_to(x + w, y + h);
	mg.close_path();
}

// ---------------------------------------------------------------
// Mouse interaction
// ---------------------------------------------------------------

function onclick(x, y, but, cmd, shift, capslock, option, ctrl) {
	// menu is open: this click either drills into it or dismisses it,
	// either way it doesn't fall through to node interaction
	if (menuState) {
		var consumed = handleMenuClick(x, y);
		if (!consumed) menuState = null;
		refresh();
		return;
	}

	// ctrl-click (or right button, but/cmd depending on platform) -> context menu
	if (ctrl || but === 2) {
		showAddMenu(x, y);
		refresh();
		return;
	}

	var n = nodeAt(x, y);
	if (n) {
		var port = hitPort(x, y, n);
		if (port && port.isOutput) {
			// start a connection drag from this output
			connectDrag = { fromNode: n, fromPort: port.index, x: x, y: y };
			selectedNode = n;
		} else if (port && !port.isOutput) {
			// clicking an input: if a wire already feeds it, grab it to re-route
			for (var i = connections.length - 1; i >= 0; i--) {
				var c = connections[i];
				if (c.toNode === n && c.toPort === port.index) {
					connectDrag = { fromNode: c.fromNode, fromPort: c.fromPort, x: x, y: y };
					connections.splice(i, 1);
					break;
				}
			}
			selectedNode = n;
		} else {
			// start dragging the node body
			dragNode = n;
			dragOffsetX = x - n.x;
			dragOffsetY = y - n.y;
			selectedNode = n;
		}
	} else {
		selectedNode = null;
	}
	refresh();
}

function onidle(x, y) {
	// no-op placeholder; could show hover states here
}

// v8ui dispatches drag as repeated onclick-context calls in some Max
// versions and as a dedicated 'ondrag' in others; both are wired here
// so this behaves whichever way your build reports mouse-drag.
function ondrag(x, y) {
	if (dragNode) {
		dragNode.x = x - dragOffsetX;
		dragNode.y = y - dragOffsetY;
		refresh();
	} else if (connectDrag) {
		connectDrag.x = x;
		connectDrag.y = y;
		refresh();
	}
}

function onmouseup(x, y) {
	if (connectDrag) {
		var target = nodeAt(x, y);
		if (target && target !== connectDrag.fromNode) {
			var port = hitPort(x, y, target);
			if (port && !port.isOutput) {
				// remove any existing connection to that input (one wire per input)
				for (var i = connections.length - 1; i >= 0; i--) {
					var c = connections[i];
					if (c.toNode === target && c.toPort === port.index) connections.splice(i, 1);
				}
				connections.push({
					fromNode: connectDrag.fromNode,
					fromPort: connectDrag.fromPort,
					toNode: target,
					toPort: port.index
				});
			}
		}
		connectDrag = null;
	}
	dragNode = null;
	refresh();
}

function ondblclick(x, y) {
	var n = nodeAt(x, y);
	if (n) {
		// double-click a node: delete it (quick proof-of-concept affordance)
		nodes.splice(nodes.indexOf(n), 1);
		connections = connections.filter(function (c) { return c.fromNode !== n && c.toNode !== n; });
		if (selectedNode === n) selectedNode = null;
		refresh();
	}
}

// ---------------------------------------------------------------
// Context menu: Add Node > Category > Type
// ---------------------------------------------------------------
// There's no documented native popup-menu class exposed to v8/v8ui
// JavaScript (the jpopupmenu API in Cycling '74's docs is a C-level
// SDK thing for building externals, not reachable from JS) -- so
// this menu is just drawn with mgraphics and hit-tested like any
// other on-canvas element, reusing the same click machinery as the
// nodes themselves. Guaranteed to work with what's already here,
// no unverified API surface involved.

function showAddMenu(x, y) {
	menuState = { x: x, y: y, categoryIndex: -1 };
}

// returns true if the click was consumed by the menu
function handleMenuClick(px, py) {
	var categories = Object.keys(NODE_TYPES);

	for (var i = 0; i < categories.length; i++) {
		var ry = menuState.y + i * MENU_ROW_H;
		if (px >= menuState.x && px <= menuState.x + MENU_W && py >= ry && py <= ry + MENU_ROW_H) {
			menuState.categoryIndex = i;
			return true;
		}
	}

	if (menuState.categoryIndex >= 0) {
		var cat = categories[menuState.categoryIndex];
		var types = Object.keys(NODE_TYPES[cat]);
		var subX = menuState.x + MENU_W;
		var subY = menuState.y + menuState.categoryIndex * MENU_ROW_H;
		for (var j = 0; j < types.length; j++) {
			var ry2 = subY + j * MENU_ROW_H;
			if (px >= subX && px <= subX + MENU_W && py >= ry2 && py <= ry2 + MENU_ROW_H) {
				makeNode(cat, types[j], menuState.x, menuState.y);
				selectedNode = nodes[nodes.length - 1];
				menuState = null;
				return true;
			}
		}
	}

	return false;
}

// ---------------------------------------------------------------
// Cleanup
// ---------------------------------------------------------------

function notifyDeleted() {
	nodes = [];
	connections = [];
}

/*
---------------------------------------------------------------
FORWARD-LOOKING SKETCH: gen~ backend bridge (not implemented here)
---------------------------------------------------------------
The idea of writing the graph to disk and having a gen~ patch "load"
it is worth separating into two real sub-problems:

1. Serializing this node graph (nodes + connections) into something
   a DSP engine can consume -- e.g. walk `nodes`/`connections` here,
   topologically sort by connection dependency, and emit either:
     a) a JSON description of the signal graph, written via a Max
        `File` object or Node.js `fs` (if hosted in a [node.script]
        instead of v8ui), or
     b) directly-generated gen~ codebox source (a string of gen
        operators wired up per the graph), which is closer to what
        you'd actually want gen~ to "require".

2. Getting gen~ to pick that up. gen~ doesn't literally `require()`
   external files at signal-compile time, but there are two realistic
   paths: (a) script the patcher itself -- have this same v8/node
   layer use the Max scripting API to build/modify a `gen~` subpatcher
   directly (creating gen operators and connecting them via the
   Patcher API, the same way Max scripts any subpatcher), which is
   the more "native" analogue of what you're describing; or (b) use
   codebox's @filename-style external-file loading if your Max
   version's codebox supports it, to have a codebox object re-read
   generated source and recompile on load/change.

Route (a) -- scripting the gen~ subpatcher directly via the Patcher
API -- is probably the sturdier target once this proof of concept's
interaction model feels right, since it sidesteps needing gen~ to
understand a bespoke file format at all.
*/
