function command(msg){
    if (msg === 'set_matrix'){

      var tracker_row = "C-4 90 .. ....";
        var jit_cellblock = this.patcher.getnamed('baluga');
        var cells = tracker_row.split(" ");
        var row_num = 2;
        
        for (var col = 0; col < cells.length; col++) {
            jit_cellblock.message('set', col, row_num, cells[col]);
        }
    }
}
