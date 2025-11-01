include("ztrk_squareClass.js");
outlets = 2;
inlets = 2;


mgraphics.init();
mgraphics.relative_coords = 0;
mgraphics.autofill = 0;

var g_SquaresArray = [];
var g_Mouse = [-1, -1];
var g_IsSomethingClicked = false;
var g_pattern_playhead = 0;
var settings_font_size = 12;

function bang(){
    set_tick_idx();
    mgraphics.redraw();
    outlet(0, g_pattern_playhead);
}

function msg_int(tick){
    g_pattern_playhead = tick;
}

function set_tick_idx(){
    //post("tick: " + g_pattern_playhead);
    return;
}

function clear(){
    g_SquaresArray = [];
    mgraphics.redraw();
}

function paint(){

    var w = mgraphics.size[0];
    var h = mgraphics.size[1];
    var start_x = 30;
    var start_y = 30;

    mgraphics.set_font_size(settings_font_size);
    mgraphics.select_font_face("Consolas", "normal", "normal");
    var tx_wh = mgraphics.text_measure('000 C-5 01 80 0A FFFF 0B FFFF');  // returns width and height
    var text_w = tx_wh[0];
    var text_h = tx_wh[1];

    // --- dark background ---
    mgraphics.set_source_rgba(0.2, 0.3, 0.3, 1);  // almost black
    mgraphics.rectangle(0, 0, w, h);
    mgraphics.fill();

    // --- draw tick position
    var tick_y = start_y + (g_pattern_playhead * settings_font_size) - (0.75*text_h) ;
    mgraphics.set_source_rgba(0.1, 0.1, 0.1, 1);  // almost black
    mgraphics.rectangle(start_x, tick_y, text_w, settings_font_size);
    mgraphics.fill();

    var faux_pattern = [
        '000 C-5 01 80 0A FFFF 0B FFFF',
        '001 ... .. 70 .. .... .. ....',
        '002 ... .. 70 .. .... .. ....',
        '003 D#5 01 80 .. .... 0B 20FF',
        '004 ... .. 70 .. .... .. ....',
        '005 ... .. 70 .. .... .. ....',
        '006 C-5 01 80 0A FFFF 0B FFFF',
        '007 === .. 70 .. .... .. ....',
        '008 ... .. 70 .. .... .. ....',
        '009 C-5 01 80 0A FFFF 0B FFFF',
        '010 ... .. 70 .. .... .. ....',
        '011 ... .. 70 .. .... .. ....',        
        '012 C-5 01 80 0A FFFF 0B FFFF',
        '013 ... .. 70 .. .... .. ....',
        '014 ^^^ 67 .. .. .... .. ....',
        '015 ... .. .. .. .... .. ....',        
    ]


    mgraphics.set_source_rgba(0.4, 0.9, 1.0, 1);
    for (idx in faux_pattern){
        mgraphics.move_to(start_x, start_y + (idx * settings_font_size));
        mgraphics.show_text(faux_pattern[idx]);
    }
    
    // mgraphics.text_measure(text)  // returns width and height

    for (var square in g_SquaresArray){
        mgraphics.rectangle(g_SquaresArray[square].GetRect());
        if (g_SquaresArray[square].isClicked){
            mgraphics.fill();
        }
        mgraphics.stroke();
    }

}

function onclick(x, y, button){
    g_Mouse = [x, y];
    g_IsSomethingClicked = false;

    for (var square in g_SquaresArray){
        g_SquaresArray[square].ResetIsClicked();

        if (g_SquaresArray[square].CheckIfIsClicked(x, y)){
            g_IsSomethingClicked = true;
            // post("IS CLICKED\n");
            mgraphics.redraw();
            //outlet(0, g_pattern_playhead);
        }
    }
    if (!g_IsSomethingClicked){
        g_SquaresArray.push(new Square([x, y, 0, 0]));
    }
    // mgraphics.redraw();

}


function ondrag(x, y, button){

    if (!g_IsSomethingClicked){
        var rect = g_SquaresArray[g_SquaresArray.length-1].GetRect();
        var width = x - rect[0];  // width
        var height = y - rect[1];  // height
        g_SquaresArray[g_SquaresArray.length-1].SetWidthHeight(width, height);
        mgraphics.redraw();
    }
}