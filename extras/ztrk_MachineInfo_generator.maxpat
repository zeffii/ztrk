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
                    "linecount": 139,
                    "lines": 1,
                    "maxclass": "textedit",
                    "nosymquotes": 1,
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "", "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 875.3846988677979, 80.00000762939453, 684.6154499053955, 1500.0001430511475 ],
                    "text": "Buffer buf;\nParam chIndex(0, min=0, max=22);\n\nHistory _GATEPREV(0);\nHistory _SAW(0.7);\nHistory _PULSE(0);\nHistory _SUB(0.3);\nHistory _NOISELVL(0);\nHistory _PWM(0.5);\nHistory _PWMLFODEPTH(0);\nHistory _RANGE(0);\nHistory _HPFCUTOFF(40);\nHistory _CUTOFF(1200);\nHistory _RESONANCE(0.3);\nHistory _ENVAMOUNT(0);\nHistory _LFODEPTH(0);\nHistory _KEYTRACK(0.3);\nHistory _ATTACK(0.005);\nHistory _DECAYT(0.3);\nHistory _SUSTAIN(0.6);\nHistory _RELEASE(0.3);\nHistory _LEVEL(0.8);\nHistory _ENVMODE(1);\nHistory _LFORATE(5);\nHistory _LFODELAY(0);\n\npindex = in1;\ntrig = (in2 > 0.0);\nedge = trig && !_GATEPREV;\n_GATEPREV = trig;\n\n// 0 Trigger\nraw = peek(buf, pindex, chIndex+0);\nout1 = (edge && raw > 0.5) ? 1.0 : 0.0;\n\n// 1 Saw\nraw = peek(buf, pindex, chIndex+1);\n_SAW = (edge && raw >= 0.0) ? (raw) : _SAW;\nout2 = _SAW;\n\n// 2 Pulse\nraw = peek(buf, pindex, chIndex+2);\n_PULSE = (edge && raw >= 0.0) ? (raw) : _PULSE;\nout3 = _PULSE;\n\n// 3 Sub\nraw = peek(buf, pindex, chIndex+3);\n_SUB = (edge && raw >= 0.0) ? (raw) : _SUB;\nout4 = _SUB;\n\n// 4 Noise Lvl\nraw = peek(buf, pindex, chIndex+4);\n_NOISELVL = (edge && raw >= 0.0) ? (raw) : _NOISELVL;\nout5 = _NOISELVL;\n\n// 5 Pwm\nraw = peek(buf, pindex, chIndex+5);\n_PWM = (edge && raw >= 0.0) ? (raw) : _PWM;\nout6 = _PWM;\n\n// 6 Pwm Lfo Depth\nraw = peek(buf, pindex, chIndex+6);\n_PWMLFODEPTH = (edge && raw >= 0.0) ? (raw) : _PWMLFODEPTH;\nout7 = _PWMLFODEPTH;\n\n// 7 Range\nraw = peek(buf, pindex, chIndex+7);\n_RANGE = (edge && raw >= 0.0) ? (-24 + raw * 48) : _RANGE;\nout8 = _RANGE;\n\n// 8 Hpf Cutoff\nraw = peek(buf, pindex, chIndex+8);\n_HPFCUTOFF = (edge && raw >= 0.0) ? (20 * pow(100, raw)) : _HPFCUTOFF;\nout9 = _HPFCUTOFF;\n\n// 9 Cutoff\nraw = peek(buf, pindex, chIndex+9);\n_CUTOFF = (edge && raw >= 0.0) ? (40 * pow(250, raw)) : _CUTOFF;\nout10 = _CUTOFF;\n\n// 10 Resonance\nraw = peek(buf, pindex, chIndex+10);\n_RESONANCE = (edge && raw >= 0.0) ? (raw) : _RESONANCE;\nout11 = _RESONANCE;\n\n// 11 Env Amount\nraw = peek(buf, pindex, chIndex+11);\n_ENVAMOUNT = (edge && raw >= 0.0) ? (-1 + raw * 2) : _ENVAMOUNT;\nout12 = _ENVAMOUNT;\n\n// 12 Lfo Depth\nraw = peek(buf, pindex, chIndex+12);\n_LFODEPTH = (edge && raw >= 0.0) ? (raw) : _LFODEPTH;\nout13 = _LFODEPTH;\n\n// 13 Key Track\nraw = peek(buf, pindex, chIndex+13);\n_KEYTRACK = (edge && raw >= 0.0) ? (raw) : _KEYTRACK;\nout14 = _KEYTRACK;\n\n// 14 Attack\nraw = peek(buf, pindex, chIndex+14);\n_ATTACK = (edge && raw >= 0.0) ? (0.001 * pow(4000, raw)) : _ATTACK;\nout15 = _ATTACK;\n\n// 15 Decay T\nraw = peek(buf, pindex, chIndex+15);\n_DECAYT = (edge && raw >= 0.0) ? (0.001 * pow(8000, raw)) : _DECAYT;\nout16 = _DECAYT;\n\n// 16 Sustain\nraw = peek(buf, pindex, chIndex+16);\n_SUSTAIN = (edge && raw >= 0.0) ? (raw) : _SUSTAIN;\nout17 = _SUSTAIN;\n\n// 17 Release\nraw = peek(buf, pindex, chIndex+17);\n_RELEASE = (edge && raw >= 0.0) ? (0.001 * pow(8000, raw)) : _RELEASE;\nout18 = _RELEASE;\n\n// 18 Level\nraw = peek(buf, pindex, chIndex+18);\n_LEVEL = (edge && raw >= 0.0) ? (raw) : _LEVEL;\nout19 = _LEVEL;\n\n// 19 Env Mode\nraw = peek(buf, pindex, chIndex+19);\n_ENVMODE = (edge && raw >= 0.0) ? (raw) : _ENVMODE;\nout20 = _ENVMODE;\n\n// 20 Lfo Rate\nraw = peek(buf, pindex, chIndex+20);\n_LFORATE = (edge && raw >= 0.0) ? (0.05 * pow(400, raw)) : _LFORATE;\nout21 = _LFORATE;\n\n// 21 Lfo Delay\nraw = peek(buf, pindex, chIndex+21);\n_LFODELAY = (edge && raw >= 0.0) ? (0 * pow(Infinity, raw)) : _LFODELAY;\nout22 = _LFODELAY;\n"
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
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
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