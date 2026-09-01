autowatch = 1;
outlets = 2;
inlets = 2;

mgraphics.init();
mgraphics.relative_coords = 0;
mgraphics.autofill = 0;

var theme_colors = {
    edit_indicator_color: [0.9, 0.5, 0.5, 1.0],
    def_gen_color: [0.2, 0.4, 0.5, 1.0],
    def_fx_color: [0.9, 0.34, 0.3, 1.0],
    time_markers: [0.4, 0.9, 1.0, 1.0],
    ticks_column: [0.4, 0.9, 1.0, 1.0],
    bg_color: [0.1, 0.2, 0.4, 1.0],
    header_text: [0.4, 0.9, 1.0, 1]
}

var settings_font_size = 12;
var charwidth = 0;
var charheight = 0;
var trk_width = 0;
var side_width = 0;
var global_tick = 0;

var g_env = get_environment(); post(g_env);
var g_song_name = "Demo Song";
var g_song_folder = null;
var g_in_edit_mode = 0;
var g_display_pattern_menu = 0;
var g_looping = false;
var g_loop_start = 0;
var g_loop_end = 128;
var [rows, cols] = [64, 3];
var g_tcaret = {row:0, col:0};

// selection / editing state / pattern identity.
var selected_pattern_in_menu = 0;
var g_selected_pattern_idx = -1;
var g_next_pname_counter = 8; // bump this whenever a clone/slice creates a new pattern
var g_uid_tiebreak = 0;
const next_pattern_uid = () => `${Date.now()}_${g_uid_tiebreak++}`;

// a pending selection *rectangle*, in caret index-space (row/col), not px.
// Shift commences it (anchor = current caret), then plain arrow presses
// move the caret which doubles as the far corner -- the rect is always
// derived live from {g_sel_anchor, g_tcaret}, no separate drag state.
var g_selection_active = false;
var g_sel_anchor = {row: 0, col: 0};

// keyboard only acts while the mouse sits over this ui, same convention as
// the pattern editor: onidle/onidleout flip this, keys() reads g_key_codes.
var g_mouse_on_rect = false;
var g_key_codes = [];

// just to test initial state.
var uid_01 = next_pattern_uid();
var uid_04 = next_pattern_uid();
var uid_07 = next_pattern_uid();
var uid_02 = next_pattern_uid();
var uid_05 = next_pattern_uid();
var uid_03 = next_pattern_uid();
var uid_06 = next_pattern_uid();

var sequencer_config = {
    tracks: [
        {trk: 0, trk_name: "gen.00", machine: "notes4+", trk_symbol: "Λ", kind: "gen", patterns: []},    // will just contain references with a puid (see add_pattern)
        {trk: 1, trk_name: "gen.01", machine: "notes5+", trk_symbol: "Λ", kind: "gen", patterns: []},
        {trk: 2, trk_name: "fx.01",  machine: "FX2+", trk_symbol: "φ", kind: "fx", patterns: []}
    ],
    patterns: [   /*  This is the pool of patterns to pick from for each machine / trk */
        {trk: 0, patterns: [
            {pname: "01", puid: uid_01, length: 32, color: [0.2, 0.4, 0.5], data: []},   // 0
            {pname: "04", puid: uid_04, length: 64, color: [0.2, 0.4, 0.5], data: []},   // 128
            {pname: "07", puid: uid_07, length: 32, color: [0.2, 0.4, 0.5], data: []}    // 288
        ]},
        {trk: 1, patterns: [
            {pname: "02", puid: uid_02, length: 48, color: [0.2, 0.4, 0.5], data: []},   // 16
            {pname: "05", puid: uid_05, length: 16, color: [0.2, 0.4, 0.5], data: []}    // 192
        ]},
        {trk: 2, patterns: [
            {pname: "03", puid: uid_03, length: 64, color: [0.9, 0.34, 0.3], data: []},  // 64
            {pname: "06", puid: uid_06, length: 16, color: [0.9, 0.34, 0.3], data: []}   // 256
        ]}
    ],
    machines: {
        "notes4+": [
            ['nnn', 'Note 0', 0],      ['hh', 'Volume 0', 0],       ['hh', 'Duration 0', 0],
            ['nnn', 'Note 1', 0],      ['hh', 'Volume 1', 0],       ['hh', 'Duration 1', 0],
            ['nnn', 'Note 2', 0],      ['hh', 'Volume 2', 0],       ['hh', 'Duration 2', 0],
            ['nnn', 'Note 3', 0],      ['hh', 'Volume 3', 0],       ['hh', 'Duration 3', 0]
        ],
        "notes5+": [
            ['nnn', 'Note 0', 0],      ['hh', 'Volume 0', 0],       ['hh', 'Duration 0', 0],
            ['nnn', 'Note 1', 0],      ['hh', 'Volume 1', 0],       ['hh', 'Duration 1', 0],
            ['nnn', 'Note 2', 0],      ['hh', 'Volume 2', 0],       ['hh', 'Duration 2', 0],
            ['nnn', 'Note 3', 0],      ['hh', 'Volume 3', 0],       ['hh', 'Duration 3', 0],
            ['nnn', 'Note 4', 0],      ['hh', 'Volume 4', 0],       ['hh', 'Duration 4', 0]
        ],
        "FX2+": [
            ['b', 'Trigger 1', 0],     ['b', 'Trigger 2', 0],       ['b', 'Trigger 3', 0],       ['b', 'Trigger 4', 0],
            ['ffxxyy', 'Effect 1', 1],  ['ffxxyy', 'Effect 2', 1]
        ]
    }
};

