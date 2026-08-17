inlets = 2;
outlets = 3;

mgraphics.init();
mgraphics.relative_coords = 0;
mgraphics.autofill = 0;

const theme_colors = {
    main_bg_color: [0.2, 0.2, 0.2, 1.0],
    stroke_color: [0.7, 0.3, 0.2, 1.0],
    stroke_color_dark: [0.18, 0.18, 0.18, 1.0],
    active_node: [0.96, 0.7, 0.7, 1.0],
    node: [0.6, 0.3, 0.3, 1.0],
    info_text: [0.3, 0.6, 0.97, 1.0],
    loop_line_color: [0.9, 0.5, 0.5, 1.0]
};

const padding = 17;
const node_size = 7.5;
const env_nodes = [[0.0, 1.0], [0.5, 0.5], [1.0, 0.0]];  // some defaults
const draw_data = {};
      draw_data.coords = [];

const config = {
    font_size: 12, 
    font_descriptor: ["Consolas", "normal", "normal"],
    display_help: false,
    g_in_edit_mode: false,
    g_key_codes: [],
    g_mouse_on_rect: false,
    current_node: 1,
    fine_delta: 0.01,
    coarse_delta: 0.05,
    looping: false,       // implement pingpong between two points later! 
    loop_point: -1,
    use_dashes: true
};

const DELETE = 127;
const SPACEBAR = 32;
const H_KEY = 104;
const Z_KEY = 122;  // because insert is not recognized by maxmsp key object! Z is close.
const S_KEY = 115;
const X_KEY2 = 120;
const [SHIFT, ALT, CTRL, CTRL_SHIFT] = [512, 2048, 4352, 4864];
const [PAGE_UP, PAGE_DOWN] = [11, 12];
const [C_KEY, V_KEY, X_KEY] = [3, 22, 24]; // width modifier
const [UP_KEY, DOWN_KEY] = [30, 31];
const [LEFT_KEY, RIGHT_KEY] = [28, 29];
const MODIFIER_KEYS = [SHIFT, ALT, CTRL, CTRL_SHIFT];


function absolute_coord(rx, ry, w, h){
    var total_width = w - ( 2*padding );
    var total_height = h - ( 2*padding );
    var abs_x = (total_width * rx) + padding;
    var abs_y = (total_height * ry) + padding;
    return [abs_x, abs_y];
}

function calculate_node_locations(gfx, w, h){

    draw_data.coords.length = 0;
    for (const [idx, [cx, cy]] of env_nodes.entries()) {
        var [abs_x, abs_y] = absolute_coord(cx, cy, w, h);
        var [real_x, real_y] = [abs_x - (node_size/2), h - abs_y - (node_size/2)];
        draw_data.coords.push([real_x, real_y]);
    }
};

function midpoint(a, b){
    function round4(num) { return Number(Math.round(num + 'e4') + 'e-4'); }
    return [round4((a[0]+b[0]) / 2.0), round4((a[1]+b[1]) / 2.0)];
}

function dashed_line([x1, y1], [x2, y2], dash_count) {

    dash_count = Math.max(1, dash_count);
    const dashes = [];

    for (let i = 0; i < dash_count; i++) {
        const start_t = i / dash_count;
        const end_t = (i + 0.5) / dash_count;
        const start = [x1 + (x2 - x1) * start_t, y1 + (y2 - y1) * start_t];
        const end = [x1 + (x2 - x1) * end_t, y1 + (y2 - y1) * end_t];
        dashes.push([start, end]);
    }

    return dashes;
}

function fill_background(gfx, w, h){
    gfx.set_source_rgba(...theme_colors.main_bg_color);
    gfx.rectangle(0, 0, w, h);
    gfx.fill();
}

function draw_bounding_rect(gfx, w, h){
    gfx.set_source_rgba(...theme_colors.stroke_color_dark);
    gfx.move_to(padding, padding);
    gfx.rectangle(padding, padding, w-(2*padding), h-(2*padding));
    gfx.stroke();
}

function draw_lines(gfx, w, h){
    
    const num_lines = Object.keys(env_nodes).length;
    gfx.set_source_rgba(...theme_colors.stroke_color);

    for (var i = 0; i < num_lines-1; i++){
        var [x1, y1] = draw_data.coords[i];
        var [x2, y2] = draw_data.coords[i+1];
        gfx.move_to(x1 + (node_size/2), y1 + (node_size/2));
        gfx.line_to(x2 + (node_size/2), y2 + (node_size/2));
        gfx.stroke();        
    }
}

function draw_nodes(gfx, w, h){

    for (const [idx, [cx, cy]] of env_nodes.entries()) {
        var [real_x, real_y] = draw_data.coords[idx];
        var node_color = (config.current_node === idx) ? theme_colors.active_node : theme_colors.node;
        gfx.set_source_rgba(...node_color);
        gfx.rectangle(real_x, real_y, node_size, node_size);
        gfx.stroke();
    }
}

