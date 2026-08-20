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
        "rect": [ 62.0, 85.0, 2117.0, 1265.0 ],
        "toolbars_unpinned_last_save": 4,
        "boxes": [
            {
                "box": {
                    "id": "obj-36",
                    "maxclass": "live.scope~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 1208.6022038459778, 1181.7204822301865, 184.0, 68.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-35",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 0,
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
                        "rect": [ 0.0, 0.0, 1000.0, 780.0 ],
                        "boxes": [
                            {
                                "box": {
                                    "id": "obj-32",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 154.74070954322815, 172.7407197356224, 44.0, 22.0 ],
                                    "text": "r~ freq"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-22",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 751.7777270078659, 137.92590606212616, 46.0, 22.0 ],
                                    "text": "r~ gate"
                                }
                            },
                            {
                                "box": {
                                    "fontface": 0,
                                    "fontname": "Arial",
                                    "fontsize": 12.0,
                                    "id": "obj-17",
                                    "maxclass": "number~",
                                    "mode": 2,
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "float" ],
                                    "patching_rect": [ 50.0, 235.7036806344986, 56.0, 22.0 ],
                                    "sig": 0.0
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-94",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 751.7777270078659, 172.7407197356224, 39.0, 22.0 ],
                                    "text": "click~"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-93",
                                    "maxclass": "live.scope~",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "patching_rect": [ 606.9999852180481, 589.0, 184.0, 68.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-92",
                                    "maxclass": "live.scope~",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "patching_rect": [ 161.9999852180481, 667.0, 571.8518331050873, 208.19267696142197 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-90",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 548.9999852180481, 173.92590606212616, 31.0, 22.0 ],
                                    "text": "sig~"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-88",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 343.9999852180481, 162.0, 31.0, 22.0 ],
                                    "text": "sig~"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-87",
                                    "maxclass": "live.dial",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "float" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 548.9999852180481, 111.92590606212616, 41.0, 48.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_longname": "live.dial[1]",
                                            "parameter_mmax": 1000.0,
                                            "parameter_modmode": 3,
                                            "parameter_shortname": "live.dial",
                                            "parameter_type": 0,
                                            "parameter_unitstyle": 0
                                        }
                                    },
                                    "varname": "live.dial[1]"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-86",
                                    "maxclass": "live.dial",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "float" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 343.9999852180481, 100.0, 41.0, 48.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_longname": "live.dial",
                                            "parameter_mmax": 1.0,
                                            "parameter_modmode": 3,
                                            "parameter_shortname": "live.dial",
                                            "parameter_type": 0,
                                            "parameter_unitstyle": 1
                                        }
                                    },
                                    "varname": "live.dial"
                                }
                            },
                            {
                                "box": {
                                    "code": "/*\r\nSimple one-shot wavetable voice\r\nin1 = freq  in2 = vol  in3 = dur  in4 = trigger\r\n*/\r\nBuffer wt(\"synth_wt\");\r\nHistory phase(0), env(0), playing(0), prev(0);\r\n\r\nfreq = max(in1,1); \r\nvol = clip(in2,0,1); \r\ndur = max(in3,0.001);\r\ntrig = in4 > 0.5; \r\nrise = trig && !prev; \r\nprev = trig;\r\n\r\nif (rise) { phase = 0; env = 1; playing = 1; }\r\n\r\nsr = samplerate;\r\nif (playing) {\r\n    phase = wrap(phase + freq/sr, 0, 1);\r\n    env = env - 1/(dur*sr);\r\n    if (env <= 0) { env = 0; playing = 0; }\r\n}\r\n\r\nout1 = sample(wt, phase, interp=\"linear\") * env * vol;\r\nout2 = env;",
                                    "fontface": 0,
                                    "fontname": "<Monospaced>",
                                    "fontsize": 12.0,
                                    "id": "obj-85",
                                    "maxclass": "gen.codebox~",
                                    "numinlets": 4,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "signal" ],
                                    "patching_rect": [ 154.9999852180481, 219.0, 629.0, 345.0 ]
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "obj-94", 0 ],
                                    "source": [ "obj-22", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-17", 0 ],
                                    "order": 1,
                                    "source": [ "obj-32", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-85", 0 ],
                                    "order": 0,
                                    "source": [ "obj-32", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-92", 0 ],
                                    "source": [ "obj-85", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-93", 0 ],
                                    "source": [ "obj-85", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-88", 0 ],
                                    "source": [ "obj-86", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-90", 0 ],
                                    "source": [ "obj-87", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-85", 1 ],
                                    "source": [ "obj-88", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-85", 2 ],
                                    "source": [ "obj-90", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-85", 3 ],
                                    "source": [ "obj-94", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 434.0425500869751, 429.78723096847534, 143.0, 22.0 ],
                    "text": "p SimpleWaveformPlayer"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "id": "obj-34",
                    "maxclass": "number~",
                    "mode": 2,
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "float" ],
                    "patching_rect": [ 1051.567741394043, 386.8421015739441, 56.0, 22.0 ],
                    "sig": 0.0
                }
            },
            {
                "box": {
                    "id": "obj-25",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 1996.052612543106, 19.736841917037964, 46.0, 22.0 ],
                    "text": "r~ gate"
                }
            },
            {
                "box": {
                    "id": "obj-24",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 1035.7782678604126, 356.5789439678192, 44.0, 22.0 ],
                    "text": "r~ freq"
                }
            },
            {
                "box": {
                    "id": "obj-23",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 948.9361634254456, 164.89361584186554, 46.0, 22.0 ],
                    "text": "s~ freq"
                }
            },
            {
                "box": {
                    "id": "obj-21",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 947.8723336458206, 129.78723311424255, 48.0, 22.0 ],
                    "text": "s~ gate"
                }
            },
            {
                "box": {
                    "id": "obj-20",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 771.2765902280807, 144.6808500289917, 29.5, 22.0 ],
                    "text": "- 10"
                }
            },
            {
                "box": {
                    "id": "obj-15",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "signal" ],
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
                        "rect": [ 0.0, 0.0, 1000.0, 780.0 ],
                        "boxes": [
                            {
                                "box": {
                                    "id": "obj-105",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "bang", "int" ],
                                    "patching_rect": [ 898.5572936534882, 169.49397122859955, 29.5, 22.0 ],
                                    "text": "t b i"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-102",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "float" ],
                                    "patching_rect": [ 898.5572936534882, 244.49397122859955, 31.0, 22.0 ],
                                    "text": "float"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-89",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 50.0, 434.49397122859955, 50.60241150856018, 22.0 ],
                                    "text": "sig~"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-75",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 781.0, 209.49397122859955, 29.5, 22.0 ],
                                    "text": "0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-73",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "int" ],
                                    "patching_rect": [ 809.0, 152.49397122859955, 29.5, 22.0 ],
                                    "text": "> 0."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-41",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 64.0, 327.49397122859955, 32.0, 22.0 ],
                                    "text": "mtof"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-40",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "int" ],
                                    "patching_rect": [ 64.0, 294.49397122859955, 32.0, 22.0 ],
                                    "text": "+ 24"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-35",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 2,
                                    "outlettype": [ "float", "float" ],
                                    "patching_rect": [ 620.6988496780396, 100.0, 108.0, 22.0 ],
                                    "text": "makenote 80 1000"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-12",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 897.8072936534882, 284.33735620975494, 31.0, 22.0 ],
                                    "text": "sig~"
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-10",
                                    "index": 1,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "int" ],
                                    "patching_rect": [ 620.6988530000001, 39.99999822859955, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-11",
                                    "index": 2,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "int" ],
                                    "patching_rect": [ 664.6988530000001, 39.99999822859955, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-13",
                                    "index": 1,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 50.0, 516.4939712285995, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-14",
                                    "index": 2,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 897.807251, 516.4939712285995, 30.0, 30.0 ]
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "obj-35", 0 ],
                                    "source": [ "obj-10", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-12", 0 ],
                                    "source": [ "obj-102", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-102", 1 ],
                                    "source": [ "obj-105", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-102", 0 ],
                                    "source": [ "obj-105", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-35", 1 ],
                                    "source": [ "obj-11", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-14", 0 ],
                                    "source": [ "obj-12", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-40", 0 ],
                                    "source": [ "obj-35", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-73", 0 ],
                                    "source": [ "obj-35", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-41", 0 ],
                                    "source": [ "obj-40", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-89", 0 ],
                                    "source": [ "obj-41", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-105", 0 ],
                                    "order": 0,
                                    "source": [ "obj-73", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-75", 1 ],
                                    "order": 1,
                                    "source": [ "obj-73", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-13", 0 ],
                                    "source": [ "obj-89", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 824.4680792093277, 129.78723311424255, 76.0, 22.0 ],
                    "text": "p notetrigger"
                }
            },
            {
                "box": {
                    "id": "obj-95",
                    "maxclass": "live.scope~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 1992.1052441596985, 63.157894134521484, 184.0, 68.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-84",
                    "maxclass": "live.scope~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 1894.6237394809723, 1162.3656426668167, 184.0, 68.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-83",
                    "maxclass": "live.scope~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 1664.5162024497986, 1162.3656426668167, 184.0, 68.0 ]
                }
            },
            {
                "box": {
                    "fontname": "Consolas",
                    "id": "obj-70",
                    "linecount": 43,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 664.7256398200989, 539.4736790657043, 449.0, 625.0 ],
                    "text": "Wavetable Synth Voice  –  2048-sample buffer \"synth_wt\"\nInlets:\n   in1 = frequency (Hz)\n   in2 = gate (0 or 1)\nParams (or set via messages / UI):\n   A D S R          – amplitude envelope\n   FA FD FS FR      – filter envelope\n   cutoff           – base filter frequency (Hz)\n   res              – resonance (0..1-ish, careful >0.9)\n   fenv_amt         – how much filter env modulates cutoff (0..1+)\n   gain             – final output gain\n\n============================================================\n\n[kslider] or [makenote 100 500] or your tracker\n    │\n    ├─ note → [mtof] ──────────────────────────────→ in1 of gen~\n    └─ gate (0/1) ─────────────────────────────────→ in2 of gen~\n\n[v8ui  (your synth_mk1 script)]\n    │  (outlet 1: \"param\" idx value)\n    └─→ [route param] → [select 0 1 2 3 4 5 6 7 …]\n                           │\n                           └─→ [pak …] or individual [set A $1( etc.\n                                 messages into the gen~ :\n\n[gen~]  ← receive messages:\n    A $1, D $1, S $1, R $1,\n    FA $1, FD $1, FS $1, FR $1,\n    cutoff $1, res $1, fenv_amt $1, gain $1\n\n[gen~] → [*~ 0.5] → [dac~]\n\n=============================================================\n\n[v8ui]\n|\n[route param]\n|\n[sel 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16]\n|  |  |  |  |  |  |  |  …\n[set A $1(  [set D $1(  … etc.   →  [gen~]\n"
                }
            },
            {
                "box": {
                    "id": "obj-68",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "param_connect": "gen~_AA::FR",
                    "parameter_enable": 1,
                    "patching_rect": [ 566.0, 354.0, 41.0, 48.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 0.4 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "FR",
                            "parameter_mmax": 6.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "FR",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "A[7]"
                }
            },
            {
                "box": {
                    "id": "obj-67",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "param_connect": "gen~_AA::FS",
                    "parameter_enable": 1,
                    "patching_rect": [ 519.6666666666666, 354.0, 41.0, 48.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 0.4 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "FS",
                            "parameter_mmax": 1.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "FS",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "A[6]"
                }
            },
            {
                "box": {
                    "id": "obj-66",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "param_connect": "gen~_AA::FD",
                    "parameter_enable": 1,
                    "patching_rect": [ 473.3333333333333, 354.0, 41.0, 48.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 0.3 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "FD",
                            "parameter_mmax": 6.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "FD",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "A[5]"
                }
            },
            {
                "box": {
                    "id": "obj-65",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "param_connect": "gen~_AA::FA",
                    "parameter_enable": 1,
                    "patching_rect": [ 427.0, 354.0, 41.0, 48.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 0.01 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "FA",
                            "parameter_mmax": 6.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "FA",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "A[4]"
                }
            },
            {
                "box": {
                    "id": "obj-64",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "param_connect": "gen~_AA::R",
                    "parameter_enable": 1,
                    "patching_rect": [ 566.0, 275.0, 41.0, 48.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 0.3 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "R",
                            "parameter_mmax": 6.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "R",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "A[3]"
                }
            },
            {
                "box": {
                    "id": "obj-63",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "param_connect": "gen~_AA::S",
                    "parameter_enable": 1,
                    "patching_rect": [ 519.6666666666665, 279.5180826187134, 41.0, 48.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 0.7 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "S",
                            "parameter_mmax": 1.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "S",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "A[2]"
                }
            },
            {
                "box": {
                    "id": "obj-62",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "param_connect": "gen~_AA::D",
                    "parameter_enable": 1,
                    "patching_rect": [ 473.33333333333326, 275.0, 41.0, 48.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 0.2 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "D",
                            "parameter_mmax": 6.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "D",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "A[1]"
                }
            },
            {
                "box": {
                    "id": "obj-60",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "param_connect": "gen~_AA::A",
                    "parameter_enable": 1,
                    "patching_rect": [ 427.0, 275.0, 41.0, 48.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 0.01 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "A",
                            "parameter_mmax": 6.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "A",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "A"
                }
            },
            {
                "box": {
                    "id": "obj-43",
                    "maxclass": "newobj",
                    "numinlets": 9,
                    "numoutlets": 9,
                    "outlettype": [ "", "", "", "", "", "", "", "", "" ],
                    "patching_rect": [ 427.0, 236.0, 193.0, 22.0 ],
                    "text": "route 0 1 2 3 4 5 6 7"
                }
            },
            {
                "box": {
                    "id": "obj-42",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 427.0, 200.0, 73.0, 22.0 ],
                    "text": "route param"
                }
            },
            {
                "box": {
                    "id": "obj-30",
                    "maxclass": "live.scope~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 1426.8817833662033, 1162.3656426668167, 184.0, 68.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-29",
                    "maxclass": "ezdac~",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [ 2041.041416168213, 809.2105185985565, 45.0, 45.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-28",
                    "lastchannelcount": 0,
                    "maxclass": "live.gain~",
                    "numinlets": 2,
                    "numoutlets": 5,
                    "outlettype": [ "signal", "signal", "", "float", "list" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 2009.4624691009521, 581.578941822052, 48.0, 136.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "live.gain~",
                            "parameter_mmax": 6.0,
                            "parameter_mmin": -70.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "live.gain~",
                            "parameter_type": 0,
                            "parameter_unitstyle": 4
                        }
                    },
                    "varname": "live.gain~"
                }
            },
            {
                "box": {
                    "id": "obj-7",
                    "inputmode": 1,
                    "maxclass": "kslider",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "int", "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 747.8723350763321, 45.744680523872375, 336.0, 53.0 ]
                }
            },
            {
                "box": {
                    "buffername": "synth_wt",
                    "id": "obj-4",
                    "maxclass": "waveform~",
                    "numinlets": 5,
                    "numoutlets": 6,
                    "outlettype": [ "float", "float", "float", "float", "list", "" ],
                    "patching_rect": [ 456.33333333333326, 65.12048304080963, 256.0, 64.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-3",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "float", "bang" ],
                    "patching_rect": [ 557.5381563504536, 35.0, 97.0, 22.0 ],
                    "text": "buffer~ synth_wt"
                }
            },
            {
                "box": {
                    "code": "/*\r\nwavetable synth mk2  – rewritten with safer History handling + debug\r\n*/\r\n\r\n// ---------- function (must come before everything) ----------\r\nadsr(env, state, gate, atk_samps, dec_samps, sus, rel_samps) {\r\n    // note-on / note-off state machine\r\n    if (gate && state == 0) {                   state = 1; }  // → attack\r\n    else if (!gate && state > 0 && state < 4) { state = 4; }  // → release\r\n\r\n    if (state == 1) {                       // attack\r\n        env = env + 1 / atk_samps;\r\n        if (env >= 1) env, state = 1, 2;\r\n    } else if (state == 2) {                // decay\r\n        env = env - (1 - sus) / dec_samps;\r\n        if (env <= sus) env, state = sus, 3;\r\n    } else if (state == 3) {                // sustain\r\n        env = sus;\r\n    } else if (state == 4) {                // release\r\n        env = env - env / rel_samps;\r\n        if (env < 0.0001) env, state = 0, 0;\r\n    }\r\n\r\n    return env, state;\r\n}\r\n\r\n// ---------- declarations ----------\r\nBuffer wt(\"synth_wt\");\r\n\r\nParam A(0.01), D(0.2), S(0.7), R(0.3);\r\nParam FA(0.01), FD(0.3), FS(0.4), FR(0.4);\r\nParam cutoff(1200), res(0.3), fenv_amt(0.6), gain(0.4);\r\n\r\nHistory amp_env(0), amp_state(0);       // 0=idle 1=atk 2=dec 3=sus 4=rel\r\nHistory fenv(0),    fstate(0);\r\nHistory phase(0);\r\nHistory low(0), band(0);\r\n\r\n// ---------- main code ----------\r\nfreq = max(in1, 1);\r\ngate = in2 > 0.5;                       // change to gate = 1; for forced always-on test\r\n// gate = 1;\r\n\r\n// seconds → samples (never divide by zero)\r\nsr         = samplerate;\r\natk_samps  = max(A  * sr, 1);\r\ndec_samps  = max(D  * sr, 1);\r\nrel_samps  = max(R  * sr, 1);\r\nfatk_samps = max(FA * sr, 1);\r\nfdec_samps = max(FD * sr, 1);\r\nfrel_samps = max(FR * sr, 1);\r\n\r\n// ---- amplitude envelope (safe History write-back) ----\r\namp = amp_env;\r\nst  = amp_state;\r\namp, st = adsr(amp, st, gate, atk_samps, dec_samps, S, rel_samps);\r\namp_env   = amp;\r\namp_state = st;\r\n\r\n// ---- filter envelope (same pattern) ----\r\nfe = fenv;\r\nfst = fstate;\r\nfe, fst = adsr(fe, fst, gate, fatk_samps, fdec_samps, FS, frel_samps);\r\nfenv   = fe;\r\nfstate = fst;\r\n\r\n// ---------- wavetable oscillator ----------\r\nphase = wrap(phase + freq / sr, 0, 1);\r\nosc = sample(wt, phase, interp=\"linear\");\r\n\r\n// ---------- resonant low-pass (SVF-style) ----------\r\nmod_cut = cutoff * (1 + fenv * fenv_amt * 8);\r\nmod_cut = clip(mod_cut, 20, sr * 0.45);\r\n\r\nf = 2 * sin(pi * mod_cut / sr);\r\nq = max(1 - res, 0.05);\r\n\r\nhigh = osc - low - q * band;\r\nband = band + f * high;\r\nlow  = low  + f * band;\r\nfilt = tanh(low * 1.2);                 // soft saturation\r\n\r\n// ---------- outputs ----------\r\nout1 = filt * amp_env * gain;           // main audio\r\nout2 = amp_env;                         // amplitude envelope (visual / sidechain)\r\nout3 = fenv;                            // filter envelope (visual)\r\nout4 = osc * amp_env * gain;            // dry (filter bypass) – useful for debugging",
                    "fontface": 0,
                    "fontname": "<Monospaced>",
                    "fontsize": 12.0,
                    "id": "obj-2",
                    "maxclass": "gen.codebox~",
                    "numinlets": 2,
                    "numoutlets": 4,
                    "outlettype": [ "signal", "signal", "signal", "signal" ],
                    "patching_rect": [ 1159.1398360729218, 48.38709890842438, 801.0753041505814, 1084.9462844133377 ],
                    "varname": "gen~_AA"
                }
            },
            {
                "box": {
                    "filename": "ztrk_synth_mk2.js",
                    "id": "obj-1",
                    "maxclass": "v8ui",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 20.48192846775055, 30.12048304080963, 388.0, 466.0 ],
                    "textfile": {
                        "filename": "ztrk_synth_mk2.js",
                        "flags": 0,
                        "embed": 0,
                        "autowatch": 1
                    },
                    "varname": "v8ui_AA"
                }
            },
            {
                "box": {
                    "id": "obj-6",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 456.33333333333326, 35.0, 75.0, 22.0 ],
                    "text": "set synth_wt"
                }
            },
            {
                "box": {
                    "attr": "res",
                    "id": "obj-26",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 948.9361634254456, 218.42105054855347, 150.0, 22.0 ]
                }
            },
            {
                "box": {
                    "attr": "cutoff",
                    "id": "obj-27",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 948.9361634254456, 247.36841869354248, 150.0, 22.0 ]
                }
            },
            {
                "box": {
                    "attr": "gain",
                    "id": "obj-31",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 948.9361634254456, 278.9473657608032, 150.0, 22.0 ]
                }
            },
            {
                "box": {
                    "attr": "fenv_amt",
                    "id": "obj-38",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 948.9361634254456, 313.1578917503357, 150.0, 22.0 ]
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-42", 0 ],
                    "source": [ "obj-1", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-21", 0 ],
                    "source": [ "obj-15", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-23", 0 ],
                    "source": [ "obj-15", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-28", 1 ],
                    "order": 0,
                    "source": [ "obj-2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-28", 0 ],
                    "order": 1,
                    "source": [ "obj-2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-30", 0 ],
                    "source": [ "obj-2", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-36", 0 ],
                    "order": 2,
                    "source": [ "obj-2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-83", 0 ],
                    "source": [ "obj-2", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-84", 0 ],
                    "source": [ "obj-2", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-15", 0 ],
                    "source": [ "obj-20", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-2", 0 ],
                    "order": 0,
                    "source": [ "obj-24", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-34", 0 ],
                    "order": 1,
                    "source": [ "obj-24", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-2", 1 ],
                    "order": 1,
                    "source": [ "obj-25", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-95", 0 ],
                    "order": 0,
                    "source": [ "obj-25", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-2", 0 ],
                    "midpoints": [ 958.4361634254456, 243.8315131664276, 1168.6398360729218, 243.8315131664276 ],
                    "source": [ "obj-26", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-2", 0 ],
                    "midpoints": [ 958.4361634254456, 273.65079110860825, 1171.0429235100746, 273.65079110860825, 1171.0429235100746, 292.313888669014, 1168.6398360729218, 292.313888669014 ],
                    "source": [ "obj-27", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-29", 1 ],
                    "source": [ "obj-28", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-29", 0 ],
                    "source": [ "obj-28", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-2", 0 ],
                    "midpoints": [ 958.4361634254456, 306.3718981742859, 1172.5244049429893, 306.3718981742859, 1172.5244049429893, 339.301842212677, 1168.6398360729218, 339.301842212677 ],
                    "source": [ "obj-31", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-2", 0 ],
                    "midpoints": [ 958.4361634254456, 340.7007694244385, 1149.561442732811, 340.7007694244385, 1149.561442732811, 342.12201488018036, 1168.6398360729218, 342.12201488018036 ],
                    "source": [ "obj-38", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-43", 0 ],
                    "source": [ "obj-42", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-60", 0 ],
                    "source": [ "obj-43", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-62", 0 ],
                    "source": [ "obj-43", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-63", 0 ],
                    "source": [ "obj-43", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-64", 0 ],
                    "source": [ "obj-43", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-65", 0 ],
                    "source": [ "obj-43", 4 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-66", 0 ],
                    "source": [ "obj-43", 5 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-67", 0 ],
                    "source": [ "obj-43", 6 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-68", 0 ],
                    "source": [ "obj-43", 7 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-4", 0 ],
                    "source": [ "obj-6", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-15", 1 ],
                    "source": [ "obj-7", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20", 0 ],
                    "source": [ "obj-7", 0 ]
                }
            }
        ],
        "parameters": {
            "obj-28": [ "live.gain~", "live.gain~", 0 ],
            "obj-35::obj-86": [ "live.dial", "live.dial", 0 ],
            "obj-35::obj-87": [ "live.dial[1]", "live.dial", 0 ],
            "obj-60": [ "A", "A", 0 ],
            "obj-62": [ "D", "D", 0 ],
            "obj-63": [ "S", "S", 0 ],
            "obj-64": [ "R", "R", 0 ],
            "obj-65": [ "FA", "FA", 0 ],
            "obj-66": [ "FD", "FD", 0 ],
            "obj-67": [ "FS", "FS", 0 ],
            "obj-68": [ "FR", "FR", 0 ],
            "parameterbanks": {
                "0": {
                    "index": 0,
                    "name": "",
                    "parameters": [ "-", "-", "-", "-", "-", "-", "-", "-" ],
                    "buttons": [ "-", "-", "-", "-", "-", "-", "-", "-" ]
                }
            },
            "inherited_shortname": 1
        },
        "autosave": 0
    }
}