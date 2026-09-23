const MachineDatabase = {
    "ctrl": { 
        "notes4+": [
            ['nnn', 'Note 0', 0],     ['hh', 'Volume 0', 0],     ['hh', 'Duration 0', 0],
            ['nnn', 'Note 1', 0],     ['hh', 'Volume 1', 0],     ['hh', 'Duration 1', 0],
            ['nnn', 'Note 2', 0],     ['hh', 'Volume 2', 0],     ['hh', 'Duration 2', 0],
            ['nnn', 'Note 3', 0],     ['hh', 'Volume 3', 0],     ['hh', 'Duration 3', 0]
        ],
        "notes5+": [
            ['nnn', 'Note 0', 0],     ['hh', 'Volume 0', 0],     ['hh', 'Duration 0', 0],
            ['nnn', 'Note 1', 0],     ['hh', 'Volume 1', 0],     ['hh', 'Duration 1', 0],
            ['nnn', 'Note 2', 0],     ['hh', 'Volume 2', 0],     ['hh', 'Duration 2', 0],
            ['nnn', 'Note 3', 0],     ['hh', 'Volume 3', 0],     ['hh', 'Duration 3', 0],
            ['nnn', 'Note 4', 0],     ['hh', 'Volume 4', 0],     ['hh', 'Duration 4', 0]
        ],
        "NVDP5": [  // (note , volume, duration, pan), x 5
            ['nnn', 'Note 0', 0],     ['hh', 'Volume 0', 0],     ['hh', 'Duration 0', 0],     ['hh', 'Pan 0', 0],
            ['nnn', 'Note 1', 1],     ['hh', 'Volume 1', 1],     ['hh', 'Duration 1', 1],     ['hh', 'Pan 0', 1],
            ['nnn', 'Note 2', 2],     ['hh', 'Volume 2', 2],     ['hh', 'Duration 2', 2],     ['hh', 'Pan 0', 2],
            ['nnn', 'Note 3', 3],     ['hh', 'Volume 3', 3],     ['hh', 'Duration 3', 3],     ['hh', 'Pan 0', 3],
            ['nnn', 'Note 4', 4],     ['hh', 'Volume 4', 4],     ['hh', 'Duration 4', 4],     ['hh', 'Pan 0', 4]
        ]
    },
    "fx": {
        "FX2+": [
            ['b', 'Trigger 1', 0],     ['b', 'Trigger 2', 0],       ['b', 'Trigger 3', 0],       ['b', 'Trigger 4', 0],
            ['ffxxyy', 'Effect 1', 1],  ['ffxxyy', 'Effect 2', 1]
        ]
    },
    "gen": {
        "DRMS": [
            ['b', 'Kick', 0], ['b', 'Snare', 0], ['b', 'C-Hat', 0], ['b', 'O-Hat', 0],['b', 'Clap', 0], 
            ['b', 'Shaker', 0], ['b', 'Clave', 0], ['b', 'Ride', 0], ['b', 'Crash', 0],
            ['hh', 'K Punch', 1], ['hh', 'K Decay', 1], ['hh', 'K Tone', 1], ['hh', 'K Tune', 1], ['hh', 'K Amp', 1],  // Kick
            ['hh', 'S Punch', 2], ['hh', 'S Decay', 2], ['hh', 'S Tone', 2], ['hh', 'S Tune', 2], ['hh', 'S Amp', 2],  // Snare
            ['hh', 'CH Decay', 3], ['hh', 'CH Tune', 3], ['hh', 'CH Amp', 3],       // Closed Hat
            ['hh', 'OH Decay', 4], ['hh', 'OH Tune', 4], ['hh', 'OH Amp', 4],       // Open Hat
            ['hh', 'CP Decay', 5], ['hh', 'CP Tune', 5], ['hh', 'CP Amp', 5],       // Clap
            ['hh', 'SH Decay', 6], ['hh', 'SH Tune', 6], ['hh', 'SH Amp', 6],       // Shaker
            ['hh', 'CL Decay', 7], ['hh', 'CL Tune', 7], ['hh', 'CL Amp', 7],       // Clave
            ['hh', 'RD Decay', 8], ['hh', 'RD Tune', 8], ['hh', 'RD Amp', 8],       // Ride
            ['hh', 'CR Decay', 9], ['hh', 'CR Tune', 9], ['hh', 'CR Amp', 9]        // Crash
        ],
        "KDR": [
            ['b', 'Trigger', 0], 
            ['hh', 'Start', 1], ['hh', 'End', 1], ['hh', 'Buzz', 1], ['hh', 'Click', 1], ['hh', 'Punch', 1], 
            ['hh', 'TDecay', 2], ['hh', 'TShape', 2], ['hh', 'BDecay', 2], ['hh', 'DSlope', 2], ['hh', 'DTime', 2], ['hh', 'RSlope', 2],
        ],
        "SDR": [
            ['b', 'Trigger', 0], 
            ['hhhh', 'Pitch (hz)', 1], ['hh', 'PEnv (ms)', 1], ['hh', 'Decay (ratio)', 1], ['hh', 'noiseAMT', 1], ['hh', 'toneAMT', 1],
            ['hh', 'Snap', 2], ['hh', 'Brightness', 2], ['hh', 'toneDecay', 2], ['hh', 'noiseDecay', 2],
            ['hhhh', 'lowcut (hz)', 3], ['hh', 'Stereo (0=mono, 1=wide)', 3]
        ],
        "HTX": [   // might be better for clap sounds.
            ['b', 'Trigger', 0], 
            ['hh', 'Amp |(t:coeff, d:0.8, s:[0,1.0])', 1], 
            ['hhhh', 'Pitch |(t:hz, d:2200, s:[800,6000])', 1], 
            ['hh', 'Brightness |(t:coeff, d:0.7, s:[0,0.95])', 1], 
            ['hh', 'Decay |(t:s, d:0.12, s:[0.02,2.0])', 1], 
            ['hh', 'Damp |(t:coeff, d:0.35, s:[0,0.95])', 1], 
            ['hhhh', 'Res Freq |(t:hz, d:4000, s:[1500,8000])', 2], 
            ['hh', 'Res AMT |(t:coeff, d:0.85, s:[0,0.9])', 2]
        ],
        "HTX2": [
            ['b', 'Trigger', 0],
            ["hh", "Amp |(t:coeff, d:0.8, s:[0,1])", 1], // default hex: CC
            ["hh", "Tone |(t:coeff, d:0.5, s:[0,1])", 1], // default hex: 80
            ["hh", "Decay Rate |(t:s, d:0.15, s:[0.02,2])", 1], // default hex: 11
            ["hh", "Decay Shape |(t:coeff, d:0.3, s:[0,1])", 1], // default hex: 4D
            ["hh", "Attack Energy |(t:coeff, d:0.4, s:[0,1])", 1], // default hex: 66
            ["hhhh", "Pitch |(t:hz, d:2200, s:[800,6000])", 2], // default hex: 8086
            ["hh", "Attack Time |(t:ms, d:4, s:[1,30])", 2] // default hex: 1A
        ],
        "JUNO6": [
            ["hh", "Saw |(t:coeff, d:0.7, s:[0,1], dval: B3)", 0],
            ["hh", "Pulse |(t:coeff, d:0.0, s:[0,1], dval: 00)", 0],
            ["hh", "Sub |(t:coeff, d:0.3, s:[0,1], dval: 4D)", 0],
            ["hh", "Noise Lvl |(t:coeff, d:0.0, s:[0,1], dval: 00)", 0],
            ["hh", "Pwm |(t:coeff, d:0.5, s:[0,1], dval: 80)", 1],
            ["hh", "Pwm Lfo Depth |(t:coeff, d:0.0, s:[0,1], dval: 00)", 1],
            ["hh", "Range |(t:semitones, d:0, s:[-24,24], dval: 80)", 1],
            ["hhhh", "Hpf Cutoff |(t:hz, d:40, s:[20,2000], dval: 2688)", 2],
            ["hhhh", "Cutoff |(t:hz, d:1200, s:[40,10000], dval: 9DB1)", 2],
            ["hh", "Resonance |(t:coeff, d:0.3, s:[0,1], dval: 4D)", 2],
            ["hh", "Env Amount |(t:bipolar, d:0.0, s:[-1,1], dval: 80)", 3],
            ["hh", "Lfo Depth |(t:coeff, d:0.0, s:[0,1], dval: 00)", 3],
            ["hh", "Key Track |(t:coeff, d:0.3, s:[0,1], dval: 4D)", 3],
            ["hh", "Attack |(t:s, d:0.005, s:[0.001,4], dval: 00)", 4],
            ["hh", "Decay T |(t:s, d:0.3, s:[0.001,8], dval: 0A)", 4],
            ["hh", "Sustain |(t:coeff, d:0.6, s:[0,1], dval: 99)", 4],
            ["hh", "Release |(t:s, d:0.3, s:[0.001,8], dval: 0A)", 4],
            ["hh", "Level |(t:coeff, d:0.8, s:[0,1], dval: CC)", 5],
            ["hh", "Env Mode |(t:bool, d:1, s:[0,1], dval: FF)", 5],
            ["hhhh", "Lfo Rate |(t:hz, d:5.0, s:[0.05,20], dval: C4C4)", 6],
            ["hh", "Lfo Delay |(t:s, d:0.0, s:[0,4], dval: 00)", 6]
        ],
        "SmpDemo": [
            ['nnn', 'Note |(t:note, dval: C-5)', 0],
            ["hh", "Sample Index |(t:index, d:0., s:[0,10], dval: 00)", 0],
            ["hh", "Volume |(t:coeff, d:0.8, s:[0,1], dval: CC)", 0],
            ["hh", "Pan |(t:coeff, d:0.0, s:[-1,1], dval: 80)", 0],
            ["hhhh", "Duration |(t:ms, d:0.01, s:[0.01, 6000], dval: 2000)", 0]
        ],
        "SYNDRUM": [
            ['b', 'Trigger', 0], 
            ["hh", "Drum Radius |(t:m, d:0.18, s:[0.05,0.4], dval:5F)", 1], 
            ["hh", "Drum Depth |(t:m, d:0.15, s:[0.03,0.5], dval:41)", 1], 
            ["hh", "Hit Radius |(t:m, d:0.09, s:[0,0.4], dval:39)", 1], 
            ["hh", "Vellum Thickness |(t:coeff, d:1.0, s:[0.2,2], dval:71)", 2], 
            ["hh", "Tightness |(t:coeff, d:0.6, s:[0,1], dval:99)", 2], 
            ["hh", "Tightness Env |(t:coeff, d:0.15, s:[0,1], dval:26)", 2], 
            ["hh", "Inflection |(t:coeff, d:0.5, s:[0,1], dval:80)", 2], 
            ["hh", "Membrane Damp |(t:coeff, d:0.35, s:[0,1], dval:59)", 2], 
            ["hh", "Stroke Intensity |(t:coeff, d:0.8, s:[0,1], dval:CC)", 3], 
            ["hh", "Stroke Linger |(t:coeff, d:0.12, s:[0,1], dval:1F)", 3], 
            ["hh", "Stroke Material |(t:coeff, d:0.5, s:[0,1], dval:80)", 3], 
            ["hh", "Beater Size |(t:coeff, d:0.3, s:[0,1], dval:4D)", 3], 
            ["hh", "Cavity Damp |(t:coeff, d:0.5, s:[0,1], dval:80)", 4], 
            ["hh", "Coupling |(t:coeff, d:0.3, s:[0,1], dval:4D)", 4], 
            ["hh", "Loudness |(t:coeff, d:0.7, s:[0,1], dval:B3)", 5]
        ]
    }
}

function getMachineInfo(kind, name){
    return MachineDatabase[kind][name];
}

function getMachinesList(){
    var db = MachineDatabase;
    var out = [];
    for (var kind in db) {
        out.push(kind.toUpperCase());
        
        const names = Object.keys(db[kind]);
        names.forEach((name, index) => {
            const isLast = index === names.length - 1;
            let prefix = isLast ? " └╴" : " ├╴";
            out.push(prefix + name);
        });
    }
    return out;
}