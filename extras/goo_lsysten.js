autowatch = 1;
inlets = 1;
outlets = 0;
mgraphics.init();

// ---------- state / defaults ----------
var params = {
    axiom: "X",
    rules: { "X": "F+[[X]-X]-F[-FX]+X", "F": "FF" },
    iterations: 4,
    angle: 25,
    length: 6,
    lengthScale: 1,       // multiply length per branch depth (e.g. 0.9 = taper)
    startHeading: -90,    // -90 = up
    baseColor: [0.2, 0.9, 0.4, 1],   // trunk color
    tipColor:  [1.0, 0.4, 0.8, 1],   // color at max branch depth
    baseWidth: 3,
    tipWidth: 0.5,
    glow: 1                // 0 = off, 1 = soft glow pass under the lines
};

// ---------- Max message handlers ----------
function axiom(s)      { params.axiom = s; mgraphics.redraw(); }
function iterations(n) { params.iterations = Math.max(0, n); mgraphics.redraw(); }
function angle(n)      { params.angle = n; mgraphics.redraw(); }
function length(n)     { params.length = n; mgraphics.redraw(); }
function lengthscale(n){ params.lengthScale = n; mgraphics.redraw(); }
function heading(n)    { params.startHeading = n; mgraphics.redraw(); }
function glow(n)       { params.glow = n; mgraphics.redraw(); }

// rule <symbol> <replacement>   e.g.  "rule F FF"
function rule(sym, repl) {
    params.rules[sym] = repl;
    mgraphics.redraw();
}

// preset <name>
function preset(name) {
    var presets = {
        plant: { axiom: "X", rules: { X: "F+[[X]-X]-F[-FX]+X", F: "FF" },
                 iterations: 4, angle: 25, length: 6 },
        koch:  { axiom: "F", rules: { F: "F+F-F-F+F" },
                 iterations: 3, angle: 90, length: 8 },
        dragon:{ axiom: "FX", rules: { X: "X+YF+", Y: "-FX-Y" },
                 iterations: 10, angle: 90, length: 6 },
        tree:  { axiom: "F", rules: { F: "FF-[-F+F+F]+[+F-F-F]" },
                 iterations: 3, angle: 22.5, length: 10 },
        sierpinski: { axiom: "F-G-G", rules: { F: "F-G+F+G-F", G: "GG" },
                    iterations: 5, angle: 120, length: 6 },
        hilbert: { axiom: "A", rules: {
                    A: "-BF+AFA+FB-",
                    B: "+AF-BFB-FA+"
                }, iterations: 5, angle: 90, length: 8 },
        levyC: { axiom: "F", rules: { F: "+F--F+" },
                iterations: 12, angle: 45, length: 5 },
        penroseP3: { axiom: "[X]++[X]++[X]++[X]++[X]", rules: {
                        F: "",
                        W: "YF++ZF----XF[-YF----WF]++",
                        X: "+YF--ZF[3--WF--XF]+",
                        Y: "-WF++XF[+++YF++ZF]-",
                        Z: "--YF++++WF[+ZF++++XF]--XF"
                    }, iterations: 4, angle: 36, length: 8 },
        bush: { axiom: "F", rules: { F: "FF-[-F+F+F]+[+F-F-F]F" },
                iterations: 3, angle: 22.5, length: 8 },
        seaweed: { axiom: "F", rules: { F: "FF-[-F+F+F]+[+F-F-F]" },
                iterations: 4, angle: 25.7, length: 6, lengthScale: 0.9 },
        crystal: { axiom: "F+F+F+F", rules: { F: "FF+F++F+F" },
                iterations: 3, angle: 90, length: 8 },
        kochIsland: { axiom: "F+F+F+F", rules: { F: "F-F+F+FF-F-F+F" },
                    iterations: 2, angle: 90, length: 10 },
        weed2: { axiom: "F", rules: { F: "F[+F]F[-F]F" },
                iterations: 5, angle: 20, length: 8 }                 
    };
    if (presets[name]) {
        for (var k in presets[name]) params[k] = presets[name][k];
        mgraphics.redraw();
    }
}

// ---------- L-system expansion (cached so we don't rebuild every paint) ----------
var _cacheKey = null;
var _cachedString = null;

