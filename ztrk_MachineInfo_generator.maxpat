{
    "patcher": {
        "fileversion": 1,
        "appversion": {
            "major": 9,
            "minor": 1,
            "revision": 5,
            "architecture": "x64",
            "modernui": 1
        },
        "classnamespace": "box",
        "rect": [ 161.0, 85.0, 1831.0, 1233.0 ],
        "boxes": [
            {
                "box": {
                    "bangmode": 1,
                    "fontname": "Consolas",
                    "id": "obj-6",
                    "linecount": 103,
                    "lines": 1,
                    "maxclass": "textedit",
                    "nosymquotes": 1,
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "", "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 875.3846988677979, 80.00000762939453, 684.6154499053955, 1500.0001430511475 ],
                    "presentation_linecount": 103,
                    "text": "Buffer buf;\nParam chIndex(0, min=0, max=16);\n\nHistory _GATEPREV(0);\nHistory _DRUMRADIUS(0.18);\nHistory _DRUMDEPTH(0.15);\nHistory _HITRADIUS(0.09);\nHistory _VELLUMTHICKNESS(1);\nHistory _TIGHTNESS(0.6);\nHistory _TIGHTNESSENV(0.15);\nHistory _INFLECTION(0.5);\nHistory _MEMBRANEDAMP(0.35);\nHistory _STROKEINTENSITY(0.8);\nHistory _STROKELINGER(0.12);\nHistory _STROKEMATERIAL(0.5);\nHistory _BEATERSIZE(0.3);\nHistory _CAVITYDAMP(0.5);\nHistory _COUPLING(0.3);\nHistory _LOUDNESS(0.7);\n\npindex = in1;\ntrig = (in2 > 0.0);\nedge = trig && !_GATEPREV;\n_GATEPREV = trig;\n\n// 0 Trigger\nraw = peek(buf, pindex, chIndex+0);\nout1 = (edge && raw > 0.5) ? 1.0 : 0.0;\n\n// 1 Drum Radius\nraw = peek(buf, pindex, chIndex+1);\n_DRUMRADIUS = (edge && raw >= 0.0) ? (0.05 + raw * 0.35) : _DRUMRADIUS;\nout2 = _DRUMRADIUS;\n\n// 2 Drum Depth\nraw = peek(buf, pindex, chIndex+2);\n_DRUMDEPTH = (edge && raw >= 0.0) ? (0.03 + raw * 0.47) : _DRUMDEPTH;\nout3 = _DRUMDEPTH;\n\n// 3 Hit Radius\nraw = peek(buf, pindex, chIndex+3);\n_HITRADIUS = (edge && raw >= 0.0) ? (raw * 0.4) : _HITRADIUS;\nout4 = _HITRADIUS;\n\n// 4 Vellum Thickness\nraw = peek(buf, pindex, chIndex+4);\n_VELLUMTHICKNESS = (edge && raw >= 0.0) ? (0.2 + raw * 1.8) : _VELLUMTHICKNESS;\nout5 = _VELLUMTHICKNESS;\n\n// 5 Tightness\nraw = peek(buf, pindex, chIndex+5);\n_TIGHTNESS = (edge && raw >= 0.0) ? (raw) : _TIGHTNESS;\nout6 = _TIGHTNESS;\n\n// 6 Tightness Env\nraw = peek(buf, pindex, chIndex+6);\n_TIGHTNESSENV = (edge && raw >= 0.0) ? (raw) : _TIGHTNESSENV;\nout7 = _TIGHTNESSENV;\n\n// 7 Inflection\nraw = peek(buf, pindex, chIndex+7);\n_INFLECTION = (edge && raw >= 0.0) ? (raw) : _INFLECTION;\nout8 = _INFLECTION;\n\n// 8 Membrane Damp\nraw = peek(buf, pindex, chIndex+8);\n_MEMBRANEDAMP = (edge && raw >= 0.0) ? (raw) : _MEMBRANEDAMP;\nout9 = _MEMBRANEDAMP;\n\n// 9 Stroke Intensity\nraw = peek(buf, pindex, chIndex+9);\n_STROKEINTENSITY = (edge && raw >= 0.0) ? (raw) : _STROKEINTENSITY;\nout10 = _STROKEINTENSITY;\n\n// 10 Stroke Linger\nraw = peek(buf, pindex, chIndex+10);\n_STROKELINGER = (edge && raw >= 0.0) ? (raw) : _STROKELINGER;\nout11 = _STROKELINGER;\n\n// 11 Stroke Material\nraw = peek(buf, pindex, chIndex+11);\n_STROKEMATERIAL = (edge && raw >= 0.0) ? (raw) : _STROKEMATERIAL;\nout12 = _STROKEMATERIAL;\n\n// 12 Beater Size\nraw = peek(buf, pindex, chIndex+12);\n_BEATERSIZE = (edge && raw >= 0.0) ? (raw) : _BEATERSIZE;\nout13 = _BEATERSIZE;\n\n// 13 Cavity Damp\nraw = peek(buf, pindex, chIndex+13);\n_CAVITYDAMP = (edge && raw >= 0.0) ? (raw) : _CAVITYDAMP;\nout14 = _CAVITYDAMP;\n\n// 14 Coupling\nraw = peek(buf, pindex, chIndex+14);\n_COUPLING = (edge && raw >= 0.0) ? (raw) : _COUPLING;\nout15 = _COUPLING;\n\n// 15 Loudness\nraw = peek(buf, pindex, chIndex+15);\n_LOUDNESS = (edge && raw >= 0.0) ? (raw) : _LOUDNESS;\nout16 = _LOUDNESS;\n"
                }
            },
            {
                "box": {
                    "id": "obj-7",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 875.0, 53.0, 50.0, 22.0 ],
                    "text": "set $1"
                }
            },
            {
                "box": {
                    "filename": "ztrk_params_to_gendspDecode.js",
                    "id": "obj-3",
                    "maxclass": "v8ui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 875.0, 21.0, 254.0, 24.0 ],
                    "textfile": {
                        "filename": "ztrk_params_to_gendspDecode.js",
                        "flags": 0,
                        "embed": 0,
                        "autowatch": 1
                    }
                }
            },
            {
                "box": {
                    "id": "obj-4",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 133.0, 340.0, 71.0, 22.0 ],
                    "text": "prepend list"
                }
            },
            {
                "box": {
                    "filename": "ztrk_machineinfo_converter.js",
                    "id": "obj-2",
                    "maxclass": "v8ui",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 133.0, 371.0, 352.0, 91.0 ],
                    "textfile": {
                        "filename": "ztrk_machineinfo_converter.js",
                        "flags": 0,
                        "embed": 0,
                        "autowatch": 1
                    },
                    "varname": "v8ui_AA"
                }
            },
            {
                "box": {
                    "bangmode": 1,
                    "fontname": "Consolas",
                    "id": "obj-1",
                    "linecount": 24,
                    "lines": 1,
                    "maxclass": "textedit",
                    "nosymquotes": 1,
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "", "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 133.0, 515.0, 613.0, 366.0 ],
                    "text": "    \"MACHINE\": [\n        ['b', 'Trigger', 0], \n        [\"hh\", \"Saw |(t:coeff, d:0.7, s:[0,1], dval:B3)\", 1], \n        [\"hh\", \"Pulse |(t:coeff, d:0.0, s:[0,1], dval:00)\", 1], \n        [\"hh\", \"Sub |(t:coeff, d:0.3, s:[0,1], dval:4D)\", 1], \n        [\"hh\", \"Noise Lvl |(t:coeff, d:0.0, s:[0,1], dval:00)\", 1], \n        [\"hh\", \"Pwm |(t:coeff, d:0.5, s:[0,1], dval:80)\", 1], \n        [\"hh\", \"Pwm Lfo Depth |(t:coeff, d:0.0, s:[0,1], dval:00)\", 1], \n        [\"hh\", \"Range |(t:semitones, d:0, s:[-24,24], dval:80)\", 1], \n        [\"hhhh\", \"Hpf Cutoff |(t:hz, d:40, s:[20,2000], log:true, dval:2688)\", 2], \n        [\"hhhh\", \"Cutoff |(t:hz, d:1200, s:[40,10000], log:true, dval:9DB1)\", 3], \n        [\"hh\", \"Resonance |(t:coeff, d:0.3, s:[0,1], dval:4D)\", 3], \n        [\"hh\", \"Env Amount |(t:bipolar, d:0.0, s:[-1,1], dval:80)\", 3], \n        [\"hh\", \"Lfo Depth |(t:coeff, d:0.0, s:[0,1], dval:00)\", 3], \n        [\"hh\", \"Key Track |(t:coeff, d:0.3, s:[0,1], dval:4D)\", 3], \n        [\"hh\", \"Attack |(t:s, d:0.005, s:[0.001,4], log:true, dval:31)\", 4], \n        [\"hh\", \"Decay T |(t:s, d:0.3, s:[0.001,8], log:true, dval:A2)\", 4], \n        [\"hh\", \"Sustain |(t:coeff, d:0.6, s:[0,1], dval:99)\", 4], \n        [\"hh\", \"Release |(t:s, d:0.3, s:[0.001,8], log:true, dval:A2)\", 4], \n        [\"hh\", \"Level |(t:coeff, d:0.8, s:[0,1], dval:CC)\", 5], \n        [\"hh\", \"Env Mode |(t:bool, d:1, s:[0,1], dval:FF)\", 5], \n        [\"hhhh\", \"Lfo Rate |(t:hz, d:5.0, s:[0.05,20], log:true, dval:C4C4)\", 6], \n        [\"hh\", \"Lfo Delay |(t:s, d:0.0, s:[0,4], log:true, dval:00)\", 6], \n    ]"
                }
            },
            {
                "box": {
                    "id": "obj-17",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 133.0, 313.0, 71.0, 22.0 ],
                    "text": "route text"
                }
            },
            {
                "box": {
                    "id": "obj-14",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 133.0, 21.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "bangmode": 1,
                    "fontname": "Consolas",
                    "id": "obj-11",
                    "linecount": 32,
                    "lines": 60,
                    "maxclass": "textedit",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "", "int", "", "" ],
                    "outputmode": 1,
                    "parameter_enable": 0,
                    "patching_rect": [ 133.0, 69.0, 594.0, 221.0 ],
                    "text": "\"// --- DCO ---\nParam saw(0.7);            // (type=coeff, default=0.7, scale=[0,1])\nParam pulse(0.0);          // (type=coeff, default=0.0, scale=[0,1])\nParam sub(0.3);            // (type=coeff, default=0.3, scale=[0,1])\nParam noiseLvl(0.0);       // (type=coeff, default=0.0, scale=[0,1])\nParam pwm(0.5);            // (type=coeff, default=0.5, scale=[0,1])\nParam pwmLfoDepth(0.0);    // (type=coeff, default=0.0, scale=[0,1])\nParam range(0);            // (type=semitones, default=0, scale=[-24,24])\n\n// --- HPF ---\nParam hpfCutoff(40);       // (type=hz, default=40, scale=[20,2000], log)\n\n// --- VCF ---\nParam cutoff(1200);        // (type=hz, default=1200, scale=[40,10000], log)\nParam resonance(0.3);      // (type=coeff, default=0.3, scale=[0,1])\nParam envAmount(0.0);      // (type=bipolar, default=0.0, scale=[-1,1])\nParam lfoDepth(0.0);       // (type=coeff, default=0.0, scale=[0,1])\nParam keyTrack(0.3);       // (type=coeff, default=0.3, scale=[0,1])\n\n// --- ENV (shared ADSR: drives VCF always, VCA if envMode) ---\nParam attack(0.005);       // (type=s, default=0.005, scale=[0.001,4], log)\nParam decayT(0.3);         // (type=s, default=0.3, scale=[0.001,8], log)\nParam sustain(0.6);        // (type=coeff, default=0.6, scale=[0,1])\nParam release(0.3);        // (type=s, default=0.3, scale=[0.001,8], log)\n\n// --- VCA ---\nParam level(0.8);          // (type=coeff, default=0.8, scale=[0,1])\nParam envMode(1);          // (type=bool, default=1, scale=[0,1])\n\n// --- LFO ---\nParam lfoRate(5.0);        // (type=hz, default=5.0, scale=[0.05,20], log)\nParam lfoDelay(0.0);       // (type=s, default=0.0, scale=[0,4], log)\""
                }
            },
            {
                "box": {
                    "id": "obj-5",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 133.0, 479.0, 50.0, 22.0 ],
                    "text": "set $1"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-17", 0 ],
                    "source": [ "obj-11", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-11", 0 ],
                    "source": [ "obj-14", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-4", 0 ],
                    "source": [ "obj-17", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-3", 0 ],
                    "midpoints": [ 475.5, 492.0, 803.0, 492.0, 803.0, 10.0, 884.5, 10.0 ],
                    "source": [ "obj-2", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 0 ],
                    "source": [ "obj-2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-7", 0 ],
                    "source": [ "obj-3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-2", 0 ],
                    "source": [ "obj-4", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "source": [ "obj-5", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-6", 0 ],
                    "source": [ "obj-7", 0 ]
                }
            }
        ],
        "autosave": 0
    }
}