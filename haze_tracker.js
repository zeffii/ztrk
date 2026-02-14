/*
all 'on_xxxx' functions must be mapped from your js.
*/

include("zen_tracker_ui_bassmodule_v8");

outlets = 3;
inlets = 4;
mgraphics.init();

var pattern_markup = {
    length: 32,
    descriptors: {
        track: {
            0: ['nnn', 'Note 0', 0],
            1: ['hh', 'Volume 0', 0],
            2: ['hh', 'Duration 0', 0],
            3: ['hhhh', 'Offset 0', 0],
            4: ['nnn', 'Note 1', 1],
            5: ['hh', 'Volume 1', 1],
            6: ['hh', 'Duration 1', 1],
            7: ['hhhh', 'Offset 1', 1],
            8: ['nnn', 'Note 2', 2],
            9: ['hh', 'Volume 2', 2],
            10: ['hh', 'Duration 2', 2],
            11: ['hhhh', 'Offset 3', 3],
            12: ['nnn', 'Note 3', 3],
            13: ['hh', 'Volume 3', 3],
            14: ['hh', 'Duration 3', 3],
            15: ['hhhh', 'Offset 3', 3],
            16: ['b', 'Trigger', 4], 
            17: ['hh', 'Volume', 4],
            18: ['hh', 'LDelay', 4],
            19: ['hh', 'RDelay', 4],
            20: ['ffxxyy', 'Effect 1', 4],
            21: ['ffxxyy', 'Effect 2', 5]
        }
    },
    data: [],
    lexical_track: ""
};


function sendOutlet(port, ...args) {
  try {
    outlet(port, ...args);
  } catch (e) {
    post("SAFE OUTLET ERROR: " + e + "\n");
    post("Args were: " + args.join(", ") + "\n");
  }
}

function write_buffers(tracker){
	var pattern_length = tracker.pattern_markup.length;
    var ch1 = new Buffer("ch1");
    var triggers = new Buffer("triggers");
    
    // var env = new Buffer("env");
    // ch1.send("setsize", pattern_length);
    // var source_sample = foo.peek(1, i, 1);
    
    ch1.setattr("sr", 1000);
    ch1.setattr("chans", 24);
    ch1.send("sizeinsamps", pattern_length);

    var array2d = pattern_data_to_2d_array(tracker.pattern_markup.data);
    //for (var i=0; i < pattern_length; i++){
    // 	ch1.poke(1, i, 1/32*i + Math.random());    // 1-based index.
    //}
    for (var row = 0; row < array2d.length; row++){
    	for (var col = 0; col < array2d[0].length; col++){
    		var celld = array2d[row][col];
            var floatval = encode_cell_to_float(celld);
            ch1.poke(col+1, row, floatval);
    	}
    }
}

var my_tracker = new Tracker(pattern_markup, mgraphics, {
	send: sendOutlet,
	write_buffers: write_buffers
});

key_handler = my_tracker.key_handler.bind(my_tracker);
dictionary = my_tracker.dictionary.bind(my_tracker);
onclick = my_tracker.onclick.bind(my_tracker);
ondrag = my_tracker.ondrag.bind(my_tracker);
onidle = my_tracker.onidle.bind(my_tracker);
onidleout = my_tracker.onidleout.bind(my_tracker);
paint = my_tracker.paint.bind(my_tracker);
bang = my_tracker.bang.bind(my_tracker);
msg_int = my_tracker.msg_int.bind(my_tracker);
clear = my_tracker.clear.bind(my_tracker);
refresh = my_tracker.refresh.bind(my_tracker);
keys = my_tracker.keys.bind(my_tracker);

/*
you could also use this....instead of that ugly list above .

['key_handler','dictionary','onclick','ondrag','onidle','onidleout',
  ,'paint','bang','msg_int','clear','refresh','keys']
    .forEach(k => globalThis[k] = my_tracker[k].bind(my_tracker));

below i'm explicitly redefining the command function, to keep the bassmodule modular
*/


function command(instruction){

    if (instruction === 'export_pattern'){
        post('Exporting Pattern\n');
        var outputDict = new Dict('pattern_data');
        
        my_tracker.pattern_markup.data = this.faux_pattern;
        outputDict.parse(JSON.stringify(this.pattern_markup));
        outlet(2, "dictionary", outputDict.name);
    }

    if (instruction.startsWith('jitblock_')){
    	post('yes here, jitblock set to', instruction.substring(9));
    	my_tracker.current_patcher = this.patcher;
    	my_tracker.jitblock_name = instruction.substring(9);
    	return; // end early is ok.
    }

    if (instruction.startsWith('buffermode:')){
		my_tracker.BufferMode = parseInt(instruction.substring(11));
	    post('BufferMode set to:', my_tracker.BufferMode);
	}

    switch (instruction) {
        case 'push_to_clip':
            my_tracker.push_to_live();
            post('here!');
            return;
        case 'matrixmode=0':
            post('setting matrixmode to False data');
            return;
        case 'matrixmode=1':
            post('setting matrixmode to True data');
            return;
        default: break;
    }

}
