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

var sel_x_start = 30; 
var sel_y_start = 30;

var rows = 16;
var cols = 25;
var caret = { row: 0, col: 0 };
var anchor = null;

var g_pattern_octave = 4;

var pattern_markup = {
    globals: "hh hh hh hh", 
    track: "nnn hh ss hh hhhh hh hhhh"
};
// ttt  = ticks
// nnn  = note
// hh   = 2hex
// ss   = short (ints 0..80)
// hhhh = 4hex

var faux_pattern = [
    'C-5 01 80 0A FFFF 0B FFFF',
    '... .. 70 .. .... .. ....',
    '... .. 70 .. .... .. ....',
    'D#5 01 80 .. .... 0B 20FF',
    '... .. 70 .. .... .. ....',
    '... .. 70 .. .... .. ....',
    'C-5 01 80 0A FFFF 0B FFFF',
    '=== .. 70 .. .... .. ....',
    '... .. 70 .. .... .. ....',
    'C-5 01 80 0A FFFF 0B FFFF',
    '... .. 70 .. .... .. ....',
    '... .. 70 .. .... .. ....',        
    'C-5 01 80 0A FFFF 0B FFFF',
    '... .. 70 .. .... .. ....',
    '^^^ 67 .. .. .... .. ....',
    '... .. .. .. .... .. ....',        
];

function make_empty_pattern(descriptor, length, ntracks){
    // ntracks not handled yet, ntracks is to define how many note+params tracks show up
    // this is destinct from globals.
    var pattern = [];
    const empty_row = descriptor.track.replace(/\S/g, ".");
    for (var i = 0; i < length; i++) {
        pattern.push(empty_row);
    }
    return pattern;
}

faux_pattern = make_empty_pattern(pattern_markup, 16, 1);


function replaceAt(str, index, replacement, count) {
    return str.substr(0, index)
         + replacement
         + str.substr(index + count);
}

function patterm_input_handler(key, caret, desciptor, pattern){
    if ([0, 1, 2].indexOf(caret.col) !== -1){
        if (caret.col === 0){
            //   a   b   c   d    e    f   // lowercase input only.
            // if ([97, 98, 99, 100, 101, 102].indexOf(key) !== -1) {
            //     const current_row = pattern[caret.row];
            //     const key_char = {97: 'A', 98: 'B', 99: 'C', 100: 'D', 101: 'E', 102: 'F'}[key];
            //     pattern[caret.row] = replaceAt(current_row, caret.col, key_char, 1);
            // }

            /*

                        +1                   +2
            |  C#  D#      F#  G#  A#   |  C#  D#
            | |_2_|_3_| | |_5_|_6_|_7_| | |_9_|_0_| |
            |_Q_|_W_|_E_|_R_|_T_|_Y_|_U_|_I_|_O_|_P_|
            | C   D   E   F   G   A   B | C   D   E 

                        +0               
            |  C#  D#      F#  G#  A#   |
            | |_S_|_D_| | |_G_|_H_|_J_| |
            |_Z_|_X_|_C_|_V_|_B_|_N_|_M_|
            | C   D   E   F   G   A   B |

            deal with note data on note params
            */
            const g_keyjam_encoding = {
                122: ['C-', 0], 115: ['C#', 0], 120: ['D-', 0], 100: ['D#', 0], 99: ['E-', 0], 
                118: ['F-', 0], 103: ['F#', 0], 98: ['G-', 0], 104: ['G#', 0], 110: ['A-', 0], 106: ['A#', 0], 109: ['B-', 0],
                113: ['C-', 1], 50: ['C#', 1], 119: ['D-', 1], 51: ['D#', 1], 101: ['E-', 1], 
                114: ['F-', 1], 53: ['F#', 1], 116: ['G-', 1], 54: ['G#', 1], 121: ['A-', 1], 55: ['A#', 1], 117: ['B-', 1],
                105: ['C-', 2], 57: ['C#', 2], 111: ['D-', 2], 48: ['D#', 2], 112: ['E-', 2], 
            }
            if (key in g_keyjam_encoding){
                const key_info = g_keyjam_encoding[key];
                const current_row = pattern[caret.row];
                const note = String(key_info[0]) + String(key_info[1] + g_pattern_octave);
                pattern[caret.row] = replaceAt(current_row, caret.col, note, 3);
            }
        }
    }
}

