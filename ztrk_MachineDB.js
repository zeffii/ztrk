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
        ]
    }
}

function getMachineInfo(kind, name){
    return MachineDatabase[kind][name];
}