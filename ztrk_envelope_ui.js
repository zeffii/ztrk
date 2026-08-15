inlets = 2;
outlets = 3;

mgraphics.init();
mgraphics.relative_coords = 0;
mgraphics.autofill = 0;

const theme_colors = {};
theme_colors.main_bg_color = [0.2, 0.2, 0.2, 1.0];
theme_colors.stroke_color = [0.7, 0.3, 0.2, 1.0];
theme_colors.stroke_color_dark = [0.18, 0.18, 0.18, 1.0];
theme_colors.active_node = [0.3, 0.6, 0.7, 1.0];
theme_colors.node = [0.8, 0.8, 0.7, 1.0];
theme_colors.info_text = [0.3, 0.6, 0.97, 1.0];

const padding = 20;
const node_size = 7.5;
const env_nodes = {};
env_nodes[0] = [0.0, 1.0];
env_nodes[1] = [0.5, 0.5];
env_nodes[2] = [1.0, 0.0];

const draw_data = {};
draw_data.coords = {};

const config = {};
config.font_size = 12;
config.font_descriptor = ["Consolas", "normal", "normal"];
config.display_help = false;

mgraphics.set_font_size(config.font_size);
mgraphics.select_font_face(...config.font_descriptor);
// charwidth = gfx.text_measure('_')[0];

function absolute_coord(rx, ry, w, h){
    var total_width = w - ( 2*padding );
    var total_height = h - ( 2*padding );
    var abs_x = (total_width * rx) + padding;
    var abs_y = (total_height * ry) + padding;
    return [abs_x, abs_y];
}

function calculate_node_locations(gfx, w, h){

    for (const node in env_nodes) {
        if (env_nodes.hasOwnProperty(node)) {
            var [cx, cy] = env_nodes[node];
            var [abs_x, abs_y] = absolute_coord(cx, cy, w, h);
            var [real_x, real_y] = [abs_x - (node_size/2), h - abs_y - (node_size/2)];
            draw_data.coords[node] = [real_x, real_y];
        }
    }
};

function fill_background(gfx, w, h){
    gfx.set_source_rgba(...theme_colors.main_bg_color);
    gfx.rectangle(0, 0, w, h);
    gfx.fill();
}

function draw_bounding_rect(gfx, w, h){
    gfx.set_source_rgba(...theme_colors.stroke_color_dark);
    gfx.move_to(padding, padding);
    // gfx.line_to(w-padding, padding);
    gfx.rectangle(padding, padding, w-(2*padding), h-(2*padding));
    gfx.stroke();
}

function draw_lines(gfx, w, h){
    
    const num_lines = Object.keys(draw_data.coords).length;
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

    for (const node in env_nodes) {
        if (env_nodes.hasOwnProperty(node)) {
            var [real_x, real_y] = draw_data.coords[node];
            gfx.set_source_rgba(...theme_colors.node);
            gfx.rectangle(real_x, real_y, node_size, node_size);
            gfx.stroke();
        }
    }
}

function draw_node_info(gfx, w, h){
    var text_content = "[Node: 0, XY: 0.3, 0.6]";
    var [text_width, text_height] = gfx.text_measure(text_content);
    gfx.set_source_rgba(...theme_colors.info_text);
    gfx.move_to(w-padding-text_width, h-padding+text_height);
    gfx.show_text(text_content);
}

function draw_node_help(gfx, w, h){
    const help_lines = [
        "Spacebar : Enter edit mode",
        "Arrows : Go to next or previous node",
        "Shift+Arrows : Move current node around",
        "S : Enable sustain mode on current node",
        "Del : Remove current node",
        "H : Show/Hide this message"
    ];
    gfx.set_source_rgba(...theme_colors.info_text);
    var [text_width, text_height] = gfx.text_measure("X");
    for (const idx in help_lines){
        gfx.move_to(2*padding, (2*padding) + (idx * text_height));
        gfx.show_text(help_lines[idx]);
    }

};

function paint() {
    // state and setup     
    box.size(500, 200);
    var gfx = this.mgraphics;
    var [w, h] = gfx.size;

    draw_data.coords = {};
    // this could be done once, per calculation update, and redraw
    calculate_node_locations(gfx, w, h);

    fill_background(gfx, w, h);
    
    if (!(config.display_help)){
        gfx.set_line_width(2.0);
        draw_bounding_rect(gfx, w, h);
        draw_lines(gfx, w, h);
        draw_nodes(gfx, w, h);
        draw_node_info(gfx, w, h);
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
    if (arg3 > 1.0 || arg3 < 0.0) return;   // bound check for x
    
    env_nodes[arg1] = [arg2, arg3];
    refresh(); 
}

function display_help(){
    config.display_help = !config.display_help;
    refresh(); 
}