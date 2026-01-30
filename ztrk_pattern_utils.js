// some constants

var note_coll2 = {   
    'C-': 0, 'C#': 1, 'D-': 2, 'D#': 3,
    'E-': 4, 'F-': 5, 'F#': 6, 'G-': 7,
    'G#': 8, 'A-': 9, 'A#': 10,'B-': 11
};

var note_names = [
    "C-", "C#", "D-", "D#", "E-", "F-", "F#", "G-", "G#", "A-", "A#", "B-"
];


// util funcs.

function getParameterTypeAtPosition(pattern, position) {
    var params = pattern.split(/\s+/); // Split on whitespace
    var currentIndex = 0;

    for (var i = 0; i < params.length; i++) {
        var type = params[i];
        var length = type.length;

        // Check if the cursor position is inside this parameter
        if (position >= currentIndex && position < currentIndex + length) {
            return {
                type: type,
                start: currentIndex,
                end: currentIndex + length - 1,
                indexInParam: position - currentIndex
            };
        }

        // Move past this parameter
        currentIndex += length;

        // Add 1 for the space between parameters (except after the last one)
        if (i < params.length - 1) { currentIndex += 1; }
    }
    return null;
}

function fmt(n) {
    // zero pads the tick column.
    return ('000' + Math.floor(Math.abs(n))).slice(-3) + ' ';
}

function clamp(v, lo, hi) {
    return Math.max(lo, Math.min(hi, v));
}

function find_idx_after_space(str) {
    // function finds start indices of parameters.
    const indices = [];
  
    indices.push(0);
    for (var i = 1; i < str.length; i++) {
        if (str[i - 1] === ' ') {
            indices.push(i);
        }
    }
    return indices;
}

function find_regexed_indices(str, regex) {
    // this may be a little counter intuitive
    // finds start indices of params captured by this regex pattern
    var indices = [];
    var match;
    while ((match = regex.exec(str)) !== null) {
        indices.push(match.index);
    }
    return indices;
}

function findSublistContaining(value, indices) {
    // given a nested list of indices which contain this kind of parameter
    // return the indices associated with parameter at the caret location
    for (var i = 0; i < indices.length; i++) {
        if (indices[i].indexOf(value) !== -1) {
            return indices[i]; // or return i if you only want the index
        }
    }
    return null;
}

function found_in(iterable, number){
    return iterable.indexOf(number) !== -1;
}

function replaceAt(str, index, replacement, count) {
    return str.substr(0, index)
         + replacement
         + str.substr(index + count);
}

function note_to_int(note_str) {
    var n1 = note_str.slice(0, 2);
    var n2 = note_str.slice(2);
    var semitone = note_coll2[n1];
    return semitone + parseInt(n2) * 12 + 12;  // 60 for "C-4"
}

function int_to_note(int_val) {
    const octave = Math.floor(int_val / 12) - 1;
    const noteIndex = int_val % 12;
    const note = note_names[noteIndex];
    return note + octave;
}

function interpolate(val_in, val_out, steps){

    var result = [];
    
    // 2hex or 4 hex
    if (val_in.length === 2 || val_in.length === 4){

        var start = parseInt(val_in, 16);
        var end = parseInt(val_out, 16);

        var stepSize = (end - start) / (steps - 1); // increment per step
        for (var i = 0; i < steps; i++) {
            result.push(toPaddedHex(Math.round((start + (i * stepSize))), val_in.length));
        }
    } else if (val_in.length === 3){ // and is type nnn

        var start_int = note_to_int(val_in);
        var end_int = note_to_int(val_out);

        var stepSize = (end_int - start_int) / (steps - 1); // increment per step
        for (var i = 0; i < steps; i++) {
            // even if this passes floats to the int_to_note routine, it will convert to ints inside it.
            result.push(int_to_note(Math.round((start_int + (i * stepSize)))));
        }
    } else if (val_in.length === 6){
        // very similar to 4hex version.. with some subtle differences (command is stripped and stuck back on later)
        var start = parseInt(val_in.slice(2), 16);
        var end = parseInt(val_out.slice(2), 16);
        var stepSize = (end - start) / (steps - 1); // increment per step
        for (var i = 0; i < steps; i++) {
            result.push(toPaddedHex(Math.round((start + (i * stepSize))), 4));
        }
    } else {
        post('nope', val_in.length);
    }

    return result;
}


