{
    "patcher": {
        "fileversion": 1,
        "appversion": {
            "major": 9,
            "minor": 1,
            "revision": 1,
            "architecture": "x64",
            "modernui": 1
        },
        "classnamespace": "box",
        "rect": [ 106.0, 85.0, 1533.0, 907.0 ],
        "boxes": [
            {
                "box": {
                    "id": "obj-15",
                    "lastchannelcount": 0,
                    "maxclass": "live.gain~",
                    "numinlets": 2,
                    "numoutlets": 5,
                    "outlettype": [ "signal", "signal", "", "float", "list" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 364.0, 723.0, 48.0, 136.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "live.gain~[3]",
                            "parameter_mmax": 6.0,
                            "parameter_mmin": -70.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "live.gain~",
                            "parameter_type": 0,
                            "parameter_unitstyle": 4
                        }
                    },
                    "varname": "live.gain~[3]"
                }
            },
            {
                "box": {
                    "id": "obj-14",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 262.0, 570.0, 29.5, 22.0 ],
                    "text": "1"
                }
            },
            {
                "box": {
                    "clipheight": 163.0,
                    "data": {
                        "clips": [
                            {
                                "absolutepath": "RUWA - Scared to Be Alone.mp3",
                                "filename": "RUWA - Scared to Be Alone.mp3",
                                "filekind": "audiofile",
                                "id": "u268000657",
                                "selection": [ 0.3654485049833887, 0.37209302325581395 ],
                                "loop": 0,
                                "content_state": {                                }
                            }
                        ]
                    },
                    "id": "obj-9",
                    "maxclass": "playlist~",
                    "mode": "basic",
                    "numinlets": 1,
                    "numoutlets": 5,
                    "outlettype": [ "signal", "signal", "signal", "", "dictionary" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 695.0, 723.0, 692.0, 163.0 ],
                    "quality": "basic",
                    "saved_attribute_attributes": {
                        "candicane2": {
                            "expression": ""
                        },
                        "candicane3": {
                            "expression": ""
                        },
                        "candicane4": {
                            "expression": ""
                        },
                        "candicane5": {
                            "expression": ""
                        },
                        "candicane6": {
                            "expression": ""
                        },
                        "candicane7": {
                            "expression": ""
                        },
                        "candicane8": {
                            "expression": ""
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "obj-23",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 522.0, 102.0, 29.5, 22.0 ],
                    "text": "4.2"
                }
            },
            {
                "box": {
                    "id": "obj-17",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 446.0, 129.0, 73.0, 22.0 ],
                    "text": "swing 0.625"
                }
            },
            {
                "box": {
                    "id": "obj-13",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 384.0, 67.0, 60.0, 22.0 ],
                    "text": "loadmess"
                }
            },
            {
                "box": {
                    "data": {
                        "clips": [
                            {
                                "absolutepath": "cym.aiff",
                                "filename": "cym.aiff",
                                "filekind": "audiofile",
                                "id": "u081000532",
                                "selection": [ 0.18947368421052632, 0.23157894736842105 ],
                                "loop": 0,
                                "content_state": {                                }
                            }
                        ]
                    },
                    "id": "obj-12",
                    "maxclass": "playlist~",
                    "mode": "basic",
                    "numinlets": 1,
                    "numoutlets": 5,
                    "outlettype": [ "signal", "signal", "signal", "", "dictionary" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 309.0, 629.0, 150.0, 30.0 ],
                    "quality": "basic",
                    "saved_attribute_attributes": {
                        "candicane2": {
                            "expression": ""
                        },
                        "candicane3": {
                            "expression": ""
                        },
                        "candicane4": {
                            "expression": ""
                        },
                        "candicane5": {
                            "expression": ""
                        },
                        "candicane6": {
                            "expression": ""
                        },
                        "candicane7": {
                            "expression": ""
                        },
                        "candicane8": {
                            "expression": ""
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "obj-62",
                    "lastchannelcount": 0,
                    "maxclass": "live.gain~",
                    "numinlets": 2,
                    "numoutlets": 5,
                    "outlettype": [ "signal", "signal", "", "float", "list" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 440.0, 723.0, 48.0, 136.0 ],
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
                    "id": "obj-61",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 298.0, 540.0, 29.5, 22.0 ],
                    "text": "1"
                }
            },
            {
                "box": {
                    "id": "obj-58",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 128.0, 540.0, 29.5, 22.0 ],
                    "text": "1"
                }
            },
            {
                "box": {
                    "id": "obj-54",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 644.0, 589.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-53",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 608.0, 589.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-52",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 7,
                    "outlettype": [ "int", "int", "int", "int", "int", "int", "int" ],
                    "patching_rect": [ 644.0, 534.0, 89.0, 22.0 ],
                    "text": "unpack i i i i i i i"
                }
            },
            {
                "box": {
                    "id": "obj-51",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 524.0, 493.0, 50.0, 22.0 ],
                    "text": "1"
                }
            },
            {
                "box": {
                    "id": "obj-43",
                    "lastchannelcount": 0,
                    "maxclass": "live.gain~",
                    "numinlets": 2,
                    "numoutlets": 5,
                    "outlettype": [ "signal", "signal", "", "float", "list" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 506.75, 723.0, 48.0, 136.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "live.gain~[1]",
                            "parameter_mmax": 6.0,
                            "parameter_mmin": -70.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "live.gain~",
                            "parameter_type": 0,
                            "parameter_unitstyle": 4
                        }
                    },
                    "varname": "live.gain~[1]"
                }
            },
            {
                "box": {
                    "id": "obj-42",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "int" ],
                    "patching_rect": [ 510.0, 600.0, 32.0, 22.0 ],
                    "text": "t b 1"
                }
            },
            {
                "box": {
                    "data": {
                        "clips": [
                            {
                                "absolutepath": "Clap 01.wav",
                                "filename": "Clap 01.wav",
                                "filekind": "audiofile",
                                "id": "u021002148",
                                "selection": [ 0.03157894736842106, 0.17741228070175427 ],
                                "loop": 0,
                                "content_state": {                                }
                            }
                        ]
                    },
                    "id": "obj-41",
                    "maxclass": "playlist~",
                    "mode": "basic",
                    "numinlets": 1,
                    "numoutlets": 5,
                    "outlettype": [ "signal", "signal", "signal", "", "dictionary" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 510.11556923389435, 666.7629565000534, 150.0, 30.0 ],
                    "quality": "basic",
                    "saved_attribute_attributes": {
                        "candicane2": {
                            "expression": ""
                        },
                        "candicane3": {
                            "expression": ""
                        },
                        "candicane4": {
                            "expression": ""
                        },
                        "candicane5": {
                            "expression": ""
                        },
                        "candicane6": {
                            "expression": ""
                        },
                        "candicane7": {
                            "expression": ""
                        },
                        "candicane8": {
                            "expression": ""
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "obj-39",
                    "lastchannelcount": 0,
                    "maxclass": "live.gain~",
                    "numinlets": 2,
                    "numoutlets": 5,
                    "outlettype": [ "signal", "signal", "", "float", "list" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 131.75, 712.0, 48.0, 136.0 ],
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
                    "id": "obj-38",
                    "maxclass": "ezdac~",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [ 265.0, 889.0, 45.0, 45.0 ]
                }
            },
            {
                "box": {
                    "data": {
                        "clips": [
                            {
                                "absolutepath": "Kick 01.wav",
                                "filename": "Kick 01.wav",
                                "filekind": "audiofile",
                                "id": "u953001929",
                                "selection": [ 0.0, 0.8526315789473684 ],
                                "loop": 0,
                                "content_state": {                                }
                            }
                        ]
                    },
                    "id": "obj-36",
                    "maxclass": "playlist~",
                    "mode": "basic",
                    "numinlets": 1,
                    "numoutlets": 5,
                    "outlettype": [ "signal", "signal", "signal", "", "dictionary" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 128.0, 665.0, 150.0, 30.0 ],
                    "quality": "basic",
                    "saved_attribute_attributes": {
                        "candicane2": {
                            "expression": ""
                        },
                        "candicane3": {
                            "expression": ""
                        },
                        "candicane4": {
                            "expression": ""
                        },
                        "candicane5": {
                            "expression": ""
                        },
                        "candicane6": {
                            "expression": ""
                        },
                        "candicane7": {
                            "expression": ""
                        },
                        "candicane8": {
                            "expression": ""
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "obj-34",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 364.0, 539.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-33",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 331.0, 539.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-31",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 265.0, 539.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-30",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 163.0, 430.0, 25.0, 22.0 ],
                    "text": "iter"
                }
            },
            {
                "box": {
                    "id": "obj-28",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 232.0, 539.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-26",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 197.0, 539.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-22",
                    "maxclass": "newobj",
                    "numinlets": 8,
                    "numoutlets": 8,
                    "outlettype": [ "bang", "bang", "bang", "bang", "bang", "bang", "bang", "" ],
                    "patching_rect": [ 163.0, 471.0, 94.0, 22.0 ],
                    "text": "sel 1 2 3 4 5 6 7"
                }
            },
            {
                "box": {
                    "id": "obj-19",
                    "maxclass": "live.scope~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 813.0, 430.0, 184.0, 68.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-18",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 655.0, 445.0, 50.0, 22.0 ],
                    "text": "10"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-16",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 595.0, 52.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-11",
                    "maxclass": "newobj",
                    "numinlets": 5,
                    "numoutlets": 4,
                    "outlettype": [ "int", "", "", "int" ],
                    "patching_rect": [ 625.0, 402.0, 75.0, 22.0 ],
                    "text": "counter 1 16"
                }
            },
            {
                "box": {
                    "id": "obj-10",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "bang" ],
                    "patching_rect": [ 679.0, 316.0, 42.0, 22.0 ],
                    "text": "edge~"
                }
            },
            {
                "box": {
                    "id": "obj-8",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "int" ],
                    "patching_rect": [ 722.0, 253.0, 41.0, 22.0 ],
                    "text": "what~"
                }
            },
            {
                "box": {
                    "id": "obj-6",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "signal", "signal", "int" ],
                    "patching_rect": [ 759.0, 219.0, 64.0, 22.0 ],
                    "text": "subdiv~ 2."
                }
            },
            {
                "box": {
                    "id": "obj-5",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "signal", "signal", "int" ],
                    "patching_rect": [ 709.0, 151.0, 46.0, 22.0 ],
                    "text": "swing~"
                }
            },
            {
                "box": {
                    "id": "obj-4",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 659.0, 92.0, 66.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 648.0, 64.0, 100.0, 22.0 ],
                    "text": "phasor~ 1."
                }
            },
            {
                "box": {
                    "id": "obj-3",
                    "maxclass": "preset",
                    "numinlets": 1,
                    "numoutlets": 5,
                    "outlettype": [ "preset", "int", "preset", "int", "" ],
                    "patching_rect": [ 189.0, 173.0, 100.0, 40.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 585.0, 178.0, 100.0, 40.0 ],
                    "preset_data": [
                        {
                            "number": 1,
                            "data": [ 5, "obj-1", "live.grid", "mode", 0, 5, "obj-1", "live.grid", "matrixmode", 1, 5, "obj-1", "live.grid", "columns", 16, 5, "obj-1", "live.grid", "rows", 7, 12, "obj-1", "live.grid", "constraint", 1, 1, 1, 1, 1, 1, 1, 1, 12, "obj-1", "live.grid", "constraint", 2, 1, 1, 1, 1, 1, 1, 1, 12, "obj-1", "live.grid", "constraint", 3, 1, 1, 1, 1, 1, 1, 1, 12, "obj-1", "live.grid", "constraint", 4, 1, 1, 1, 1, 1, 1, 1, 12, "obj-1", "live.grid", "constraint", 5, 1, 1, 1, 1, 1, 1, 1, 12, "obj-1", "live.grid", "constraint", 6, 1, 1, 1, 1, 1, 1, 1, 12, "obj-1", "live.grid", "constraint", 7, 1, 1, 1, 1, 1, 1, 1, 12, "obj-1", "live.grid", "constraint", 8, 1, 1, 1, 1, 1, 1, 1, 12, "obj-1", "live.grid", "constraint", 9, 1, 1, 1, 1, 1, 1, 1, 12, "obj-1", "live.grid", "constraint", 10, 1, 1, 1, 1, 1, 1, 1, 12, "obj-1", "live.grid", "constraint", 11, 1, 1, 1, 1, 1, 1, 1, 12, "obj-1", "live.grid", "constraint", 12, 1, 1, 1, 1, 1, 1, 1, 12, "obj-1", "live.grid", "constraint", 13, 1, 1, 1, 1, 1, 1, 1, 12, "obj-1", "live.grid", "constraint", 14, 1, 1, 1, 1, 1, 1, 1, 12, "obj-1", "live.grid", "constraint", 15, 1, 1, 1, 1, 1, 1, 1, 12, "obj-1", "live.grid", "constraint", 16, 1, 1, 1, 1, 1, 1, 1, 4, "obj-1", "live.grid", "clear", 8, "obj-1", "live.grid", "steps", 1, 1, 1, 4, 6, "obj-1", "live.grid", "steps", 3, 5, 6, "obj-1", "live.grid", "steps", 5, 5, 6, "obj-1", "live.grid", "steps", 7, 5, 8, "obj-1", "live.grid", "steps", 9, 1, 9, 6, 6, "obj-1", "live.grid", "steps", 11, 4, 6, "obj-1", "live.grid", "steps", 13, 5, 6, "obj-1", "live.grid", "steps", 15, 5, 20, "obj-1", "live.grid", "directions", 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ]
                        },
                        {
                            "number": 9,
                            "data": [ 5, "obj-1", "live.grid", "mode", 0, 5, "obj-1", "live.grid", "matrixmode", 1, 5, "obj-1", "live.grid", "columns", 16, 5, "obj-1", "live.grid", "rows", 7, 12, "obj-1", "live.grid", "constraint", 1, 1, 1, 1, 1, 1, 1, 1, 12, "obj-1", "live.grid", "constraint", 2, 1, 1, 1, 1, 1, 1, 1, 12, "obj-1", "live.grid", "constraint", 3, 1, 1, 1, 1, 1, 1, 1, 12, "obj-1", "live.grid", "constraint", 4, 1, 1, 1, 1, 1, 1, 1, 12, "obj-1", "live.grid", "constraint", 5, 1, 1, 1, 1, 1, 1, 1, 12, "obj-1", "live.grid", "constraint", 6, 1, 1, 1, 1, 1, 1, 1, 12, "obj-1", "live.grid", "constraint", 7, 1, 1, 1, 1, 1, 1, 1, 12, "obj-1", "live.grid", "constraint", 8, 1, 1, 1, 1, 1, 1, 1, 12, "obj-1", "live.grid", "constraint", 9, 1, 1, 1, 1, 1, 1, 1, 12, "obj-1", "live.grid", "constraint", 10, 1, 1, 1, 1, 1, 1, 1, 12, "obj-1", "live.grid", "constraint", 11, 1, 1, 1, 1, 1, 1, 1, 12, "obj-1", "live.grid", "constraint", 12, 1, 1, 1, 1, 1, 1, 1, 12, "obj-1", "live.grid", "constraint", 13, 1, 1, 1, 1, 1, 1, 1, 12, "obj-1", "live.grid", "constraint", 14, 1, 1, 1, 1, 1, 1, 1, 12, "obj-1", "live.grid", "constraint", 15, 1, 1, 1, 1, 1, 1, 1, 12, "obj-1", "live.grid", "constraint", 16, 1, 1, 1, 1, 1, 1, 1, 4, "obj-1", "live.grid", "clear", 8, "obj-1", "live.grid", "steps", 1, 1, 1, 4, 6, "obj-1", "live.grid", "steps", 3, 5, 6, "obj-1", "live.grid", "steps", 5, 5, 6, "obj-1", "live.grid", "steps", 7, 4, 8, "obj-1", "live.grid", "steps", 9, 1, 9, 6, 6, "obj-1", "live.grid", "steps", 11, 4, 6, "obj-1", "live.grid", "steps", 13, 5, 6, "obj-1", "live.grid", "steps", 15, 5, 20, "obj-1", "live.grid", "directions", 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ]
                        },
                        {
                            "number": 17,
                            "data": [ 5, "obj-1", "live.grid", "mode", 0, 5, "obj-1", "live.grid", "matrixmode", 1, 5, "obj-1", "live.grid", "columns", 16, 5, "obj-1", "live.grid", "rows", 7, 12, "obj-1", "live.grid", "constraint", 1, 1, 1, 1, 1, 1, 1, 1, 12, "obj-1", "live.grid", "constraint", 2, 1, 1, 1, 1, 1, 1, 1, 12, "obj-1", "live.grid", "constraint", 3, 1, 1, 1, 1, 1, 1, 1, 12, "obj-1", "live.grid", "constraint", 4, 1, 1, 1, 1, 1, 1, 1, 12, "obj-1", "live.grid", "constraint", 5, 1, 1, 1, 1, 1, 1, 1, 12, "obj-1", "live.grid", "constraint", 6, 1, 1, 1, 1, 1, 1, 1, 12, "obj-1", "live.grid", "constraint", 7, 1, 1, 1, 1, 1, 1, 1, 12, "obj-1", "live.grid", "constraint", 8, 1, 1, 1, 1, 1, 1, 1, 12, "obj-1", "live.grid", "constraint", 9, 1, 1, 1, 1, 1, 1, 1, 12, "obj-1", "live.grid", "constraint", 10, 1, 1, 1, 1, 1, 1, 1, 12, "obj-1", "live.grid", "constraint", 11, 1, 1, 1, 1, 1, 1, 1, 12, "obj-1", "live.grid", "constraint", 12, 1, 1, 1, 1, 1, 1, 1, 12, "obj-1", "live.grid", "constraint", 13, 1, 1, 1, 1, 1, 1, 1, 12, "obj-1", "live.grid", "constraint", 14, 1, 1, 1, 1, 1, 1, 1, 12, "obj-1", "live.grid", "constraint", 15, 1, 1, 1, 1, 1, 1, 1, 12, "obj-1", "live.grid", "constraint", 16, 1, 1, 1, 1, 1, 1, 1, 4, "obj-1", "live.grid", "clear", 8, "obj-1", "live.grid", "steps", 1, 1, 1, 4, 6, "obj-1", "live.grid", "steps", 3, 5, 6, "obj-1", "live.grid", "steps", 5, 5, 6, "obj-1", "live.grid", "steps", 7, 5, 8, "obj-1", "live.grid", "steps", 9, 1, 9, 6, 6, "obj-1", "live.grid", "steps", 11, 4, 6, "obj-1", "live.grid", "steps", 13, 5, 6, "obj-1", "live.grid", "steps", 15, 5, 20, "obj-1", "live.grid", "directions", 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ]
                        }
                    ]
                }
            },
            {
                "box": {
                    "direction": 0,
                    "id": "obj-1",
                    "matrixmode": 1,
                    "maxclass": "live.grid",
                    "numinlets": 2,
                    "numoutlets": 6,
                    "outlettype": [ "", "", "", "", "", "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 163.0, 253.0, 449.0, 129.0 ],
                    "rounded": 0.0,
                    "rows": 7,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_invisible": 1,
                            "parameter_longname": "live.grid",
                            "parameter_modmode": 0,
                            "parameter_shortname": "live.grid",
                            "parameter_type": 3
                        }
                    },
                    "varname": "live.grid"
                }
            },
            {
                "box": {
                    "attr": "swing",
                    "id": "obj-7",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 741.0, 134.0, 150.0, 22.0 ]
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-30", 0 ],
                    "source": [ "obj-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-51", 1 ],
                    "order": 1,
                    "source": [ "obj-1", 5 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-52", 0 ],
                    "order": 0,
                    "source": [ "obj-1", 5 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-11", 0 ],
                    "source": [ "obj-10", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "midpoints": [ 634.5, 426.0, 150.0, 426.0, 150.0, 232.0, 172.5, 232.0 ],
                    "order": 1,
                    "source": [ "obj-11", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-18", 1 ],
                    "order": 0,
                    "source": [ "obj-11", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-62", 1 ],
                    "order": 0,
                    "source": [ "obj-12", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-62", 0 ],
                    "order": 1,
                    "source": [ "obj-12", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-17", 0 ],
                    "order": 1,
                    "source": [ "obj-13", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-23", 0 ],
                    "order": 0,
                    "source": [ "obj-13", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9", 0 ],
                    "source": [ "obj-14", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-38", 1 ],
                    "source": [ "obj-15", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-38", 0 ],
                    "source": [ "obj-15", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-4", 0 ],
                    "source": [ "obj-16", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 0 ],
                    "source": [ "obj-17", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-14", 0 ],
                    "order": 1,
                    "source": [ "obj-22", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-26", 0 ],
                    "source": [ "obj-22", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-28", 0 ],
                    "source": [ "obj-22", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-31", 0 ],
                    "order": 0,
                    "source": [ "obj-22", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-33", 0 ],
                    "source": [ "obj-22", 5 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-34", 0 ],
                    "source": [ "obj-22", 6 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-58", 0 ],
                    "source": [ "obj-22", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-61", 0 ],
                    "source": [ "obj-22", 4 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-16", 0 ],
                    "source": [ "obj-23", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "midpoints": [ 198.5, 233.0, 172.5, 233.0 ],
                    "source": [ "obj-3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-22", 0 ],
                    "source": [ "obj-30", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-42", 0 ],
                    "source": [ "obj-33", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-39", 1 ],
                    "source": [ "obj-36", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-39", 0 ],
                    "source": [ "obj-36", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-38", 1 ],
                    "source": [ "obj-39", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-38", 0 ],
                    "source": [ "obj-39", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 0 ],
                    "source": [ "obj-4", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-43", 1 ],
                    "source": [ "obj-41", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-43", 0 ],
                    "source": [ "obj-41", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-41", 0 ],
                    "source": [ "obj-42", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-38", 1 ],
                    "source": [ "obj-43", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-38", 0 ],
                    "source": [ "obj-43", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-6", 0 ],
                    "source": [ "obj-5", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-53", 0 ],
                    "source": [ "obj-52", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-54", 0 ],
                    "source": [ "obj-52", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-36", 0 ],
                    "source": [ "obj-58", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-19", 0 ],
                    "order": 0,
                    "source": [ "obj-6", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-8", 0 ],
                    "order": 1,
                    "source": [ "obj-6", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-12", 0 ],
                    "source": [ "obj-61", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-38", 1 ],
                    "source": [ "obj-62", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-38", 0 ],
                    "source": [ "obj-62", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 0 ],
                    "source": [ "obj-7", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-10", 0 ],
                    "source": [ "obj-8", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-15", 1 ],
                    "source": [ "obj-9", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-15", 0 ],
                    "source": [ "obj-9", 0 ]
                }
            }
        ],
        "parameters": {
            "obj-1": [ "live.grid", "live.grid", 0 ],
            "obj-15": [ "live.gain~[3]", "live.gain~", 0 ],
            "obj-39": [ "live.gain~", "live.gain~", 0 ],
            "obj-43": [ "live.gain~[1]", "live.gain~", 0 ],
            "obj-62": [ "live.gain~[2]", "live.gain~", 0 ],
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