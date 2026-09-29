// const {ZKEYMAP} = require("ztrk_general_utils.js");

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
var output_list = [];
var settings_font_size = ztrk_get_font_size(); // 12;
var charwidth = 6.60;   // this gets updated at runtime. see this.get_text_width_and_height();
var charheight = settings_font_size;

var num_items_to_display = 25;
var max_line_buffer_length = 200;
const set_buffer_length = (new_length) => { 
    max_line_buffer_length = new_length;
    mgraphics.refresh();
};

var scrollbar_width = 6;
var scroll_offset = 0;        // 0 = latest; grows as you scroll back
var scrollbar_thumb_h = 20;   // recalculated each draw, used by ondrag
var drag_start_y = null;
var drag_start_offset = 0;
var scrollbar_side = 1;
var padding = 10;

var terminal_text = "";
var syntax_highlight = "basic"; //  off 
var inserting = 0;
var insert_index = 0;
var direction = 0;

function max_scroll(){
    return Math.max(0, output_list.length - num_items_to_display);
}
function clamp_scroll(){
    scroll_offset = Math.max(0, Math.min(scroll_offset, max_scroll()));
}

function set_scrollbar_side(num){
    switch(num){
        case 0: scrollbar_side = 0; break;
        case 1: scrollbar_side = 1; break;
        default: scrollbar_side = 1;
    }
    mgraphics.redraw();
}


var log_color = {
    warning: [0.9, 0.2, 0.2, 1.0],
    info: [0.5, 0.7, 0.95, 1.0],
    debug: [0.2, 0.9, 0.2, 1.0],
    low: [1.0, 0.502, 0.0, 1.0],
    special: [1.0, 0.802, 0.81, 1.0]
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
    var ztrk_console_text = "zconsole v.009";
    var identifier_width = gfx.text_measure(ztrk_console_text + ' ')[0];
    gfx.move_to(w - identifier_width, h - (0.25 * charheight));
    gfx.show_text(ztrk_console_text);    
}

function draw_lines(gfx){
    var [w, h] = gfx.size;

    var end = output_list.length - scroll_offset;
    var start = Math.max(0, end - num_items_to_display);
    var recent_list = output_list.slice(start, end);
    var insert = "|";

    // history
    for (const [idx, line] of recent_list.reverse().entries()){
        var color = log_color[line[0]] || log_color.info;
        gfx.set_source_rgba(...color);
        gfx.move_to(10, h - ((idx+1) * charheight) - padding - charheight);
        gfx.show_text(`${line[1]}`);
    }
    // terminal
    if (syntax_highlight === "off"){
        gfx.set_source_rgba(...log_color.low);
        gfx.move_to(10, h - padding - charheight);
        gfx.show_text(`$ ${terminal_text}`);
        gfx.set_source_rgba(...log_color.special);
        gfx.show_text("⁃");
    } else {
        gfx.set_source_rgba(...log_color.low);
        gfx.move_to(10, h - padding - charheight);
        gfx.show_text(`$ `);
        for (const char of terminal_text){
            gfx.set_source_rgba(...log_color.low);
            if ("()/\\[]{}!><,*&^%$#@~|;:".indexOf(char) > -1)
                gfx.set_source_rgba(...log_color.special);
            else if ("0123456789".indexOf(char) > -1){
                gfx.set_source_rgba(...log_color.info);
            }
            gfx.show_text(char);
        }
        gfx.set_source_rgba(...log_color.special);
        gfx.show_text("⁃");
    }

    if (inserting) {
        gfx.set_source_rgba(...log_color.special);
        gfx.move_to(10 + (1.5 * charwidth), h - padding - charheight);
        gfx.show_text(" ".repeat(insert_index) + insert);
    }

}

function draw_scrollbar(gfx){
    var [w, h] = gfx.size;
    var track_h = h - (2 * charheight);
    var total = output_list.length;
    if (total <= num_items_to_display) return; // nothing to scroll

    scrollbar_thumb_h = Math.max(20, track_h * (num_items_to_display / total));
    var scroll_range = max_scroll();
    var travel = track_h - scrollbar_thumb_h;
    var thumb_y = scroll_range === 0 ? 0 : ((scroll_range - scroll_offset) / scroll_range) * travel;
    var bar_x = (scrollbar_side === 1) ? w - scrollbar_width : 0;

    gfx.set_source_rgba(0.15, 0.15, 0.18, 1.0);
    gfx.rectangle(bar_x, 0, scrollbar_width, track_h);
    gfx.fill();

    gfx.set_source_rgba(0.6, 0.6, 0.65, 1.0);
    gfx.rectangle(bar_x, thumb_y, scrollbar_width, scrollbar_thumb_h);
    gfx.fill();
}