// - simulate adding data at runtime.
add_pattern(0, 0,   uid_01);
add_pattern(0, 128, uid_04);
add_pattern(0, 288, uid_07);
add_pattern(1, 16,  uid_02);
add_pattern(1, 192, uid_05);
add_pattern(2, 64,  uid_03);
add_pattern(2, 256, uid_06);

// - one liner utils.

const clamp = (v, lo, hi) => Math.min(hi, Math.max(lo, v));
const ASCII = (key) => String.fromCharCode(key).toUpperCase();
const fmt4 = (n) => ('0000' + Math.floor(Math.abs(n))).slice(-4) + ' '; 
const fmt3 = (n) => ('000' + Math.floor(Math.abs(n))).slice(-3) + ' '; 

const asRGBobj = (col) => ({r: col[0], g: col[1], b: col[2]});
const RGBA_2_RGB = (col) => col.slice(0, 3);
const set_rgb = (c, d /*color, dimming*/) => { mgraphics.set_source_rgba(c.r / d, c.g / d, c.b / d, 1); }

const kind_from_column = (col) => sequencer_config.tracks[col].kind;
const tick_from_row = (row) => row * 16;
const found_in = (list, value) => (list.indexOf(value) !== -1);

// - multi line utils

function color_from_kind(kind) { 
    // quick defaults.
    if (kind === "fx") return theme_colors.def_fx_color;
    if (kind === "gen") return theme_colors.def_gen_color;
    return theme_colors.def_gen_color;
}

function make_new_pattern(machine_trk, length){
    // two steps,
    // 1  add to pattern list for the machine/track
    // 2  add to the sequence editor at insertion point
    var kind = kind_from_column(machine_trk);
    var color = RGBA_2_RGB(color_from_kind(kind));
    const new_puid = next_pattern_uid();
    return {pname: next_pname3(), puid: new_puid, length: length, color: color, data: []};
};

function getPattrByPUID(track, puid){
    for (const [idx, pattern] of track.patterns.entries()) {
        if (pattern.puid === puid)
            return pattern;
    }
    return null;
}

function add_pattern(machine_trk, start, puid){
    var pattern = getPattrByPUID(sequencer_config.patterns[machine_trk], puid);
    if (pattern === null) { 
        post(`failed to located pattern by uid ${puid}`)
        return;
    }
    var mpattern = {pname: pattern.pname, puid: puid, start: start, length: pattern.length, color: pattern.color};
    sequencer_config.tracks[machine_trk].patterns.push(mpattern);
};

function delete_pattern(puid){}
function remove_pattern_from_sequencer(){};

function find_pattern_under_cursor(trk, start){
    // this just finds a pattern if the cursor is at the same `start` 
    // as an existing pattern in that track
    var found_idx = -1;
    for (const [pidx, pattern] of sequencer_config.tracks[trk].patterns.entries()) {
        if (pattern.start == start) {
            found_idx = pidx;
            break;
        }
    }
    return found_idx;
}

function find_any_pattern_under_cursor(trk, cursor, inclusive = false){
    // slightly more elaborate pattern finder, will check all patterns in the track
    // if any of the patterns has a condition where the cursor falls within start + length
    // then this is the pattern we want to slice (or navigate to, if inclusive).
    // we should search in reverse, from bottom of track to top :)
    var found_idx = -1;
    var patterns = sequencer_config.tracks[trk].patterns;
    for (let i = patterns.length - 1; i >= 0; i--) {
        var pattern = patterns[i];
        var pattern_end = pattern.start + pattern.length;
        // post(`cursor ${cursor}, pattern.start ${pattern.start}, pattern.end ${pattern_end}`);
        var hit = inclusive
            ? (cursor >= pattern.start) && (cursor < pattern_end)
            : (cursor > pattern.start) && (cursor < pattern_end);
        if (hit) {
            found_idx = i;
            post('found:' , pattern.pname, found_idx);
            break;
        }
    }
    return found_idx;
}

