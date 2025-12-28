// ES5 compatible function to generate chord progressions based on circle of fifths
// Returns a list of chords, where each chord is an array of note names (e.g., ["C4", "E4", "G4"])
// with optional dissonance (percent chance to use dissonant voicings)
function generateChordProgressionNotes(startKey, numChords, dissonancePercent) {
    // Note names (sharps) – we'll add octave later
    var notes = ['C', 'C#', 'D', 'D#', 'E', 'F', 'F#', 'G', 'G#', 'A', 'A#', 'B'];
    
    // Basic chord voicings (intervals above root)
    var majorTriad   = [0, 4, 7];     // root, maj3, perf5
    var minorTriad   = [0, 3, 7];     // root, min3, perf5
    var dimTriad     = [0, 3, 6];     // root, min3, dim5
    var augTriad     = [0, 4, 8];     // root, maj3, aug5
    var dominant7    = [0, 4, 7, 10]; // root, maj3, perf5, min7
    var maj7         = [0, 4, 7, 11]; // root, maj3, perf5, maj7
    var min7         = [0, 3, 7, 10]; // root, min3, perf5, min7
    var sus4         = [0, 5, 7];     // root, 4th, perf5
    
    var chordVoicings = {
        'maj':   majorTriad,
        'min':   minorTriad,
        'dim':   dimTriad,
        'aug':   augTriad,
        '7':     dominant7,
        'maj7':  maj7,
        'min7':  min7,
        'sus4':  sus4
    };
    
    // Dissonant voicings (more colorful choices)
    var dissonantVoicings = [dimTriad, augTriad, dominant7, maj7, min7, sus4];
    
    // Find starting key index
    var startIndex = notes.indexOf(startKey.toUpperCase());
    if (startIndex === -1) {
        return [];
    }
    
    var progression = [];
    var currentIndex = startIndex;
    var baseOctave = 4;  // Start in octave 4 (middle C region)
    
    for (var i = 0; i < numChords; i++) {
        var root = notes[currentIndex];
        var rootNote = root + baseOctave;
        
        // Decide if major or minor (simple alternating pattern for emotive feel)
        var isMinor = (i % 4 === 1 || i % 4 === 3);
        var voicing = isMinor ? minorTriad : majorTriad;
        
        // Apply dissonance with given probability
        if (Math.random() * 100 < dissonancePercent) {
            var dissIndex = Math.floor(Math.random() * dissonantVoicings.length);
            voicing = dissonantVoicings[dissIndex];
        }
        
        // Build chord notes
        var chord = [];
        for (var j = 0; j < voicing.length; j++) {
            var semitones = voicing[j];
            var noteIndex = (currentIndex + semitones) % 12;
            var octave = baseOctave + Math.floor((currentIndex + semitones) / 12);
            chord.push(notes[noteIndex] + octave);
        }
        
        progression.push(chord);
        
        // Move to next fifth (+7 semitones)
        currentIndex = (currentIndex + 7) % 12;
    }
    
    return progression;
}