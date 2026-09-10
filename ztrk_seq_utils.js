include("ztrk_pattern_utils.js");

function get_buffer_name_from_track(track){
    return "t" + track + "_buf";
}

function pattern_data_to_2d_Array_string_cells(data){
    /*
    this function currently expects to be passed pattern data in the form of strings, 
    and it splits them up into a 2d array for conversion in cell_to_float.
    */
    var celldata_array = [];

    // not super efficient looping strategy..
    for (const row_idx in data){
        const pattern_row_data = data[row_idx].split(' ');
        var cell_row_data = [];
        for (const param_idx in pattern_row_data){
            var cell_data = pattern_row_data[param_idx];
            if (cell_data.length < 6){
                cell_row_data.push(cell_data)
            } else if (cell_data.length === 6){
                cell_row_data.push(...[cell_data.substring(0, 2), cell_data.substring(2)]);
            }
        }
        celldata_array.push(cell_row_data);
    }
    return celldata_array;
}

// function write_track_buffer_from_Array2D_floats(track, start, num_ticks, array2d){

//     var buffer_name = get_buffer_name_from_track(track);
//     var buff_track = new Buffer(buffer_name);

//     var rows_to_write = Math.min(num_ticks, array2d.length);

//     for (var row = 0; row < rows_to_write; row++){
//         var buffer_index = start + row;
//         for (var col = 0; col < array2d[0].length; col++){
//             var cell = array2d[row][col];  // is a float now.
//             buff_track.poke(col+1, buffer_index, cell);
//         }
//     }
// }

function write_track_buffer_from_Array2D_floats(track, start, num_ticks, array2d, mask = null){

    var buffer_name = get_buffer_name_from_track(track);
    var buff_track = new Buffer(buffer_name);

    var rows_to_write = Math.min(num_ticks, array2d.length);

    for (var row = 0; row < rows_to_write; row++){
        if (mask && mask[row]) continue; // masked — an overlapping pattern owns this tick

        var buffer_index = start + row;
        for (var col = 0; col < array2d[0].length; col++){
            var cell = array2d[row][col];  // is a float now.
            buff_track.poke(col+1, buffer_index, cell);
        }
    }
}


function encodeArray2Dstr_to_float(grid) {
    return grid.map(row => row.map(cell => encode_cell_to_float(cell)));
}

function empty_buffers_by_range(startTrack, endTrack) {
	var count = 0;
	for (var n = startTrack; n <= endTrack; n++) {
		var bufname = `t${n}_buf`;
		new Buffer(bufname).send("clear");
		count++;
	}
	post(`empty_buffers_by_range: cleared ${count} buffer(s) (t${startTrack}_buf .. t${endTrack}_buf)\n`);
}

function generateEmpty2dArrayFloats(track_index, num_samples){
	//var frames = buf.framecount();
    var buffer_name = get_buffer_name_from_track(track_index);
    var buf = new Buffer(buffer_name);    
    var num_channels = buf.channelcount();

    var celldata_array = [];
    for (let row_idx = 0; row_idx < num_channels; row_idx += 1){
        var cell_row_data = [];
        for (let param_idx = 0; param_idx < num_samples; param_idx += 1){ cell_row_data.push(0.0);  }
        celldata_array.push(cell_row_data);
    }
    return celldata_array;
}

