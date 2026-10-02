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
