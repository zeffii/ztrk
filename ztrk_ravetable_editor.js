/// RaveTable 2026
/// 2048 normal resolution
/// 8192 current industry standard 
/// rebuild and augmentation of my 2019 RavetTable SoftSynth (C++).

inlets = 2;
outlets = 3;

mgraphics.init();
mgraphics.relative_coords = 0;
mgraphics.autofill = 0;

const sin = Math.sin;

function make_param(...params){
    const [param, param_props] = [{}, ["def", "min", "max", "longname", "shortname"]];
    for (const [idx, value] of params.entries())
        param[param_props[idx]] = value;
    return param;
}

const params = {
    Amp:   make_param(1.0,    0.0, 4.0,   "Amplifier",   "Amp"),
    A01:   make_param(0.5,    0.0, 4.0,   "Osc 1 Amp",   "A01"),
    A02:   make_param(0.25,   0.0, 4.0,   "Osc 2 Amp",   "A02"),
    A03:   make_param(0.123,  0.0, 4.0,   "Osc 3 Amp",   "A03"),
    A04:   make_param(0.0625, 0.0, 4.0,   "Osc 4 Amp",   "A04"),
    NMix:  make_param(0.0,    0.0, 1.0,   "Noise Mix",   "NMix"),
    Seed:  make_param(1.0,    0.0, 255.0, "Noise Seed",  "Seed"),
    Shift: make_param(0.0,    0.0, 1.0,   "Noise Rot",   "Shift"),
    Sm:    make_param(0.0,    0.0, 1.0,   "smoothing",   "Sm")
}

// init the ravetable variables using defaults.
const RaveTable = {buff: null, buff_name: null, data: [], num_samples: 2048};
for (const [key, value] of Object.entries(params)) { 
    RaveTable[key] = value.def;
}

// dynamic function definitions in a loop.
for (const [key, param_props] of Object.entries(params)) { 
    // hard clamp to avoid accidental out of bounds input.
    eval(
    `function ${key}(value) { 
        if (value > params.${key}.max) { value = params.${key}.max }
        else if ( value < params.${key}.min) { value = params.${key}.min }
        RaveTable.${key} = value;
        update_wavetable();
    }`);
}

function fill_buffer(bufname, data){
    for (const [idx, value] of data.entries()) {
        RaveTable.buff.poke(1, idx, value);
    }
}

function generate_wavetable(){    
    /*
    this is where the fun stuff happens! port from namesake function in airtracker.

    */
    // sanity_check_all_params() ?  in case i'm offering a dict input for mass param update ( like a preset palette)

    function generate_noise(n, seed){
        // seed?
        return Array.from({ length: n }, () => Math.random() * 2 - 1);
    } 

    // void mix_signal_into_nfsamples(std::vector<RT_Point> &nfsamples, float *noise_samples, float mix){
    //     int numsamples = nfsamples.size();
    //     for (int i = 0; i < numsamples; ++i) {
    //         nfsamples[i].y = float_lerp(nfsamples[i].y, noise_samples[i], mix);
    //     }
    // };

    /*

void float_constrain(float& x, float x_min, float x_max){
    if (x <= x_min) x = x_min;
    else if (x >= x_max) x = x_max;
};

void float_fold_constrain(float& x, float x_min, float x_max){
    if (x < x_min) {
        float diff = abs(x - x_min);
        x = x_min + diff;
    }
    else if (x > x_max) {
        float diff = abs(x - x_max);
        x = x_max -          diff;
    }
    float_constrain(x, x_min, x_max);
};

float float_lerp(float a, float b, float mix){
    float_constrain(mix, 0.0, 1.0);
    if (mix == 0.0) return a;
    if (mix == 1.0) return b;

    float result = a + mix * (b - a);
    return result;
};

float get_denominator_for_multipliers(int width){

    int upmid = ceil(float(width) / float(2));
    int sumval = 0;
    for (int i = 1; i < upmid; i++)
        sumval += (2 * i);
    sumval += upmid;
    return float(sumval);
}

    void unweighted_sliding_average(std::vector<RT_Point> &nfsamples, int width, float mix){
    
    std::vector<RT_Point> smoothed;
    int numfsamples = nfsamples.size();

    if (width == 3){
        for (int i = 0; i < numfsamples; i++) {

            int idx = ((i-1) < 0) ? numfsamples-1 : i-1;
            float A = nfsamples[idx].y;
            float B = nfsamples[i].y;
            float C = nfsamples[(i+1) % numfsamples].y;
            float fy = (A + B + C) / 3.0;
            RT_Point p = {float(i), fy};
            smoothed.push_back(p);
        }
    } else if (width == 9){

        int midpoint = ceil(float(width) / float(2));
        int lowermid = floor(width/2);
        float denominator = get_denominator_for_multipliers(width);

        for (int i = 0; i < numfsamples; i++) {

            float samples[width];

            for (int j = 0; j < width; j++){

                if (j == lowermid){
                    samples[j] = nfsamples[i].y * float(midpoint);

                } else if ( j < lowermid ){
                    float amp = j + 1;               // 1 2 3 .. midpoint
                    int offset = lowermid - j;       // midpoint .. 3 2 1
                    float index = ((i-offset) < 0) ? numfsamples-(offset-i) : i-offset;
                    samples[j] = nfsamples[index].y * float(amp);

                } else if ( j > lowermid ){
                    float amp = width - j;           // midpoint .. 3 2 1
                    int offset = j - lowermid;       // 1 2 3 ...midpoint 
                    float index = (i+offset) % numfsamples;
                    samples[j] = nfsamples[index].y * float(amp);
                }
            }
            float fy = float(sum_of_floats(samples, width)) / denominator;
            RT_Point p = {float(i), fy};
            smoothed.push_back(p);
        }
    }

    if ((width == 3) || (width == 9)){
        for (int i = 0; i < numfsamples; i++) {
            float mixed = float_lerp(nfsamples[i].y, smoothed[i].y, mix);
            nfsamples[i].y = mixed;
        }
    }

};
*/


    RaveTable.data = []; // reset anyway.
    //RaveTable.data = generate_noise(RaveTable.num_samples, seed);

    const fi = Math.PI * 2.0 / RaveTable.num_samples;

    // apply values to formula for wavetable
    for (let i = 0; i < RaveTable.num_samples; i++){
        const fy = RaveTable.A01 * sin(fi*i) +
                   RaveTable.A02 * sin(2*fi*i) +
                   RaveTable.A03 * sin(3*fi*i) +
                   RaveTable.A04 * sin(4*fi*i);
        fy *= RaveTable.Amp;
                   
        // float_constrain(fy, -1.0, 1.0);  <-- this would be a double foldover
        float_fold_constrain(fy, -1.0, 1.0);
        RaveTable.data.push(fy);
    }

    // insert noise here, noise seed and noise amplitude :)
    if (gparams[13].real_val > 0.0){

        const mix = gparams[13].real_val;
        const seed = int(gparams[14].real_val);
        const shift = gparams[15].real_val;
        const numspaces = int(map(shift, 0.0, 1.0, float(0), float(numsamples)));

        noise_samples = generate_noise(numsamples, seed); // OK
        shift_float_array(noise_samples, numsamples, numspaces);
        mix_signal_into_nfsamples(RaveTable.data, noise_samples, mix);  // not implemented yet!
    }
    
    // smoothing
    if (gparams[16].real_val > 0.0){ unweighted_sliding_average(nfsamples, 9, gparams[16].real_val); }

    fill_buffer(RaveTable.buff, RaveTable.data);
};

