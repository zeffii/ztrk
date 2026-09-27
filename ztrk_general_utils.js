function sendTo(name, msg) {
    try {
        var obj = this.patcher.getnamed(name);
        if (!obj) {
            post("object '" + name + "' not found\n");
            return false;
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

// could have _postInfo _postWarning _postLow _postError