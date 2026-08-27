autowatch = 1;
outlets = 2;
inlets = 2;

mgraphics.init();
mgraphics.relative_coords = 0;
mgraphics.autofill = 0;

var theme_colors = {
    edit_indicator_color: [0.9, 0.5, 0.5, 1.0]
}

var settings_font_size = 12;
var charwidth = 0;
var charheight = 0;
var trk_width = 0;
var side_width = 0;
var global_tick = 0;

var g_in_edit_mode = 0;
var g_looping = 0;
var g_loop_start = 0;
var g_loop_end = 128;
var [rows, cols] = [64, 3];
var g_tcaret = {row:0, col:0};

// selection / editing state
var g_selected_pattern_idx = -1;
var g_next_pname_counter = 8; // bump this whenever a clone/slice mints a new pattern

// a pending "mark" for a new pattern: click empty space in a lane to drop
// the anchor, click again (same lane) to set the far edge, then trigger
// 'create_pattern_from_selection' via command() to turn it into a real pattern
var g_pending_selection = null; // {trk, start, end}

// keyboard only acts while the mouse sits over this ui, same convention as
// the pattern editor: onidle/onidleout flip this, keys() reads g_key_codes.
var g_mouse_on_rect = false;
var g_key_codes = [];

// display patterns ..start with a placeholder structure
var sequence_data = [
    {pname: "01", trk: 0, start: 0, length: 30, color: [0.2, 0.4, 0.5], kind: "gen"},
    {pname: "02", trk: 1, start: 16, length: 48, color: [0.2, 0.4, 0.5], kind: "gen"},
    {pname: "03", trk: 2, start: 64, length: 64, color: [0.2, 0.4, 0.5], kind: "fx"},
    {pname: "04", trk: 0, start: 128, length: 64, color: [0.2, 0.4, 0.5], kind: "gen"},
    {pname: "05", trk: 1, start: 192, length: 16, color: [0.2, 0.4, 0.5], kind: "gen"},
    {pname: "06", trk: 2, start: 256, length: 16, color: [0.2, 0.4, 0.5], kind: "fx"},
    {pname: "07", trk: 0, start: 288, length: 32, color: [0.2, 0.4, 0.5], kind: "gen"}
];

function clamp(v, lo, hi) {
    return Math.max(lo, Math.min(hi, v));
}

