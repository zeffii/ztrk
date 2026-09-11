include("ztrk_seq_utils.js");

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
var g_2hex_input = "";

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

var default_config = {
    tracks: [
        {trk: 0, trk_name: "gen.00", machine: "notes4+", trk_symbol: "Λ", kind: "gen", patterns: []},    // will just contain references with a puid (see add_pattern)
        {trk: 1, trk_name: "gen.01", machine: "notes5+", trk_symbol: "Λ", kind: "gen", patterns: []},
        {trk: 2, trk_name: "fx.01",  machine: "FX2+", trk_symbol: "φ", kind: "fx", patterns: []}
    ],
    patterns: [   /*  This is the pool of patterns to pick from for each machine / trk */
        {trk: 0, patterns: [
            {pname: "01", puid: uid_01, length: 32, color: [0.2, 0.4, 0.5], data: []},
            {pname: "04", puid: uid_04, length: 64, color: [0.2, 0.4, 0.5], data: []},
            {pname: "07", puid: uid_07, length: 32, color: [0.2, 0.4, 0.5], data: []}
        ]},
        {trk: 1, patterns: [
            {pname: "02", puid: uid_02, length: 48, color: [0.2, 0.4, 0.5], data: []},
            {pname: "05", puid: uid_05, length: 16, color: [0.2, 0.4, 0.5], data: []}
        ]},
        {trk: 2, patterns: [
            {pname: "03", puid: uid_03, length: 128, color: [0.9, 0.34, 0.3], data: []},
            {pname: "06", puid: uid_06, length: 16, color: [0.9, 0.34, 0.3], data: []}
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
    },
    encoded_pattern_cache: {}
};

function get_cached_puid_or_compute_and_cache_it(puid){
    if (pattern_ref.puid in sequencer_config.encoded_pattern_cache) {
        return sequencer_config.encoded_pattern_cache[pattern_ref.puid]
    }

    let pdata = getPatterDataByPUID(pattern_ref.puid);
    let array2d_str = pattern_data_to_2d_Array_string_cells(pdata);
    let array2d_float = encodeArray2Dstr_to_float(array2d_str);
    sequencer_config.encoded_pattern_cache[pattern_ref.puid] = array2d_float;
    return array2d_float;
}

var sequencer_config = { ...default_config};

function sequencer_init(){
    var num_tracks = sequencer_config.tracks.length;
    var patcher = this.patcher;

    init_track_buffers(patcher, num_tracks);
    debug_empty_buffers();
    outlet(0, "refresh", "buffer_viz");
    return ;
}

// - simulate adding data at runtime.
add_pattern(0, 0,   uid_01);
add_pattern(0, 128, uid_04);
add_pattern(0, 288, uid_07);
add_pattern(1, 16,  uid_02);
add_pattern(1, 192, uid_05);
add_pattern(2, 64,  uid_03);
add_pattern(2, 256, uid_06);

// - one liner utils.

const ASCII = (key) => String.fromCharCode(key).toUpperCase();
const fmt4 = (n) => ('0000' + Math.floor(Math.abs(n))).slice(-4) + ' '; 
const fmt3 = (n) => ('000' + Math.floor(Math.abs(n))).slice(-3) + ' '; 

const asRGBobj = (col) => ({r: col[0], g: col[1], b: col[2]});
const RGBA_2_RGB = (col) => col.slice(0, 3);
const set_rgb = (c, d /*color, dimming*/) => { mgraphics.set_source_rgba(c.r / d, c.g / d, c.b / d, 1); }

const kind_from_column = (col) => sequencer_config.tracks[col].kind;
const tick_from_row = (row) => row * 16;


// - multi line utils

function set_2hex_menu_input(new_char){
    switch (g_2hex_input.length) {
        case 0: {
            g_2hex_input += new_char;
            return {count: 1};
        }
        case 1: {
            g_2hex_input += new_char;
            return {count: 2}; // complete
        }
    }
    return {count: 0};
}


function finalize(command){
    /*
    understands     command. refresh
                    command. update_buffer
    */
    if ('refresh' in command){ mgraphics.redraw(); }

    if ('update_buffer' in command){

        if ('operation' in command){
            if (command.operation === 'wipe'){
                // if you know this pattern wasn't interupting other patterns, you can go ahead and overwrite the buffer with zeroes.
                var array2d = generateEmpty2dArrayFloats(command.trk_idx, command.samples);
                write_track_buffer_from_Array2D_floats(command.trk_idx, command.start, command.samples, array2d);
                outlet(0, "refresh", "buffer_viz");
            } 
            else if (command.operation === 'restore_underlying_pattern'){
                // you will be invoking this when a pattern-to-remove was interupting another pattern, and wish to restore that data
                // command.info = {found_idx: i, pattern: candidate_pattern, track_index: track_index};
                var candidate_pattern = command.info.pattern;
                var pattern_ref = getMachineAndPIndexByPUID(candidate_pattern.puid);
                var pattern = sequencer_config.patterns[pattern_ref.track].patterns[pattern_ref.pindex];
                var array2d_str = pattern_data_to_2d_Array_string_cells(pattern.data);
                var array2d_float = encodeArray2Dstr_to_float(array2d_str);
                // sequencer_config.encoded_pattern_cache[command.info.pattern.puid] = array2d_float;
                
                var mode = ['surgical', 'lazy'][0];
                
                if (mode === 'surgical'){
                    // note that this is slightly wasteful, as i could slice the pattern data first, then convert to 2d arrays.
                    var offset = command.start - command.info.pattern.start;
                    var restore_len = Math.min(command.samples, pattern.length - offset);
                    var array2d_float_trimmed = array2d_float.slice(offset, offset + restore_len);
                    write_track_buffer_from_Array2D_floats(pattern_ref.track, command.start, command.samples, array2d_float_trimmed);
                } else {
                    // this is a lazy implementation, but lets get it to work first. This simply rewrites the pattern data entirely.
                    // this is ok, but it assumes there aren't any other patterns interupting a longer pattern, hence why surgical with range replacement would be better.
                    write_track_buffer_from_Array2D_floats(pattern_ref.track, command.info.pattern.start, pattern.length, array2d_float);
                }

                outlet(0, "refresh", "buffer_viz");
            } 
            else if (command.operation === "insertion"){
                // something this doesn't handle yet, if inserted pattern's extent falls within the start, or start+length of other patterns.
                //
                // massive bug.

                // {refresh: true, update_buffer: true, puid: puid, start: start, track_index: trk, operation: "insertion"});
                var pattern_ref = getMachineAndPIndexByPUID(command.puid);
                var pattern = sequencer_config.patterns[pattern_ref.track].patterns[pattern_ref.pindex];
                var array2d_str = pattern_data_to_2d_Array_string_cells(pattern.data);
                var array2d_float = encodeArray2Dstr_to_float(array2d_str);
                sequencer_config.encoded_pattern_cache[command.puid] = array2d_float;
                write_track_buffer_from_Array2D_floats(command.track_index, command.start, pattern.length, array2d_float);
                outlet(0, "refresh", "buffer_viz");
            }
            else if (command.operation === "write_all"){
                // loop through all tracks, write all data sorted by pref.start 
                for (const [idx, track] of sequencer_config.tracks.entries()) {
                    for (const pattern_ref of track.patterns) {
                        // this is where i should use the encoded_pattern_cache, after first write of a pattern..
                        // array2d_float = get_cached_puid_or_compute_and_cache_it(puid)
                        let pdata = getPatterDataByPUID(pattern_ref.puid);
                        var array2d_str = pattern_data_to_2d_Array_string_cells(pdata);
                        var array2d_float = encodeArray2Dstr_to_float(array2d_str);
                        sequencer_config.encoded_pattern_cache[pattern_ref.puid] = array2d_float;
                        write_track_buffer_from_Array2D_floats(idx, pattern_ref.start, pattern_ref.length, array2d_float);
                    }
                }
                outlet(0, "refresh", "buffer_viz");
            }
        }
    }
}

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
    post(`getPatterByPUID: failed to locate pattern by uid ${puid}`);
    return null;
}

function getMachineAndPIndexByPUID(puid){
    for (const [midx, machine_storage] of sequencer_config.patterns.entries()){
        for (const [idx, pattern] of machine_storage.patterns.entries()) {
            if (pattern.puid === puid)
                return {track: midx, pindex: idx};
        }
    }
    post(`getMachineAndPIndexByPUID: failed to locate pattern by uid ${puid}`);
    return null;
}

function getPatterDataByPUID(puid){
    var pattern_ref = getMachineAndPIndexByPUID(puid);
    if (pattern_ref === null) { return null; }
    var pattern = sequencer_config.patterns[pattern_ref.track].patterns[pattern_ref.pindex];
    return pattern.data;
}


function add_pattern(machine_trk, start, puid){
    /*
    exclusively add the pattern to the sequencer.
    */
    var pattern = getPattrByPUID(sequencer_config.patterns[machine_trk], puid);
    if (pattern === null) { 
        post(`failed to locate pattern by uid ${puid}`)
        return;
    }
    var mpattern = {pname: pattern.pname, puid: puid, start: start, length: pattern.length, color: pattern.color};
    sequencer_config.tracks[machine_trk].patterns.push(mpattern);
};

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

function find_pattern_suspended_by_this_pattern(track_index, puid, pattern_index){
    var other_pattern = null;

    // present a reverse sorted pattern list, last to first pattern.start.
    var patterns = sequencer_config.tracks[track_index].patterns;
    var sorted_placements = patterns.slice().sort(function(a, b){ return a.start - b.start; });

    var pattern_to_remove_start = patterns[pattern_index].start;
    for (let i = patterns.length - 1; i >= 0; i--) {
        var candidate_pattern = sorted_placements[i];
        if (candidate_pattern.start > pattern_to_remove_start) { continue; }
        else if (candidate_pattern.start === pattern_to_remove_start) { continue; }  // the current pattern, no need to puid check ? :) no we do not allow overlapping /w same start.
        else if ((candidate_pattern.start < pattern_to_remove_start ) && (pattern_to_remove_start < (candidate_pattern.start + candidate_pattern.length)) ){
            post('found:' , candidate_pattern.pname, i);
            other_pattern = {found_idx: i, pattern: candidate_pattern, track_index: track_index};
            break;
        }
    }

    return other_pattern;
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

function clear_sequencer(){

    empty_buffers_by_range(0, sequencer_config.tracks.length);

    // get a known good config, and redux it.
    const temp_config = { ...default_config};
    // remove pattern_refs from
    for (let j = 0; j < temp_config.tracks.length; j++) {
        temp_config.tracks[j].patterns = [];
    }

    // remove patterns from database.
    for (let i = 0; i < temp_config.patterns.length; i++) {
        temp_config.patterns[i].patterns = [];
    }
    
    sequencer_config = { ...temp_config};
    mgraphics.redraw();

    var message_to_wipe = new Dict('pattern_markup_dict');
    message_to_wipe.parse(JSON.stringify({"mode": "wipe" }));
    outlet(0, "refresh", "buffer_viz");
    outlet(1, "dictionary", message_to_wipe.name);

}

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

function debug_empty_buffers(){
    empty_buffers_by_range(0, sequencer_config.tracks.length);
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

    var pattern_ref = getMachineAndPIndexByPUID(pattern.puid);
    var pdata = sequencer_config.patterns[pattern_ref.track].patterns[pattern_ref.pindex].data;

    var machine_name = sequencer_config.tracks[trk].machine;
    var track_name = sequencer_config.tracks[trk].trk_name;
    var pattern_exchange_markup = {
        editing_puid: 1,
        puid: pattern.puid,
        length: pattern.length,
        descriptors: {track: sequencer_config.machines[machine_name]},
        data: pdata,
        lexical_track: "",
        track_name: track_name,
        pattern_name: pattern.pname
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
        case 'save': create_fullpath_and_save(); break;
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

function find_overlapping_patterns_within_occurance(occ){
    // occ: {start: placement.start, num_ticks: num_ticks, trk: track, puid: puid}
    let overlaps = false;
    const track_placements = sequencer_config.tracks[occ.trk].patterns;
    const occ_end = occ.start + occ.num_ticks;
    const mask = new Array(occ.num_ticks).fill(false); // false = unmasked = write it

    for (const other of track_placements) {
        if (other.puid === occ.puid) continue;
        if (other.start <= occ.start) continue; // other started at/before occ — it doesn't interrupt occ, occ interrupts it

        const other_end = other.start + other.length;
        if (other.start >= occ_end || occ.start >= other_end) continue; // no intersection at all

        const clip_start = Math.max(occ.start, other.start) - occ.start;
        const clip_end = Math.min(occ_end, other_end) - occ.start;

        for (let t = clip_start; t < clip_end; t++) {
            mask[t] = true;
        }
        overlaps = true;
    }
    return overlaps ? mask : null;
};

function handle_pattern_from_tracker(payload){
    post('handle_pattern_from_tracker');
    /*
    maybe the payload should include the track it came from, but puid already locks that, so puid lookup suffices
    this should be more streamlined.  For the time being this may not handle overlapping patterns very well.
    */
    // [x]  first update the pattern data.
    var pattern_ref = getMachineAndPIndexByPUID(payload.puid);
    sequencer_config.patterns[pattern_ref.track].patterns[pattern_ref.pindex].data = payload.data;

    // [x]  translate this pattern data into data that can be written to buffers.
    var array2d_str = pattern_data_to_2d_Array_string_cells(payload.data);
    var array2d_float = encodeArray2Dstr_to_float(array2d_str);

    // stash it in the encoded-pattern cache too, since we've just computed it anyway
    sequencer_config.encoded_pattern_cache[payload.puid] = array2d_float;

    var occurrences = find_pattern_occurrences_for_buffer_write(pattern_ref.track, payload.puid);
    for (const occ of occurrences) {
        var overlaps = find_overlapping_patterns_within_occurance(occ);
        if (overlaps === null){
            write_track_buffer_from_Array2D_floats(pattern_ref.track, occ.start, occ.num_ticks, array2d_float);
        } else {
            // post('riding masked buffer writing!');
            write_track_buffer_from_Array2D_floats(pattern_ref.track, occ.start, occ.num_ticks, array2d_float, overlaps);
        }
    }

    // this operation does not require the sequence-editor view to be refreshed.
    return;
};

function find_pattern_occurrences_for_buffer_write(track, puid){
    var placements = sequencer_config.tracks[track].patterns;

    var occurrences = [];
    for (var i = 0; i < placements.length; i++) {
        var placement = placements[i];
        if (placement.puid !== puid) continue;

        occurrences.push({start: placement.start, num_ticks: placement.length, trk: track, puid: puid});
    }
    return occurrences;
}

//  I O 

function dictionary(dictName) {

    var d = new Dict(dictName);
    var data = JSON.parse(d.stringify());
    d.freepeer();  // free now that we own our own copy of thet passed dict

    // remember to remove this object key before storing it.
    if ("edit_request" in data) {
        // [ ] add another check to see if puid is present, else ignore.
        post(`sequencer: received puid ${data.payload.puid} for injection`)
        this.handle_pattern_from_tracker(data.payload);
        return;
    }

}

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

    /*
    if (g_display_pattern_menu){
        let result = set_2hex_menu_input(new_char);
    }
    */

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
        case 'D': clone_pattern(); return;   // duplicate
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
    */
    
    sequencer_config.tracks[trk].patterns.splice(found_idx, 1); // remove indexed pattern from track list.

    var basename = pattern_to_slice.pname;
    var pattern_a = make_new_pattern(trk, pattern_a_length);
    var pattern_b = make_new_pattern(trk, pattern_b_length);
    pattern_a.pname = basename + ":A";
    pattern_b.pname = basename + ":B";

    let data = getPatterDataByPUID(pattern_to_slice.puid);
    // if pattern_to_slice has data  (this can be called on empty patterns, 
    // filling it with empty dats may be not be needed, but it might be expected down the line, 
    // right now tracker will fill it with 'empty pattern'.
    if (data && data.length > 0) {
        pattern_a.data = data.slice(0, pattern_a_length);
        pattern_b.data = data.slice(pattern_a_length);
    }

    // add to sequencer_config.patterns[trk].patterns   (adds to song-database)
    sequencer_config.patterns[trk].patterns.push(pattern_a);
    sequencer_config.patterns[trk].patterns.push(pattern_b);

    // add to sequencer_config.tracks[trk].patterns     (adds to sequencer)
    add_pattern(trk, pattern_a_start, pattern_a.puid);
    add_pattern(trk, pattern_b_start, pattern_b.puid);
    
    mgraphics.redraw();
    // not necessary to update buffer, as will be unchanged by this operation.
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

    // don't allow adding pattern in the place of an existing pattern. yet.
    var found_idx = find_pattern_under_cursor(trk, start);
    if (found_idx >= 0) return;

    var puid = null;
    if (new_pattern_flag){
        var new_pattern = make_new_pattern(trk, 64);
        sequencer_config.patterns[trk].patterns.push(new_pattern);
        puid = new_pattern.puid;
    } else {
        puid = pattern.puid;
    }

    add_pattern(trk, start, puid);
    finalize({refresh: true, update_buffer: true, puid: puid, start: start, track_index: trk, operation: "insertion"});
}

function remove_pattern_at_cursor(){
    var trk_idx = g_tcaret.col;
    var start = tick_from_row(g_tcaret.row);

    var found_idx = find_pattern_under_cursor(trk_idx, start);
    if (found_idx >= 0){ 
        // get info before removing.
        var track = sequencer_config.tracks[trk_idx];
        var puid = track.patterns[found_idx].puid;
        var pattern = getPattrByPUID(track, puid);
        var samples = pattern.length;

        var other_pattern = find_pattern_suspended_by_this_pattern(trk_idx, pattern.puid, found_idx);
        track.patterns.splice(found_idx, 1); // remove from sequencer

        // reflect updates.
        if (other_pattern === null){
            finalize({refresh: true, update_buffer: true, puid: puid, start: start, samples: samples, trk_idx: trk_idx, operation: "wipe"});
        } else {
            // other_pattern {found_idx: i, pattern: candidate_pattern, track_index: track_index};
            finalize({refresh: true, update_buffer: true, puid: puid, start: start, samples: samples, trk_idx: trk_idx, operation: "restore_underlying_pattern", info: other_pattern});
        }
    }
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
    // finalize()
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

    // list the patterns , draw 2hex triggers beside
    for (const [idx, pattern] of sequencer_config.patterns[trk].patterns.entries()){
        var highlight = (selected_pattern_in_menu === idx) ? [0.86, 0.86, 0.86, 1] : [0.7, 0.7, 0.7, 1];
        var indicator = (selected_pattern_in_menu === idx) ? " ←" : "";
        
        // pattern identifier (pname)
        gfx.set_source_rgba(...highlight);
        gfx.move_to(rect_start_x + xoffset, rect_start_y + yoffset + (idx * charheight));
        gfx.show_text(pattern.pname + indicator);

        // pattern trigger 
        gfx.set_source_rgba(0.02, 0.02, 0.02, 1);
        gfx.rectangle(rect_start_x + trk_width, rect_start_y + (idx * charheight), 2*charwidth, charheight);
        gfx.fill();
        gfx.set_source_rgba(0.42, 0.72, 0.99, 1);
        gfx.move_to(rect_start_x + trk_width, rect_start_y + yoffset + (idx * charheight));
        gfx.show_text(toPaddedHex(idx, 2));
    }

}

function draw_songname(gfx, h){
    gfx.set_source_rgba(...theme_colors.header_text);
    gfx.move_to(10, h-2);
    var abbreviated_folder_structure = shortenPath(g_song_folder);
    gfx.show_text(`${g_song_name} @ ${abbreviated_folder_structure}`);
}

sequencer_init();

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

// function save(filepath, content) {
//     var f = new File(filepath, "write", "TEXT");
//     if (f.isopen) {
//         // there's a 32kb limit.
//         f.open();
//         f.writestring(content);
//         f.close();
//     }
// }

function save(filepath, content) {
    var f = new File(filepath, "write", "TEXT");
    if (f.isopen) {
        f.open();

        var chunk_size = 16000; // stay comfortably under the 32k per-call limit
        var pos = 0;
        while (pos < content.length) {
            f.writestring(content.substring(pos, pos + chunk_size));
            pos += chunk_size;
        }
        f.close();
    }
}

// function load_song(filepath){
    
//     let f = new File(filepath, "read");
//     if (!f.isopen) { post("Could not open: " + path + "\n"); return; }
    
//     let text = f.readstring(f.eof);
//     post("Read " + text.length + " characters\n");
//     f.close();
    
//     try {
//         let data = JSON.parse(text);
//         if (!data.hasOwnProperty("patterns")) { throw new Error("Missing required key: patterns"); }
//         if (!data.hasOwnProperty("tracks")) { throw new Error("Missing required key: tracks"); }
//         if (!data.hasOwnProperty("machines")) { throw new Error("Missing required key: machines"); }
//         sequencer_config = { ...data };
//         finalize({refresh: true, update_buffer: true, operation: "write_all"});
        
//     } catch (e) {
//         post("Invalid JSON: " + e + "\n");
//     }
// }

function load_song(filepath){
    let f = new File(filepath, "read");
    if (!f.isopen) { post("Could not open: " + filepath + "\n"); return; }

    var chunk_size = 16000;
    var text = "";
    var remaining = f.eof;

    while (remaining > 0) {
        var to_read = Math.min(chunk_size, remaining);
        text += f.readstring(to_read);
        remaining -= to_read;
    }

    post("Read " + text.length + " characters\n");
    f.close();

    try {
        let data = JSON.parse(text);
        if (!data.hasOwnProperty("patterns")) { throw new Error("Missing required key: patterns"); }
        if (!data.hasOwnProperty("tracks")) { throw new Error("Missing required key: tracks"); }
        if (!data.hasOwnProperty("machines")) { throw new Error("Missing required key: machines"); }
        sequencer_config = { ...data, encoded_pattern_cache: {} };
        finalize({refresh: true, update_buffer: true, operation: "write_all"});

    } catch (e) {
        post("Invalid JSON: " + e + "\n");
    }
}


function create_fullpath_and_save(){
    var filename = getSafeDatetimeFilename(g_song_name);
    var output_dir = g_song_folder;
    if (output_dir !== null){
        // as output_dir ends in slash, simple concat may suffice x-platform.
        const fullPath = output_dir + filename + ".json";   
        post('writing', fullPath);

        const sequencer_reduxed = { ...sequencer_config};
        sequencer_reduxed.encoded_pattern_cache = {}; // drop the content. but not the key.
        
        var content = JSON.stringify(sequencer_reduxed, null, 2);    // if g_export_indent === true
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

function init_track_buffers(patcher, num_tracks) {
    /*
    Initializer for the buffer-holding subpatcher: ensures one buffer~
    per track exists with the correct sr/size/chans, creating only
    what's missing, and returns Buffer() handles keyed by track index.
    */
    opts = {};
    var sr      = opts.sr      || 1000;   // nominal declared sample rate (not audio driver sr)
    var nsamps  = opts.nsamps  || 2048;   // buffer length in samples (ticks)
    var chans   = opts.chans   || 48;     // channels per buffer
    var x       = opts.x       || 20;
    var y       = opts.y       || 20;
    var y_step  = opts.y_step  || 32;
    var name_fn = opts.name_fn || function (i) { return "t" + i + "_buf"; };

    var buffers = {};

    // check if the subpatcher box already exists before creating a new one
    var subpatch = patcher.getnamed("buffer_storage");

    if (!subpatch) {
        subpatch = patcher.newdefault(5, 25, "p", "buffer_storage");
        subpatch.varname = "buffer_storage";
    }

    var internalPatcher = subpatch.subpatcher();
    internalPatcher.wind.size = [200, 400];
    internalPatcher.wind.visible = 0;

    for (var i = 0; i < num_tracks; i++) {
        var buf_name = name_fn(i);
        var box = internalPatcher.getnamed(buf_name); // matches on varname, see note below

        if (!box) {
            box = internalPatcher.newdefault(x, y + (i * y_step), "buffer~", buf_name);
            box.varname = buf_name; // required so future getnamed(buf_name) calls find it
        }

        // ensure we are working with what we expect.
        box.message("sr", sr);
        box.message("size", nsamps);
        box.message("chans", chans);
        buffers[i] = new Buffer(buf_name);
    }

    return buffers;
}
