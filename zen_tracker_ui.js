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
var g_caret = [0, 0]

var start_x = 30;
var start_y = 30;

var settings_font_size = 12;
var charwidth = 8;
var charheight = settings_font_size;

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

function caret_to_location(){
    var caret_x = start_x + ((4 + g_caret[0]) * charwidth);
    var caret_y = start_y + (g_caret[1] * charheight);
    return [caret_x, caret_y];
}

function set_caret(x, y){ g_caret = [x, y]; }

function move_caret(direction){
    switch (direction) {
        case 28:  
            if (g_caret[0] > 0){ set_caret(g_caret[0]-1, g_caret[1]); } // left
            break;
        case 29: 
            if (g_caret[0] < 20){ set_caret(g_caret[0]+1, g_caret[1]); } // right
            break;
        case 30: 
            if (g_caret[1] > 0){ set_caret(g_caret[0], g_caret[1]-1); } // up
            break;
        case 31: 
            if (g_caret[1] < 15){ set_caret(g_caret[0], g_caret[1]+1); } // down
            break;
        default:
            post('not possible');
    }
    post(g_caret);

}

function key_handler(){
    if (g_in_edit_mode){
        // post('Keys: ', g_key_codes);
        var directions = [28, 29, 30, 31];
        if (directions.indexOf(g_key_codes[0]) !== -1){
            move_caret(g_key_codes[0]);
            mgraphics.redraw();
        }
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

    mgraphics.set_font_size(settings_font_size);
    mgraphics.select_font_face("Consolas", "normal", "normal");
    charwidth = mgraphics.text_measure('_')[0];
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

    // draw caret
    mgraphics.set_source_rgba(0.7, 0.2, 0.4, 1);
    var caret_pos = caret_to_location();
    mgraphics.rectangle(caret_pos[0], caret_pos[1] - (0.9 * charheight), charwidth, charheight);
    mgraphics.fill();        

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
