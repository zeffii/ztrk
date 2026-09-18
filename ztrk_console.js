
autowatch = 1;
outlets = 2;
inlets = 2;

mgraphics.init();
mgraphics.relative_coords = 0;
mgraphics.autofill = 0;

const g_font_dict = new Dict("ztrk_font_settings");
if (!g_font_dict.contains("fontFamily")) g_font_dict.set("fontFamily", ["Consolas", "normal", "normal"]);
if (!g_font_dict.contains("fontSize"))   g_font_dict.set("fontSize", 12);
const ztrk_get_font_family = () => g_font_dict.get("fontFamily");
const ztrk_get_font_size   = () => g_font_dict.get("fontSize");

var line_idx = 0;
var output_list = []
var settings_font_size = ztrk_get_font_size(); // 12;
var charwidth = 6.60;   // this gets updated at runtime. see this.get_text_width_and_height();
var charheight = null;

var log_color = {
    'warning': [0.9, 0.2, 0.2, 1.0],
    'info': [0.2, 0.2, 0.9, 1.0],
    'debug': [0.2, 0.9, 0.2, 1.0]
};

function get_text_width_and_height(){
        var gfx = mgraphics;
        gfx.set_font_size(ztrk_get_font_size());   //this.settings_font_size);
        gfx.select_font_face(...ztrk_get_font_family());  //"Consolas", "normal", "normal");
        [charwidth, charheight] = gfx.text_measure('A');
}

function dark_background(){
    var gfx = mgraphics;
    var [w, h] = gfx.size;
    // gfx.set_source_rgba(0.1, 0.2, 0.4, 1);  // this.ui_bg_color
    gfx.set_source_rgba(0.01, 0.07, 0.098, 1.0);
    gfx.rectangle(0, 0, w, h);
    gfx.fill();
}

function paint(){
    var gfx = mgraphics;
    get_text_width_and_height();
    dark_background();

    for (const [idx, line] of output_list.entries()){
        gfx.set_source_rgba(...log_color[line[0]]);
        gfx.move_to(10, 20 + (idx * charheight));
        gfx.show_text(`${line[2]}: ${line[1]}`);
    }
    mgraphics.redraw();
}

function set_msg(...args){
    var received_string = args.join(" ");
    post("triggered!", received_string);
    output_list.push([args[0], received_string, line_idx]);
    line_idx += 1;

    if (output_list.length >= 15){
        output_list.shift();
    }
}