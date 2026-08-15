mgraphics.init();
mgraphics.relative_coords = 0;
mgraphics.autofill = 0;

const theme_colors = {};
theme_colors.main_bg_color = [0.2, 0.2, 0.2, 1.0];
theme_colors.stroke_color = [0.7, 0.3, 0.2, 1.0];
theme_colors.active_node = [0.3, 0.6, 0.7, 1.0];
theme_colors.node = [0.8, 0.8, 0.7, 1.0];

const padding = 50;
const node_size = 15;
const env_nodes = {};
env_nodes[0] = [0.0, 1.0];
env_nodes[1] = [0.5, 0.5];
env_nodes[2] = [1.0, 0.0];

function absolute_coord(rx, ry, w, h){
    var total_width = w - ( 2*padding );
    var total_height = h - ( 2*padding );
    var abs_x = (total_width * rx) + padding;
    var abs_y = (total_height * ry) + padding;
    return [abs_x, abs_y];
}

function fill_background(gfx, w, h){
    gfx.set_source_rgba(...theme_colors.main_bg_color);
    gfx.rectangle(0, 0, w, h);
    gfx.fill();
}

function draw_bounding_rect(gfx, w, h){
    gfx.set_source_rgba(...theme_colors.stroke_color);
    gfx.move_to(padding, padding);
    gfx.line_to(w-padding, padding);
    gfx.set_line_width(5.0);
    gfx.stroke();
}

function draw_nodes(gfx, w, h){
    // Object.keys(env_nodes).length;
    for (const node in env_nodes) {
        if (env_nodes.hasOwnProperty(node)) {
            var [cx, cy] = env_nodes[node];
            var [abs_x, abs_y] = absolute_coord(cx, cy, w, h);
            gfx.set_source_rgba(...theme_colors.node);
            gfx.rectangle(abs_x - (node_size/2), h - abs_y - (node_size/2), node_size, node_size);
            gfx.stroke();
        }
    }
};

function paint() {
    // state and setup     
    box.size(1200, 480);
    var gfx = this.mgraphics;
    var [w, h] = gfx.size;

    fill_background(gfx, w, h);
    draw_bounding_rect(gfx, w, h);
    draw_nodes(gfx, w, h);
}

function onresize(w, h) {
    // Trigger redraw if necessary
    refresh(); 
}