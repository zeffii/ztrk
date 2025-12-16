// include("ztrk_patternClass.js");
outlets = 3;
inlets = 4;

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
var text_w = 1;
var text_h = settings_font_size;

var started_selection_mode = false;
var g_updating_selection = true;

var sel_x_start = 30; 
var sel_y_start = 30;

var caret = { row: 0, col: 0 };
var anchor = null;

var g_pattern_octave = 4;

function set_rgb(color, dimming){
    mgraphics.set_source_rgba(color.r / dimming, color.g / dimming, color.b / dimming, 1);
}


var faux_pattern = [];

function make_empty_pattern(markup, ntracks){
    // ntracks not handled yet, ntracks is to define how many note+params tracks show up
    // this is destinct from globals.
    var pattern = [];

    var param_track = [];
    for (var i=0; i < Object.keys(markup.descriptors.track).length; i++){
        param_track.push(markup.descriptors.track[i][0]);
    }

    var lexical_descriptor = param_track.join(' ');
    markup.track = lexical_descriptor;
    const empty_row = lexical_descriptor.replace(/\S/g, ".");
    
    for (var i = 0; i < markup.length; i++) {
        pattern.push(empty_row);
    }
    return pattern;
}

var pattern_markup = {
    length: 32,
    descriptors: {
        global: {
            0: ['hh', 'Spatial'],
            1: ['hh', 'Clarity'],
            2: ['hh', 'Smoothness'],
            3: ['hh', 'Crispyness']
        },
        track: {
            0: ['nnn', 'Note'],
            1: ['hh', 'Volume'],
            2: ['hhhh', 'Offset'],
            3: ['b', 'Trigger'],
            4: ['hh', 'Volume'], 
            5: ['b', 'Trigger'], 
            6: ['hh', 'Volume'],
            7: ['b', 'Trigger'], 
            8: ['hh', 'Volume'],
            9: ['b', 'Trigger'], 
            10: ['hh', 'Volume'],
            11: ['b', 'Trigger'], 
            12: ['hh', 'Volume']
        }
    },
    data: []
};

faux_pattern = make_empty_pattern(pattern_markup, 1);
pattern_markup.data = faux_pattern;

var rows = pattern_markup.length;
var cols = pattern_markup.track.length;

//track: "nnn hh ss hh hhhh hh hhhh"
// ttt  = ticks
// nnn  = note
// hh   = 2hex
// ss   = short (ints 0..80)
// hhhh = 4hex
// b    = bang/trigger  ( 1 or .)
// ggg  = signed (-20 .. +20)

// untested.

function find_idx_after_space(str) {
    const indices = [];
  
    indices.push(0);
    for (var i = 1; i < str.length; i++) {
        if (str[i - 1] === ' ') {
            indices.push(i);
        }
    }
    return indices;
}

function find_2hex_indices(str) {
    var regex = /\bh{2}\b/g;
    var indices = [];
    var match;

    while ((match = regex.exec(str)) !== null) {
        indices.push(match.index);
    }

    return indices;
}

function found_in(iterable, number){
    return iterable.indexOf(number) !== -1;
}

function replaceAt(str, index, replacement, count) {
    return str.substr(0, index)
         + replacement
         + str.substr(index + count);
}

