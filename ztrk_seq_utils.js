include("ztrk_pattern_utils.js");

function write_track_buffer(props, array2d){

    var buff_track = new Buffer(props.buffer_name);

    // these are set already.
    // buff_track.setattr("sr", 1000);
    // buff_track.setattr("chans", 24);
    // buff_track.send("sizeinsamps", pattern_length);

    // probably not sane to do this in the context of a massive buffer track.
    // var array2d = pattern_data_to_2d_array(tracker.pattern_markup.data);

    for (var row = 0; row < array2d.length; row++){
        for (var col = 0; col < array2d[0].length; col++){
            var celld = array2d[row][col];
            var floatval = encode_cell_to_float(celld);
            buff_track.poke(col+1, row, floatval);
        }
    }
}