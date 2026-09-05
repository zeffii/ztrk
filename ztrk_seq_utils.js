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

function write_track_buffer_from_Array2D_floats(track, start, num_ticks, array2d){

    var buffer_name = get_buffer_name_from_track(track);
    var buff_track = new Buffer(buffer_name);

    var rows_to_write = Math.min(num_ticks, array2d.length);

    for (var row = 0; row < rows_to_write; row++){
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