function draw_node_info(gfx, w, h){
    var idx = config.current_node;
    var [nx, ny] = env_nodes[idx];
    var text_content = `Node: ${idx}, X: ${nx.toFixed(4)}, Y: ${ny.toFixed(4)}`;   // Template Literal! woohoo! 
    var [text_width, text_height] = gfx.text_measure(text_content);
    gfx.set_source_rgba(...theme_colors.info_text);
    gfx.move_to(w-padding-text_width, h-padding+text_height);
    gfx.show_text(text_content);
}

function draw_sustain(gfx, w, h){
    if (!config.looping) return;
    if (config.loop_point === -1) return;

    // get the x from the current loop index and draw top to bottom
    var [lx, ly] = env_nodes[config.loop_point];
    var [x1, y1] = absolute_coord(lx, ly, w, h);
    if (!config.use_dashes){
        gfx.move_to(x1, padding);
        gfx.line_to(x1, h-padding);
        gfx.stroke();
    } else {
        var dash_segments = dashed_line([x1, padding], [x1, h-padding], 12);
        for (const [idx, [start, end]] of dash_segments.entries()) {
            gfx.move_to(...start);
            gfx.line_to(...end);
            gfx.stroke();
        }
    }

}

function draw_node_help(gfx, w, h){
    const help_lines = [
        "          Spacebar : Enter edit mode",
        "         LR Arrows : Select next or previous node",
        "       CTRL+Arrows : Move current node around slowly",
        " CTRL+SHIFT+Arrows : Move current node around faster",        
        "                 S : Enable sustain mode on current node",
        "                 X : Remove current node",
        "                 H : Show/Hide this message",
        "                 Z : Insert Node to the right, unless last node",
        "          messages : <move_node idx x y>  - for procedural node moving",
        "                     <display_help>       - Same as H",
        "                     <write nodes>        - to inlet 0, as a list",
        "                     <preset idx>         - not implemented yet"
    ];
    gfx.set_source_rgba(...theme_colors.info_text);
    var [text_width, text_height] = gfx.text_measure("X");
    for (const idx in help_lines){
        gfx.move_to(8, padding + (idx * text_height));
        gfx.show_text(help_lines[idx]);
    }

};

function paint() {
    // state and setup     
    box.size(500, 200);
    var gfx = this.mgraphics;
    var [w, h] = gfx.size;

    gfx.set_font_size(config.font_size);
    gfx.select_font_face(...config.font_descriptor);

    calculate_node_locations(gfx, w, h);  // TODO , only calc when needed
    fill_background(gfx, w, h);
    
    if (!(config.display_help)){
        gfx.set_line_width(2.0);
        draw_bounding_rect(gfx, w, h);
        draw_lines(gfx, w, h);
        draw_sustain(gfx, w, h);
        draw_nodes(gfx, w, h);
        if (config.g_in_edit_mode){
            draw_node_info(gfx, w, h);
        }
    } else {
        draw_node_help(gfx, w, h);
    }

}

function onresize(w, h) {
    // Trigger redraw if necessary
    refresh(); 
}

// custom mesages

function move_node(arg1, arg2, arg3){
    if (!(arg1 in env_nodes)) return;       // node index check, dont ref nodes that dont exist
    if (arg2 > 1.0 || arg2 < 0.0) return;   // bound check for x
    if (arg3 > 1.0 || arg3 < 0.0) return;   // bound check for y
    
    env_nodes[arg1] = [arg2, arg3];
    refresh(); 
}

function display_help(){
    config.display_help = !config.display_help;
    refresh(); 
}

function write(msg){
    // const obj = Object.fromEntries( env_nodes.map((value, index) => [index, value]) );  // if i want a dict output.. do i? yes
    if (msg === 'nodes'){
        outlet(0, ...env_nodes);
    }
}

function array_from_env(path, n) {
    /*
    chatGPT wrote this Path Sampler function. I have not meditated on it at any length, output seems perfect!
    */
    const result = [];

    for (let i = 0; i < n; i++) {
        const x = n > 1 ? i / (n - 1) : 0;
        const intersections = [];

        for (let j = 0; j < path.length - 1; j++) {
            const [x1, y1] = path[j];
            const [x2, y2] = path[j + 1];

            // Vertical segment
            if (x1 === x2) {
                if (x === x1) { intersections.push(y1, y2); }
                continue;
            }

            // Does this segment cross our vertical line?
            if (x >= Math.min(x1, x2) && x <= Math.max(x1, x2)) {
                const t = (x - x1) / (x2 - x1);
                const y = y1 + t * (y2 - y1);
                intersections.push(y);
            }
        }

        // First intersection from y=0
        result.push(intersections.length > 0 ? Math.min(...intersections) : null);
    }

    return result;
}

function fill_buffer(bufname){
    const num_samples = 512;
    var envbuff = new Buffer(bufname);
        envbuff.setattr("sr", 1000);
        envbuff.setattr("chans", 1);
        envbuff.send("sizeinsamps", num_samples);

    const env_as_array = array_from_env(env_nodes, num_samples);
    for (const [idx, value] of env_as_array.entries()) {
        envbuff.poke(1, idx, value);
    }

}

