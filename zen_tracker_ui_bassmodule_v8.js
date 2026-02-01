/*

You will always move in the direction of your strongest thought -- so make it a good one.

*/

include("ztrk_pattern_utils.js");

class Tracker  {

    #AbletonMode = true;
    #MatrixMode = false;
    #ztrk_clipboard = {};
    // #faux_pattern = [];
    
    #g_Mouse = [-1, -1];
    #g_in_edit_mode = false;
    #g_key_codes = [];
    #g_mouse_on_rect = false;
    #g_caret = [0, 0];
    
    #started_selection_mode = false;
    #g_updating_selection = true;
    
    #caret = { row: 0, col: 0 };     
    #anchor = null;
    #g_pattern_octave = 4;           // [ todo, implement current octave for input ]

    constructor(pattern_markup, mgraphics, options = {} ){

        this.send = options.send || function() { post("No send function provided"); };

        // make local params
        this.mgraphics = mgraphics;
        this.pattern_markup = pattern_markup;
        this.faux_pattern = this.make_empty_pattern(this.pattern_markup);
        this.pattern_markup.data = this.faux_pattern;

        // set states of local params
        this.g_pattern_playhead = 8;
        this.mgraphics.relative_coords = 0;
        this.mgraphics.autofill = 0;

        this.rows = this.pattern_markup.length;
        this.cols = this.pattern_markup.lexical_track.length;
        this.settings_font_size = 12; //
        this.charwidth = 8;
        this.charheight = this.settings_font_size; 
        this.text_w = 1;
        this.text_h = this.settings_font_size;
        this.start_x = 30;
        this.start_y = 30;

    }

    make_empty_pattern(markup){

        // lexical_track: "nnn hh ss hh hhhh hh hhhh"
        // nnn  = note
        // hh   = 2hex
        // ss   = short (ints 0..80)
        // hhhh = 4hex
        // b    = bang/trigger  ( 1 or .)
        // FFXXYY = COMMAND+ARG
        // ggg  = signed (-20 .. +20)  NOT IMPLEMENTED

        var pattern = [];
        var param_track = [];
        for (var i=0; i < Object.keys(markup.descriptors.track).length; i++){
            param_track.push(markup.descriptors.track[i][0]);
        }

        var lexical_descriptor = param_track.join(' ');
        markup.lexical_track = lexical_descriptor;
        const empty_row = lexical_descriptor.replace(/\S/g, ".");
        
        for (var i = 0; i < markup.length; i++) {
            pattern.push(empty_row);
        }
        return pattern;

    }

    bang(){
        this.send(0, this.g_pattern_playhead);
        if (this.faux_pattern){
             this.send(1, this.faux_pattern[this.g_pattern_playhead]);
        }
        this.mgraphics.redraw();
        //post('latest', this.g_pattern_playhead);
    }

    msg_int(tick){
        this.g_pattern_playhead = tick;
    }

    clear(){
        this.faux_pattern = this.make_empty_pattern(this.pattern_markup);
        this.pattern_markup.data = this.faux_pattern;    
        this.mgraphics.redraw();
    }

    refresh(){
        this.mgraphics.redraw();
    }


