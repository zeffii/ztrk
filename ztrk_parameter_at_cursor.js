// quickly restore song state when js has changed.

autowatch = 1;
mgraphics.init();

var local_payload = {}

function dictionary(dictName) {

    // this is called when a dictionary is passed into the object, it should probably do some update?
    var d = new Dict(dictName);
    var payload = JSON.parse(d.stringify());
    d.freepeer();  // free now that we own our own copy of thet passed dict
    
    const isEmpty = (obj) => Object.keys(obj).length === 0;
    if (isEmpty(payload)){ post('malformed pattern object, or empty..probably empty'); return;  }
    
    if ("track" in payload) {
        local_payload = {...payload};  // get a copy of the payload..
        mgraphics.redraw();
        return;
    }
}

function paint(){

    var gfx = mgraphics;
    var [w, h] = gfx.size;

    gfx.set_font_size(12);
    gfx.select_font_face("Consolas", "normal", "normal");

    var [msg_body, msg_width] = [null, null];

    function replaceKeys(str) {
        return str.replace(/t:/g, 'Type=').replace(/d:/g, 'Default=').replace(/s:/g, 'Scale=');
    }

    function stripParens(str) {
        if (str.startsWith('(') && str.endsWith(')')) {
            return str.slice(1, -1);
        }
        return str;
    }

    if ('track' in local_payload){
        let tail = replaceKeys(local_payload.tail);  // this makes it slightly easier to read
        tail = stripParens(tail);
        msg_body = `Track: ${local_payload.track} | ${local_payload.head.trim()} | ${tail}`;
    } else {
        msg_body = "Waiting for parameters..";
    }

    msg_width = gfx.text_measure(msg_body)[0] + 14;

    box.size(msg_width, 16);
    let bg_color = [.2, .5, .7, 1.0];
    gfx.set_source_rgba(...bg_color);
    gfx.rectangle(0, 0, msg_width, 16);
    gfx.fill();
    
    gfx.set_source_rgba(.97, .97, .97, 1.0);
    gfx.move_to(5, 12);
    gfx.show_text(msg_body);
    
}