function moveCaret(dc, dr) {
    g_tcaret.col = clamp(g_tcaret.col + dc, 0, cols - 1);
    g_tcaret.row = clamp(g_tcaret.row + dr, 0, rows - 1);
    mgraphics.redraw();
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

function command(instruction){
    if (instruction === 'export_sequence_data'){
        post('Exporting Sequence Data\n');
        var outputDict = new Dict('sequence_dict');

        // compose sequencer dict from sequencer list:
        var sequence_data_dict = {};
        for (pattern_idx in sequence_data){
            sequence_data_dict[pattern_idx] = sequence_data[pattern_idx];
        }
        outputDict.parse(JSON.stringify(sequence_data_dict));
        outlet(1, "dictionary", outputDict.name);
    }
    if (instruction === 'get_pmarkup'){
        // var markup = this.patcher.getnamed("TrackerView").getnamed("pattern_markup").getvalueof
        // post(markup.length);
    }
    // editing commands, reachable from a keyboard shortcut object upstream
    if (instruction === 'clone_pattern'){ clone_pattern(); }
    if (instruction === 'move_pattern_up'){ move_pattern_lane(-1); }
    if (instruction === 'move_pattern_down'){ move_pattern_lane(1); }
    if (instruction === 'extend_pattern'){ extend_pattern(16); }
    if (instruction === 'shrink_pattern'){ extend_pattern(-16); }
    if (instruction === 'slice_pattern'){ slice_pattern_at_playhead(); }
    if (instruction === 'create_pattern_from_selection'){ create_pattern_from_selection(); }
    if (instruction === 'cancel_selection'){ g_pending_selection = null; mgraphics.redraw(); }
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

function next_pname(){
    // dumb incrementing label, good enough until patterns carry real identity
    var pname = fmt4(g_next_pname_counter).trim();
    g_next_pname_counter += 1;
    return pname;
}

function found_in(list, value){ return list.indexOf(value) !== -1; }

// --- keyboard input, same shape as the pattern editor's keys()/key_handler --
// only ever acts while the mouse is over this ui (see onidle/onidleout below)

function keys(a1, a2, a3, a4){
    g_key_codes = [a1, a2, a3, a4];
    key_handler();
}

function key_handler(){

    if (!g_mouse_on_rect) return;

    var SHIFT = 512;
    var ALT = 2048;
    var CTRL = 4352;

    var ENTER = 13;
    var ESCAPE = 27;
    var SPACE = 32;
    
    var [UP_KEY, DOWN_KEY] = [30, 31];
    var [LEFT_KEY, RIGHT_KEY] = [28, 29];
    var [MINUS1, PLUS1] = [45, 61]; // reuse the pattern editor's octave keys for length
    var arrows = [UP_KEY, DOWN_KEY, LEFT_KEY, RIGHT_KEY];

    var SELECTOR = g_key_codes[2];
    var USER_KEY = g_key_codes[0];

    if (USER_KEY === SPACE){
        g_in_edit_mode = !g_in_edit_mode;
        mgraphics.redraw();
        return;
    }
    
    if (SELECTOR === CTRL){
        var char = String.fromCharCode(USER_KEY).toUpperCase();
        if (char === 'C'){ clone_pattern(); return; }
        if (char === 'S'){ slice_pattern_at_playhead(); return; }
    }

    if (SELECTOR === ALT){
        if (USER_KEY === UP_KEY){ move_pattern_lane(-1); return; }
        if (USER_KEY === DOWN_KEY){ move_pattern_lane(1); return; }
    }

    if (found_in([MINUS1, PLUS1], USER_KEY)){
        extend_pattern(USER_KEY === MINUS1 ? -16 : 16);
        return;
    }

    if (USER_KEY === ENTER){
        create_pattern_from_selection();
        return;
    }

    if (USER_KEY === ESCAPE){
        g_pending_selection = null;
        mgraphics.redraw();
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

// --- hit testing : inverse of the rect math used in paint() ---
// keeping this in one place so paint() and onclick() never drift apart

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

// --- editing actions ---
// these all operate on g_selected_pattern_idx. hooked up for real where the
// math is trivial (clone / move lane / extend); left dummy where the actual
// pattern *content* would need to be touched, since that lives outside this UI.

function clone_pattern(){
    if (g_selected_pattern_idx < 0) return;
    var src = sequence_data[g_selected_pattern_idx];
    var clone = {
        pname: next_pname(),
        trk: src.trk,
        start: src.start + src.length,
        length: src.length,
        color: src.color.slice(),
        kind: src.kind
    };
    sequence_data.push(clone);
    g_selected_pattern_idx = sequence_data.length - 1;
    post('cloned pattern ' + src.pname + ' -> ' + clone.pname + '\n');
    mgraphics.redraw();
}

function move_pattern_lane(direction){
    if (g_selected_pattern_idx < 0) return;
    var p = sequence_data[g_selected_pattern_idx];
    var new_trk = p.trk + direction;
    if (new_trk < 0) return; // no upper clamp yet, lane count isn't fixed here
    p.trk = new_trk;
    post('moved pattern ' + p.pname + ' to lane ' + p.trk + '\n');
    mgraphics.redraw();
}

function extend_pattern(delta_ticks){
    if (g_selected_pattern_idx < 0) return;
    var p = sequence_data[g_selected_pattern_idx];
    var new_length = p.length + delta_ticks;
    if (new_length < 16) new_length = 16; // floor at one row-group
    p.length = new_length;
    post('resized pattern ' + p.pname + ' to length ' + p.length + '\n');
    mgraphics.redraw();
}

function slice_pattern_at_playhead(){
    if (g_selected_pattern_idx < 0) return;
    var p = sequence_data[g_selected_pattern_idx];
    if (global_tick <= p.start || global_tick >= (p.start + p.length)){
        post('playhead is outside the selected pattern, nothing to slice\n');
        return;
    }

    // sequencing-side split is real: two entries with matching start/length.
    // the actual row data each half should contain is a dummy for now --
    // that needs to reach into the per-machine pattern content, not this file.
    var first_length = global_tick - p.start;
    var second_length = p.length - first_length;

    var second_half = {
        pname: next_pname(),
        trk: p.trk,
        start: global_tick,
        length: second_length,
        color: p.color.slice(),
        kind: p.kind
    };

    p.length = first_length;
    sequence_data.push(second_half);

    slice_pattern_content_dummy(p, second_half); // <- stub, see below

    post('sliced pattern ' + p.pname + ' at tick ' + global_tick + '\n');
    mgraphics.redraw();
}

function snap16(tick){
    return Math.round(tick / 16) * 16;
}

function mark_selection_point(trk, tick){
    tick = snap16(tick);
    if (g_pending_selection === null || g_pending_selection.trk !== trk){
        // first mark in this lane (or switching lanes): drop a fresh anchor
        g_pending_selection = {trk: trk, start: tick, end: tick};
    } else {
        // second mark in the same lane: set the far edge
        g_pending_selection.end = tick;
    }
    mgraphics.redraw();
}

function create_pattern_from_selection(){
    if (g_pending_selection === null) return;
    var sel = g_pending_selection;
    var lo = Math.min(sel.start, sel.end);
    var hi = Math.max(sel.start, sel.end);
    var length = hi - lo;
    if (length <= 0){
        post('selection has no length, nothing to create\n');
        return;
    }

    var fresh = {
        pname: next_pname(),
        trk: sel.trk,
        start: lo,
        length: length,
        color: [0.2, 0.4, 0.5],
        kind: "gen"
    };
    sequence_data.push(fresh);
    g_selected_pattern_idx = sequence_data.length - 1;
    g_pending_selection = null;
    post('created pattern ' + fresh.pname + ' at lane ' + fresh.trk + ', tick ' + fresh.start + ', length ' + fresh.length + '\n');
    mgraphics.redraw();
}

function slice_pattern_content_dummy(first_half, second_half){
    // TODO: once pattern row-data lives somewhere addressable from here,
    // copy/split the underlying rows so second_half actually starts with
    // whatever was under the playhead. For now this is just a hook.
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

function draw_pending_selection(){
    if (g_pending_selection === null) return;

    var yoffset = (0.75 * charheight);
    var xoffset = (0.46 * charwidth);
    var lo = Math.min(g_pending_selection.start, g_pending_selection.end);
    var hi = Math.max(g_pending_selection.start, g_pending_selection.end);

    var rect_start_x = side_width + (g_pending_selection.trk * trk_width) - xoffset;
    var rect_start_y = ((lo/16) * charheight) - yoffset;
    var rect_h = ((hi - lo) / 16) * charheight;
    if (rect_h < 1) rect_h = 1; // still show a sliver at a bare anchor point

    set_rgb({r:1.0, g:1.0, b:1.0}, 1.0);
    mgraphics.rectangle(rect_start_x, rect_start_y, trk_width, rect_h);
    mgraphics.stroke();
}

function draw_track_cursor(){
    // lol, this is wnky for the first 16 ticks
    set_rgb({r:1.0, g:0.5, b:0.3}, 1.0);
    var cx = side_width + (g_tcaret.col * trk_width);
    var cy = (g_tcaret.row * charheight);
    mgraphics.rectangle(cx-2 , cy+3, trk_width-3, -charheight*.9);
    mgraphics.stroke();
    post('doing!');
}

function draw_edit_mode_indicator(h){

    if (g_in_edit_mode){
        // this.mgraphics.set_source_rgba(0.9, 0.5, 0.5, 1.0); // this.edit_indicator_color
        mgraphics.set_source_rgba(...theme_colors.edit_indicator_color);
        mgraphics.rectangle(0, 0, 5, 39, 39);
        mgraphics.fill();        
    }
}

function paint(){

    const gfx = mgraphics;
    var [w, h] = gfx.size;
    
    mgraphics.set_font_size(settings_font_size);
    mgraphics.select_font_face("Consolas", "normal", "normal");
    [charwidth, charheight] = mgraphics.text_measure('/');
    trk_width = mgraphics.text_measure('|    Λ    ')[0];
    side_width = mgraphics.text_measure('tick  ')[0];

    // --- dark background ---
    var color = {r: 0.4, g: 0.9, b: 1.0};
    var dimming  = 1.5;
    mgraphics.set_source_rgba(0.1/dimming, 0.2/dimming, 0.4/dimming, 1);  // almost black
    mgraphics.rectangle(0, 0, w, h);
    mgraphics.fill();

    draw_edit_mode_indicator(h);

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
    draw_pending_selection();

    var yoffset = (0.75 * charheight);
    var xoffset = (0.46 * charwidth);
    for (pattern_idx in sequence_data){
        pattern = sequence_data[pattern_idx];
        var [cr, cg, cb] = pattern.color; 
        mgraphics.set_source_rgba(cr, cg, cb, 1);
        if (pattern.kind === "fx"){
            set_rgb({r:0.9 ,g: 0.34, b: 0.3}, 1.2);    
        }

        var rect_start_x = side_width + (pattern.trk * trk_width) - xoffset;
        var rect_start_y = ((pattern.start/16) * charheight) - yoffset;
        mgraphics.rectangle(rect_start_x, rect_start_y, trk_width, ((pattern.length / 16) * charheight) );
        mgraphics.fill();
        set_rgb(color, 0.7);
        if (pattern.kind === "fx"){
            set_rgb({r:0.9 ,g: 0.34, b: 0.2}, 0.5);    
        }        
        mgraphics.rectangle(rect_start_x, rect_start_y, trk_width, ((pattern.length / 16) * charheight) );
        mgraphics.stroke();

        if (pattern_idx == g_selected_pattern_idx){
            set_rgb({r:1.0, g:1.0, b:1.0}, 1.0);
            mgraphics.rectangle(rect_start_x, rect_start_y, trk_width, ((pattern.length / 16) * charheight) );
            mgraphics.stroke();
        }

        set_rgb({r:0.82, g:0.82, b:0.82}, 1.0);
        mgraphics.move_to(rect_start_x + xoffset, rect_start_y + yoffset);
        mgraphics.show_text(pattern.pname);

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
    draw_track_cursor();
};

// mgraphics calls onidle continuously while the mouse is over the ui (click
// or not), and onidleout once when it leaves -- same pair the pattern editor
// uses to gate keys(). Also keeps the pending-selection ghost tracking live.
function onidle(x, y, button, mod1, shift, caps, opt, mod2){
    g_mouse_on_rect = true;

    if (g_pending_selection === null) return;

    var local_x = x - 30;
    var local_y = y - 50;
    var tick = snap16(tick_from_y(local_y));

    if (tick !== g_pending_selection.end){
        g_pending_selection.end = tick;
        mgraphics.redraw();
    }
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
