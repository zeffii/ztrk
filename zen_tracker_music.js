// ES5 compatible function to generate chord progressions based on circle of fifths
// with optional dissonance (percent chance to alter chord to a dissonant type)
function generateChordProgression(startKey, numChords, dissonancePercent) {
    // Note names (using sharps)
    var notes = ['C', 'C#', 'D', 'D#', 'E', 'F', 'F#', 'G', 'G#', 'A', 'A#', 'B'];
    
    // Chord types: normal (major/minor) and dissonant options
    var normalTypes = ['maj', 'min'];
    var dissonantTypes = ['dim', 'aug', '7', 'min7', 'maj7', 'sus4'];
    
    // Find index of starting key
    var startIndex = notes.indexOf(startKey.toUpperCase());
    if (startIndex === -1) {
        return []; // Invalid start key
    }
    
    var progression = [];
    var currentIndex = startIndex;
    
    for (var i = 0; i < numChords; i++) {
        // Get root note based on circle of fifths (move +7 semitones, mod 12)
        var root = notes[currentIndex];
        
        // Decide chord type: major for I,IV,V; minor for ii,iii,vi; diminished for vii
        // But simplify: alternate major/minor for emotive feel
        var isMinor = (i % 4 === 1 || i % 4 === 3); // e.g., I - v - II - vi pattern vibe
        var baseType = isMinor ? 'min' : 'maj';
        
        // With dissonancePercent chance, make it dissonant
        var rand = Math.random() * 100;
        if (rand < dissonancePercent) {
            // Pick random dissonant type
            var dissIndex = Math.floor(Math.random() * dissonantTypes.length);
            baseType = dissonantTypes[dissIndex];
        }
        
        // Add to progression (e.g., 'C maj' or 'G min7')
        progression.push(root + ' ' + baseType);
        
        // Move to next fifth (+7 mod 12)
        currentIndex = (currentIndex + 7) % 12;
    }
    
    return progression;
}

// Example usage:
// var prog = generateChordProgression('C', 8, 30); // Start in C, 8 chords, 30% dissonance chance
// console.log(prog); // e.g., ['C maj', 'G min', 'D maj', 'A min7', 'E maj', 'B min', 'F# maj', 'C# dim']