function next_pname4(){
    // dumb incrementing label, patterns should be named eventually.
    var pname = fmt4(g_next_pname_counter).trim();
    g_next_pname_counter += 1;
    return pname;
}

function next_pname3(){
    // dumb incrementing label, patterns should be named eventually.
    var pname = fmt3(g_next_pname_counter).trim();
    g_next_pname_counter += 1;
    return pname;
}

function moveCaret(dc, dr) {
    g_tcaret.col = clamp(g_tcaret.col + dc, 0, cols - 1);
    g_tcaret.row = clamp(g_tcaret.row + dr, 0, rows - 1);
    mgraphics.redraw();
    // post(`caret col ${g_tcaret.col}, row ${g_tcaret.row}`);
}

function change_selected_pattern_in_menu(dir){
    // this will have to track the last used index per track, to avoid out of bounds indexing.
    selected_pattern_in_menu += dir;
    mgraphics.redraw();
}

function toggle_pattern_menu_visibility(){
    g_display_pattern_menu = !g_display_pattern_menu; 
    mgraphics.redraw();
}

function toggle_looping(){
    g_looping = !g_looping;
    mgraphics.redraw();
}

// - Message handling.  (they can also be called by key handler )

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

function song_name(name){
    g_song_name = name;
    post(g_song_name);
    mgraphics.redraw();
}

function set_output_dir(full_path){
    g_song_folder = full_path;
    post(g_song_folder);
    mgraphics.redraw();
}

function send_pattern_to_tracker(){

    const trk = g_tcaret.col;
    const start = tick_from_row(g_tcaret.row);
    const found_idx = find_any_pattern_under_cursor(trk, start, true);
    
    if (found_idx < 0) {
        post("no pattern under cursor!");
        return;
    }
    var pattern = sequencer_config.tracks[trk].patterns[found_idx];
    var machine_name = sequencer_config.tracks[trk].machine;
    var pattern_exchange_markup = {
        editing_puid: 1,
        length: pattern.length,
        descriptors: {track: sequencer_config.machines[machine_name]},
        data: [],
        lexical_track: ""
    };

    post('Telling Tracker to show pattern \n');
    var outputDict = new Dict('pattern_markup_dict');
    outputDict.parse(JSON.stringify(pattern_exchange_markup));
    outlet(1, "dictionary", outputDict.name);
}


function command(instruction) {
    switch (instruction) {
        case 'export_sequence_data': {
            post('Exporting Sequence Data\n');
            var outputDict = new Dict('sequence_dict');
            outputDict.parse(JSON.stringify(sequencer_config));
            outlet(1, "dictionary", outputDict.name);
            break;
        }
        case 'save': crate_fullpath_and_save(); break;
        case 'get_pmarkup': {
            // var markup = this.patcher.getnamed("TrackerView").getnamed("pattern_markup").getvalueof
            // post(markup.length);
            break;
        }
        // editing commands, reachable from a keyboard shortcut object upstream
        case 'clone_pattern': clone_pattern(); break;
        case 'extend_pattern': extend_pattern(16); break;
        case 'shrink_pattern': extend_pattern(-16); break;
        case 'create_pattern_from_selection': insert_patterns_in_selection(); break;
        case 'cancel_selection': cancel_selection(); break;
        default: post("unknown command, seek help"); return;
    }
}

//  I O 

// function send_dict_out(outlet_index, obj) {
//     var d = new Dict();               // auto-named, one-shot
//     d.parse(JSON.stringify(obj));     // load the payload as dict content
//     outlet(outlet_index, "dictionary", d.name); // Max convention for passing a dict by name
//     d.freepeer();                     // dict content is now owned by Max's dict system,
//                                        // safe to free our JS-side peer immediately
// }



function msg_int(tick){
    global_tick = tick;
    mgraphics.redraw();
}

// - KEY handling.

function keys(a1, a2, a3, a4){
    if (inlet !== 1) return; // keypresses arrive on the cold 2nd inlet, not the hot one
    g_key_codes = [a1, a2, a3, a4];
    key_handler();
}

