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

function _postMessage(msg){
    sendTo("zconsole", ["set_msg", "info", msg]);
}

// could have _postInfo _postWarning _postLow _postError