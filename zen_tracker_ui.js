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

var started_selection_mode = false;
var g_updating_selection = true;
var selection_w_idx = 1;
var selection_h_idx = 1;
var sel_x_start = 30; 
var sel_y_start = 30;
var num_rows_selected = 1;
var num_rows_selected = 1;


function set_selection(x, y, w, h){
    selection_range = [x, y, w, h];
}

function print_abs_dims(){
    post('num_rows_sel:', Math.abs(num_rows_selected), 'num_cols_sel:', Math.abs(num_cols_selected), '\n');
}

function draw_selection(){
    if (!started_selection_mode){ return; }
    const [cx, cy] = caret_to_location();
    mgraphics.set_source_rgba(0.7, 0.7, 0.9, 1);
    var rect_width = (num_cols_selected-1) * charwidth;
    var rect_height = num_rows_selected * charheight;
    mgraphics.rectangle(cx-rect_width, cy-rect_height, rect_width+charwidth, rect_height);
    mgraphics.stroke();
}

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

function reset_selection_range(){
    num_rows_selected = 1;
    num_cols_selected = 1;
}

function move_caret(direction){
    switch (direction) {
        case 28:  
            if (g_caret[0] > 0){ set_caret(g_caret[0]-1, g_caret[1]); } // left
            break;
        case 29: 
            if (g_caret[0] < 24){ set_caret(g_caret[0]+1, g_caret[1]); } // right
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
}

function update_selection_dimensions(direction){
    const num_cols_in_pattern = 25;
    const num_rows_in_pattern = 16;
    switch (direction) {
        case 28: // left
            if (g_caret[0] > 0){ 
                num_cols_selected -= 1;
            } 
            break;
        case 29: // right
            if (g_caret[0] < (num_cols_in_pattern-1)){ 
                num_cols_selected += 1;
            } 
            break;
        case 30: // up
            if (g_caret[1] > 0){ 
                num_rows_selected -= 1;
            } 
            break;
        case 31: // down
            if (g_caret[1] < (num_rows_in_pattern)){ 
                if (num_rows_selected !== num_rows_in_pattern){
                    num_rows_selected += 1;
                }
            } 
            break;
        default:
            post('not possible');
    }
}

function key_handler(){
    if (g_in_edit_mode){

        var just_shift = 512;
        var directions = [28, 29, 30, 31];
        var direction_input = (directions.indexOf(g_key_codes[0]) !== -1);

        if (direction_input){
            move_caret(g_key_codes[0]);
        }
        
        if ((g_key_codes[2] === just_shift) && direction_input){
            if (started_selection_mode){
                post('modifying');
                update_selection_dimensions(g_key_codes[0]);
                //const [x1, y1, x2, y2] = g_selection_range_in_carets;
                //var cx = start_x + ((4 + g_caret[0]) * charwidth);
                //var cy = start_y + (g_caret[1] * charheight);
                //set_selection(cx, cy, (x2 - x1 - 1) * charwidth, ((y2 - y1) * charheight) - charheight);
            } else {
                // means the section is going to start at cursor index x, y, w, h where w and h are 1.
                update_selection_dimensions(g_key_codes[0]);
                //const [x_start, y_start] = caret_to_location();
                //set_selection(x_start, y_start, charwidth, charheight);
                post('starting');
            }
            started_selection_mode = true;

        } else {
            reset_selection_range();
            started_selection_mode = false;
        }
        // post('selection range: ', g_selection_range_in_carets);
        // we can restrict this to redraw iff there are updates, but for now this is convenient.
        mgraphics.redraw();
    }
    // post('woop', num_cols_selected, num_rows_selected, '\n');
    print_abs_dims();

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

    var pattern_markup = "ttt nnn hh ss hh hhhh hh hhhh"
    // ttt  = ticks
    // nnn  = note
    // hh   = 2hex
    // ss   = short (ints 0..80)
    // hhhh = 4hex

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
    ];

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

    draw_selection();

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