function toPaddedHex(number, digits) {
    digits = digits || 2;  // Default to 2 digits if not specified
    var hex = number.toString(16).toUpperCase();
    return ('00000' + hex).slice(-digits);  // Prepend enough zeros, take last 'digits'
}

function transpose_value(found_param_value, direction){
    // LOL, this is so ugly :)
    var INT_MAX_2HEX = parseInt('FF', 16);
    var INT_MAX_4HEX = parseInt('FFFF', 16);
    var NOTE_MAX = 127;
    var plen = found_param_value.length;
    var replacement_param_value = found_param_value;

    if (found_in(['===', '^^^', '.', '..', '...', '....', '......', '1'], found_param_value)){
        return replacement_param_value;
    }

    switch (plen) {
        case 2:
            var initial_value = parseInt(found_param_value, 16);
            if (direction === 'UP'){
                var new_value = Math.min(INT_MAX_2HEX, initial_value + 1);
            } else if (direction === 'DOWN'){
                var new_value = Math.max(0, initial_value - 1);
            }
            return toPaddedHex(new_value, plen);
        case 4:
            var initial_value = parseInt(found_param_value, 16);
            if (direction === 'UP'){
                var new_value = Math.min(INT_MAX_4HEX, initial_value + 1);
            } else if (direction === 'DOWN'){
                var new_value = Math.max(0, initial_value - 1);
            } 
            return toPaddedHex(new_value, plen);
        case 3: 
            var found_note = note_to_int(found_param_value);
            if (direction === 'UP'){
                var new_value = Math.min(NOTE_MAX, found_note + 1);
                return int_to_note(new_value);
            } else if (direction === 'DOWN'){
                var new_value = Math.max(0, found_note - 1);
                return int_to_note(new_value);
            }
        case 6: 
            var command = found_param_value.slice(0, 2);
            var argmnt = found_param_value.slice(2);
            var initial_value = parseInt(argmnt, 16);
            
            if (direction === 'UP'){
                var new_value = Math.min(INT_MAX_4HEX, initial_value + 1);
            } else if (direction === 'DOWN'){
                var new_value = Math.max(0, initial_value - 1);
            } 
            return command + toPaddedHex(new_value, 4);

        default: break;
    }
    return replacement_param_value;
}

function isOnlyDots(str) {
    return str && /^\.+$/.test(str);
}

function PostDict(dict){
     Object.keys(dict).forEach(function(key) { post(key + ": " + dict[key]); });
}

function MakeSimpleNoteDictFromArrays(pattern_markup){
    /*
    this is only a super early attempt at patterndata to clipdata

    */

    function MakeNote(pitch, midi_vol, ntime, duration){
        return { 
          "pitch": pitch,        // midi note
          "start_time": ntime,    //
          "duration": duration,  // 0.25
          "velocity": midi_vol,  // 100
          "mute": 0, 
          "probability": 1, 
          "velocity_deviation": 0, 
          "release_velocity": 64 
        };
    }

    // Duplicate notes at the same time are not allowed yet..
    var notes_obj = {"notes": []};

    var note_indices = find_regexed_indices(pattern_markup.track, /\bn{3}\b/g);   // nnn
    var note_time_multiplier = 0.25;
    for (row_idx in pattern_markup.data){
        var pattern_row_data = pattern_markup.data[row_idx];
        for (param_idx in note_indices){
            var note_idx_start = note_indices[param_idx];
            var note_str = pattern_row_data.substr(note_idx_start, 3);
            if (!found_in(['...', '===', '^^^'], note_str)) {
                var note_pitch = note_to_int(note_str);
                // force rigid time.
                // var ntime = Math.round(((row_idx * note_time_multiplier) + Number.EPSILON) * 100) / 100;
                var ntime = Math.round((row_idx * note_time_multiplier) * 100) / 100;
                var new_note = MakeNote(note_pitch, 100, ntime, 0.25);
                notes_obj.notes.push(new_note);
            }
        }
    }

    // const jsonString = JSON.stringify(note_obj, null, 2); // Pretty-printed JSON
    // post(jsonString);    

    // live_api = new LiveAPI("live_set view detail_clip");
    // var notes_obj = remove_node_ids(note_obj)
    if (!notes_obj.notes.length){
        return;
    }


    live_api = new LiveAPI("live_set tracks 0 clip_slots 0 clip");
    live_api.call("remove_notes_extended", 0, 127, 0, 9999);
    live_api.call("add_new_notes", notes_obj);
}