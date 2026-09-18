
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
var charheight = settings_font_size;

var log_color = {
    'warning': [0.9, 0.2, 0.2, 1.0],
    'info': [0.5, 0.7, 0.95, 1.0],
    'debug': [0.2, 0.9, 0.2, 1.0]
};

var default_theme_colors = {
    caret_color: [0.7, 0.2, 0.4, 1],
    status_bg_color: [0.2, 0.3, 0.2, 1.0],
    status_text_color: [0.9, 0.9, 0.7, 1.0]
};

function asRGB(r, g, b, a){ return {r:r, g:g, b:b}};
function set_rgb(c, d){ mgraphics.set_source_rgba(c.r / d, c.g / d, c.b / d, 1); }

function get_text_width_and_height(gfx){
    gfx.set_font_size(ztrk_get_font_size());   //this.settings_font_size);
    gfx.select_font_face(...ztrk_get_font_family());  //"Consolas", "normal", "normal");
    var [cw, ch] = gfx.text_measure('_');
    charheight = ch;
    charwidth = cw;

}

function dark_background(gfx){
    var [w, h] = gfx.size;
    gfx.set_source_rgba(0.01, 0.07, 0.098, 1.0);
    gfx.rectangle(0, 0, w, h);
    gfx.fill();
}

function draw_status_bar(gfx){
    var [w, h] = gfx.size;
    // background.
    set_rgb(asRGB(...default_theme_colors.status_bg_color), 2.3);
    gfx.rectangle(0, h-charheight, w, charheight);
    gfx.fill();
    
    // text
    set_rgb(asRGB(...default_theme_colors.status_text_color), 1.3);
    var ztrk_console_text = "zconsole 0.001";
    var identifier_width = gfx.text_measure(ztrk_console_text + ' ')[0];
    gfx.move_to(w - identifier_width, h - (0.25 * charheight));
    gfx.show_text(ztrk_console_text);    
}

function draw_lines(gfx){
    for (const [idx, line] of output_list.entries()){
        gfx.set_source_rgba(...log_color[line[0]]);
        gfx.move_to(10, 20 + (idx * charheight));
        gfx.show_text(`${line[2]}: ${line[1]}`);
    }
}

function paint(){
    get_text_width_and_height(mgraphics);
    dark_background(mgraphics);
    draw_lines(mgraphics);
    draw_status_bar(mgraphics);
}

function set_msg(...args){
    var kind = args[0];
    args.shift();
    var received_string = args.join(" ");
    output_list.push([kind, received_string, line_idx]);
    line_idx += 1;
    
    if (output_list.length >= 15){
        output_list.shift();
    }
    mgraphics.redraw();
}

/*

    FUNCTION

    const __logging = (obj, kind, msg) => {
        var msg_real = msg.split(' ');
        msg_real.unshift(kind);
        obj.message("set_msg", msg_real); 
    }

    USAGE:
    
    var zconsole = this.patcher.getnamed("zconsole");
    if (zconsole){ __logging(zconsole, "warning", "Gather all start positions."); }

*/