    keys(a1, a2, a3, a4) {
        if (a1 === 32 && this.#g_mouse_on_rect){
            this.#g_in_edit_mode = !this.#g_in_edit_mode;
            this.mgraphics.redraw();
        }
        this.#g_key_codes = [a1, a2, a3, a4];
        post(this.#g_key_codes);
    }

    // command(instruction){

    //     if (instruction === 'export_pattern'){
    //         post('Exporting Pattern\n');
    //         var outputDict = new Dict('pattern_data');
            
    //         this.pattern_markup.data = this.faux_pattern;
    //         outputDict.parse(JSON.stringify(this.pattern_markup));
    //         this.outlet(2, "dictionary", outputDict.name);
    //     }
    //     switch (instruction) {
    //         case 'push_to_clip':
    //             push_to_live();
    //             post('here!');
    //             return;
    //         case 'matrixmode=0':
    //             post('setting matrixmode to False data');
    //             return;
    //         case 'matrixmode=1':
    //             post('setting matrixmode to True data');
    //             return;
    //         default: break;
    //     }

    // }


    set_rgb(color, dimming){

        this.mgraphics.set_source_rgba(color.r / dimming, color.g / dimming, color.b / dimming, 1);

    }




    dictionary(dictName) {
        // this is called when a dictionary is passed into the object, it should probably do some update?
        // expect error here.
        var inputDict = new Dict(dictName);
        var jsObject = JSON.parse(inputDict.stringify());
        this.pattern_markup = jsObject;
        this.faux_pattern = this.pattern_markup.data;

    }


    handle_2hex_input(key, caret, desciptor, pattern){
        // 4hex version of this was written after 2hex, use 4hex as inspiration if you plan to rewrite this function.
        var hex_deletes = [46, 127];
        const two_hex_indices = find_regexed_indices(this.pattern_markup.lexical_track, /\bh{2}\b/g);  // hh
        const two_hex_index_pairs = [];
        for (var i=0; i < two_hex_indices.length; i++){
            two_hex_index_pairs.push([two_hex_indices[i], two_hex_indices[i] + 1]);
        }

        var two_hex_indices_found = findSublistContaining(caret.col, two_hex_index_pairs);
        if (two_hex_indices_found !== null){

            var [lower_index, higher_index] = two_hex_indices_found;
            var charfound = String.fromCharCode(key).toUpperCase();
            var HEXALPHNUM = '0123456789ABCDEF';
            var listed = HEXALPHNUM.split('');
            if (found_in(listed, charfound)){
                var replacement_hex = '';

                if (caret.col === lower_index){
                    replacement_hex += charfound;
                    if (pattern[caret.row][higher_index] === '.'){
                        replacement_hex += '0';
                    } else {
                        replacement_hex += pattern[caret.row][higher_index];
                    }
                    pattern[caret.row] = replaceAt(pattern[caret.row], caret.col, replacement_hex, 2);
                }
                else if (caret.col === higher_index){
                    if (pattern[caret.row][lower_index] === '.'){
                        replacement_hex += '0';
                    } else {
                        replacement_hex += pattern[caret.row][lower_index];
                    }
                    replacement_hex += charfound;
                    pattern[caret.row] = replaceAt(pattern[caret.row], caret.col-1, replacement_hex, 2);
                }
            } else if (found_in(hex_deletes, key)) {
                pattern[caret.row] = replaceAt(pattern[caret.row], lower_index, '..', 2);
            }
        }    

    }


    handle_trigger_input(key, caret, desciptor, pattern){

        const trigger_indices = find_regexed_indices(this.pattern_markup.lexical_track, /\bb{1}\b/g);  // b
        if (found_in(trigger_indices, caret.col)){
            var keybangs = {49: "1", 46: ".", 127: "."};
            if (key in keybangs){
                const key_infoB = keybangs[key];
                const current_rowB = pattern[caret.row];
                pattern[caret.row] = replaceAt(current_rowB, caret.col, key_infoB, 1);
            }
        }

    }


    handle_ffxxyy_input(key, caret, desciptor, pattern, param_at_position){

        var hex_deletes = [46, 127];
        var p = param_at_position;

        // post('ffxxyy ---> start:', p.start, ' end: ', p.end, 'current idx in param', p.indexInParam);
        /*
            important to note that ff and xxyy are two separate components of the parameter, (command vs argument)
            where FF and XXYY are 2hex and 4hex respectively. 
                    FF0000
                    FFXXYY
                    ..XXYY
                    ..XXYY
            if FF has a value, then XXYY must also,
            but if XXYY has a value, FF does not automatically need to be input, traditionally this means
            the command in this column-argument-combo is receiving parameter changes.

            interpolation and transposing should be on the XXYY part only.
        */
        var charfound = String.fromCharCode(key).toUpperCase();
        var HEXALPHNUM = '0123456789ABCDEF';
        var listed = HEXALPHNUM.split('');

        if (found_in([0, 1], p.indexInParam)){

            var [index_0, index_1] = [p.start, p.start + 1];
            if (found_in(listed, charfound)){
                var current_param_data = pattern[caret.row].substr(index_0, 2);
                var proposed_param_data = replaceAt(current_param_data, (caret.col - index_0), charfound, 1);
                proposed_param_data = proposed_param_data.replace(/\./g, "0");
                pattern[caret.row] = replaceAt(pattern[caret.row], index_0, proposed_param_data, 2);
            } else if (found_in(hex_deletes, key)) {
                pattern[caret.row] = replaceAt(pattern[caret.row], index_0, '..', 2);
            }


        } else if (found_in([2, 3, 4, 5], p.indexInParam)){

            var [index_0, index_1, index_2, index_3] = [p.start + 2, p.start + 3, p.start + 4, p.start + 5];
            if (found_in(listed, charfound)){
                var current_param_data = pattern[caret.row].substr(index_0, 4);
                var proposed_param_data = replaceAt(current_param_data, (caret.col - index_0), charfound, 1);
                proposed_param_data = proposed_param_data.replace(/\./g, "0");
                pattern[caret.row] = replaceAt(pattern[caret.row], index_0, proposed_param_data, 4);
            } else if (found_in(hex_deletes, key)) {
                pattern[caret.row] = replaceAt(pattern[caret.row], index_0, '....', 4);
            }
        }


    }


    handle_4hex_input(key, caret, desciptor, pattern, param_at_position){

        var hex_deletes = [46, 127];
        const four_hex_indices = find_regexed_indices(this.pattern_markup.lexical_track, /\bh{4}\b/g);  // hhhh
        const four_hex_index_pairs = [];
        for (var i=0; i < four_hex_indices.length; i++){
            four_hex_index_pairs.push(
                [four_hex_indices[i], 
                four_hex_indices[i] + 1,
                four_hex_indices[i] + 2,
                four_hex_indices[i] + 3]);
        }

        var four_hex_indices_found = findSublistContaining(caret.col, four_hex_index_pairs);
        if (four_hex_indices_found !== null){

            var [index_0, index_1, index_2, index_3] = four_hex_indices_found;
            var charfound = String.fromCharCode(key).toUpperCase();
            var HEXALPHNUM = '0123456789ABCDEF';
            var listed = HEXALPHNUM.split('');

            if (found_in(listed, charfound)){
                var current_param_data = pattern[caret.row].substr(index_0, 4);
                var proposed_param_data = replaceAt(current_param_data, (caret.col - index_0), charfound, 1);
                proposed_param_data = proposed_param_data.replace(/\./g, "0");
                pattern[caret.row] = replaceAt(pattern[caret.row], index_0, proposed_param_data, 4);
            } else if (found_in(hex_deletes, key)) {
                pattern[caret.row] = replaceAt(pattern[caret.row], index_0, '....', 4);
            }
        }

    };


    handle_note_input(key, caret, desciptor, pattern){

        const NoteClearList = {46: "...", 127: "...", 96: "^^^", 49: "==="};
        const note_indices = find_regexed_indices(this.pattern_markup.lexical_track, /\bn{3}\b/g);   // nnn
        if (note_indices.length){
            // post('note_indices :', note_indices, '\n');

            const note_index_pairs = [];
            for (var i=0; i < note_indices.length; i++){
                var index_0 = note_indices[i];
                var index_1 = index_0 + 1;
                var index_2 = index_0 + 2;
                note_index_pairs.push([index_0, index_1, index_2]);
            }
            // post('note_index_pairs :', note_index_pairs);

            var notefield_indices_found = findSublistContaining(caret.col, note_index_pairs);
            if (notefield_indices_found === null){
                return;  // caret is not in a notefield
            }

            // only allow full note input on first element of note field
            var notefield_first_index = notefield_indices_found[0];
            if (caret.col === notefield_first_index){
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
                    const note = String(key_info[0]) + String(key_info[1] + this.#g_pattern_octave);
                    pattern[caret.row] = replaceAt(current_row, caret.col, note, 3);

                } else if (key in NoteClearList){

                    // this can be moved into a loop over the 3 indices, so input can be handled in all three
                    const NoteReplacement = NoteClearList[key];
                    const current_row1 = pattern[caret.row];
                    pattern[caret.row] = replaceAt(current_row1, caret.col, NoteReplacement, 3);
                }

            }
        }

    }


    pattern_input_handler(key, caret, desciptor, pattern){

        const param_at_position = getParameterTypeAtPosition(desciptor.lexical_track, caret.col);
        if (param_at_position == null){
            return;  // in space column
        }

        switch (param_at_position.type) {
          case 'nnn':
            this.handle_note_input(key, caret, desciptor, pattern); break;
          case 'hh':
            this.handle_2hex_input(key, caret, desciptor, pattern); break;
          case 'b':
            this.handle_trigger_input(key, caret, desciptor, pattern); break;
          case 'hhhh':
            this.handle_4hex_input(key, caret, desciptor, pattern, param_at_position); break;
          case 'ffxxyy':
            this.handle_ffxxyy_input(key, caret, desciptor, pattern, param_at_position); break;        
          default:
            break;
        }    

    }


    moveCaret(dr, dc) {
        this.#caret.row = clamp(this.#caret.row + dr, 0, this.rows - 1);
        this.#caret.col = clamp(this.#caret.col + dc, 0, this.cols - 1);
    }

    getSelectionRect() {
        if (!this.#anchor) return null;
        return {
            top:    Math.min(this.#anchor.row, this.#caret.row),
            left:   Math.min(this.#anchor.col, this.#caret.col),
            bottom: Math.max(this.#anchor.row, this.#caret.row),
            right:  Math.max(this.#anchor.col, this.#caret.col)
        };

    }

    caret_to_location(){
        var caret_x = this.start_x + ((4 + this.#caret.col) * this.charwidth);
        var caret_y = this.start_y + (this.#caret.row * this.charheight);
        return [caret_x, caret_y];

    }

    corner_to_location(x, y){
        var _x = this.start_x + ((4 + x) * this.charwidth);
        var _y = this.start_y + (y * this.charheight);
        return [_x, _y];   

    }


    wheres_the_caret(){
        // dont do this frequently
        var indices = find_idx_after_space(this.pattern_markup.lexical_track);
        for (var idx = indices.length - 1; idx >= 0; idx--) {
            if (this.#caret.col >= indices[idx]) {
                return [indices[idx], idx];
            }
        }
        return [-1, -1];
    }

    handle_delete_selection(pattern){

        if (this.#started_selection_mode){
            this.handle_copy_selection(pattern);
            var selection = this.getSelectionRect();
            // this implementation will operate all selected parameters, even if a parameter is only partially
            // in the selection. This is unlike interpolation, where there is a case to make for partial interpolats.
            var selection_start = selection.left;
            var selection_length = (selection.right - selection.left) + 1;

            // First establish if the selection contains partials. extend if needed.
            // is selection.left at index0 of the param?
            // is selection right at indexN of the param?
            var xx_first_param = getParameterTypeAtPosition(this.pattern_markup.lexical_track, selection_start);
            var xx_last_param = getParameterTypeAtPosition(this.pattern_markup.lexical_track, selection.right);

            if (xx_first_param !== null){ 
                selection_start = xx_first_param.start;
            }
            if (xx_last_param !== null){
                selection_length = (xx_last_param.end - xx_first_param.start) + 1;
            }

            for (var row = selection.top; row <= selection.bottom; row++){
                var row_substr = pattern[row].substr(selection_start, selection_length);
                row_substr = row_substr.replace(/[^ ]/g, '.');
                pattern[row] = replaceAt(pattern[row], selection_start, row_substr, selection_length);
            }

            this.push_to_live();
            this.refresh();
            return true;
        }
        return false;

    }

    get_adjusted_selection_rect(){

        var selection = this.getSelectionRect();
        var selected_num_rows = (selection.bottom - selection.top) + 1;
        var selection_start = selection.left;
        var selection_length = (selection.right - selection.left) + 1;

        // extend selection left + right if some parameters are not fully selected.
        var xx_first_param = getParameterTypeAtPosition(this.pattern_markup.lexical_track, selection_start);
        var xx_last_param = getParameterTypeAtPosition(this.pattern_markup.lexical_track, selection.right);
        if (xx_first_param !== null){ selection_start = xx_first_param.start; }
        if (xx_last_param !== null){ selection_length = (xx_last_param.end - xx_first_param.start) + 1; }

        return {
            'start_index': selection_start,
            'selection_length': selection_length,
            'top': selection.top,
            'bottom': selection.bottom,
            'num_rows': selected_num_rows
        }

    }

    handle_interpolate_selection(pattern){

        if (this.#started_selection_mode){
            /*
                - which parameters of the selection have values at the start and end of the selection (in rows);
                - only operate on those parameters.
                - collect start and end value for each such parameter, create a linear interpolation for now.
                - i can add a console command to do `> itpl 1`  (linear)  `> itpl 0.3` (accelerating ramp)  1.5 decel
            */
            // post('Interpolating:\n');
            var selection = this.getSelectionRect();
            var selected_num_rows = (selection.bottom - selection.top) + 1;
            if (selected_num_rows < 3){
                return true;
            }

            var selection_start = selection.left;
            var selection_length = (selection.right - selection.left) + 1;

            // extend selection left + right if some parameters are not fully selected.
            var xx_first_param = getParameterTypeAtPosition(this.pattern_markup.lexical_track, selection_start);
            var xx_last_param = getParameterTypeAtPosition(this.pattern_markup.lexical_track, selection.right);
            if (xx_first_param !== null){ selection_start = xx_first_param.start; }
            if (xx_last_param !== null){ selection_length = (xx_last_param.end - xx_first_param.start) + 1; }

            // get content of the first and last selected row, to prepare interpolation attempt
            var substr_start = pattern[selection.top].substr(selection_start, selection_length);
            var substr_end = pattern[selection.bottom].substr(selection_start, selection_length);
            var start_list = substr_start.split(' ');
            var end_list = substr_end.split(' ');

            var interpolation_dict = {};
            // we will only interpolate a parameter if it is in the first and last row of the selection
            // we skip trigger interpolations. so.. 2hex and 2hex and notes only..for now.
            for (var param_col = 0; param_col < start_list.length; param_col++){
                var param_length = start_list[param_col].length;
                if (param_length > 1){
                    if ( !isOnlyDots(start_list[param_col]) && !isOnlyDots(end_list[param_col]) ){
                        interpolation_dict[param_col] = interpolate(start_list[param_col], end_list[param_col], selected_num_rows);
                    }
                }
            }

            // we could (and probably should) skip the first and last row as they should be the same.
            for (var row = selection.top; row <= selection.bottom; row++){

                var row_repr = pattern[row].substr(selection_start, selection_length);
                var splitted_row = row_repr.split(' ');
                var rebuilt_list_of_strings = []

                for (var param_idx = 0; param_idx < splitted_row.length; param_idx++){
                    if (interpolation_dict.hasOwnProperty(param_idx)){
                        if (splitted_row[param_idx].length === 6){
                            // this needs to inject the existing command back into the interpolation parameter
                            var argmnt = interpolation_dict[param_idx].shift();
                            var command = splitted_row[param_idx].slice(0, 2);
                            var new_parameter = command + argmnt;
                            rebuilt_list_of_strings.push(new_parameter);
                        } else {
                            rebuilt_list_of_strings.push(interpolation_dict[param_idx].shift());
                        }

                    } else {
                        rebuilt_list_of_strings.push(splitted_row[param_idx]);
                    }
                }
                var replacement_part = rebuilt_list_of_strings.join(' ');
                pattern[row] = replaceAt(pattern[row], selection_start, replacement_part, selection_length);
            }

            this.push_to_live();
            this.refresh();
            return true;
        }
        return false;

    }


    handle_copy_selection(pattern){

        // post('initiating copy function\n');
        var sel_rect = this.get_adjusted_selection_rect();
        //  selection_info: {start_index: 7  selection_length: 29  top: 2  bottom: 8  num_rows: 7}
        //  selection_data: [rows,....]
        this.#ztrk_clipboard = {
            'selection_info': sel_rect,
            'selection_data': []
        }
        for (var row = sel_rect.top; row <= sel_rect.bottom; row++){
            var this_row_data = pattern[row].substr(sel_rect.start_index, sel_rect.selection_length);
            this.#ztrk_clipboard.selection_data.push(this_row_data);
        }
    }


    handle_shift_selection(pattern, direction){

        if (this.#started_selection_mode){
            var remap_main = {30: 'UP', 31: 'DOWN'};

            // post('----> initiating shift function', remap_main[direction], '\n');
            var sel_rect = this.get_adjusted_selection_rect();
            //  selection_info: {start_index: 7  selection_length: 29  top: 2  bottom: 8  num_rows: 7}
            //  selection_data: [rows,....]
            this.#ztrk_clipboard = {
                'selection_info': sel_rect,
                'selection_data': []
            }
            for (var row = sel_rect.top; row <= sel_rect.bottom; row++){
               var this_row_data = pattern[row].substr(sel_rect.start_index, sel_rect.selection_length);
               this.#ztrk_clipboard.selection_data.push(this_row_data);
            }

            if (remap_main[direction] === 'UP'){
                var first_element = this.#ztrk_clipboard.selection_data.shift();
                this.#ztrk_clipboard.selection_data.push(first_element);
            }
            else if (remap_main[direction] === 'DOWN'){
                var last_element = this.#ztrk_clipboard.selection_data.pop();
                this.#ztrk_clipboard.selection_data.unshift(last_element);
            }

            var idx = sel_rect.top;
            for (const paste_row_idx in this.#ztrk_clipboard.selection_data){
                var replacement_part = this.#ztrk_clipboard.selection_data[paste_row_idx];
                pattern[idx] = replaceAt(pattern[idx], sel_rect.start_index, replacement_part, sel_rect.selection_length);
                idx++;
            }

            this.push_to_live();
            this.refresh();
            return true;
        }
        return false;
    }

    handle_transpose_selection(pattern, direction){

        // post('initiating transpose function: ' + direction + '\n');
        if (this.#started_selection_mode){

            var sel_rect = this.get_adjusted_selection_rect();
            //  selection_info: {start_index: 7  selection_length: 29  top: 2  bottom: 8  num_rows: 7}
            //  selection_data: [rows,....]
            this.#ztrk_clipboard = {
                'selection_info': sel_rect,
                'selection_data': []
            }
            for (var row = sel_rect.top; row <= sel_rect.bottom; row++){
                var this_row_data = pattern[row].substr(sel_rect.start_index, sel_rect.selection_length);
                var row_data = this_row_data.split(' ');
                var new_row_data = [];
                for (const param_idx in row_data){
                    var adjusted_value = transpose_value(row_data[param_idx], direction);
                    // post(row_data[param_idx], 'vs', adjusted_value);
                    new_row_data.push(adjusted_value);
                }
                var replacement_part = new_row_data.join(' ');
                pattern[row] = replaceAt(pattern[row], sel_rect.start_index, replacement_part, sel_rect.selection_length);

            }

            this.push_to_live();
            this.refresh();
            return true;
        }
        return false;
    }

    handle_paste_selection(pattern){

        post('initiating paste function\n');
        /*  
            a few thoughts here.
            - how complex do i want to this be, will i allow mixing selection origins. 
                (ie do i allow pasting as long as the destination is compatible with the current clipboard data)
            - mix paste/overwrite/inject is a different function
            
            for now i will force a start_index to override the cursor location, only row index of caret
            will be used. It's just a choice.
        */
        if (this.#ztrk_clipboard.selection_info && this.#ztrk_clipboard.selection_data.length){
            // post('\n --------selection start----------\n');
            // for (row_idx in ztrk_clipboard.selection_data){
            //     post(ztrk_clipboard.selection_data[row_idx] + '\n');
            // }
            // post(' --------selection end----------\n');

            var selection_start = this.#ztrk_clipboard.selection_info.start_index; // in X axis, column
            var selection_length = this.#ztrk_clipboard.selection_info.selection_length;
            var idx = this.#caret.row;
            for (const paste_row_idx in this.#ztrk_clipboard.selection_data){
                var replacement_part = this.#ztrk_clipboard.selection_data[paste_row_idx];
                pattern[idx] = replaceAt(pattern[idx], selection_start, replacement_part, selection_length);
                idx++;

                if (idx >= pattern.length){
                    break;
                }
            }

            this.push_to_live();
            this.refresh();
        }
    }


    key_handler(){

        if (!this.faux_pattern){
            return;
        }

        if (this.#g_mouse_on_rect !== true){
            // you don't want any data interaction if the mouse is not on the rectangle
            return;  
        };

        if (this.#g_in_edit_mode){

            var SHIFT = 512;
            var ALT = 2048;
            var CTRL = 4352;
            var CTRL_SHIFT = 4864;

            var DELETE = 127;
            var PAGE_UP = 11;
            var PAGE_DOWN = 12;
            var C_KEY = 3;
            var V_KEY = 22;
            var X_KEY = 24;
            var [UP_KEY, DOWN_KEY] = [30, 31];
            var [LEFT_KEY, RIGHT_KEY] = [28, 29];
            var SELECTOR = this.#g_key_codes[2];
            var USER_KEY = this.#g_key_codes[0];
            var [MINUS, PLUS] = [95, 43];   // not the numkey ones at the moment.

            /*
            maxmsp captures some of the kb shortcuts for its own purposes:
            - ctrl+I = inspector
            - f5 = magnifying glass
            - ..and a few others i'm forgetting right now
            This means i'm substituting occupied ones for similar but available ones. 
            Not ideal but it does tempt me to implement some input hardware for interaction.

            */

            if (SELECTOR === ALT){
                if (found_in([UP_KEY, DOWN_KEY], USER_KEY)){
                    if (this.handle_shift_selection(this.faux_pattern, USER_KEY)){ return; }
                }
            }

            if (SELECTOR === SHIFT){
                if (String.fromCharCode(USER_KEY).toUpperCase() === 'I'){
                    if (this.handle_interpolate_selection(this.faux_pattern)){ return; } 
                }
                switch(USER_KEY){
                    case MINUS: this.handle_transpose_selection(this.faux_pattern, 'DOWN'); return;
                    case PLUS: this.handle_transpose_selection(this.faux_pattern, 'UP'); return;
                    default: break;
                }
            }

            if (SELECTOR === CTRL){
                switch(USER_KEY) {
                    case C_KEY: this.handle_copy_selection(this.faux_pattern); return;
                    case V_KEY: this.handle_paste_selection(this.faux_pattern); return;
                    case X_KEY: this.handle_delete_selection(this.faux_pattern); return;
                    default: break;
                }
            }

            var directions = [LEFT_KEY, RIGHT_KEY, UP_KEY, DOWN_KEY];
            var direction_input = (directions.indexOf(USER_KEY) !== -1);

            const shift_or_ctrlshift = found_in([SHIFT, CTRL_SHIFT], SELECTOR);
            if (shift_or_ctrlshift && direction_input){
                if (this.#started_selection_mode){
                    post('modifying selection rectangle\n');
                } else {
                    // means the section is going to start at cursor index x, y, w, h where w and h are 1.
                    this.#anchor = { row: this.#caret.row, col: this.#caret.col };
                    post('starting selection mode\n');
                    this.#started_selection_mode = true;
                }

            } else {
                this.#started_selection_mode = false;
                this.#anchor = null;
            }

            if (direction_input){

                if (found_in([CTRL, CTRL_SHIFT], SELECTOR)){

                    var param_starts = find_idx_after_space(this.pattern_markup.lexical_track);
                    var [left_distance, right_distance] = [-1, 1];
                    var [low, high] = [1, 1];

                    for (var i=0; i < param_starts.length; i++){
                        if (USER_KEY === LEFT_KEY){
                        
                            if (this.#caret.col === 0){ 
                                left_distance = 0;
                                break;
                            }
                            if (param_starts[i] >= this.#caret.col){ break; }
                            low = param_starts[i];
                            left_distance = this.#caret.col - low;

                        } else if (USER_KEY === RIGHT_KEY){

                            if (this.#caret.col === (this.pattern_markup.lexical_track.length - 1)){
                                right_distance = 0;
                                break;
                            }
                            if (param_starts[i] > this.#caret.col){
                                high = param_starts[i];
                                right_distance = high - this.#caret.col;
                                break
                            }
                        }
                    }

                    switch(USER_KEY) {
                        case LEFT_KEY: this.moveCaret(0, -left_distance); break;
                        case RIGHT_KEY: this.moveCaret(0,  right_distance); break;
                        case UP_KEY: this.moveCaret(-2, 0); break;
                        case DOWN_KEY: this.moveCaret(2, 0); break;
                        default: return;
                    }

                } else {

                    switch(USER_KEY) {
                        case LEFT_KEY: 
                            this.moveCaret(0, -1);
                            var over_a_space = (this.pattern_markup.lexical_track.charAt(this.#caret.col) === ' ');
                            if (over_a_space){ this.moveCaret(0, -1); } // move to the next tick
                            break;
                        case RIGHT_KEY: 
                            this.moveCaret(0,  1); 
                            var over_a_space = (this.pattern_markup.lexical_track.charAt(this.#caret.col) === ' ');
                            if (over_a_space){ this.moveCaret(0, 1); }
                            break;
                        case UP_KEY: this.moveCaret(-1, 0); break;
                        case DOWN_KEY: this.moveCaret(1, 0); break;
                        default: return;
                    }
                }
            }
            
            this.pattern_input_handler(USER_KEY, this.#caret, this.pattern_markup, this.faux_pattern);

            // we can restrict this to redraw iff there are updates, but for now this is convenient.
            this.mgraphics.redraw();
        }
    }


    draw_caret(){

        const [offset_x, offset_y] = this.caret_to_location();
        this.mgraphics.set_source_rgba(0.7, 0.2, 0.4, 1);
        this.mgraphics.rectangle(offset_x, offset_y - (0.9 * this.charheight), this.charwidth, this.charheight);
        this.mgraphics.fill();        

    }

    draw_selection(){

        var selection = this.getSelectionRect();
        if (!this.#started_selection_mode && !selection){ return; }
        // post('selection:', selection.top, selection.bottom, selection.left, selection.right, '\n');

        const [cx, cy] = this.corner_to_location(selection.left, selection.top);
        var rect_width = Math.abs((selection.right - selection.left)) * this.charwidth;
        var rect_height = Math.abs(selection.top - selection.bottom-1) * this.charheight;
        this.mgraphics.set_source_rgba(0.7, 0.7, 0.9, 1);
        this.mgraphics.rectangle(cx, cy-(this.charheight * 0.9), rect_width + this.charwidth, rect_height);
        this.mgraphics.stroke();

    }

    draw_highlighted_lines(every_nth){

        this.set_rgb({r: 0.1, g: 0.2, b:0.4}, 1.3);
        var total_draw_amount = Math.floor(this.pattern_markup.length / Math.max(every_nth, 1));
        for (var i = 0; i < total_draw_amount; i++){
            var tick_y = this.start_y + (i * every_nth * this.settings_font_size) - (0.75 * this.text_h);
            this.mgraphics.rectangle(this.start_x, tick_y, this.text_w, this.settings_font_size);
            this.mgraphics.fill();
        }
    }

    draw_edit_mode_indicator(h){

        if (this.#g_in_edit_mode){
            this.mgraphics.set_source_rgba(0.9, 0.5, 0.5, 1.0);
            this.mgraphics.rectangle(0, 0, 5, this.start_y - this.text_h);
            this.mgraphics.fill();        
        }
    }

    draw_command_background(markup){
        /*
        draws rectangles under the command part of the ffxxyy parameter tracks/columns
        This is not essential but adds UI contrast.
        */
        var param_indices = find_regexed_indices(markup.lexical_track, /\bffxxyy\b/g);
        var xx_start = this.start_x + (4 * this.charwidth); // where to start from
        var rect_length = this.charheight * markup.length;
        var rect_y_start = (this.start_y - (0.9 * this.charheight));
        // post(this.faux_pattern.length);
        for (const idx in param_indices){
            this.mgraphics.set_source_rgba(0.1, 0.1, 0.3, 0.42);
            this.mgraphics.rectangle(xx_start + (param_indices[idx] * this.charwidth), rect_y_start, (this.charwidth * 2), rect_length);
            this.mgraphics.fill();
        }
    }

    draw_command_overlay(markup){
        /*
        if the ff column of the ffxxyy track has a value other than two dots (..) 
        this draws the cmd value using a different colour for UI contrast. 
        */
        var param_indices = find_regexed_indices(markup.lexical_track, /\bffxxyy\b/g);
        var xx_start = this.start_x + (4 * this.charwidth); // where to start from
        for (const idx in param_indices){

            var start_idx = param_indices[idx];
            this.mgraphics.set_source_rgba(0.1, 0.5, 0.8, 1.);
            for (var pidx = 0; pidx < markup.length; pidx++){
                var tx = xx_start + (start_idx * this.charwidth);

                var command = this.faux_pattern[pidx].slice(start_idx, start_idx+2);
                if (command !== '..'){
                    mgraphics.move_to(tx, this.start_y + (pidx * this.settings_font_size));
                    mgraphics.show_text(command);
                }
            }
        }
    }

    draw_tick_position(tick){
        var gfx = this.mgraphics;        

        var tick_y = this.start_y + (this.g_pattern_playhead * this.settings_font_size) - (0.75 * this.text_h);
        gfx.set_source_rgba(0.1, 0.1, 0.1, 1);  // almost black
        gfx.rectangle(this.start_x, tick_y, this.text_w, this.settings_font_size);
        gfx.fill();
    }

    draw_pattern_data(){
        var gfx = this.mgraphics;

        gfx.set_source_rgba(0.4, 0.9, 1.0, 1);
        for (const idx in this.faux_pattern){
            gfx.move_to(this.start_x, this.start_y + (idx * this.settings_font_size));
            var pattern_row = fmt(idx) + this.faux_pattern[idx];
            gfx.show_text(pattern_row);
        }
    }

    dark_background(){
        var gfx = this.mgraphics;
        var [w, h] = gfx.size;
        gfx.set_source_rgba(0.1, 0.2, 0.4, 1);
        gfx.rectangle(0, 0, w, h);
        gfx.fill();
    }

    push_to_live(){
        if (this.#AbletonMode === 1){ MakeSimpleNoteDictFromArrays(this.pattern_markup); }
    }

    get_text_width_and_height(){
        var gfx = this.mgraphics;
        var w = gfx.size[0];
        var h = gfx.size[1];

        gfx.set_font_size(this.settings_font_size);
        gfx.select_font_face("Consolas", "normal", "normal");
        this.charwidth = gfx.text_measure('_')[0];
        
        var tx_wh = gfx.text_measure('000 ' + this.pattern_markup.lexical_track);  // returns width and height
        this.text_w = tx_wh[0];
        this.text_h = tx_wh[1];        

    }

    draw_track_descriptor(){

        // draw at bottom
        var gfx = this.mgraphics;
        var [w, h] = gfx.size;

        this.set_rgb({r: 0.2, g: 0.3, b:0.2}, 2.3);
        gfx.rectangle(0, h-this.charheight, w, this.charheight);
        gfx.fill();

        const caret_string = '[' + this.#caret.row + ', ' + this.#caret.col + ']';

        var idx = this.wheres_the_caret();
        if (idx[0] >= 0) {
            const vidx = idx + 4;
            this.set_rgb({r: 0.9, g: 0.9, b:0.7}, 1.3);
            // mgraphics.move_to(start_x + ((idx[0] + 4) * charwidth), start_y - (0.9 * charheight));
            var locator_width = this.mgraphics.text_measure(caret_string + '  ')[0];
            gfx.move_to(locator_width, h - (0.25 * this.charheight));
            gfx.show_text(this.pattern_markup.descriptors.track[idx[1]][1]);

            gfx.move_to(0 + this.charwidth, h - (0.25 * this.charheight));
            gfx.show_text(caret_string);
            var version_identifier = 'ztrk v.003';
            var identifier_width = this.mgraphics.text_measure(version_identifier + ' ')[0];

            gfx.move_to(w - identifier_width, h - (0.25 * this.charheight));
            gfx.show_text(version_identifier);
        }
    }

    draw_scrollbars(){
        // these are not interactive
        var gfx = this.mgraphics;
        var [w, h] = gfx.size;

        var data_width = this.start_x + this.text_w;
        if (w < data_width){

            var hidden_portion = (w / data_width) * w;
            this.set_rgb({r: 0.2, g: 0.2, b:0.2}, 1.0);
            gfx.rectangle(this.start_x, 0, w, 10);
            gfx.fill();
            
            var wdim = hidden_portion - this.start_x;
            if (wdim > 0){
                this.set_rgb({r: 0.1, g: 0.1, b:0.1}, 1.0);
                gfx.rectangle(this.start_x, 0, wdim, 10);
                gfx.fill();            
            }
        }

        var data_height = this.start_y + ((this.pattern_markup.length + 0.2) * this.charheight);
        if (h < data_height ){
            this.set_rgb({r: 0.1, g: 0.1, b:0.1}, 1.0);
            gfx.rectangle(0, this.start_y, 10, (h - this.start_y));
            gfx.fill();
        }

    }

    paint(){

        this.get_text_width_and_height()

        this.dark_background();
        this.draw_highlighted_lines(4);
        this.draw_tick_position();
        this.draw_command_background(this.pattern_markup);
        this.draw_caret();
        this.draw_pattern_data();
        this.draw_command_overlay(this.pattern_markup);  // if this is slowing stuff down, comment it out.
        this.draw_edit_mode_indicator();
        this.draw_selection();
        this.draw_track_descriptor();
        this.draw_scrollbars();

    }

    find_cell_under_cursor(x, y){

        var caret_range_x_start = this.start_x + (4 * this.charwidth);
        var caret_range_y_start = this.start_y - this.charheight;
        if ((x >= caret_range_x_start ) && (y >= caret_range_y_start)){
            var cell_x = Math.floor((x - caret_range_x_start) / this.charwidth);
            var cell_y = Math.floor((y - caret_range_y_start) / this.charheight);
            if ((cell_x < this.pattern_markup.lexical_track.length) && (cell_y < this.pattern_markup.length)){
                this.#caret.row = cell_y;
                this.#caret.col = cell_x;
            }
        }
    }


    onclick(x, y, button){
        this.#g_Mouse = [x, y];
        if (this.#g_in_edit_mode){
            this.find_cell_under_cursor(x, y);
        }
        this.mgraphics.redraw();
    }

    ondrag(x, y, button){ return; }

    onidle(x, y, button, mod1, shift, caps, opt, mod2) { this.#g_mouse_on_rect = true; }
    onidleout(x, y, button, mod1, shift, caps, opt, mod2) { this.#g_mouse_on_rect = false; }

};