function clamp(v, lo, hi) {
    return Math.max(lo, Math.min(hi, v));
}

function moveCaret(dr, dc) {
    caret.row = clamp(caret.row + dr, 0, rows - 1);
    caret.col = clamp(caret.col + dc, 0, cols - 1);
}

function getSelectionRect() {
    if (!anchor) return null;
    return {
        top:    Math.min(anchor.row, caret.row),
        left:   Math.min(anchor.col, caret.col),
        bottom: Math.max(anchor.row, caret.row),
        right:  Math.max(anchor.col, caret.col)
    };
}

function caret_to_location(){
    var caret_x = start_x + ((4 + caret.col) * charwidth);
    var caret_y = start_y + (caret.row * charheight);
    return [caret_x, caret_y];
}

function corner_to_location(x, y){
    var _x = start_x + ((4 + x) * charwidth);
    var _y = start_y + (y * charheight);
    return [_x, _y];   
}

function draw_caret(){
    const [offset_x, offset_y] = caret_to_location();
    mgraphics.set_source_rgba(0.7, 0.2, 0.4, 1);
    mgraphics.rectangle(offset_x, offset_y - (0.9 * charheight), charwidth, charheight);
    mgraphics.fill();        
}

function draw_selection(){
    var selection = getSelectionRect();
    if (!started_selection_mode && !selection){ return; }
    post('selection:', selection.top, selection.bottom, selection.left, selection.right, '\n');

    const [cx, cy] = corner_to_location(selection.left, selection.top);
    var rect_width = Math.abs((selection.right - selection.left)) * charwidth;
    var rect_height = Math.abs(selection.top - selection.bottom-1) * charheight;
    mgraphics.set_source_rgba(0.7, 0.7, 0.9, 1);
    mgraphics.rectangle(cx, cy-(charheight*0.9), rect_width+charwidth, rect_height);
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


function key_handler(){
    if (g_in_edit_mode){

        var just_shift = 512;
        var directions = [28, 29, 30, 31];
        var direction_input = (directions.indexOf(g_key_codes[0]) !== -1);

        post(g_key_codes);

        if ((g_key_codes[2] === just_shift) && direction_input){
            if (started_selection_mode){
                post('modifying');
            } else {
                // means the section is going to start at cursor index x, y, w, h where w and h are 1.
                anchor = { row: caret.row, col: caret.col };
                post('starting');
                started_selection_mode = true;
            }

        } else {
            started_selection_mode = false;
            anchor = null;
        }

        if (direction_input){
            switch(g_key_codes[0]) {
                case 28: moveCaret(0, -1); break;  // left
                case 29: moveCaret(0,  1); break;  // right
                case 30: moveCaret(-1, 0); break;  // up
                case 31: moveCaret(1, 0); break;  // down
                default: return;
            }
        }

        patterm_input_handler(g_key_codes[0], caret, pattern_markup, faux_pattern);

        // we can restrict this to redraw iff there are updates, but for now this is convenient.
        mgraphics.redraw();
    }
}

function keys(a1, a2, a3, a4) {
    if (a1 === 32 && g_mouse_on_rect){
        g_in_edit_mode = !g_in_edit_mode;
        mgraphics.redraw();
    }
    g_key_codes = [a1, a2, a3, a4];

}

function fmt(n) {
    return ('000' + Math.floor(Math.abs(n))).slice(-3) + ' ';
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

    draw_caret();

    mgraphics.set_source_rgba(0.4, 0.9, 1.0, 1);
    for (idx in faux_pattern){
        mgraphics.move_to(start_x, start_y + (idx * settings_font_size));
        var pattern_row = fmt(idx) + faux_pattern[idx]
        mgraphics.show_text(pattern_row);
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
