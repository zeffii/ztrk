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
    var sendL = sp.newdefault(20, 110, "s~", `ch_L_${trk_index}`);
    sendL.varname = "sendL";
    var sendR = sp.newdefault(20, 140, "s~", `ch_R_${trk_index}`);
    sendR.varname = "sendR";

    // 6 add the control script that checks the global namespace for thus muid, and which track its in.
    var rebind_rx = sp.newdefault(20, 190, "r", "rebind");
    var binder = sp.newdefault(20, 220, "v8", "ztrk_buffer_binder.js", muid);
    sp.connect(rebind_rx, 0, binder, 0);

    return sub;
}