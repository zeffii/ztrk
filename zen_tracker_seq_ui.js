outlets = 2;
inlets = 3;

mgraphics.init();
mgraphics.relative_coords = 0;
mgraphics.autofill = 0;

var settings_font_size = 12;
var charwidth = 0;
var charheight = 0;
var global_tick = 0;

var g_looping = 0;
var g_loop_start = 0;
var g_loop_end = 128;

function loop(mode){
    g_looping = mode;
    mgraphics.redraw();
}

function loop_start(tick){
    g_loop_start = tick;
    mgraphics.redraw();
}

function loop_end(tick){
    g_loop_end = tick;
    mgraphics.redraw();
}


function fmt4(n) {
    return ('0000' + Math.floor(Math.abs(n))).slice(-4) + ' ';
}

function set_rgb(color, dimming){
    mgraphics.set_source_rgba(color.r / dimming, color.g / dimming, color.b / dimming, 1);
}

function msg_int(tick){
    global_tick = tick;
    mgraphics.redraw();
}


function display_current_tick(){
    var tick_distance = charheight / 16;
    var lineh = (global_tick * tick_distance) - charheight + 3.5;
    set_rgb({r:0.95 ,g: 0.44, b: 0.4}, 0.9);
    mgraphics.move_to(0, lineh);
    mgraphics.line_to(500, lineh);
    mgraphics.stroke();
}

function draw_looping_indicators(){

    if (g_looping === 1){
        var loop_start_y = -10.5 + ((g_loop_start / 16.0) * charheight);
        var loop_end_y = -10.5 + ((g_loop_end / 16.0 ) * charheight);
        set_rgb({r: 0.2, g: 0.6, b:0.9}, 1.3);
        mgraphics.move_to(0, loop_start_y);
        mgraphics.line_to(500, loop_start_y);
        mgraphics.stroke();
        mgraphics.move_to(0, loop_end_y);
        mgraphics.line_to(500, loop_end_y);
        mgraphics.stroke();
    }
}

function paint(){

    var w = mgraphics.size[0];
    var h = mgraphics.size[1];

    mgraphics.set_font_size(settings_font_size);
    mgraphics.select_font_face("Consolas", "normal", "normal");
    [charwidth, charheight] = mgraphics.text_measure('/');
    var trk_width = mgraphics.text_measure('|    Λ    ')[0];
    var side_width = mgraphics.text_measure('tick  ')[0];

    // --- dark background ---
    var color = {r: 0.4, g: 0.9, b: 1.0};
    var dimming  = 1.5;
    mgraphics.set_source_rgba(0.1/dimming, 0.2/dimming, 0.4/dimming, 1);  // almost black
    mgraphics.rectangle(0, 0, w, h);
    mgraphics.fill();


    // sequence info
    mgraphics.translate(30, 50);

    // secondary horizontal separator lines
    var sdim = 0.34;
    for (var i = 0; i < 20; i++){
        mgraphics.set_source_rgba(0.4*sdim, 0.9*sdim, 1.0*sdim, 1);
        var lineh = -10.5 + ((i * 8) * charheight);
        mgraphics.move_to(0, lineh);
        mgraphics.line_to(500, lineh);
        mgraphics.stroke();
    }

    draw_looping_indicators();

    // separator line header
    //set_rgb(color, 2.5);
    //mgraphics.move_to(0, -10.5);
    //mgraphics.line_to(500, -10.5);
    //mgraphics.stroke();


    // display patterns ..start with a placeholder structure
    var pattern_data = [
        {pname: '01', trk: 0, start: 0, length: 16, color: [0.2, 0.4, 0.5], kind: "gen"},
        {pname: '02', trk: 1, start: 16, length: 48, color: [0.2, 0.4, 0.5], kind: "gen"},
        {pname: '03', trk: 2, start: 64, length: 64, color: [0.2, 0.4, 0.5], kind: "fx"},
        {pname: '04', trk: 0, start: 128, length: 64, color: [0.2, 0.4, 0.5], kind: "gen"},
        {pname: '05', trk: 1, start: 192, length: 16, color: [0.2, 0.4, 0.5], kind: "gen"},
        {pname: '06', trk: 2, start: 256, length: 16, color: [0.2, 0.4, 0.5], kind: "fx"},
        {pname: '07', trk: 0, start: 384, length: 32, color: [0.2, 0.4, 0.5], kind: "gen"}
    ];

    var yoffset = (0.75 * charheight);
    var xoffset = (0.46 * charwidth);
    for (pattern_idx in pattern_data){
        pattern = pattern_data[pattern_idx];
        var [cr, cg, cb] = pattern.color; 
        mgraphics.set_source_rgba(cr, cg, cb, 1);
        if (pattern.kind === "fx"){
            set_rgb({r:0.9 ,g: 0.34, b: 0.3}, 1.2);    
        }
        mgraphics.rectangle(side_width + (pattern.trk * trk_width) - xoffset, ((pattern.start/16) * charheight) - yoffset, trk_width, ((pattern.length / 16) * charheight) );
        mgraphics.fill();
        set_rgb(color, 0.7);
        if (pattern.kind === "fx"){
            set_rgb({r:0.9 ,g: 0.34, b: 0.2}, 0.5);    
        }        
        mgraphics.rectangle(side_width + (pattern.trk * trk_width) - xoffset, ((pattern.start/16) * charheight) - yoffset, trk_width, ((pattern.length / 16) * charheight) );
        mgraphics.stroke();

    }

    // header
    mgraphics.set_source_rgba(0.4, 0.9, 1.0, 1);

    mgraphics.move_to(0,  -2 * charheight);
    mgraphics.show_text('     |    Λ    |    Λ    |    φ    |');
    mgraphics.move_to(0,  -1 * charheight);
    mgraphics.show_text('tick | gen.00  | gen.01  | fx.01   | →');

    for (var idx = 0; idx < 38; idx++){
        mgraphics.move_to(0,  (idx * charheight));
        var pattern_row = String(fmt4(idx * 16)) + '|'; // |█';
        if (idx % 4 === 0){
            set_rgb(color, 1.3);
        } else {
            set_rgb(color, 1.0);
        }
        mgraphics.show_text(pattern_row);        
    }

    display_current_tick();

    // post('wooot');
};

function onclick(x, y, button){
    // g_Mouse = [x, y];
    // g_in_edit_mode = !g_in_edit_mode;
    mgraphics.redraw();
}