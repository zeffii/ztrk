// better , tried using `for const idx  in somearrar` and this fails.

    push_to_live(){
        // better name needed as this will be the update handler for external data passing.
        if (this.#AbletonMode === 1){ MakeSimpleNoteDictFromArrays(this.pattern_markup); }

        if (this.jitblock_name && this.current_patcher){
            post('setting jitblock, >>', this.jitblock_name);

            var celldata_array = [];
            var jit_cellblock = this.current_patcher.getnamed(this.jitblock_name);

            // not super efficient looping strategy..
            for (const row_idx in pattern_markup.data){
                const pattern_row_data = pattern_markup.data[row_idx].split(' ');
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

            // pprint(celldata_array);
            
            for (var row = 0; row < celldata_array.length; row++){
                var num_cols = celldata_array[row].length;
                for (var col = 0; col < num_cols; col++){
                    jit_cellblock.set(col, row, celldata_array[row][col]);
                }
            }
            
        }
    }

