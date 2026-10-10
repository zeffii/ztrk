{
    "patcher": {
        "fileversion": 1,
        "appversion": {
            "major": 9,
            "minor": 2,
            "revision": 0,
            "architecture": "x64",
            "modernui": 1
        },
        "classnamespace": "box",
        "rect": [ 59.0, 107.0, 1000.0, 780.0 ],
        "boxes": [
            {
                "box": {
                    "id": "obj-1",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patcher": {
                        "fileversion": 1,
                        "appversion": {
                            "major": 9,
                            "minor": 2,
                            "revision": 0,
                            "architecture": "x64",
                            "modernui": 1
                        },
                        "classnamespace": "dsp.gen",
                        "rect": [ 84.0, 132.0, 770.0, 631.0 ],
                        "boxes": [
                            {
                                "box": {
                                    "code": "//#! subtractor\r\n// --- DCO ---\r\nParam saw(0.7);            // (type=coeff, default=0.7, scale=[0,1])\r\nParam pulse(0.0);          // (type=coeff, default=0.0, scale=[0,1])\r\nParam sub(0.3);            // (type=coeff, default=0.3, scale=[0,1])\r\nParam noiseLvl(0.0);       // (type=coeff, default=0.0, scale=[0,1])\r\nParam pwm(0.5);            // (type=coeff, default=0.5, scale=[0,1])\r\nParam pwmLfoDepth(0.0);    // (type=coeff, default=0.0, scale=[0,1])\r\nParam range(0);            // (type=semitones, default=0, scale=[-24,24])\r\n\r\n// --- HPF ---\r\nParam hpfCutoff(40);       // (type=hz, default=40, scale=[20,2000], log)\r\n\r\n// --- VCF ---\r\nParam cutoff(1200);        // (type=hz, default=1200, scale=[40,10000], log)\r\nParam resonance(0.3);      // (type=coeff, default=0.3, scale=[0,1])\r\nParam envAmount(0.0);      // (type=bipolar, default=0.0, scale=[-1,1])\r\nParam lfoDepth(0.0);       // (type=coeff, default=0.0, scale=[0,1])\r\nParam keyTrack(0.3);       // (type=coeff, default=0.3, scale=[0,1])\r\n\r\n// --- ENV (shared ADSR: drives VCF always, VCA if envMode) ---\r\nParam attack(0.005);       // (type=s, default=0.005, scale=[0.001,4], log)\r\nParam decayT(0.3);         // (type=s, default=0.3, scale=[0.001,8], log)\r\nParam sustain(0.6);        // (type=coeff, default=0.6, scale=[0,1])\r\nParam release(0.3);        // (type=s, default=0.3, scale=[0.001,8], log)\r\n\r\n// --- VCA ---\r\nParam level(0.8);          // (type=coeff, default=0.8, scale=[0,1])\r\nParam envMode(1);          // (type=bool, default=1, scale=[0,1])\r\n\r\n// --- LFO ---\r\nParam lfoRate(5.0);        // (type=hz, default=5.0, scale=[0.05,20], log)\r\nParam lfoDelay(0.0);       // (type=s, default=0.0, scale=[0,4], log)\r\n\r\n\r\n\r\n\r\nout1 = in1 + in2;",
                                    "fontface": 0,
                                    "fontname": "<Monospaced>",
                                    "fontsize": 12.0,
                                    "id": "obj-8",
                                    "maxclass": "codebox",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 337.0, 133.0, 340.0, 200.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-6",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 298.0, 239.0, 150.0, 20.0 ],
                                    "text": "v"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-1",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 152.0, 14.0, 28.0, 22.0 ],
                                    "text": "in 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-2",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 305.0, 14.0, 28.0, 22.0 ],
                                    "text": "in 2"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-4",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 176.0, 418.0, 35.0, 22.0 ],
                                    "text": "out 1"
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "obj-8", 0 ],
                                    "source": [ "obj-1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-8", 1 ],
                                    "source": [ "obj-2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-4", 0 ],
                                    "source": [ "obj-8", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 500.0, 375.0, 39.0, 22.0 ],
                    "text": "gen~"
                }
            }
        ],
        "lines": [],
        "autosave": 0
    }
}