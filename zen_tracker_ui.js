// include("ztrk_patternClass.js");
outlets = 2;
inlets = 3;

mgraphics.init();

mgraphics.relative_coords = 0;
mgraphics.autofill = 0;

var g_Mouse = [-1, -1];
var g_pattern_playhead = 0;
var g_in_edit_mode = false;
var g_key_codes = [];
var g_mouse_on_rect = false;
var settings_font_size = 12;

function bang(){
    mgraphics.redraw();
    outlet(0, g_pattern_playhead);
}

function msg_int(tick){
    g_pattern_playhead = tick;
}

function clear(){
    mgraphics.redraw();
}

function key_handler(){
    /*
    28 left
    29 right
    30 up
    31 down
    32 spacebar
    */
    if (g_in_edit_mode){
        post('Keys: ', g_key_codes);
    }

}

function keys(a1, a2, a3, a4) {
    if (a1 === 32 && g_mouse_on_rect){
        g_in_edit_mode = !g_in_edit_mode;
        mgraphics.redraw();
    }
    g_key_codes = [a1, a2, a3, a4];

}


function paint(){

    var w = mgraphics.size[0];
    var h = mgraphics.size[1];
    var start_x = 30;
    var start_y = 30;

    mgraphics.set_font_size(settings_font_size);
    mgraphics.select_font_face("Consolas", "normal", "normal");
    var tx_wh = mgraphics.text_measure('000 C-5 01 80 0A FFFF 0B FFFF');  // returns width and height
    var text_w = tx_wh[0];
    var text_h = tx_wh[1];

    // --- dark background ---
    mgraphics.set_source_rgba(0.1, 0.2, 0.4, 1);  // almost black
    mgraphics.rectangle(0, 0, w, h);
    mgraphics.fill();

    // --- draw tick position
    var tick_y = start_y + (g_pattern_playhead * settings_font_size) - (0.75*text_h) ;
    mgraphics.set_source_rgba(0.1, 0.1, 0.1, 1);  // almost black
    mgraphics.rectangle(start_x, tick_y, text_w, settings_font_size);
    mgraphics.fill();

    var faux_pattern = [
        '000 C-5 01 80 0A FFFF 0B FFFF',
        '001 ... .. 70 .. .... .. ....',
        '002 ... .. 70 .. .... .. ....',
        '003 D#5 01 80 .. .... 0B 20FF',
        '004 ... .. 70 .. .... .. ....',
        '005 ... .. 70 .. .... .. ....',
        '006 C-5 01 80 0A FFFF 0B FFFF',
        '007 === .. 70 .. .... .. ....',
        '008 ... .. 70 .. .... .. ....',
        '009 C-5 01 80 0A FFFF 0B FFFF',
        '010 ... .. 70 .. .... .. ....',
        '011 ... .. 70 .. .... .. ....',        
        '012 C-5 01 80 0A FFFF 0B FFFF',
        '013 ... .. 70 .. .... .. ....',
        '014 ^^^ 67 .. .. .... .. ....',
        '015 ... .. .. .. .... .. ....',        
    ]


    mgraphics.set_source_rgba(0.4, 0.9, 1.0, 1);
    for (idx in faux_pattern){
        mgraphics.move_to(start_x, start_y + (idx * settings_font_size));
        mgraphics.show_text(faux_pattern[idx]);
    }
    
    // mgraphics.stroke();
    if (g_in_edit_mode){
        mgraphics.set_source_rgba(0.9, 0.5, 0.5, 1.0);
        mgraphics.rectangle(0, 0, 5, h);
        mgraphics.fill();        
    }

    post('mouse in rect?', g_mouse_on_rect);
}

function onclick(x, y, button){
    g_Mouse = [x, y];
    g_in_edit_mode = !g_in_edit_mode;
    mgraphics.redraw();
}


function ondrag(x, y, button){
    return;
}

function onidle(x, y, button, mod1, shift, caps, opt, mod2) { g_mouse_on_rect = true; }
function onidleout(x, y, button, mod1, shift, caps, opt, mod2) { g_mouse_on_rect = false; }