function key_handler(){

    if (!g_mouse_on_rect) return;

    var SHIFT = 512;
    var ALT = 2048;
    var CTRL = 4352;
    var CTRL_ALT = 6400;

    var ENTER = 13;
    var ESCAPE = 27;
    var SPACE = 32;

    var CTRL_ALT_S = 223;   // these have different USER_KEYS when combined with the two modifiers.
    var CTRL_ALT_O = 243;
    var [UP_KEY, DOWN_KEY] = [30, 31];
    var [LEFT_KEY, RIGHT_KEY] = [28, 29];
    var [MINUS1, PLUS1] = [45, 61]; // reuse the pattern editor's octave keys for length
    var arrows = [UP_KEY, DOWN_KEY, LEFT_KEY, RIGHT_KEY];

    var SELECTOR = g_key_codes[2];
    var USER_KEY = g_key_codes[0];

    // space toggles edit mode
    if (USER_KEY === SPACE){
        g_in_edit_mode = !g_in_edit_mode;
        mgraphics.redraw();
        return;
    }

    // if not in edit mode, ignore all other input.
    if (!g_in_edit_mode) return;

    if (SELECTOR === SHIFT){
        // stub implementation.
        // a bare shift press commences (or just reaffirms) the selection
        // anchor at wherever the caret currently sits.
        start_selection();
        return;
    }

    const UKEY = ASCII(USER_KEY);

    if (SELECTOR === CTRL){
        if (g_display_pattern_menu){
            switch(USER_KEY) {
                case UP_KEY: change_selected_pattern_in_menu(-1); return;
                case DOWN_KEY: change_selected_pattern_in_menu(+1); return;
            }
            return;
        }
    }
    if (SELECTOR === CTRL_ALT){
        switch(USER_KEY) {
            case CTRL_ALT_S: command('save'); return;
            case CTRL_ALT_O: command('open_dir_selector_dialog'); return;
        }
        return;
    }

    if (SELECTOR === ALT){
        // switch(USER_KEY) {
        //     case UP_KEY: move_pattern_lane(-1); return;
        //     case DOWN_KEY: move_pattern_lane(1); return;
        // }
        return;
    }
    
    if (found_in([MINUS1, PLUS1], USER_KEY)){
        extend_pattern(USER_KEY === MINUS1 ? -16 : 16);
        return;
    }
    
    switch(UKEY) {
        case "N": insert_pattern_at_cursor(true, null); return; // new empty pattern.
        case "X": remove_pattern_at_cursor(); return;
        case "I": toggle_pattern_menu_visibility(); return;
        case "B": loop_start(g_tcaret.row*16); return;
        case "E": loop_end(g_tcaret.row*16); return;
        case "L": toggle_looping(); return;
        case 'C': clone_pattern(); return;
        case 'S': slice_pattern_at_cursor(); return;
    }

    if (USER_KEY === ENTER){
        if (g_display_pattern_menu){
            var trk = g_tcaret.col;
            if (selected_pattern_in_menu < sequencer_config.patterns[trk].patterns.length){
                var pattern = sequencer_config.patterns[trk].patterns[selected_pattern_in_menu];
                insert_pattern_at_cursor(false, pattern);
                g_display_pattern_menu = !g_display_pattern_menu;
            }
            return;
        } 
        else { 
            send_pattern_to_tracker(); 
        }
        // else { insert_patterns_in_selection(); }
        return;
    }

    if (USER_KEY === ESCAPE){
        cancel_selection();
        return;
    }

    if (found_in(arrows, USER_KEY)){
        switch(USER_KEY) {
            case LEFT_KEY: moveCaret(-1, 0); break;
            case RIGHT_KEY: moveCaret(1, 0); break;
            case UP_KEY: moveCaret(0, -1); break;
            case DOWN_KEY: moveCaret(0, 1); break;
            default: return;
        }
    }
}

// - hit testing : inverse of the rect math used in paint() ---

function tick_from_y(y){
    var yoffset = (0.75 * charheight);
    return Math.round(((y + yoffset) / charheight) * 16);
}

function trk_from_x(x){
    var xoffset = (0.46 * charwidth);
    return Math.round((x - side_width + xoffset) / trk_width);
}

function hit_test(x, y){
    // translate into the same space paint() draws in
    var local_x = x - 30;
    var local_y = y - 50;
    var tick = tick_from_y(local_y);
    var trk = trk_from_x(local_x);

    for (var i = sequence_data.length - 1; i >= 0; i--){
        var p = sequence_data[i];
        if (p.trk === trk && tick >= p.start && tick < (p.start + p.length)){
            var near_bottom_edge = (p.start + p.length - tick) <= 2;
            return {idx: i, edge: near_bottom_edge ? "resize" : "body"};
        }
    }
    return null;
}

// - editing actions

// these all operate on g_selected_pattern_idx. hooked up for real where the
// math is trivial (clone / move lane / extend); left dummy where the actual
// pattern *content* would need to be touched, since that lives outside this UI.

