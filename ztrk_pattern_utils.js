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

function interpolate(val_in, val_out, steps){

    var result = [];
    
    // 2hex or 4 hex
    if (val_in.length === 2 || val_in.length === 4){
        var start = parseInt(val_in, 16);
        var end = parseInt(val_out, 16);

        var stepSize = (end - start) / (steps - 1); // Calculate the increment per step
        for (var i = 0; i < steps; i++) {
            result.push(Math.round((start + (i * stepSize))).toString(16).toUpperCase());
        }
    } else {
        post('nope', val_in.length);
    }


    // notes?

    return result;
}

function isOnlyDots(str) {
    return str && /^\.+$/.test(str);
}

function PostDict(dict){
     Object.keys(dict).forEach(function(key) { post(key + ": " + dict[key]); });
}