function expand() {
    var key = params.axiom + JSON.stringify(params.rules) + params.iterations;
    if (key === _cacheKey) return _cachedString;

    var str = params.axiom;
    for (var i = 0; i < params.iterations; i++) {
        var next = "";
        for (var c = 0; c < str.length; c++) {
            var ch = str[c];
            next += (params.rules[ch] !== undefined ? params.rules[ch] : ch);
        }
        str = next;
    }
    _cacheKey = key;
    _cachedString = str;
    return str;
}

// ---------- color helpers ----------
function lerpColor(a, b, t) {
    return [
        a[0] + (b[0] - a[0]) * t,
        a[1] + (b[1] - a[1]) * t,
        a[2] + (b[2] - a[2]) * t,
        a[3] + (b[3] - a[3]) * t
    ];
}

// ---------- core turtle walk, shared by glow pass + main pass ----------
function walk(drawSegment) {
    var str = expand();
    var rad = Math.PI / 180;
    var angleRad = params.angle * rad;
    var heading = params.startHeading * rad;
    var len = params.length;
    var x = 0, y = 0, depth = 0;
    var stack = [];

    // estimate max depth for color/width scaling (count max '[' nesting)
    var maxDepth = 1, cur = 0;
    for (var i = 0; i < str.length; i++) {
        if (str[i] === "[") { cur++; maxDepth = Math.max(maxDepth, cur); }
        else if (str[i] === "]") cur--;
    }

    for (var j = 0; j < str.length; j++) {
        var sym = str[j];
        switch (sym) {
            case "F":
            case "G":
                var segLen = len * Math.pow(params.lengthScale, depth);
                var nx = x + Math.cos(heading) * segLen;
                var ny = y + Math.sin(heading) * segLen;
                drawSegment(x, y, nx, ny, depth / maxDepth);
                x = nx; y = ny;
                break;
            case "f":
                x += Math.cos(heading) * len * Math.pow(params.lengthScale, depth);
                y += Math.sin(heading) * len * Math.pow(params.lengthScale, depth);
                break;
            case "+": heading += angleRad; break;
            case "-": heading -= angleRad; break;
            case "[":
                stack.push({ x: x, y: y, heading: heading, depth: depth });
                depth++;
                break;
            case "]":
                var s = stack.pop();
                if (s) { x = s.x; y = s.y; heading = s.heading; depth = s.depth; }
                break;
        }
    }
}

// ---------- bounds, for auto-fit/centering ----------
function getBounds() {
    var minX = Infinity, maxX = -Infinity, minY = Infinity, maxY = -Infinity;
    walk(function (x0, y0, x1, y1) {
        minX = Math.min(minX, x0, x1); maxX = Math.max(maxX, x0, x1);
        minY = Math.min(minY, y0, y1); maxY = Math.max(maxY, y0, y1);
    });
    if (minX === Infinity) { minX = maxX = minY = maxY = 0; }
    return { minX: minX, maxX: maxX, minY: minY, maxY: maxY };
}

// ---------- paint ----------
function paint() {
    var w = box.rect[2] - box.rect[0];
    var h = box.rect[3] - box.rect[1];

    mgraphics.set_source_rgba(0.08, 0.08, 0.09, 1);
    mgraphics.rectangle(0, 0, w, h);
    mgraphics.fill();

    var b = getBounds();
    var contentW = Math.max(1, b.maxX - b.minX);
    var contentH = Math.max(1, b.maxY - b.minY);
    var scale = Math.min((w * 0.9) / contentW, (h * 0.9) / contentH);
    var offX = w / 2 - (b.minX + contentW / 2) * scale;
    var offY = h / 2 - (b.minY + contentH / 2) * scale;

    function drawPass(glowPass) {
        walk(function (x0, y0, x1, y1, t) {
            var col = lerpColor(params.baseColor, params.tipColor, t);
            var width = params.baseWidth + (params.tipWidth - params.baseWidth) * t;
            width *= scale / params.length * 0.6; // keep proportional after fit-scaling

            if (glowPass) {
                mgraphics.set_source_rgba(col[0], col[1], col[2], 0.15);
                mgraphics.set_line_width(width * 4);
            } else {
                mgraphics.set_source_rgba(col[0], col[1], col[2], col[3]);
                mgraphics.set_line_width(Math.max(0.5, width));
            }
            mgraphics.move_to(x0 * scale + offX, y0 * scale + offY);
            mgraphics.line_to(x1 * scale + offX, y1 * scale + offY);
            mgraphics.stroke();
        });
    }

    if (params.glow) drawPass(true);
    drawPass(false);
}