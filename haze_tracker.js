/*
all 'on_xxxx' functions must be mapped from your js.
*/

include("zen_tracker_ui_bassmodule");

outlets = 3;
inlets = 4;

var pattern_markup = {
    length: 32,
    descriptors: {
        global: {
            0: ['hh', 'Spatial'],
            1: ['hh', 'Clarity'],
            2: ['hh', 'Smoothness'],
            3: ['hh', 'Crispyness']
        },
        track: {
            0: ['nnn', 'Note 0'],
            1: ['hh', 'Volume 0'],
            2: ['hh', 'Duration 0'],
            3: ['hhhh', 'Offset 0'],
            4: ['nnn', 'Note 1'],
            5: ['hh', 'Volume 1'],
            6: ['hh', 'Duration 1'],
            7: ['hhhh', 'Offset 1'],
            8: ['nnn', 'Note 2'],
            9: ['hh', 'Volume 2'],
            10: ['hh', 'Duration 2'],
            11: ['hhhh', 'Offset 3'],
            12: ['nnn', 'Note 3'],
            13: ['hh', 'Volume 3'],
            14: ['hh', 'Duration 3'],
            15: ['hhhh', 'Offset 3'],
            16: ['b', 'Trigger'], 
            17: ['hh', 'Volume'],
            18: ['hh', 'LDelay'],
            19: ['hh', 'RDelay'],
            20: ['ffxxyy', 'Effect 1'],
            21: ['ffxxyy', 'Effect 2']
        }
    },
    data: []
};


var my_tracker = new Tracker(outlet, pattern_markup, mgraphics);

key_handler = my_tracker.key_handler.bind(my_tracker);
dictionary = my_tracker.dictionary.bind(my_tracker);
onclick = my_tracker.onclick.bind(my_tracker);
ondrag = my_tracker.ondrag.bind(my_tracker);
onidle = my_tracker.onidle.bind(my_tracker);
onidleout = my_tracker.onidleout.bind(my_tracker);
command = my_tracker.command.bind(my_tracker);
paint = my_tracker.paint.bind(my_tracker);
bang = my_tracker.bang.bind(my_tracker);
msg_int = my_tracker.msg_int.bind(my_tracker);
clear = my_tracker.clear.bind(my_tracker);
refresh = my_tracker.refresh.bind(my_tracker);
keys = my_tracker.keys.bind(my_tracker);