function clone_pattern(){
    // if (g_selected_pattern_idx < 0) return;
    // var src = sequence_data[g_selected_pattern_idx];
    // var clone = {
    //     pname: next_pname(),
    //     trk: src.trk,
    //     start: src.start + src.length,
    //     length: src.length,
    //     color: src.color.slice(),
    //     kind: src.kind
    // };
    // sequence_data.push(clone);
    // g_selected_pattern_idx = sequence_data.length - 1;
    // post('cloned pattern ' + src.pname + ' -> ' + clone.pname + '\n');
    // mgraphics.redraw();
}

function extend_pattern(delta_ticks){
    // if (g_selected_pattern_idx < 0) return;
    // var p = sequence_data[g_selected_pattern_idx];
    // var new_length = p.length + delta_ticks;
    // if (new_length < 16) new_length = 16; // floor at one row-group
    // p.length = new_length;
    // post('resized pattern ' + p.pname + ' to length ' + p.length + '\n');
    // mgraphics.redraw();
}

function slice_pattern_at_cursor(){

    var trk = g_tcaret.col;
    var cursor = tick_from_row(g_tcaret.row);
    var found_idx = find_any_pattern_under_cursor(trk, cursor);

    if (found_idx < 0) return; // no pattern under cursor?

    var pattern_to_slice = sequencer_config.tracks[trk].patterns[found_idx];
    var pattern_a_start = pattern_to_slice.start;
    var pattern_a_length = cursor - pattern_to_slice.start;
    var pattern_b_start = cursor;
    var pattern_b_length = pattern_to_slice.length - pattern_a_length;

    /*
    tracks[trk].pattern[0] will resemble 
    {pname: pattern.pname, puid: puid, start: start, length: pattern.length, color: pattern.color};

    [x] copy puid of found pattern
    [x] remove pattern from track ( do not delete )
    [x] create new pattern of a_length ( later include the data ), place it at a_start
    [x] create new pattern of b_length ( later include the data ), place it as b_start
    */
    
    sequencer_config.tracks[trk].patterns.splice(found_idx, 1); // remove indexed pattern from track list.

    var puid = pattern_to_slice.puid
    var basename = pattern_to_slice.pname;
    var pattern_a = make_new_pattern(trk, pattern_a_length);
    var pattern_b = make_new_pattern(trk, pattern_b_length);
    pattern_a.pname = basename + ":A";
    pattern_b.pname = basename + ":B";
    sequencer_config.patterns[trk].patterns.push(pattern_a);
    sequencer_config.patterns[trk].patterns.push(pattern_b);
    add_pattern(trk, pattern_a_start, pattern_a.puid);
    add_pattern(trk, pattern_b_start, pattern_b.puid);
    
    mgraphics.redraw();
}



// - BEHAVIOURS

function start_selection(){
    if (!g_selection_active){
        g_selection_active = true;
        g_sel_anchor = {row: g_tcaret.row, col: g_tcaret.col};
        mgraphics.redraw();
    }
    // already active: leave the anchor where it is, arrows keep extending
}

function cancel_selection(){
    g_selection_active = false;
    mgraphics.redraw();
}

function get_selection_rect(){
    // cols use the usual lo/hi span. rows keep the anchor as a fixed edge
    // rather than lo/hi, since "insert" needs to know which end is the
    // start tick -- see insert_patterns_in_selection.
    if (!g_selection_active) return null;
    return {
        col_lo: Math.min(g_sel_anchor.col, g_tcaret.col),
        col_hi: Math.max(g_sel_anchor.col, g_tcaret.col),
        row_lo: Math.min(g_sel_anchor.row, g_tcaret.row),
        row_hi: Math.max(g_sel_anchor.row, g_tcaret.row)
    };
}

function pattern_overlaps(trk, start, length){
    // for (var i = 0; i < sequence_data.length; i++){
    //     var p = sequence_data[i];
    //     if (p.trk !== trk) continue;
    //     if (start < (p.start + p.length) && (start + length) > p.start) return true;
    // }
    // return false;
}

function insert_pattern_at_cursor(new_pattern_flag, pattern){

    var trk = g_tcaret.col;
    var start = tick_from_row(g_tcaret.row);

    // don't allow adding pattern in the place of an existing pattern.
    var found_idx = find_pattern_under_cursor(trk, start);
    if (found_idx >= 0) return;

    // contains some redundant code. i know.
    if (new_pattern_flag){
        var new_pattern = make_new_pattern(trk, 64);
        sequencer_config.patterns[trk].patterns.push(new_pattern);
        add_pattern(trk, start, new_pattern.puid);
    } else {
        add_pattern(trk, start, pattern.puid);
    }
    mgraphics.redraw();
}

