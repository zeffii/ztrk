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

const config = {
    font_size: 12, 
    font_descriptor: ["Consolas", "normal", "normal"],
    display_help: false,
    g_in_edit_mode: false,
    g_key_codes: [],
    g_mouse_on_rect: false,
};

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

function fill_background(gfx, w, h){
    gfx.set_source_rgba(...theme_colors.main_bg_color);
    gfx.rectangle(0, 0, w, h);
    gfx.fill();
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

function draw_bounding_rect(gfx, w, h){
    gfx.set_source_rgba(...theme_colors.stroke_color_dark);
    gfx.move_to(padding, padding);
    gfx.rectangle(padding, padding, w-(2*padding), h-(2*padding));
    gfx.stroke();
}

function paint() {
    // state and setup     
    box.size(500, 200);
    var gfx = this.mgraphics;
    var [w, h] = gfx.size;

    gfx.set_font_size(config.font_size);
    gfx.select_font_face(...config.font_descriptor);

    // calculate_node_locations(gfx, w, h);  // TODO , only calc when needed
    fill_background(gfx, w, h);
    
    if (!(config.display_help)){
        gfx.set_line_width(2.0);
        draw_bounding_rect(gfx, w, h);
        // draw_lines(gfx, w, h);
        // draw_sustain(gfx, w, h);
        //draw_nodes(gfx, w, h);
        //if (config.g_in_edit_mode){
        //    draw_node_info(gfx, w, h);
        //}
    } else {
        draw_node_help(gfx, w, h);
    }

}