function pattern_input_handler(key, caret, desciptor, pattern){

    const NoteClearList = {46: "...", 127: "...", 96: "^^^", 49: "==="};
    if ([0, 1, 2].indexOf(caret.col) !== -1){
        if (caret.col === 0){
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
            } else if (key in NoteClearList ){
                const NoteReplacement = NoteClearList[key];
                const current_row1 = pattern[caret.row];
                pattern[caret.row] = replaceAt(current_row1, caret.col, NoteReplacement, 3);
            }
        }
    }
    if (found_in([12, 17, 22, 27, 32], caret.col)){
        var keybangs = {49: "1", 46: ".", 127: "."};
        if (key in keybangs){
            const key_infoB = keybangs[key];
            const current_rowB = pattern[caret.row];
            pattern[caret.row] = replaceAt(current_rowB, caret.col, key_infoB, 1);
        }
    }

    var hex_deletes = [46, 127];
    const two_hex_indices = find_2hex_indices(pattern_markup.track);
    for (var i=0; i < two_hex_indices.length; i++){
        var [lower_index, upper_index] = [two_hex_indices[i], two_hex_indices[i] + 1];
        // post('[' + lower_index + ', ' + upper_index + ']');
        // iterate over this list the following function
    }

    if (found_in([34, 35], caret.col)){
        // hardcoding, before generalization.
        var charfound = String.fromCharCode(key).toUpperCase();
        var HEXALPHNUM = '0123456789ABCDEF';
        var listed = HEXALPHNUM.split('');
        if (found_in(listed, charfound)){
            var replacement_hex = '';
            // post('>>>', charfound, '\n');
            // first char of 2 character hex input
            if (caret.col === 34){
                replacement_hex += charfound;
                if (pattern[caret.row][35] === '.'){
                    replacement_hex += '0';
                } else {
                    replacement_hex += pattern[caret.row][35];
                }
                pattern[caret.row] = replaceAt(pattern[caret.row], caret.col, replacement_hex, 2);
            }
            else if (caret.col === 35){
                if (pattern[caret.row][34] === '.'){
                    replacement_hex += '0';
                } else {
                    replacement_hex += pattern[caret.row][34];
                }
                replacement_hex += charfound;
                pattern[caret.row] = replaceAt(pattern[caret.row], caret.col-1, replacement_hex, 2);
            }
        } else if (found_in(hex_deletes, key)) {
            pattern[caret.row] = replaceAt(pattern[caret.row], 34, '..', 2);
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

function draw_highlighted_lines(every_nth){
    set_rgb({r: 0.1, g: 0.2, b:0.4}, 1.3);
    var total_draw_amount = Math.floor(pattern_markup.length / Math.max(every_nth, 1));
    for (var i = 0; i < total_draw_amount; i++){
        var tick_y = start_y + (i * every_nth * settings_font_size) - (0.75*text_h) ;
        mgraphics.rectangle(start_x, tick_y, text_w, settings_font_size);
        mgraphics.fill();
    }
}

function draw_edit_mode_indicator(h){

    if (g_in_edit_mode){
        mgraphics.set_source_rgba(0.9, 0.5, 0.5, 1.0);
        mgraphics.rectangle(0, 0, 5, mgraphics.size[1]);
        mgraphics.fill();        
    }
}

function bang(){
    mgraphics.redraw();
    outlet(0, g_pattern_playhead);
    if (faux_pattern){
        outlet(1, faux_pattern[g_pattern_playhead]);
    }
}

function msg_int(tick){
    g_pattern_playhead = tick;
}

function dictionary(dictName) {
    var inputDict = new Dict(dictName);
    var jsObject = JSON.parse(inputDict.stringify());
    pattern_markup = jsObject;
    faux_pattern = pattern_markup.data;
}

function clear(){
    faux_pattern = make_empty_pattern(pattern_markup, 1);
    pattern_markup.data = faux_pattern;    
    mgraphics.redraw();
}

function refresh(){
    mgraphics.redraw();
}

function command(instruction){
    if (instruction === 'export_pattern'){
        post('Exporting Pattern\n');
        var outputDict = new Dict('pattern_data');
        
        pattern_markup.data = faux_pattern;
        outputDict.parse(JSON.stringify(pattern_markup));
        outlet(2, "dictionary", outputDict.name);
    }
}

function wheres_the_caret(){
    // dont do this frequently
    var indices = find_idx_after_space(pattern_markup.track);
    for (var idx = indices.length - 1; idx >= 0; idx--) {
        if (caret.col >= indices[idx]) {
            return [indices[idx], idx];
        }
    }
    return [-1, -1];
}


function draw_track_descriptor(){

    const caret_string = '[' + caret.row + ', ' + caret.col + ']';

    var idx = wheres_the_caret();
    if (idx[0] >= 0) {
        const vidx = idx + 4;
        set_rgb({r: 0.9, g: 0.9, b:0.7}, 1.3);
        mgraphics.move_to(start_x + ((idx[0] + 4) * charwidth), start_y - (0.9 * charheight));
        mgraphics.show_text(pattern_markup.descriptors.track[idx[1]][1]);
        mgraphics.move_to(0, start_y - (1.6 * charheight));
        mgraphics.show_text( caret_string);
    }
}

function key_handler(){

    if (g_mouse_on_rect !== true){
        // you don't want any data interaction if the mouse is not on the rectangle
        return;  
    };

    if (g_in_edit_mode){

        var just_shift = 512;
        var just_ctrl = 4352;
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

            /* if just_ctrl or shift_and_control
                . find your position in the pattern row. move to the nearest start of a parameter
                . move to starts only

            */

            // else
            switch(g_key_codes[0]) {
                case 28: moveCaret(0, -1); break;  // left
                case 29: moveCaret(0,  1); break;  // right
                case 30: moveCaret(-1, 0); break;  // up
                case 31: moveCaret(1, 0); break;  // down
                default: return;
            }
        }

        if (faux_pattern){
            pattern_input_handler(g_key_codes[0], caret, pattern_markup, faux_pattern);
        }

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
    var tx_wh = mgraphics.text_measure('000 ' + pattern_markup.track);  // returns width and height
    text_w = tx_wh[0];
    text_h = tx_wh[1];

    // --- dark background ---
    mgraphics.set_source_rgba(0.1, 0.2, 0.4, 1);
    mgraphics.rectangle(0, 0, w, h);
    mgraphics.fill();

    draw_highlighted_lines(4);

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
    
    draw_edit_mode_indicator();
    draw_selection();
    draw_track_descriptor();

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
