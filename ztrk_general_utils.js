function sendTo(name, msg) {
    try {
        var obj = this.patcher.getnamed(name);
        if (!obj) {
            obj = this.patcher.parentpatcher.getnamed(name);
            if (!obj) {
                post("object '" + name + "' not found in patcher or parentpatcher\n");
                return false;
            }
        }
        obj.message(msg);
        return true;
    } catch (e) {
        post("sendTo('" + name + "', '" + msg + "') failed: " + e.message + "\n");
        return false;
    }
}


function _postInfo(msg){
    sendTo("zconsole", ["set_msg", "info", msg]);
}

function _postWarning(msg){
    sendTo("zconsole", ["set_msg", "warning", msg]);
}

function _postLow(msg){
    sendTo("zconsole", ["set_msg", "low", msg]);
}

function _postError(msg){
    sendTo("zconsole", ["set_msg", "error", msg]);
}

const _postMessage = _postInfo;


function _sendAdvanced(control_msg) {
    var [destination, action] = control_msg.split(" ");
    var locators = destination.split('::');
    try {
        var subpatch = this.patcher.getnamed(locators[0]);
        if (!subpatch) {
            _postError(`_sendAdvanced couldn't find scripting name: ${locators[0]} in the current patcher.` )
            return false;
        }
        var internalPatcher = subpatch.subpatcher();
        var toggle_button = internalPatcher.getnamed(locators[1]);
        if (action === "toggle" || action === "bang"){
            toggle_button.message("bang");
            return true
        }
    } catch (e) {
        post(`${control_msg} failed: ${e.message}\n`);
        return false;
    }
    return false;
}


function create_machine_subpatcher(that, muid, trk_index, pname){

    // pname is the name of the subpatcher we are goin goin to add the machine into.
    // not sure how great this is.. we'll see.

    if (!that || !that.patcher) { _postWarning("create_machine_subpatcher: no patcher"); return null; }

    // Create the subpatcher box in the parent patcher, give it a varname.
    var sub = that.patcher.newdefault(20 + (50 * trk_index), 1000, "p", "MACH_" + pname);
    sub.varname = "machine_" + muid;

    var sp = sub.subpatcher();

    // 1. receive for tick signal
    sp.newdefault(20, 20, "r~", "tick_signal");

    // 2. receive for trigger signal
    sp.newdefault(20, 50, "r~", "trig_signal");

    // 3. message box containing the muid
    var msg_box = sp.newdefault(20, 80, "message");
    msg_box.message("set", muid);
    msg_box.size = [155, 22];

    // 4 & 5. send~ for L and R channels, named by track index
    // max will not update the send visually when we .set('name': "ch_L_<index>"),
    // therefore i am giving them generic names. AND
    // setting their new name to the correct name immediately.
    var sendL = sp.newdefault(20, 110, "s~", "SendLeft");   
    sendL.varname = "sendL";
    sendL.message("set", `ch_L_${trk_index}`)
    var sendR = sp.newdefault(20, 140, "s~", "SendRight");
    sendR.varname = "sendR";
    sendR.message("set", `ch_R_${trk_index}`)

    // 6 add the control script that checks the global namespace for thus muid, and which track its in.
    var rebind_rx = sp.newdefault(20, 190, "r", "rebind");
    var binder = sp.newdefault(20, 220, "v8", "ztrk_buffer_binder.js", muid);
    sp.connect(rebind_rx, 0, binder, 0);

    // This is purely for optical reinforcement so we have something that easily displays the name.
    var msgL = sp.newdefault(130, 110, "message");
    msgL.message("set", `ch_L_${trk_index}`);
    msgL.varname = "dispL";

    var msgR = sp.newdefault(130, 140, "message");
    msgR.message("set", `ch_R_${trk_index}`);
    msgR.varname = "dispR";

    return sub;
}


