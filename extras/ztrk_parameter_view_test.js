mgraphics.init();
mgraphics.relative_coords = 0;
mgraphics.autofill = 0;

outlets = 1;   // 0: bang when buffer updated, 1: param / debug
inlets  = 1;

config_colors = {
    background_all: [0.1, 0.12, 0.12, 1],
    title: [0.7, 0.9, 0.7, 1]
}

var SLIDER_H      = 14;
var SLIDER_GAP    = 3;
var SPACER_H      = 6;
var LEFT_MARGIN   = 8;
var RIGHT_MARGIN  = 50;

var params = [
    {i:0, real:1.0,   min:0.0, max:4.0,   name:"Amplifier",      short:"Amp"},
    {i:1, real:0.5,   min:0.0, max:4.0,   name:"Osc 1 Amp",      short:"A01"},
    {i:2, real:0.25,  min:0.0, max:4.0,   name:"Osc 2 Amp",      short:"A02"},
    {i:3, real:0.123, min:0.0, max:4.0,   name:"Osc 3 Amp",      short:"A03"},
    {i:4, real:0.0625,min:0.0, max:4.0,   name:"Osc 4 Amp",      short:"A04"},
    {i:5, real:0.0,   min:0.0, max:1.0,   name:"Noise Mix",      short:"NMix"},
    {i:6, real:1.0,   min:0.0, max:255.0, name:"Noise Seed",     short:"Seed"},
    {i:7, real:0.0,   min:0.0, max:1.0,   name:"Noise Rot",      short:"Shift"},
    {i:8, real:0.0,   min:0.0, max:1.0,   name:"Smoothing",      short:"Sm"}
];

var active_slider = 0;
var drag_slider   = -1;
var spacer_after  = {1:true, 5:true};

function param_to_slider_x(p, track_w) {
    return ((p.real - p.min) / (p.max - p.min)) * track_w;
}
function slider_x_to_real(p, x, track_w) {
    var t = float_constrain(x / track_w, 0, 1);
    return p.min + t * (p.max - p.min);
}
function float_constrain(x, xmin, xmax) {
    if (x <= xmin) return xmin;
    if (x >= xmax) return xmax;
    return x;
}

function get_slider_rects() {
    var [box_w, box_h] = mgraphics.size;

    var rects = [];
    var y = 28;
    var track_w = box_w - LEFT_MARGIN - RIGHT_MARGIN - 4;
    for (var i = 0; i < params.length; i++) {
        
        if (spacer_after[i]) y += SPACER_H;

        rects.push({idx:i, x:LEFT_MARGIN, y:y, w:track_w+4, h:SLIDER_H, track_w:track_w});
        y += SLIDER_H + SLIDER_GAP;
    }
    return rects;
}

function paint() {

    var size = mgraphics.size;
    var [w, h] = mgraphics.size;
    mgraphics.set_source_rgba(0.01, 0.07, 0.098, 1.0);
    mgraphics.rectangle(0, 0, w, h);
    mgraphics.fill();

    // title
    var ypadding = 20;
    mgraphics.set_source_rgba(...config_colors.title);
    mgraphics.select_font_face("Consolas");
    mgraphics.set_font_size(12);

    // sliders
    var rects = get_slider_rects();
    for (var r = 0; r < rects.length; r++) {
        var rc = rects[r];
        var p  = params[rc.idx];
        var act = (rc.idx === active_slider);

        mgraphics.set_source_rgba(0.08, act ? 0.31 : 0.20, 0.08, 1);
        mgraphics.rectangle(rc.x, rc.y, rc.w, rc.h);
        mgraphics.fill();

        // var kx = rc.x + 2 + param_to_slider_x(p, rc.track_w);
        var kx = rc.x + 2 + param_to_slider_x(p, rc.track_w - SLIDER_H);
        mgraphics.set_source_rgba(0.2, act ? 0.47 : 0.35, 0.2, 1);
        mgraphics.rectangle(kx, rc.y, SLIDER_H, SLIDER_H);
        mgraphics.fill();

        mgraphics.set_source_rgba(act ? 0.85 : 0.55, act ? 0.85 : 0.55, act ? 0.85 : 0.55, 1);
        mgraphics.set_font_size(12);
        mgraphics.move_to(rc.x + rc.w + 6, rc.y + 12);
        mgraphics.show_text(p.short);
    }
}

// ---------------------------------------------------------------------------
// Interaction
// ---------------------------------------------------------------------------
function onclick(x, y) {
    var rects = get_slider_rects();
    drag_slider = -1;
    for (var i = 0; i < rects.length; i++) {
        var rc = rects[i];
        if (x >= rc.x && x <= rc.x+rc.w && y >= rc.y && y <= rc.y+rc.h) {
            active_slider = rc.idx;
            drag_slider = rc.idx;
            params[rc.idx].real = slider_x_to_real(params[rc.idx], x-(rc.x+2), rc.track_w);
            mgraphics.redraw();
            //outlet(1, "param", rc.idx, params[rc.idx].real);
            break;
        }
    }
}
onclick.local = 1;

function ondrag(x, y) {
    if (drag_slider < 0) return;
    var rects = get_slider_rects();
    var rc = rects[drag_slider];
    params[drag_slider].real = slider_x_to_real(params[drag_slider], x-(rc.x+2), rc.track_w);
    
    mgraphics.redraw();
    // outlet(1, "param", drag_slider, params[drag_slider].real);
}
ondrag.local = 1;

function onidleout() { drag_slider = -1; }
onidleout.local = 1;

function anything() {

}