function remove_pattern_at_cursor(){
    var trk = g_tcaret.col;
    var start = tick_from_row(g_tcaret.row);

    var found_idx = find_pattern_under_cursor(trk, start);
    if (found_idx >= 0){ sequencer_config.tracks[trk].patterns.splice(found_idx, 1); }
    mgraphics.redraw();
}

function insert_patterns_in_selection(){
    // var rect = get_selection_rect();
    // if (rect === null) return;

    // // the anchor's row is the start tick no matter which way the caret grew
    // // the region; length is just the row span in ticks.
    // var span_rows = Math.abs(g_tcaret.row - g_sel_anchor.row) + 1;
    // var start = tick_from_row(g_sel_anchor.row);
    // var length = span_rows * 16;

    // var created = 0;
    // var skipped = 0;
    // for (var col = rect.col_lo; col <= rect.col_hi; col++){

    //     // dont add patterns ontop of existing
    //     if (pattern_overlaps(col, start, length)){
    //         skipped += 1;
    //         continue;
    //     }
    //     var fresh = {
    //         pname: next_pname(),
    //         trk: col,
    //         start: start,
    //         length: length,
    //         color: [0.2, 0.4, 0.5],
    //         kind: "gen"
    //     };
    //     sequence_data.push(fresh);
    //     created += 1;
    // }

    // post('inserted ' + created + ' pattern(s), skipped ' + skipped + ' occupied lane(s)\n');
    // cancel_selection();
    // mgraphics.redraw();
}

function slice_pattern_content_dummy(first_half, second_half){
    // TODO: once pattern row-data lives somewhere addressable from here,
    // copy/split the underlying rows so second_half actually starts with
    // whatever was under the playhead. For now this is just a hook.
    // pattern name will be  "pname A" and "pname B"
}

// - DRAWING.

function draw_background(w, h){
    var col = theme_colors.bg_color;
    var dimming  = 1.5;
    mgraphics.set_source_rgba(col[0]/dimming, col[1]/dimming, col[2]/dimming, 1);
    mgraphics.rectangle(0, 0, w, h);
    mgraphics.fill();
}

function draw_current_tick(){
    var tick_distance = charheight / 16;
    var lineh = (global_tick * tick_distance) - charheight + 3.5;
    set_rgb({r:0.95 ,g: 0.44, b: 0.4}, 0.9);
    mgraphics.move_to(0, lineh);
    mgraphics.line_to(500, lineh);
    mgraphics.stroke();
}