function doppler(ratio){
    // this function squishes nodes towards the left if ratio < 0.5, towards the right if ratio > 0.5, 0.5 = unchanged.

}

function key_handler(){
    
    var [k1, k2, k3, k4] = config.g_key_codes;
    const num_nodes = Object.keys(draw_data.coords).length;
    const MODIFIER = MODIFIER_KEYS.includes(k3);
    const HOLDING_CTRL = (k3 === CTRL);
    const HOLDING_CTRL_SHIFT = (k3 === CTRL_SHIFT);
    var idx = config.current_node;   //shorthand..

    // only select nodes via LR keys
    if ([LEFT_KEY, RIGHT_KEY].includes(k1) && !MODIFIER){
        config.current_node = (k1 === LEFT_KEY) ? Math.max(0, idx-1) : Math.min(num_nodes-1, idx+1);
        this.mgraphics.redraw();
        return;
    }

    // CTRL moves, CTRL+SHIFT moves faster
    if (HOLDING_CTRL || HOLDING_CTRL_SHIFT){

        var [cx, cy] = env_nodes[config.current_node];
        const delta = HOLDING_CTRL ? config.fine_delta : config.coarse_delta;
        const epsilon = config.fine_delta / 2; // distance in the x-axis to nearest node

        if ([UP_KEY, DOWN_KEY].includes(k1)){
            [cx, cy] = (k1 === DOWN_KEY) ? [cx, Math.max(0, cy - delta)] : [cx, Math.min(1.0, cy + delta)];
            env_nodes[config.current_node] = [cx, cy];
            this.mgraphics.redraw();
        } else if ([LEFT_KEY, RIGHT_KEY].includes(k1)){
            /* 
            slightly more involved because a choice is made for the user, 
                - do not step to the left or right of an existing node  (or)
                - resort on-the-fly if node moves beyond x of another node
                - first node never to leave x=0
                - last node can roam free.
            */
            var [lowest, highest] = [0.0, 1.0];
            // lowest and highest x value is limited by neighbouring nodes.
            if (config.current_node === 0){  // first node
                lowest = 0.0;
                highest = 0.0; // env_nodes[1][0] - epsilon;
            } else if (config.current_node === num_nodes - 1){  // last node, maybe introduce a lock param to force 0 at end of envelope.
                highest = 1.0
                lowest = env_nodes[num_nodes-2][0] + epsilon;
            } else {  // inbetween
                highest = env_nodes[config.current_node + 1][0] - epsilon;
                lowest = env_nodes[config.current_node - 1][0] + epsilon;
            }

            [cx, cy] = (k1 === LEFT_KEY) ? [Math.max(lowest, cx - delta), cy] : [Math.min(highest, cx + delta), cy];

            env_nodes[config.current_node] = [cx, cy];
            this.mgraphics.redraw();
        }
        return;
    }
    if (k1 === H_KEY){
        // this should maybe move to the top, and add prevention of other keyhandlers if Help is visible...
        display_help();
        return;
    }
    if (k1 === Z_KEY){
        /*
            if current_node is last node, then insert between n-1 and n
            else insert between n and n+1
        */
        var new_node = [0.0, 0.0];
        if (config.current_node === num_nodes-1){
            new_node = midpoint(env_nodes[idx-1], env_nodes[idx]);
            env_nodes.splice(idx, 0, new_node);
        } else {
            new_node = midpoint(env_nodes[idx+1], env_nodes[idx]);
            env_nodes.splice(idx+1, 0, new_node);
        }

        // inserting nodes to the left of the sustain point updates (loop_point + 1)
        if (config.looping && (idx < config.loop_point)){
            config.loop_point += 1;
        }

        this.mgraphics.redraw();
        return;
    }
    if (k1 == S_KEY){
        post('here')
        config.looping = !config.looping;
        config.loop_point = config.looping ? idx : -1;
        this.mgraphics.redraw();
        return;
    }
    if (k1 == X_KEY2){
        // 3 nodes is the minimum, and first and last node cant be deleted.
        const boundary_nodes = ((idx == 0) || (idx == (num_nodes - 1)));
        if (num_nodes > 3 && !boundary_nodes){
            env_nodes.splice(idx, 1);
            
            // still buggly
            if (config.loop_point > idx) {
                config.loop_point = config.loop_point - 1;
            }
            this.mgraphics.redraw();
            return;
        }
    }
    
}

function keys(a1, a2, a3, a4) {
    /*
    this function is called when keys are pressed, when in edit mode it calls keyhandler too.
    */
    if (config.g_mouse_on_rect){

        if (a1 === SPACEBAR){
            config.g_in_edit_mode = !config.g_in_edit_mode;
            this.mgraphics.redraw();
            return;
        }
        
        if (config.g_in_edit_mode){
            config.g_key_codes = [a1, a2, a3, a4];
            key_handler();
        }
    }
}

function onidle(x, y, button, mod1, shift, caps, opt, mod2) { config.g_mouse_on_rect = true; }
function onidleout(x, y, button, mod1, shift, caps, opt, mod2) { config.g_mouse_on_rect = false; }    