// regenerate the wavetable and update UI to reflect this.
function update_wavetable(){
    generate_wavetable(2048);
    this.mgraphics.redraw();
}

function set(buffname){ 
    RaveTable.buff_name = buffname
    RaveTable.buff = new Buffer(RaveTable.buff_name);
    RaveTable.buff.setattr("sr", 1000);  // 44100 ?
    RaveTable.buff.setattr("chans", 1);
    RaveTable.buff.send("sizeinsamps", RaveTable.num_samples);
};

const theme_colors = {
    main_bg_color: [0.2, 0.2, 0.2, 1.0],
    stroke_color: [0.7, 0.3, 0.2, 1.0],
    stroke_color_dark: [0.18, 0.18, 0.18, 1.0],
    active_node: [0.96, 0.7, 0.7, 1.0],
    node: [0.6, 0.3, 0.3, 1.0],
    info_text: [0.3, 0.6, 0.97, 1.0],
    loop_line_color: [0.9, 0.5, 0.5, 1.0]
};

const padding = 17;

const config = {
    font_size: 12, 
    font_descriptor: ["Consolas", "normal", "normal"],
    display_help: false,
    g_in_edit_mode: false,
    g_key_codes: [],
    g_mouse_on_rect: false,
};

function absolute_coord(rx, ry, w, h){
    var total_width = w - ( 2*padding );
    var total_height = h - ( 2*padding );
    var abs_x = (total_width * rx) + padding;
    var abs_y = (total_height * ry) + padding;
    return [abs_x, abs_y];
}

function calculate_node_locations(gfx, w, h){

    draw_data.coords.length = 0;
    for (const [idx, [cx, cy]] of env_nodes.entries()) {
        var [abs_x, abs_y] = absolute_coord(cx, cy, w, h);
        var [real_x, real_y] = [abs_x - (node_size/2), h - abs_y - (node_size/2)];
        draw_data.coords.push([real_x, real_y]);
    }
};

function fill_background(gfx, w, h){
    gfx.set_source_rgba(...theme_colors.main_bg_color);
    gfx.rectangle(0, 0, w, h);
    gfx.fill();
}

function draw_node_help(gfx, w, h){
    // todo update...
    const help_lines = [
        "                 H : Show/Hide this message",
        "                 Z : Insert Node to the right, unless last node",
        "          messages : <move_node idx x y>  - for procedural node moving",
        "                     <display_help>       - Same as H",
        "                     <write nodes>        - to inlet 0, as a list",
        "                     <preset idx>         - not implemented yet"
    ];
    gfx.set_source_rgba(...theme_colors.info_text);
    var [text_width, text_height] = gfx.text_measure("X");
    for (const idx in help_lines){
        gfx.move_to(8, padding + (idx * text_height));
        gfx.show_text(help_lines[idx]);
    }

};

function draw_bounding_rect(gfx, w, h){
    gfx.set_source_rgba(...theme_colors.stroke_color_dark);
    gfx.move_to(padding, padding);
    gfx.rectangle(padding, padding, w-(2*padding), h-(2*padding));
    gfx.stroke();
}

function paint() {
    // state and setup     
    box.size(500, 200);
    var gfx = this.mgraphics;
    var [w, h] = gfx.size;

    gfx.set_font_size(config.font_size);
    gfx.select_font_face(...config.font_descriptor);

    // calculate_node_locations(gfx, w, h);  // TODO , only calc when needed
    fill_background(gfx, w, h);
    
    if (!(config.display_help)){
        gfx.set_line_width(2.0);
        draw_bounding_rect(gfx, w, h);
        // draw_lines(gfx, w, h);
        // draw_sustain(gfx, w, h);
        //draw_nodes(gfx, w, h);
        //if (config.g_in_edit_mode){
        //    draw_node_info(gfx, w, h);
        //}
    } else {
        draw_node_help(gfx, w, h);
    }
}