outlets = 2;
inlets = 3;

mgraphics.init();
mgraphics.relative_coords = 0;
mgraphics.autofill = 0;

var settings_font_size = 12;
var charwidth = 0;
var charheight = 0;

function fmt4(n) {
    return ('0000' + Math.floor(Math.abs(n))).slice(-4) + ' ';
}

function paint(){

    var w = mgraphics.size[0];
    var h = mgraphics.size[1];

    mgraphics.set_font_size(settings_font_size);
    mgraphics.select_font_face("Consolas", "normal", "normal");
    [charwidth, charheight] = mgraphics.text_measure('/');
    var trk_width = mgraphics.text_measure('|    Λ    ')[0];
    var side_width = mgraphics.text_measure('tick  ')[0];
    // post(charwidth, charheight);
    // var tx_wh = mgraphics.text_measure('000 C-5 01 80 0A FFFF 0B FFFF');  // returns width and height
    // var text_w = tx_wh[0];
    // var text_h = tx_wh[1];
    // post('CH', charheight);

    // --- dark background ---
    var dimming  = 1.5;
    mgraphics.set_source_rgba(0.1/dimming, 0.2/dimming, 0.4/dimming, 1);  // almost black
    mgraphics.rectangle(0, 0, w, h);
    mgraphics.fill();


    // sequence info
    mgraphics.translate(30, 50);

    // display patterns ..start with a placeholder structure
    var pattern_data = [
        {pname: '01', trk: 0, start: 0, length: 16, color: [0.2, 0.4, 0.5]},
        {pname: '02', trk: 1, start: 16, length: 48, color: [0.3, 0.4, 0.5]},
        {pname: '03', trk: 2, start: 64, length: 64, color: [0.2, 0.4, 0.5]},
        {pname: '04', trk: 0, start: 128, length: 64, color: [0.1, 0.2, 0.5]},
        {pname: '05', trk: 1, start: 192, length: 16, color: [0.2, 0.4, 0.2]},
        {pname: '06', trk: 2, start: 256, length: 16, color: [0.1, 0.5, 0.5]},
        {pname: '07', trk: 0, start: 384, length: 32, color: [0.2, 0.2, 0.9]}
    ];

    var yoffset = (0.75 * charheight);
    var xoffset = (0.46 * charwidth);
    for (pattern_idx in pattern_data){
        pattern = pattern_data[pattern_idx];
        var [cr, cg, cb] = pattern.color; 
        mgraphics.set_source_rgba(cr, cg, cb, 1);
        mgraphics.rectangle(side_width + (pattern.trk * trk_width) - xoffset, ((pattern.start/16) * charheight) - yoffset, trk_width, ((pattern.length / 16) * charheight) );
        mgraphics.fill();


    }


    // separator lines header
    mgraphics.set_source_rgba(0.4, 0.9, 1.0, 1);
    mgraphics.move_to(0, -10.5);
    mgraphics.line_to(500, -10.5);
    mgraphics.stroke();

    // secondary separator lines
    var sdim = 0.34;
    for (var i = 1; i < 20; i++){
        mgraphics.set_source_rgba(0.4*sdim, 0.9*sdim, 1.0*sdim, 1);
        var lineh = -10.5 + ((i * 8) * charheight);    
        mgraphics.move_to(0, lineh);
        mgraphics.line_to(500, lineh);
        mgraphics.stroke();
    }

    // header
    mgraphics.set_source_rgba(0.4, 0.9, 1.0, 1);

    mgraphics.move_to(0,  -2 * charheight);
    mgraphics.show_text('     |    Λ    |    Λ    |    φ    |');
    mgraphics.move_to(0,  -1 * charheight);
    mgraphics.show_text('tick | gen.00  | gen.01  | fx.01   | →');

    for (var idx = 0; idx < 38; idx++){
        mgraphics.move_to(0,  (idx * charheight));
        var pattern_row = String(fmt4(idx * 16)) + '|'; // |█';
        mgraphics.show_text(pattern_row);        
    }



    post('wooot');
};

function onclick(x, y, button){
    // g_Mouse = [x, y];
    // g_in_edit_mode = !g_in_edit_mode;
    mgraphics.redraw();
}