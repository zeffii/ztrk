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
        "rect": [ 541.0, 85.0, 1947.0, 1234.0 ],
        "boxes": [
            {
                "box": {
                    "id": "obj-40",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 507.0, 439.0, 47.0, 22.0 ],
                    "text": "> 0."
                }
            },
            {
                "box": {
                    "id": "obj-30",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 462.0, 439.0, 32.0, 22.0 ],
                    "text": "mtof"
                }
            },
            {
                "box": {
                    "id": "obj-5",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "multichannelsignal" ],
                    "patching_rect": [ 462.0, 574.0, 158.0, 22.0 ],
                    "text": "mc.gen~ JunoXP @chans 8"
                }
            },
            {
                "box": {
                    "id": "obj-78",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 422.0, 86.0, 72.0, 22.0 ],
                    "text": "r MidiSends"
                }
            },
            {
                "box": {
                    "id": "obj-95",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 692.0, 82.0, 61.0, 22.0 ],
                    "text": "zl group 3"
                }
            },
            {
                "box": {
                    "id": "obj-94",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 692.0, 130.0, 39.0, 22.0 ],
                    "text": "$2 $3"
                }
            },
            {
                "box": {
                    "id": "obj-87",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 692.0, 48.0, 40.0, 22.0 ],
                    "text": "midiin"
                }
            },
            {
                "box": {
                    "id": "obj-33",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 645.0, 130.0, 34.0, 22.0 ],
                    "text": "flush"
                }
            },
            {
                "box": {
                    "id": "obj-36",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "int", "int" ],
                    "patching_rect": [ 620.0, 375.0, 47.0, 22.0 ],
                    "text": "unpack"
                }
            },
            {
                "box": {
                    "id": "obj-42",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 507.0, 405.0, 97.0, 22.0 ],
                    "text": "scale 0 127 0. 1."
                }
            },
            {
                "box": {
                    "id": "obj-48",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "setvalue", "int" ],
                    "patching_rect": [ 648.0, 475.0, 128.0, 22.0 ],
                    "text": "mc.target"
                }
            },
            {
                "box": {
                    "id": "obj-52",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 462.0, 743.0, 84.0, 22.0 ],
                    "text": "mc.unpack~ 1"
                }
            },
            {
                "box": {
                    "id": "obj-53",
                    "maxclass": "ezdac~",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [ 401.0, 914.0, 45.0, 45.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-55",
                    "lastchannelcount": 0,
                    "maxclass": "live.gain~",
                    "numinlets": 2,
                    "numoutlets": 5,
                    "orientation": 1,
                    "outlettype": [ "signal", "signal", "", "float", "list" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 398.0, 848.0, 136.0, 47.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "live.gain~[2]",
                            "parameter_mmax": 6.0,
                            "parameter_mmin": -70.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "live.gain~",
                            "parameter_type": 0,
                            "parameter_unitstyle": 4
                        }
                    },
                    "varname": "live.gain~[2]"
                }
            },
            {
                "box": {
                    "id": "obj-56",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "multichannelsignal" ],
                    "patching_rect": [ 462.0, 657.0, 92.0, 22.0 ],
                    "text": "mc.mixdown~ 1"
                }
            },
            {
                "box": {
                    "id": "obj-63",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "int", "int" ],
                    "patching_rect": [ 462.0, 375.0, 47.0, 22.0 ],
                    "text": "unpack"
                }
            },
            {
                "box": {
                    "id": "obj-65",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "setvalue", "int" ],
                    "patching_rect": [ 462.0, 475.0, 59.0, 22.0 ],
                    "text": "mc.target"
                }
            },
            {
                "box": {
                    "id": "obj-66",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 6,
                    "outlettype": [ "list", "list", "int", "int", "", "int" ],
                    "patching_rect": [ 505.0, 338.0, 270.0, 22.0 ],
                    "text": "mc.noteallocator~ @voices 8 @steal 1"
                }
            },
            {
                "box": {
                    "id": "obj-67",
                    "maxclass": "newobj",
                    "numinlets": 7,
                    "numoutlets": 2,
                    "outlettype": [ "int", "" ],
                    "patching_rect": [ 442.0, 262.0, 82.0, 22.0 ],
                    "text": "midiformat"
                }
            },
            {
                "box": {
                    "id": "obj-68",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 441.0, 235.0, 336.0, 22.0 ],
                    "text": "pack 0 0"
                }
            },
            {
                "box": {
                    "id": "obj-70",
                    "maxclass": "kslider",
                    "mode": 2,
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "int", "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 441.0, 173.0, 336.0, 53.0 ]
                }
            },
            {
                "box": {
                    "attr": "mode",
                    "id": "obj-72",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 441.0, 130.0, 150.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-73",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 602.0, 130.0, 35.0, 22.0 ],
                    "text": "clear"
                }
            },
            {
                "box": {
                    "attr": "saw",
                    "id": "obj-43",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 844.0, 475.0, 150.0, 22.0 ]
                }
            },
            {
                "box": {
                    "attr": "pulse",
                    "id": "obj-44",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1017.0, 475.0, 150.0, 22.0 ]
                }
            },
            {
                "box": {
                    "attr": "sub",
                    "id": "obj-45",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1190.0, 475.0, 150.0, 22.0 ]
                }
            },
            {
                "box": {
                    "attr": "noiseLvl",
                    "id": "obj-46",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1369.0, 475.0, 150.0, 22.0 ]
                }
            },
            {
                "box": {
                    "attr": "pwm",
                    "id": "obj-47",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1543.0, 475.0, 150.0, 22.0 ]
                }
            },
            {
                "box": {
                    "attr": "pwmLfoDepth",
                    "id": "obj-50",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1710.0, 475.0, 150.0, 22.0 ]
                }
            },
            {
                "box": {
                    "attr": "range",
                    "id": "obj-51",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1878.0, 475.0, 150.0, 22.0 ]
                }
            },
            {
                "box": {
                    "attr": "hpfCutoff",
                    "id": "obj-54",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 2126.0, 475.0, 150.0, 22.0 ]
                }
            },
            {
                "box": {
                    "attr": "cutoff",
                    "id": "obj-57",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 844.0, 761.0, 150.0, 22.0 ]
                }
            },
            {
                "box": {
                    "attr": "resonance",
                    "id": "obj-58",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1018.0, 761.0, 150.0, 22.0 ]
                }
            },
            {
                "box": {
                    "attr": "envAmount",
                    "id": "obj-59",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1185.0, 761.0, 150.0, 22.0 ]
                }
            },
            {
                "box": {
                    "attr": "lfoDepth",
                    "id": "obj-60",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1357.0, 761.0, 150.0, 22.0 ]
                }
            },
            {
                "box": {
                    "attr": "keyTrack",
                    "id": "obj-61",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1533.0, 761.0, 150.0, 22.0 ]
                }
            },
            {
                "box": {
                    "attr": "attack",
                    "id": "obj-62",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 844.0, 986.0, 150.0, 22.0 ]
                }
            },
            {
                "box": {
                    "attr": "decayT",
                    "id": "obj-64",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1018.0, 986.0, 150.0, 22.0 ]
                }
            },
            {
                "box": {
                    "attr": "sustain",
                    "id": "obj-69",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1190.0, 986.0, 150.0, 22.0 ]
                }
            },
            {
                "box": {
                    "attr": "release",
                    "id": "obj-71",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1361.0, 986.0, 150.0, 22.0 ]
                }
            },
            {
                "box": {
                    "attr": "level",
                    "id": "obj-74",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 844.0, 1174.0, 150.0, 22.0 ]
                }
            },
            {
                "box": {
                    "attr": "envMode",
                    "id": "obj-75",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1018.0, 1174.0, 150.0, 22.0 ]
                }
            },
            {
                "box": {
                    "attr": "lfoRate",
                    "id": "obj-76",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1291.0, 1174.0, 150.0, 22.0 ]
                }
            },
            {
                "box": {
                    "attr": "lfoDelay",
                    "id": "obj-77",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1454.0, 1174.0, 150.0, 22.0 ]
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-65", 0 ],
                    "source": [ "obj-30", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-70", 0 ],
                    "source": [ "obj-33", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-48", 0 ],
                    "source": [ "obj-36", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-48", 0 ],
                    "source": [ "obj-40", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-40", 0 ],
                    "source": [ "obj-42", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 0 ],
                    "midpoints": [ 853.5, 539.0, 471.5, 539.0 ],
                    "source": [ "obj-43", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 0 ],
                    "midpoints": [ 1026.5, 542.0, 471.5, 542.0 ],
                    "source": [ "obj-44", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 0 ],
                    "midpoints": [ 1199.5, 546.0, 471.5, 546.0 ],
                    "source": [ "obj-45", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 0 ],
                    "midpoints": [ 1378.5, 549.0, 471.5, 549.0 ],
                    "source": [ "obj-46", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 0 ],
                    "midpoints": [ 1552.5, 553.0, 471.5, 553.0 ],
                    "source": [ "obj-47", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 1 ],
                    "source": [ "obj-48", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-56", 0 ],
                    "order": 1,
                    "source": [ "obj-5", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-66", 0 ],
                    "midpoints": [ 471.5, 638.0, 404.0, 638.0, 404.0, 325.0, 514.5, 325.0 ],
                    "order": 0,
                    "source": [ "obj-5", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 0 ],
                    "midpoints": [ 1719.5, 555.0, 471.5, 555.0 ],
                    "source": [ "obj-50", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 0 ],
                    "midpoints": [ 1887.5, 558.0, 471.5, 558.0 ],
                    "source": [ "obj-51", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-55", 1 ],
                    "order": 0,
                    "source": [ "obj-52", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-55", 0 ],
                    "order": 1,
                    "source": [ "obj-52", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 0 ],
                    "midpoints": [ 2135.5, 561.0, 471.5, 561.0 ],
                    "source": [ "obj-54", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-53", 1 ],
                    "source": [ "obj-55", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-53", 0 ],
                    "source": [ "obj-55", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-52", 0 ],
                    "source": [ "obj-56", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 0 ],
                    "midpoints": [ 853.5, 804.0, 650.0, 804.0, 650.0, 561.0, 471.5, 561.0 ],
                    "source": [ "obj-57", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 0 ],
                    "midpoints": [ 1027.5, 810.0, 644.0, 810.0, 644.0, 561.0, 471.5, 561.0 ],
                    "source": [ "obj-58", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 0 ],
                    "midpoints": [ 1194.5, 815.0, 637.0, 815.0, 637.0, 561.0, 471.5, 561.0 ],
                    "source": [ "obj-59", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 0 ],
                    "midpoints": [ 1366.5, 818.0, 630.0, 818.0, 630.0, 561.0, 471.5, 561.0 ],
                    "source": [ "obj-60", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 0 ],
                    "midpoints": [ 1542.5, 823.0, 624.0, 823.0, 624.0, 565.0, 471.5, 565.0 ],
                    "source": [ "obj-61", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 0 ],
                    "midpoints": [ 853.5, 1023.0, 682.0, 1023.0, 682.0, 561.0, 471.5, 561.0 ],
                    "source": [ "obj-62", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-30", 0 ],
                    "source": [ "obj-63", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-42", 0 ],
                    "source": [ "obj-63", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 0 ],
                    "midpoints": [ 1027.5, 1031.0, 676.0, 1031.0, 676.0, 561.0, 471.5, 561.0 ],
                    "source": [ "obj-64", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 0 ],
                    "source": [ "obj-65", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-36", 0 ],
                    "source": [ "obj-66", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-48", 1 ],
                    "order": 0,
                    "source": [ "obj-66", 5 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-63", 0 ],
                    "source": [ "obj-66", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-65", 1 ],
                    "order": 1,
                    "source": [ "obj-66", 5 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-66", 0 ],
                    "source": [ "obj-67", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-67", 0 ],
                    "source": [ "obj-68", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 0 ],
                    "midpoints": [ 1199.5, 1037.0, 670.0, 1037.0, 670.0, 561.0, 471.5, 561.0 ],
                    "source": [ "obj-69", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-68", 1 ],
                    "source": [ "obj-70", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-68", 0 ],
                    "source": [ "obj-70", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 0 ],
                    "midpoints": [ 1370.5, 1044.0, 664.0, 1044.0, 664.0, 561.0, 471.5, 561.0 ],
                    "source": [ "obj-71", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-70", 0 ],
                    "source": [ "obj-72", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-70", 0 ],
                    "source": [ "obj-73", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 0 ],
                    "midpoints": [ 853.5, 1210.0, 714.0, 1210.0, 714.0, 561.0, 471.5, 561.0 ],
                    "source": [ "obj-74", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 0 ],
                    "midpoints": [ 1027.5, 1215.0, 708.0, 1215.0, 708.0, 561.0, 471.5, 561.0 ],
                    "source": [ "obj-75", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 0 ],
                    "midpoints": [ 1300.5, 1219.0, 701.0, 1219.0, 701.0, 1020.0, 701.0, 1020.0, 701.0, 561.0, 471.5, 561.0 ],
                    "source": [ "obj-76", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 0 ],
                    "midpoints": [ 1463.5, 1225.0, 694.0, 1225.0, 694.0, 561.0, 471.5, 561.0 ],
                    "source": [ "obj-77", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-95", 0 ],
                    "source": [ "obj-87", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-70", 0 ],
                    "source": [ "obj-94", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-94", 0 ],
                    "source": [ "obj-95", 0 ]
                }
            }
        ],
        "parameters": {
            "obj-55": [ "live.gain~[2]", "live.gain~", 0 ],
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