function read_machine_genexpr(machine_name){
    var patch_dir = this.patcher.filepath;
    if (!patch_dir){ post("patch has no filepath — save first"); return null; }
    patch_dir = patch_dir.slice(0, patch_dir.lastIndexOf("/") + 1);

    // Try the full nested layout first.
    var candidates = [
        `${patch_dir}Machines/Generators/${machine_name}/${machine_name}.genexpr`,
        // flat layout — machine file sits directly in Machines/Generators
        `${patch_dir}Machines/Generators/${machine_name}.genexpr`,
        // machine sits in the patch directory itself (test scaffold)
        `${patch_dir}${machine_name}.genexpr`,
        `${patch_dir}${machine_name}/${machine_name}.genexpr`,
    ];

    for (var i = 0; i < candidates.length; i++){
        var path = candidates[i];
        post(`Trying Path: ${path}`);
        var f = new File(path, "read");
        if (f.isopen){
            var text = "";
            var remaining = f.eof;
            while (remaining > 0){
                var to_read = Math.min(16000, remaining);
                text += f.readstring(to_read);
                remaining -= to_read;
            }
            f.close();
            post("genexpr loaded from:", path, "\n");
            return text;
        }
    }

    post(`no genexpr found for ${machine_name} in ${patch_dir}`);
    return null;
}

function parse_genexpr_params(source){
    var params = [];
    // Match: Param name(value);  optionally followed by // (key=val, ...)
    var re = /Param\s+(\w+)\s*\(\s*([-\d.]+)\s*\)\s*;?\s*(?:\/\/\s*\((.*?)\))?/g;
    var m;
    while ((m = re.exec(source)) !== null){
        var name = m[1];
        var def  = parseFloat(m[2]);
        var meta = m[3] || "";

        // Parse the comment: key=value, key=value, ...
        var fields = {};
        var parts = meta.split(",");
        for (var i = 0; i < parts.length; i++){
            var kv = parts[i].split("=");
            if (kv.length === 2){
                fields[kv[0].trim()] = kv[1].trim();
            }
        }

        // scale=[lo,hi]
        var min = null, max = null;
        if (fields.scale){
            var s = fields.scale.replace(/[\[\]\s]/g, "");
            var pair = s.split(",");
            if (pair.length === 2){
                min = parseFloat(pair[0]);
                max = parseFloat(pair[1]);
            }
        }

        params.push({
            name:     name,
            def:      def,
            min:      min,
            max:      max,
            type:     fields.type || null,
            log:      "log" in fields || Object.values(fields).includes("log")
        });
    }
    return params;
}

function build_param_ui(patcher, gen_varname, param_list){

    var gen_obj = patcher.getnamed(gen_varname);
    post("build_param_ui: gen lookup for", gen_varname, "=", gen_obj ? "found" : "null", "\n");
    if (!gen_obj) return;
    post("build_param_ui: creating", param_list.length, "attrui\n");
    // ...

    var gen_rect = gen_obj.rect;
    var gen_x = gen_rect[0];
    var gen_y = gen_rect[1];

    // Stack vertically to the left of the gen~
    var box_w = 200;
    var box_h = 25;
    var y_step = 28;
    var x_offset = -220;   // place to the left of the gen~
    var y_offset = 0;

    for (let i = 0; i < param_list.length; i++){
        var p = param_list[i];
        var px = gen_x + x_offset;
        var py = gen_y + y_offset + (i * y_step);

        var attr_ui = this.patcher.newdefault(px, py, "attrui");
        attr_ui.rect = [px, py, px + box_w, py + box_h];

        attr_ui.setattr("paramonly", 1);
        attr_ui.setattr("attr", p.name);

        this.patcher.connect(attr_ui, 0, gen_obj, 0);
    }
}

function attach_attrui_to_gen(machine_subpatcher, machine_name){
    /*

    To Run.

    var MachineName = "Kick3";
    var machine_subpatcher = this.patcher;
    attach_attrui_to_gen(machine_subpatcher, MachineName);
    */

    var source = read_machine_genexpr(machine_name);
    if (!source){ post("no genexpr for", machine_name, "\n"); return; }

    var params = parse_genexpr_params(source);
    if (!params.length){ post("no params parsed for", machine_name, "\n"); return; }

    build_param_ui(machine_subpatcher, `${machine_name}_gen`, params);
}