function set_num_lines_to_dispay(gfx){
    var [w, h] = gfx.size;
    num_items_to_display = Math.floor((h - padding) / charheight);
};

function paint(){

    // book keeping
    get_text_width_and_height(mgraphics);
    set_num_lines_to_dispay(mgraphics);

    // drawing
    dark_background(mgraphics);
    draw_lines(mgraphics);
    draw_scrollbar(mgraphics);
    draw_status_bar(mgraphics);
}

function set_msg(...args){
    var kind = args.shift();
    var received_string = args.join(" ");
    output_list.push([kind, received_string, line_idx]);
    line_idx += 1;
    
    // if scrolled back and new lines arrive then this ensures offset 
    // stays valid rather than pointing past the end.
    clamp_scroll(); 
    
    if (output_list.length >= max_line_buffer_length){
        output_list.shift();
    }
    mgraphics.redraw();
}

// Handler for Keys.
// function onkeydown(keycode: number, textcharacter: number, updown: number, mod1: number, shift: number, caps: number, opt: number, mod2: number): number;
function onkeydown(keycode, textcharacter, updown, mod1, shift, caps, opt, mod2){
    // that handles repeat keys no problem!
    const ASCII = (key) => String.fromCharCode(key);
    //set_msg('info', [JSON.stringify([keycode, textcharacter, updown, shift, ASCII(textcharacter)])]);
    
    const [SPACE, BACKSPACE, TAB, INSERT, HOME, DEL] = [-2, -7, -5, -8, -15, -6];
    const [LEFT, RIGHT, UP, DOWN] = [-11, -12, -9, -10];

    function insert_char(){ terminal_text += ASCII(textcharacter) };
    function perform_backspace() { terminal_text = terminal_text.slice(0, -1); }
    function move_cursorLR(keycode){
        if (inserting){
            direction = (keycode === LEFT) ? -1 : 1;
            insert_index += direction;
            insert_index = Math.max(0, insert_index);
            insert_index = Math.min(terminal_text.length, insert_index);
            set_msg('info', `Insert Index: ${insert_index}`);
        }
    }

    switch (keycode){
        case SPACE: insert_char(); break;
        case BACKSPACE: case DEL:
            if (inserting){
                terminal_text = terminal_text.substring(0, insert_index) + terminal_text.substring(insert_index + 1);
                insert_index -= 1;
            } else {
                perform_backspace(); break;
            }
        case LEFT: case RIGHT: 
            move_cursorLR(keycode); break;
        case UP: case DOWN: 
            set_msg('info', "NAVIGATION U/D"); break;
        case INSERT:
            inserting = !inserting; 
            if (inserting) {
                direction = 0;
                insert_index = terminal_text.length + direction;
            }
            break;
        default: 
            let ch = ASCII(textcharacter);
            if (inserting){
                terminal_text = terminal_text.slice(0, insert_index) + ch + terminal_text.slice(insert_index);
            }
            else {
                terminal_text += ch;
            }
            // set_msg('info', ASCII(textcharacter)); break;
    }
    mgraphics.redraw();
}

function onclick(x, y, but, cmd, shift, capslock, option, ctrl){

    var [w, h] = mgraphics.size;
    var hit = (scrollbar_side === 1) ? (x >= w - scrollbar_width) : (x <= scrollbar_width);
    if (hit){
        drag_start_y = y;
        drag_start_offset = scroll_offset;
    }
}

function ondrag(x, y, but, cmd, shift, capslock, option, ctrl){
    if (drag_start_y === null) return;
    var [w, h] = mgraphics.size;
    var track_h = h - charheight;
    var travel = track_h - scrollbar_thumb_h;
    var scroll_range = max_scroll();
    if (scroll_range === 0 || travel <= 0) return;

    var dy = y - drag_start_y;
    scroll_offset = drag_start_offset - (dy / travel) * scroll_range;
    clamp_scroll();
    mgraphics.redraw();
}

function onresize(w, h){
    set_num_lines_to_dispay(mgraphics);
    clamp_scroll();
    mgraphics.redraw();
}

function print_logo(){
    var line1 = "           dP                              dP                        "; 
    var line2 = "           88                              88                        "; 
    var line3 = "d888888b d8888P 88d888b. .d8888b. .d8888b. 88  .dP  .d8888b. 88d888b."; 
    var line4 = "   .d8P'   88   88'  `88 88'  `88 88'  `\"\" 88888\"   88ooood8 88'  `88";
    var line5 = " .Y8P      88   88       88.  .88 88.  ... 88  `8b. 88.  ... 88      ";
    var line6 = "d888888P   dP   dP       `88888P8 `88888P' dP   `YP `88888P' dP      v.009";
    var lines = [line1, line2, line3, line4, line5, line6];

    for (const line in lines){
        set_msg('low', lines[line]);
    }
    set_msg('info', "i'm alive!");

}

