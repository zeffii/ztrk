autowatch = 1;
outlets = 1;
inlets = 1;

var my_muid = jsarguments[1];

function bang(){
    // post('JSARGS', JSON.stringify(jsarguments));
    var map = new Dict("ztrk_muid_map");
    var muidmap_str = map.stringify();
    //post('MAP:', muidmap_str);

    var all = JSON.parse(muidmap_str);
    var entry = all[my_muid];
    
    if (!entry){ 
        outlet(0, "nodata"); 
        post('does not contain muid');
        return; 
    }
    var trk = entry.trk;
    post(`muid ${my_muid} maps to ${trk}`);

    // update the two send~ objects in this subpatcher
    var sendL = this.patcher.getnamed("sendL");
    var sendR = this.patcher.getnamed("sendR");

    if (sendL) sendL.message("set", `ch_L_${trk}`);
    if (sendR) sendR.message("set", `ch_R_${trk}`);

    var dispL = this.patcher.getnamed("dispL");
    var dispR = this.patcher.getnamed("dispR");
    if (dispL) dispL.message("set", `ch_L_${trk}`);
    if (dispR) dispR.message("set", `ch_R_${trk}`);

    // output the buffer name for downstream readers
    outlet(0, `t${trk}_buf`);
    map.freepeer();
}