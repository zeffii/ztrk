// quickly restore song state when js has changed.

autowatch = 1;
mgraphics.init();

function checkAndBang(obj) { 
    if (obj.maxclass === "loadmess") { 
        obj.bang(); 
        post("banged a loadmess");
    } 
}

function paint(){
    var gfx = mgraphics;
    var [w, h] = gfx.size;
    gfx.set_font_size(12);
    gfx.select_font_face("Consolas", "normal", "normal");
    // var charwidth = gfx.text_measure('_')[0];
    box.size(120, 16);
    let bg_color = [.2, .5, .7, 1.0];
    gfx.set_source_rgba(...bg_color);
    gfx.rectangle(0, 0, 120, 16);
    gfx.fill();
    
    gfx.set_source_rgba(.97, .97, .97, 1.0);
    gfx.move_to(5, 12);
    gfx.show_text("Nuke Loadmess++");
}

function onclick(x, y, button){
    this.patcher.applydeep(checkAndBang);
}
