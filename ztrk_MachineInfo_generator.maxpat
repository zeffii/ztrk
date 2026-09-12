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
        "rect": [ 629.0, 413.0, 888.0, 855.0 ],
        "boxes": [
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
                    "linecount": 10,
                    "lines": 1,
                    "maxclass": "textedit",
                    "nosymquotes": 1,
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "", "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 133.0, 522.0, 594.0, 221.0 ],
                    "presentation_linecount": 10,
                    "text": "    \"MACHINE\": [\n        ['b', 'Trigger', 0], \n        [\"hh\", \"Amp |(t:coeff, d:0.8, s:[0,1])\", 1], // default hex: CC\n        [\"hh\", \"Tone |(t:coeff, d:0.5, s:[0,1])\", 1], // default hex: 80\n        [\"hh\", \"Decay Rate |(t:s, d:0.15, s:[0.02,2])\", 1], // default hex: 11\n        [\"hh\", \"Decay Shape |(t:coeff, d:0.3, s:[0,1])\", 1], // default hex: 4D\n        [\"hh\", \"Attack Energy |(t:coeff, d:0.4, s:[0,1])\", 1], // default hex: 66\n        [\"hhhh\", \"Pitch |(t:hz, d:2200, s:[800,6000])\", 2], // default hex: 8086\n        [\"hh\", \"Attack Time |(t:ms, d:4, s:[1,30])\", 2], // default hex: 1A\n    ]"
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
                    "linecount": 8,
                    "lines": 60,
                    "maxclass": "textedit",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "", "int", "", "" ],
                    "outputmode": 1,
                    "parameter_enable": 0,
                    "patching_rect": [ 133.0, 69.0, 594.0, 221.0 ],
                    "text": "Param amp(0.8);            // (type=coeff, default=0.8, scale=[0,1])\nParam tone(0.5);           // (type=coeff, default=0.5, scale=[0,1])\nParam decayRate(0.15);     // (type=s, default=0.15, scale=[0.02,2.0])\nParam decayShape(0.3);     // (type=coeff, default=0.3, scale=[0,1])\nParam attackEnergy(0.4);   // (type=coeff, default=0.4, scale=[0,1])\n// --- section ---\nParam pitch(2200);         // (type=hz, default=2200, scale=[800,6000])\nParam attackTime(4);       // (type=ms, default=4, scale=[1,30])\n"
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
                    "destination": [ "obj-5", 0 ],
                    "source": [ "obj-2", 0 ]
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
            }
        ],
        "autosave": 0
    }
}