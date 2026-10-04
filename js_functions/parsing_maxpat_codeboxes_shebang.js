function read_machine_source_from_maxpat(maxpat_path, machine_name){
    /*
    Opens a .maxpat file as JSON, walks the tree, and returns the contents
    of the first `code` key whose value starts with "// #!<machine_name>".
    Returns null if the file can't be opened, isn't valid JSON, or no
    matching codebox is found.
    */

    var f = new File(maxpat_path, "read");
    if (!f.isopen){
        post("read_machine_source_from_maxpat: couldn't open", maxpat_path, "err:", f.error, "\n");
        return null;
    }

    var text = "";
    var remaining = f.eof;
    while (remaining > 0){
        var to_read = Math.min(16000, remaining);
        text += f.readstring(to_read);
        remaining -= to_read;
    }
    f.close();

    var data;
    try { data = JSON.parse(text); }
    catch(e){
        post("read_machine_source_from_maxpat: bad json —", e, "\n");
        return null;
    }

    return find_codebox_with_shebang(data, machine_name);
}

function find_codebox_with_shebang(node, machine_name){
    /*
    Recursive walk. A "node" can be:
      - a patcher object { boxes: [...] }
      - a box wrapper { box: {...} }
      - a box { code: "...", patcher: {...}, ... }
    We look for a `code` string that starts with "// #!<machine_name>",
    and we also descend into any nested `patcher`.
    */

    if (!node || typeof node !== "object") return null;

    // Does this node itself hold a matching code string?
    if (typeof node.code === "string"){
        var first_line = node.code.split(/\r?\n/)[0].trim();
        if (first_line === `// #!${machine_name}`){
            return node.code;
        }
    }

    // Descend into a nested patcher if present.
    if (node.patcher){
        var found = find_codebox_with_shebang(node.patcher, machine_name);
        if (found) return found;
    }

    // Descend into a box wrapper's contents.
    if (node.box){
        var found = find_codebox_with_shebang(node.box, machine_name);
        if (found) return found;
    }

    // Walk arrays (e.g. `boxes`, `lines`).
    for (var key in node){
        if (!Object.prototype.hasOwnProperty.call(node, key)) continue;
        var child = node[key];
        if (Array.isArray(child)){
            for (var i = 0; i < child.length; i++){
                var found = find_codebox_with_shebang(child[i], machine_name);
                if (found) return found;
            }
        }
    }

    return null;
}

/*
var source = read_machine_source_from_maxpat(
    "C:/Users/zeffi/GITWORX/AbletonMaxLive/ztrk/Machines/Generators/Kick3/Kick3.maxpat",
    "Kick3"
);
if (source){
    var params = parse_genexpr_params(source);
    // ...
}

*/