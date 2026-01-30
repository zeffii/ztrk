function getMethods(obj)
{
    var res = [];
    for(var m in obj) {
        if(typeof obj[m] == "function") {
            res.push(m)
        }
    }
    return res.join(' ');
}

function command(msg){
    if (msg === 'set_matrix'){
        
        post('yep');

        var celldata_array = [];
        var jit_cellblock = this.patcher.getnamed('baluga');

        // column, row.
        jit_cellblock.set(3, 2, "ueeee");
        post(getMethods(jit_cellblock));
    }
}