function draw_looping_indicators(){

    if (g_looping){
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

function draw_selection_rect(){
    // if (!g_selection_active) return;

    // var rect = get_selection_rect();
    // var cx = side_width + (rect.col_lo * trk_width);
    // var cy = (rect.row_lo * charheight);
    // var w = ((rect.col_hi - rect.col_lo + 1) * trk_width) - 3;
    // var h = ((rect.row_hi - rect.row_lo + 1) * charheight) * -1; // rows grow downward, same sign convention as draw_track_cursor

    // set_rgb({r:1.0, g:1.0, b:1.0}, 1.0);
    // mgraphics.rectangle(cx - 2, cy + 3, w, h * 0.9);
    // mgraphics.stroke();
}

function draw_track_cursor(){
    // lol, this is wnky for the first 16 ticks
    set_rgb({r:1.0, g:0.5, b:0.3}, 1.0);
    var cx = side_width + (g_tcaret.col * trk_width);
    var cy = (g_tcaret.row * charheight);
    mgraphics.rectangle(cx-2 , cy+3, trk_width-3, -charheight*.9);
    mgraphics.stroke();
}

function draw_edit_mode_indicator(h){
    if (g_in_edit_mode){
        // this.mgraphics.set_source_rgba(0.9, 0.5, 0.5, 1.0); // this.edit_indicator_color
        mgraphics.set_source_rgba(...theme_colors.edit_indicator_color);
        mgraphics.rectangle(0, 0, 5, 39, 39);
        mgraphics.fill();        
    }
}

function draw_header(){

    function centered(char, width) {
        const totalPadding = width - 1;
        const left = Math.floor(totalPadding / 2);
        const right = totalPadding - left;
        return ' '.repeat(left) + char + ' '.repeat(right);
    }

    function clipped(name, width){
        return name.length > width ? name.slice(0, width): name.padEnd(width, ' ');
    }

    // start tokens
    var symbol_tracks = "     "
    var name_tracks   = "tick "
    mgraphics.set_source_rgba(...theme_colors.header_text);

    // track tokens for every track
    for (const [idx, track] of sequencer_config.tracks.entries()) {
        symbol_tracks += ("|" + centered(    track.trk_symbol, 9));
        name_tracks   += ("|" +  clipped(" " + track.trk_name, 9));
    }

    // final tokens
    symbol_tracks += "|";
    name_tracks += "| →";

    mgraphics.move_to(0,  -2 * charheight);
    mgraphics.show_text(symbol_tracks);
    mgraphics.move_to(0,  -1 * charheight);
    mgraphics.show_text(name_tracks);
}

function draw_ticks_column(charheight){
    var color = asRGBobj(theme_colors.ticks_column);
    for (var idx = 0; idx < 38; idx++){
        mgraphics.move_to(0,  (idx * charheight));
        var pattern_row = String(fmt4(idx * 16)) + '|';
        if (idx % 4 === 0){
            set_rgb(color, 1.3);
        } else {
            set_rgb(color, 1.0);
        }
        mgraphics.show_text(pattern_row);
    }    
}

function draw_horizontal_time_markers(charheight){
    // secondary horizontal separator lines, all the same color for now.
    var sdim = 0.34;
    var tm = theme_colors.time_markers;
    mgraphics.set_source_rgba(tm[0]*sdim, tm[1]*sdim, tm[2]*sdim, 1);
    for (var i = 0; i < 20; i++){
        var lineh = -10.5 + ((i * 8) * charheight);
        mgraphics.move_to(0, lineh);
        mgraphics.line_to(500, lineh);
        mgraphics.stroke();
    }    
}

function draw_patterns(){

    var color = {r: 0.4, g: 0.9, b: 1.0};
    var yoffset = (0.75 * charheight);
    var xoffset = (0.46 * charwidth);

    for (const [idx, track] of sequencer_config.tracks.entries()) {

        // ordered display based on start values, earlier starts are rendered first.
        // patterns should cut off playing patterns, this is a way to visualize that.
        const ordered = track.patterns.slice().sort((a, b) => a.start - b.start);
        for (const pattern of ordered){

            // Pattern Rect
            mgraphics.set_source_rgba(...pattern.color, 1);
            var rect_start_x = side_width + (track.trk * trk_width) - xoffset;
            var rect_start_y = ((pattern.start/16) * charheight) - yoffset;
            mgraphics.rectangle(rect_start_x, rect_start_y, trk_width, ((pattern.length / 16) * charheight) );
            mgraphics.fill();

            // Outline Rect  ( i'm not happy about the outline colour being locked.. it's OK for now. _
            set_rgb(color, 0.7);
            if (track.kind === "fx"){ set_rgb({r:0.9 ,g: 0.34, b: 0.2}, 0.5); }        
            mgraphics.rectangle(rect_start_x, rect_start_y, trk_width, ((pattern.length / 16) * charheight) );
            mgraphics.stroke();

            // pattern name
            set_rgb({r:0.82, g:0.82, b:0.82}, 1.0);
            mgraphics.move_to(rect_start_x + xoffset, rect_start_y + yoffset);
            mgraphics.show_text(pattern.pname);
        }
    }    
}

function draw_pattern_menu(gfx, charheight, charwidth, trk_width, side_width){
    var trk = g_tcaret.col;
    var start = tick_from_row(g_tcaret.row);

    var num_patterns = sequencer_config.patterns[trk].patterns.length;
    if (num_patterns <= 0){ return; }
    
    var yoffset = (0.75 * charheight);
    var xoffset = (0.46 * charwidth);
    gfx.set_source_rgba(0.2, 0.2, 0.2, 1);
    // display the rectangle to the right of the track cursor.
    var rect_start_x = side_width + ((trk+1) * trk_width) - xoffset;
    var rect_start_y = ((start/16) * charheight) - yoffset;
    gfx.rectangle(rect_start_x, rect_start_y, trk_width, (num_patterns * charheight) );
    gfx.fill();

    // list the patterns
    for (const [idx, pattern] of sequencer_config.patterns[trk].patterns.entries()){
        var highlight = (selected_pattern_in_menu === idx) ? [0.86, 0.86, 0.86, 1] : [0.7, 0.7, 0.7, 1];
        var indicator = (selected_pattern_in_menu === idx) ? " ←" : "";
        gfx.set_source_rgba(...highlight);
        gfx.move_to(rect_start_x + xoffset, rect_start_y + yoffset + (idx * charheight));
        gfx.show_text(pattern.pname + indicator);
    }

}

function draw_songname(gfx, h){
    gfx.set_source_rgba(...theme_colors.header_text);
    gfx.move_to(10, h-2);
    var abbreviated_folder_structure = shortenPath(g_song_folder);
    gfx.show_text(`${g_song_name} @ ${abbreviated_folder_structure}`);
}

function paint(){

    // --- constants ---
    const gfx = mgraphics;
    var [w, h] = gfx.size;
    
    mgraphics.set_font_size(settings_font_size);
    mgraphics.select_font_face("Consolas", "normal", "normal");
    [charwidth, charheight] = mgraphics.text_measure('/');
    trk_width = mgraphics.text_measure('|    Λ    ')[0];
    side_width = mgraphics.text_measure('tick  ')[0];

    draw_background(w, h);
    draw_edit_mode_indicator(h);
    draw_songname(gfx, h);

    mgraphics.translate(30, 50);
    draw_horizontal_time_markers(charheight);
    draw_looping_indicators();  // start: α   , end: Ω
    draw_selection_rect();
    draw_patterns();
    draw_header();
    draw_ticks_column(charheight);
    draw_current_tick();
    draw_track_cursor();

    if (g_display_pattern_menu) draw_pattern_menu(gfx, charheight, charwidth, trk_width, side_width);
};

// -- MOUSE HANDLING

// mgraphics calls onidle continuously while the mouse is over the ui (click
// or not), and onidleout once when it leaves -- gates keys() via g_mouse_on_rect.
function onidle(x, y, button, mod1, shift, caps, opt, mod2){
    g_mouse_on_rect = true;
}

function onidleout(x, y, button, mod1, shift, caps, opt, mod2){
    g_mouse_on_rect = false;
}

function onclick(x, y, button, cmd, shift, capslock, option, ctrl){
    // var hit = hit_test(x, y);

    // if (hit === null){
    //     g_selected_pattern_idx = -1;
    //     var local_x = x - 30;
    //     var local_y = y - 50;
    //     mark_selection_point(trk_from_x(local_x), tick_from_y(local_y));
    //     return; // mark_selection_point already redraws
    // }

    // // clicking an actual pattern abandons any in-progress selection mark
    // g_pending_selection = null;
    // g_selected_pattern_idx = hit.idx;
    // mgraphics.redraw();
}

// - FILE IO Util Funcs.

function getSafeDatetimeFilename(baseName, date = new Date()) {
    // Format the date as DD-MM-YYYY-HH-mm
    const pad = (n) => n.toString().padStart(2, '0');
    const dateStr = `${pad(date.getDate())}-${pad(date.getMonth() + 1)}-${date.getFullYear()}-${pad(date.getHours())}-${pad(date.getMinutes())}`;
    const rawFilename = `${baseName}-${dateStr}`; // combine
    return makeFilenameSafe(rawFilename);         // sanitize
}

function makeFilenameSafe(str, maxLength = 255) {
    // Replace reserved characters with underscores
    let safeStr = str.replace(/[\/|\\:*?"<>|]/g, '_');
  
    safeStr = safeStr.replace(/\s+/g, '_'); // space to underscore
    safeStr = safeStr.trim('_');          // trim leading/trailing underscores
  
    // Handle Windows reserved names (case-insensitive)
    const reservedNames = new Set(['con', 'prn', 'aux', 'nul', 'com1', 'com2', 'com3', 'lpt1', 'lpt2', 'lpt3']);
    if (reservedNames.has(safeStr.toLowerCase())) {
        safeStr += '_';
    }
  
    // Truncate to max length
    if (safeStr.length > maxLength) {
        safeStr = safeStr.slice(0, maxLength);
    }
  
    return safeStr;
}

function save(filepath, content) {
    var f = new File(filepath, "write", "TEXT");
    if (f.isopen) {
        f.open();
        f.writestring(content);
        f.close();
    }
}

function crate_fullpath_and_save(){
    var filename = getSafeDatetimeFilename(g_song_name);
    var output_dir = g_song_folder;
    if (output_dir !== null){
        // as output_dir ends in slash, simple concat may suffice x-platform.
        const fullPath = output_dir + filename + ".json";   
        post('writing', fullPath);
        // var content = JSON.stringify(sequencer_config);          // if g_export_indent === false
        var content = JSON.stringify(sequencer_config, null, 2);    // if g_export_indent === true
        save(fullPath, content);
    } else {
        post('specify output directory using message: set_output_dir $1    , where $1 is the directory including terminating slash')
    }    
}

function shortenPath(path, keepLast = 3) {
    if (!path) return '<no folder chosen yet>';
    const sep = path.includes('\\') ? '\\' : '/';
    const parts = path.split(/[\\/]/).filter(Boolean);
    if (parts.length <= keepLast) return parts.join(sep);
    return '...' + sep + parts.slice(-keepLast).join(sep);
}

function get_environment(){
    if (max.os === "macintosh") return "Mac";
    if (max.os === "windows") return "Win";
    return "Gibson"
}
