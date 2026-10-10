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
        "rect": [ 34.0, 77.0, 1472.0, 921.0 ],
        "boxes": [
            {
                "box": {
                    "id": "obj-14",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 716.0, 196.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "code": "function bang() {\n  const obj = this.patcher.getnamed(\"DRIFTER\");\n  if (!obj) {\n    post(\"no object named 'drift'\\n\");\n    return;\n  }\n  obj.getattrnames().forEach(name => post(`${name} = ${obj.getattr(name)}\\n`));\n}",
                    "filename": "none",
                    "fontface": 0,
                    "fontname": "<Monospaced>",
                    "fontsize": 12.0,
                    "id": "obj-1",
                    "maxclass": "v8.codebox",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 767.0, 7.0, 685.0, 136.0 ],
                    "saved_object_attributes": {
                        "parameter_enable": 0
                    }
                }
            },
            {
                "box": {
                    "id": "obj-54",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 98.0, 903.0, 143.0, 22.0 ],
                    "text": "connect_all_drift_params"
                }
            },
            {
                "box": {
                    "code": "function connect_all_drift_params(){\r\n    var device_name = \"DRIFTER\";\r\n    var device = this.patcher.getnamed(device_name);\r\n\r\n    if (!device){\r\n        post(\"connect_all_drift_params: no object named\", device_name, \"\\n\");\r\n        return;\r\n    }\r\n\r\n    var drift_params = [\r\n        \"osc1enable\", \"osc1filter\", \"osc1gain\", \"osc1octave\", \"osc1shape\",\r\n        \"osc1shapemod\", \"osc1shapemodsrc\", \"osc1type\",\r\n        \"osc2detune\", \"osc2enable\", \"osc2filter\", \"osc2gain\", \"osc2octave\",\r\n        \"osc2shape\", \"osc2shapemod\", \"osc2shapemodsrc\", \"osc2type\",\r\n        \"noiseenable\", \"noisefilter\", \"noisegain\",\r\n        \"lpfreq\", \"lpres\", \"hpfreq\", \"hpres\",\r\n        \"lfoamount\", \"lfofreq\", \"lfomodamount\", \"lfomodsrc\", \"lforetrigger\", \"lfoshape\",\r\n        \"modamt1\", \"modamt2\", \"modamt3\",\r\n        \"moddst1\", \"moddst2\", \"moddst3\",\r\n        \"modsrc1\", \"modsrc2\", \"modsrc3\",\r\n        \"notepitchbend\", \"pitchbendrange\",\r\n        \"voice_mode_index\", \"voice_count_index\",\r\n        \"drift_amount\", \"gain\", \"transpose\", \"volume\",\r\n        \"env1attack\", \"env1decay\", \"env1sustain\", \"env1release\",\r\n        \"env2attack\", \"env2decay\", \"env2sustain\", \"env2release\",\r\n        \"env2tilt\", \"env2hold\", \"env2rate\"\r\n    ];\r\n\r\n    var start_x = 20;\r\n    var start_y = 20;\r\n    var col_step = 80;    // horizontal spacing between dials\r\n    var row_step = 80;    // vertical spacing between rows\r\n    var COLS = 4;\r\n\r\n    for (var i = 0; i < drift_params.length; i++){\r\n        var pname = drift_params[i];\r\n\r\n        var col = i % COLS;\r\n        var row = Math.floor(i / COLS);\r\n        var px = start_x + (col * col_step);\r\n        var py = start_y + (row * row_step);\r\n\r\n        var dial = this.patcher.newdefault(px, py, \"live.dial\");\r\n        dial.varname = device_name + \"_\" + pname;\r\n\r\n        dial.message(\"param_connect\", device_name + \"::\" + pname);\r\n    }\r\n\r\n    post(\"Created\", drift_params.length, \"dials for\", device_name, \"\\n\");\r\n}",
                    "filename": "none",
                    "fontface": 0,
                    "fontname": "<Monospaced>",
                    "fontsize": 12.0,
                    "id": "obj-52",
                    "maxclass": "v8.codebox",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 94.0, 941.0, 340.0, 200.0 ],
                    "saved_object_attributes": {
                        "parameter_enable": 0
                    }
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-67",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 295.0, 684.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-63",
                    "maxclass": "newobj",
                    "numinlets": 5,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "signal" ],
                    "patching_rect": [ 95.0, 684.0, 157.35294117647058, 22.0 ],
                    "text": "abl.device.echo~",
                    "varname": "abl.device.echo~_AA"
                }
            },
            {
                "box": {
                    "id": "obj-60",
                    "maxclass": "newobj",
                    "numinlets": 7,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "signal" ],
                    "patching_rect": [ 95.0, 643.0, 119.0, 22.0 ],
                    "text": "abl.device.autofilter~",
                    "varname": "abl.device.autofilter~_AA"
                }
            },
            {
                "box": {
                    "id": "obj-41",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 83.0, 155.0, 139.0, 22.0 ],
                    "text": "chord 50 60 53 60 57 60"
                }
            },
            {
                "box": {
                    "id": "obj-39",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "bang" ],
                    "patching_rect": [ 328.0, 140.0, 42.0, 22.0 ],
                    "text": "edge~"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-18",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 52.0, 33.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-16",
                    "maxclass": "live.scope~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 391.0, 26.0, 184.0, 68.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-13",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "int" ],
                    "patching_rect": [ 328.0, 105.0, 41.0, 22.0 ],
                    "text": "what~"
                }
            },
            {
                "box": {
                    "id": "obj-12",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "signal", "signal", "int" ],
                    "patching_rect": [ 250.0, 105.0, 60.0, 22.0 ],
                    "text": "subdiv~ 2"
                }
            },
            {
                "box": {
                    "id": "obj-11",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "signal", "signal", "int" ],
                    "patching_rect": [ 159.0, 105.0, 73.0, 22.0 ],
                    "text": "swing~ 0.54"
                }
            },
            {
                "box": {
                    "id": "obj-10",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 88.0, 105.0, 52.0, 22.0 ],
                    "text": "phasor~"
                }
            },
            {
                "box": {
                    "id": "obj-4",
                    "lastchannelcount": 0,
                    "maxclass": "live.gain~",
                    "numinlets": 2,
                    "numoutlets": 5,
                    "orientation": 1,
                    "outlettype": [ "signal", "signal", "", "float", "list" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 47.0, 726.0, 136.0, 47.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ -12 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "live.gain~[5]",
                            "parameter_mmax": 6.0,
                            "parameter_mmin": -70.0,
                            "parameter_modmode": 0,
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
                    "id": "obj-8",
                    "local": 1,
                    "maxclass": "ezdac~",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [ 47.25, 801.0, 48.0, 48.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-9",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "signal" ],
                    "patching_rect": [ 83.0, 541.0, 93.0, 22.0 ],
                    "text": "abl.device.drift~",
                    "varname": "DRIFTER"
                }
            },
            {
                "box": {
                    "id": "obj-6",
                    "maxclass": "newobj",
                    "numinlets": 7,
                    "numoutlets": 2,
                    "outlettype": [ "int", "" ],
                    "patching_rect": [ 83.0, 366.0, 173.0, 22.0 ],
                    "text": "midiformat @hires 1"
                }
            },
            {
                "box": {
                    "id": "obj-43",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 83.0, 322.0, 36.0, 22.0 ],
                    "text": "pack"
                }
            },
            {
                "box": {
                    "id": "obj-5",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 2,
                    "outlettype": [ "float", "float" ],
                    "patching_rect": [ 83.0, 284.0, 108.0, 22.0 ],
                    "text": "makenote 120 530"
                }
            },
            {
                "box": {
                    "id": "obj-7",
                    "maxclass": "kslider",
                    "mode": 2,
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "int", "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 83.0, 209.0, 336.0, 53.0 ],
                    "style": "ksliderWhite"
                }
            },
            {
                "box": {
                    "attr": "mode",
                    "id": "obj-3",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 402.0, 162.0, 150.0, 22.0 ]
                }
            },
            {
                "box": {
                    "attr": "phaseoffset",
                    "id": "obj-15",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 101.0, 63.0, 150.0, 22.0 ]
                }
            },
            {
                "box": {
                    "attr": "drive",
                    "id": "obj-61",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 176.0, 434.0, 150.0, 22.0 ]
                }
            },
            {
                "box": {
                    "attr": "frequency",
                    "id": "obj-62",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 10.0, 589.0, 150.0, 22.0 ]
                }
            },
            {
                "box": {
                    "attr": "mod_freq",
                    "id": "obj-64",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 85.0, 479.0, 150.0, 22.0 ]
                }
            },
            {
                "box": {
                    "attr": "reverb_decay",
                    "id": "obj-68",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 238.0, 479.0, 150.0, 22.0 ]
                }
            },
            {
                "box": {
                    "attr": "reverb",
                    "id": "obj-69",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 391.0, 479.0, 150.0, 22.0 ]
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-56",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "param_connect": "DRIFTER::osc1enable",
                    "parameter_enable": 1,
                    "patching_rect": [ 1381.0, 403.0, 34.0, 52.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "osc1enable",
                            "parameter_modmode": 4,
                            "parameter_shortname": "osc1enable",
                            "parameter_type": 1,
                            "parameter_unitstyle": 0
                        }
                    },
                    "varname": "DRIFTER_osc1enable"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-58",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "param_connect": "DRIFTER::osc1filter",
                    "parameter_enable": 1,
                    "patching_rect": [ 1381.0, 345.0, 34.0, 52.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "osc1filter",
                            "parameter_modmode": 4,
                            "parameter_shortname": "osc1filter",
                            "parameter_type": 1,
                            "parameter_unitstyle": 0
                        }
                    },
                    "varname": "DRIFTER_osc1filter"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-65",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "param_connect": "DRIFTER::osc1gain",
                    "parameter_enable": 1,
                    "patching_rect": [ 1371.0, 463.0, 54.0, 52.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "osc1gain",
                            "parameter_mmax": 6.0,
                            "parameter_mmin": -70.6,
                            "parameter_modmode": 3,
                            "parameter_shortname": "osc1gain",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "DRIFTER_osc1gain"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-70",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "param_connect": "DRIFTER::osc1octave",
                    "parameter_enable": 1,
                    "patching_rect": [ 1381.0, 281.0, 34.0, 52.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "osc1octave",
                            "parameter_mmax": 3.0,
                            "parameter_mmin": -2.0,
                            "parameter_modmode": 4,
                            "parameter_shortname": "osc1octave",
                            "parameter_type": 1,
                            "parameter_unitstyle": 0
                        }
                    },
                    "varname": "DRIFTER_osc1octave"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-72",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "param_connect": "DRIFTER::osc1shape",
                    "parameter_enable": 1,
                    "patching_rect": [ 1360.0, 525.0, 77.0, 52.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "osc1shape",
                            "parameter_mmax": 1.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "osc1shape",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "DRIFTER_osc1shape"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-74",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "param_connect": "DRIFTER::osc1shapemod",
                    "parameter_enable": 1,
                    "patching_rect": [ 1362.0, 589.0, 71.5, 52.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "osc1shapemod",
                            "parameter_mmax": 1.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "osc1shapemod",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "DRIFTER_osc1shapemod"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-76",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "param_connect": "DRIFTER::osc1shapemodsrc",
                    "parameter_enable": 1,
                    "patching_rect": [ 1318.0, 669.0, 97.0, 52.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "Env 1", "Env 2 / Cyc", "LFO", "Key", "Velocity", "Modwheel", "Pressure", "Slide" ],
                            "parameter_longname": "osc1shapemodsrc",
                            "parameter_mmax": 7.0,
                            "parameter_modmode": 4,
                            "parameter_shortname": "osc1shapemodsrc",
                            "parameter_type": 1,
                            "parameter_unitstyle": 9
                        }
                    },
                    "varname": "DRIFTER_osc1shapemodsrc"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-78",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "param_connect": "DRIFTER::osc1type",
                    "parameter_enable": 1,
                    "patching_rect": [ 1381.0, 211.0, 34.0, 52.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "Saw", "Shark tooth", "Triangle", "Rectangle", "Pulse", "Quadratic sine", "Saturated" ],
                            "parameter_longname": "osc1type",
                            "parameter_mmax": 6.0,
                            "parameter_modmode": 4,
                            "parameter_shortname": "osc1type",
                            "parameter_type": 1,
                            "parameter_unitstyle": 9
                        }
                    },
                    "varname": "DRIFTER_osc1type"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-80",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "param_connect": "DRIFTER::osc2detune",
                    "parameter_enable": 1,
                    "patching_rect": [ 1439.0, 714.0, 62.0, 52.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "osc2detune",
                            "parameter_mmax": 7.0,
                            "parameter_mmin": -7.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "osc2detune",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "DRIFTER_osc2detune"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-82",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "param_connect": "DRIFTER::osc2enable",
                    "parameter_enable": 1,
                    "patching_rect": [ 1453.0, 403.0, 34.0, 52.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "osc2enable",
                            "parameter_modmode": 4,
                            "parameter_shortname": "osc2enable",
                            "parameter_type": 1,
                            "parameter_unitstyle": 0
                        }
                    },
                    "varname": "DRIFTER_osc2enable"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-84",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "param_connect": "DRIFTER::osc2filter",
                    "parameter_enable": 1,
                    "patching_rect": [ 1451.0, 345.0, 37.0, 52.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "osc2filter",
                            "parameter_modmode": 4,
                            "parameter_shortname": "osc2filter",
                            "parameter_type": 1,
                            "parameter_unitstyle": 0
                        }
                    },
                    "varname": "DRIFTER_osc2filter"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-86",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "param_connect": "DRIFTER::osc2gain",
                    "parameter_enable": 1,
                    "patching_rect": [ 1452.0, 463.0, 36.0, 52.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "osc2gain",
                            "parameter_mmax": 6.0,
                            "parameter_mmin": -70.6,
                            "parameter_modmode": 3,
                            "parameter_shortname": "osc2gain",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "DRIFTER_osc2gain"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-88",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "param_connect": "DRIFTER::osc2octave",
                    "parameter_enable": 1,
                    "patching_rect": [ 1428.0, 281.0, 83.0, 52.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "osc2octave",
                            "parameter_mmax": 3.0,
                            "parameter_mmin": -2.0,
                            "parameter_modmode": 4,
                            "parameter_shortname": "osc2octave",
                            "parameter_type": 1,
                            "parameter_unitstyle": 0
                        }
                    },
                    "varname": "DRIFTER_osc2octave"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-90",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "param_connect": "DRIFTER::osc2shape",
                    "parameter_enable": 1,
                    "patching_rect": [ 1428.0, 525.0, 84.0, 52.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "osc2shape",
                            "parameter_modmode": 3,
                            "parameter_shortname": "osc2shape",
                            "parameter_type": 0,
                            "parameter_unitstyle": 0
                        }
                    },
                    "varname": "DRIFTER_osc2shape"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-92",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "param_connect": "DRIFTER::osc2shapemod",
                    "parameter_enable": 1,
                    "patching_rect": [ 1428.0, 589.0, 84.0, 52.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "osc2shapemod",
                            "parameter_modmode": 3,
                            "parameter_shortname": "osc2shapemod",
                            "parameter_type": 0,
                            "parameter_unitstyle": 0
                        }
                    },
                    "varname": "DRIFTER_osc2shapemod"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-94",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "param_connect": "DRIFTER::osc2shapemodsrc",
                    "parameter_enable": 1,
                    "patching_rect": [ 1428.0, 651.0, 84.0, 52.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "osc2shapemodsrc",
                            "parameter_modmode": 3,
                            "parameter_shortname": "osc2shapemodsrc",
                            "parameter_type": 0,
                            "parameter_unitstyle": 0
                        }
                    },
                    "varname": "DRIFTER_osc2shapemodsrc"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-96",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "param_connect": "DRIFTER::osc2type",
                    "parameter_enable": 1,
                    "patching_rect": [ 1428.0, 211.0, 84.0, 52.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "Saw", "Shark tooth", "Triangle", "Rectangle", "Pulse", "Quadratic sine", "Saturated" ],
                            "parameter_longname": "osc2type",
                            "parameter_mmax": 6.0,
                            "parameter_modmode": 4,
                            "parameter_shortname": "osc2type",
                            "parameter_type": 1,
                            "parameter_unitstyle": 9
                        }
                    },
                    "varname": "DRIFTER_osc2type"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-98",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "param_connect": "DRIFTER::noiseenable",
                    "parameter_enable": 1,
                    "patching_rect": [ 1541.0, 211.0, 84.0, 52.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "noiseenable",
                            "parameter_modmode": 4,
                            "parameter_shortname": "noiseenable",
                            "parameter_type": 1,
                            "parameter_unitstyle": 0
                        }
                    },
                    "varname": "DRIFTER_noiseenable"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-100",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "param_connect": "DRIFTER::noisefilter",
                    "parameter_enable": 1,
                    "patching_rect": [ 1541.0, 332.0, 84.0, 52.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "noisefilter",
                            "parameter_modmode": 4,
                            "parameter_shortname": "noisefilter",
                            "parameter_type": 1,
                            "parameter_unitstyle": 0
                        }
                    },
                    "varname": "DRIFTER_noisefilter"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-102",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "param_connect": "DRIFTER::noisegain",
                    "parameter_enable": 1,
                    "patching_rect": [ 1540.0, 269.0, 86.0, 52.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "noisegain",
                            "parameter_mmax": 6.0,
                            "parameter_mmin": -70.6,
                            "parameter_modmode": 3,
                            "parameter_shortname": "noisegain",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "DRIFTER_noisegain"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-104",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "param_connect": "DRIFTER::lpfreq",
                    "parameter_enable": 1,
                    "patching_rect": [ 1539.0, 393.0, 88.0, 52.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "lpfreq",
                            "parameter_mmax": 20000.0,
                            "parameter_mmin": 20.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "lpfreq",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "DRIFTER_lpfreq"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-106",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "param_connect": "DRIFTER::lpres",
                    "parameter_enable": 1,
                    "patching_rect": [ 1540.0, 463.0, 87.0, 52.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "lpres",
                            "parameter_mmax": 1.1,
                            "parameter_modmode": 3,
                            "parameter_shortname": "lpres",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "DRIFTER_lpres"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-108",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "param_connect": "DRIFTER::hpfreq",
                    "parameter_enable": 1,
                    "patching_rect": [ 1537.0, 538.0, 88.0, 52.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "hpfreq",
                            "parameter_mmax": 20500.0,
                            "parameter_mmin": 10.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "hpfreq",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "DRIFTER_hpfreq"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-110",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "param_connect": "DRIFTER::hpres",
                    "parameter_enable": 1,
                    "patching_rect": [ 1539.0, 589.0, 84.0, 52.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "hpres",
                            "parameter_modmode": 3,
                            "parameter_shortname": "hpres",
                            "parameter_type": 0,
                            "parameter_unitstyle": 0
                        }
                    },
                    "varname": "DRIFTER_hpres"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-112",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "param_connect": "DRIFTER::lfoamount",
                    "parameter_enable": 1,
                    "patching_rect": [ 1645.0, 521.0, 87.0, 52.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "lfoamount",
                            "parameter_mmax": 1.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "lfoamount",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "DRIFTER_lfoamount"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-114",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "param_connect": "DRIFTER::lfofreq",
                    "parameter_enable": 1,
                    "patching_rect": [ 1645.0, 328.0, 87.0, 52.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "lfofreq",
                            "parameter_mmax": 1700.0,
                            "parameter_mmin": 0.17,
                            "parameter_modmode": 3,
                            "parameter_shortname": "lfofreq",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "DRIFTER_lfofreq"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-116",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "param_connect": "DRIFTER::lfomodamount",
                    "parameter_enable": 1,
                    "patching_rect": [ 1645.0, 393.0, 87.0, 52.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "lfomodamount",
                            "parameter_mmax": 1.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "lfomodamount",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "DRIFTER_lfomodamount"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-118",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "param_connect": "DRIFTER::lfomodsrc",
                    "parameter_enable": 1,
                    "patching_rect": [ 1646.0, 457.0, 84.0, 52.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "Env 1", "Env 2 / Cyc", "LFO", "Key", "Velocity", "Modwheel", "Pressure", "Slide" ],
                            "parameter_longname": "lfomodsrc",
                            "parameter_mmax": 7.0,
                            "parameter_modmode": 4,
                            "parameter_shortname": "lfomodsrc",
                            "parameter_type": 1,
                            "parameter_unitstyle": 9
                        }
                    },
                    "varname": "DRIFTER_lfomodsrc"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-120",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "param_connect": "DRIFTER::lforetrigger",
                    "parameter_enable": 1,
                    "patching_rect": [ 1646.0, 211.0, 84.0, 52.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "lforetrigger",
                            "parameter_modmode": 4,
                            "parameter_shortname": "lforetrigger",
                            "parameter_type": 1,
                            "parameter_unitstyle": 0
                        }
                    },
                    "varname": "DRIFTER_lforetrigger"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-122",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "param_connect": "DRIFTER::lfoshape",
                    "parameter_enable": 1,
                    "patching_rect": [ 1646.0, 269.0, 84.0, 52.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "Sine", "Triangle", "Saw Up", "Saw Down", "Square", "Sample & hold", "Wander", "Linear env", "Exponential env" ],
                            "parameter_longname": "lfoshape",
                            "parameter_mmax": 8.0,
                            "parameter_modmode": 4,
                            "parameter_shortname": "lfoshape",
                            "parameter_type": 1,
                            "parameter_unitstyle": 9
                        }
                    },
                    "varname": "DRIFTER_lfoshape"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-124",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "param_connect": "DRIFTER::modamt1",
                    "parameter_enable": 1,
                    "patching_rect": [ 847.0, 332.0, 27.0, 52.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "modamt1",
                            "parameter_mmax": 1.0,
                            "parameter_mmin": -1.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "modamt1",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "DRIFTER_modamt1"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-126",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "param_connect": "DRIFTER::modamt2",
                    "parameter_enable": 1,
                    "patching_rect": [ 905.0, 332.0, 27.0, 52.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "modamt2",
                            "parameter_mmax": 1.0,
                            "parameter_mmin": -1.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "modamt2",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "DRIFTER_modamt2"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-128",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "param_connect": "DRIFTER::modamt3",
                    "parameter_enable": 1,
                    "patching_rect": [ 935.0, 332.0, 87.0, 52.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "modamt3",
                            "parameter_mmax": 1.0,
                            "parameter_mmin": -1.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "modamt3",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "DRIFTER_modamt3"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-130",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "param_connect": "DRIFTER::moddst1",
                    "parameter_enable": 1,
                    "patching_rect": [ 858.0, 268.0, 27.0, 52.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "None", "Osc 1 Gain", "Osc 1 Shape", "Osc 2 Gain", "Osc 2 Detune", "Noise Gain", "LP Frequency", "LP Resonance", "HP Frequency", "LFO Rate", "Cyc Env Rate", "Main Volume" ],
                            "parameter_longname": "moddst1",
                            "parameter_mmax": 11.0,
                            "parameter_modmode": 4,
                            "parameter_shortname": "moddst1",
                            "parameter_type": 1,
                            "parameter_unitstyle": 9
                        }
                    },
                    "varname": "DRIFTER_moddst1"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-132",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "param_connect": "DRIFTER::moddst2",
                    "parameter_enable": 1,
                    "patching_rect": [ 909.0, 268.0, 27.0, 52.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "None", "Osc 1 Gain", "Osc 1 Shape", "Osc 2 Gain", "Osc 2 Detune", "Noise Gain", "LP Frequency", "LP Resonance", "HP Frequency", "LFO Rate", "Cyc Env Rate", "Main Volume" ],
                            "parameter_longname": "moddst2",
                            "parameter_mmax": 11.0,
                            "parameter_modmode": 4,
                            "parameter_shortname": "moddst2",
                            "parameter_type": 1,
                            "parameter_unitstyle": 9
                        }
                    },
                    "varname": "DRIFTER_moddst2"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-134",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "param_connect": "DRIFTER::moddst3",
                    "parameter_enable": 1,
                    "patching_rect": [ 936.0, 268.0, 84.0, 52.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "None", "Osc 1 Gain", "Osc 1 Shape", "Osc 2 Gain", "Osc 2 Detune", "Noise Gain", "LP Frequency", "LP Resonance", "HP Frequency", "LFO Rate", "Cyc Env Rate", "Main Volume" ],
                            "parameter_longname": "moddst3",
                            "parameter_mmax": 11.0,
                            "parameter_modmode": 4,
                            "parameter_shortname": "moddst3",
                            "parameter_type": 1,
                            "parameter_unitstyle": 9
                        }
                    },
                    "varname": "DRIFTER_moddst3"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-136",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "param_connect": "DRIFTER::modsrc1",
                    "parameter_enable": 1,
                    "patching_rect": [ 855.0, 393.0, 27.0, 52.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "Env 1", "Env 2 / Cyc", "LFO", "Key", "Velocity", "Modwheel", "Pressure", "Slide" ],
                            "parameter_longname": "modsrc1",
                            "parameter_mmax": 7.0,
                            "parameter_modmode": 4,
                            "parameter_shortname": "modsrc1",
                            "parameter_type": 1,
                            "parameter_unitstyle": 9
                        }
                    },
                    "varname": "DRIFTER_modsrc1"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-138",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "param_connect": "DRIFTER::modsrc2",
                    "parameter_enable": 1,
                    "patching_rect": [ 905.0, 393.0, 27.0, 52.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "Env 1", "Env 2 / Cyc", "LFO", "Key", "Velocity", "Modwheel", "Pressure", "Slide" ],
                            "parameter_longname": "modsrc2",
                            "parameter_mmax": 7.0,
                            "parameter_modmode": 4,
                            "parameter_shortname": "modsrc2",
                            "parameter_type": 1,
                            "parameter_unitstyle": 9
                        }
                    },
                    "varname": "DRIFTER_modsrc2"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-140",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "param_connect": "DRIFTER::modsrc3",
                    "parameter_enable": 1,
                    "patching_rect": [ 936.0, 397.0, 84.0, 52.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "Env 1", "Env 2 / Cyc", "LFO", "Key", "Velocity", "Modwheel", "Pressure", "Slide" ],
                            "parameter_longname": "modsrc3",
                            "parameter_mmax": 7.0,
                            "parameter_modmode": 4,
                            "parameter_shortname": "modsrc3",
                            "parameter_type": 1,
                            "parameter_unitstyle": 9
                        }
                    },
                    "varname": "DRIFTER_modsrc3"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-142",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "param_connect": "DRIFTER::notepitchbend",
                    "parameter_enable": 1,
                    "patching_rect": [ 812.0, 461.0, 84.0, 52.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "notepitchbend",
                            "parameter_modmode": 4,
                            "parameter_shortname": "notepitchbend",
                            "parameter_type": 1,
                            "parameter_unitstyle": 0
                        }
                    },
                    "varname": "DRIFTER_notepitchbend"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-144",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "param_connect": "DRIFTER::pitchbendrange",
                    "parameter_enable": 1,
                    "patching_rect": [ 935.0, 461.0, 87.0, 52.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "pitchbendrange",
                            "parameter_mmax": 12.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "pitchbendrange",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "DRIFTER_pitchbendrange"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-146",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "param_connect": "DRIFTER::voice_mode_index",
                    "parameter_enable": 1,
                    "patching_rect": [ 1070.0, 268.0, 82.0, 52.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "voice_mode_index",
                            "parameter_modmode": 3,
                            "parameter_shortname": "voice_mode_index",
                            "parameter_type": 0,
                            "parameter_unitstyle": 0
                        }
                    },
                    "varname": "DRIFTER_voice_mode_index"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-148",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "param_connect": "DRIFTER::voice_count_index",
                    "parameter_enable": 1,
                    "patching_rect": [ 1070.0, 211.0, 82.0, 52.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "voice_count_index",
                            "parameter_modmode": 3,
                            "parameter_shortname": "voice_count_index",
                            "parameter_type": 0,
                            "parameter_unitstyle": 0
                        }
                    },
                    "varname": "DRIFTER_voice_count_index"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-150",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "param_connect": "DRIFTER::drift_amount",
                    "parameter_enable": 1,
                    "patching_rect": [ 937.0, 211.0, 82.0, 52.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "drift_amount",
                            "parameter_modmode": 3,
                            "parameter_shortname": "drift_amount",
                            "parameter_type": 0,
                            "parameter_unitstyle": 0
                        }
                    },
                    "varname": "DRIFTER_drift_amount"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-152",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "param_connect": "DRIFTER::gain",
                    "parameter_enable": 1,
                    "patching_rect": [ 759.0, 211.0, 87.0, 52.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "gain",
                            "parameter_mmax": 0.0,
                            "parameter_mmin": -70.6,
                            "parameter_modmode": 3,
                            "parameter_shortname": "gain",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "DRIFTER_gain"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-154",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "param_connect": "DRIFTER::transpose",
                    "parameter_enable": 1,
                    "patching_rect": [ 1068.0, 332.0, 87.0, 52.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "transpose",
                            "parameter_mmax": 48.0,
                            "parameter_mmin": -48.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "transpose",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "DRIFTER_transpose"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-156",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "param_connect": "DRIFTER::volume",
                    "parameter_enable": 1,
                    "patching_rect": [ 814.0, 211.0, 82.0, 52.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "volume",
                            "parameter_modmode": 3,
                            "parameter_shortname": "volume",
                            "parameter_type": 0,
                            "parameter_unitstyle": 0
                        }
                    },
                    "varname": "DRIFTER_volume"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-158",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "param_connect": "DRIFTER::env1attack",
                    "parameter_enable": 1,
                    "patching_rect": [ 1171.0, 211.0, 87.0, 52.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "env1attack",
                            "parameter_mmax": 60.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "env1attack",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "DRIFTER_env1attack"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-160",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "param_connect": "DRIFTER::env1decay",
                    "parameter_enable": 1,
                    "patching_rect": [ 1171.0, 275.0, 87.0, 52.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "env1decay",
                            "parameter_mmax": 60.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "env1decay",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "DRIFTER_env1decay"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-162",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "param_connect": "DRIFTER::env1sustain",
                    "parameter_enable": 1,
                    "patching_rect": [ 1171.0, 340.0, 87.0, 52.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "env1sustain",
                            "parameter_mmax": 1.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "env1sustain",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "DRIFTER_env1sustain"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-164",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "param_connect": "DRIFTER::env1release",
                    "parameter_enable": 1,
                    "patching_rect": [ 1171.0, 408.0, 87.0, 52.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "env1release",
                            "parameter_mmax": 60.0,
                            "parameter_mmin": 0.01,
                            "parameter_modmode": 3,
                            "parameter_shortname": "env1release",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "DRIFTER_env1release"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-166",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "param_connect": "DRIFTER::env2attack",
                    "parameter_enable": 1,
                    "patching_rect": [ 1243.0, 211.0, 87.0, 52.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "env2attack",
                            "parameter_mmax": 60.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "env2attack",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "DRIFTER_env2attack"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-168",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "param_connect": "DRIFTER::env2decay",
                    "parameter_enable": 1,
                    "patching_rect": [ 1243.0, 275.0, 88.0, 52.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "env2decay",
                            "parameter_mmax": 60.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "env2decay",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "DRIFTER_env2decay"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-170",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "param_connect": "DRIFTER::env2sustain",
                    "parameter_enable": 1,
                    "patching_rect": [ 1243.0, 340.0, 87.0, 52.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "env2sustain",
                            "parameter_mmax": 1.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "env2sustain",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "DRIFTER_env2sustain"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-172",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "param_connect": "DRIFTER::env2release",
                    "parameter_enable": 1,
                    "patching_rect": [ 1243.0, 408.0, 87.0, 52.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "env2release",
                            "parameter_mmax": 60.0,
                            "parameter_mmin": 0.01,
                            "parameter_modmode": 3,
                            "parameter_shortname": "env2release",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "DRIFTER_env2release"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-174",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "param_connect": "DRIFTER::env2tilt",
                    "parameter_enable": 1,
                    "patching_rect": [ 1243.0, 461.0, 87.0, 52.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "env2tilt",
                            "parameter_mmax": 1.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "env2tilt",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "DRIFTER_env2tilt"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-176",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "param_connect": "DRIFTER::env2hold",
                    "parameter_enable": 1,
                    "patching_rect": [ 1171.0, 461.0, 87.0, 52.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "env2hold",
                            "parameter_mmax": 1.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "env2hold",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "varname": "DRIFTER_env2hold"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-178",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "param_connect": "DRIFTER::env2rate",
                    "parameter_enable": 1,
                    "patching_rect": [ 1246.0, 521.0, 82.0, 52.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "env2rate",
                            "parameter_modmode": 3,
                            "parameter_shortname": "env2rate",
                            "parameter_type": 0,
                            "parameter_unitstyle": 0
                        }
                    },
                    "varname": "DRIFTER_env2rate"
                }
            },
            {
                "box": {
                    "attr": "lfoamount",
                    "id": "obj-179",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 295.0, 613.0, 150.0, 22.0 ]
                }
            },
            {
                "box": {
                    "attr": "reverb_decay",
                    "id": "obj-180",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 217.0, 654.0, 150.0, 22.0 ]
                }
            },
            {
                "box": {
                    "attr": "reverb",
                    "id": "obj-181",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 370.0, 654.0, 150.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-51",
                    "maxclass": "panel",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 773.0, 148.0, 999.0, 646.0 ],
                    "rounded": 12
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-11", 0 ],
                    "source": [ "obj-10", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-12", 0 ],
                    "source": [ "obj-11", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-13", 0 ],
                    "source": [ "obj-12", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-16", 0 ],
                    "order": 0,
                    "source": [ "obj-13", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-39", 0 ],
                    "order": 1,
                    "source": [ "obj-13", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "source": [ "obj-14", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-10", 0 ],
                    "source": [ "obj-15", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-60", 0 ],
                    "source": [ "obj-179", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-10", 0 ],
                    "source": [ "obj-18", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-63", 0 ],
                    "source": [ "obj-180", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-63", 0 ],
                    "source": [ "obj-181", 0 ]
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
                    "destination": [ "obj-41", 0 ],
                    "source": [ "obj-39", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-8", 1 ],
                    "source": [ "obj-4", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-8", 0 ],
                    "source": [ "obj-4", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-7", 0 ],
                    "source": [ "obj-41", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-6", 0 ],
                    "source": [ "obj-43", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-43", 1 ],
                    "source": [ "obj-5", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-43", 0 ],
                    "source": [ "obj-5", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-52", 0 ],
                    "source": [ "obj-54", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9", 0 ],
                    "source": [ "obj-6", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-63", 1 ],
                    "source": [ "obj-60", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-63", 0 ],
                    "source": [ "obj-60", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-60", 0 ],
                    "source": [ "obj-61", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-60", 0 ],
                    "source": [ "obj-62", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-4", 1 ],
                    "source": [ "obj-63", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-4", 0 ],
                    "source": [ "obj-63", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-63", 0 ],
                    "source": [ "obj-64", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-63", 2 ],
                    "source": [ "obj-67", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-63", 0 ],
                    "source": [ "obj-68", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-63", 0 ],
                    "source": [ "obj-69", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 1 ],
                    "source": [ "obj-7", 1 ]
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
                    "destination": [ "obj-60", 1 ],
                    "source": [ "obj-9", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-60", 0 ],
                    "source": [ "obj-9", 0 ]
                }
            }
        ],
        "parameters": {
            "obj-100": [ "noisefilter", "noisefilter", 0 ],
            "obj-102": [ "noisegain", "noisegain", 0 ],
            "obj-104": [ "lpfreq", "lpfreq", 0 ],
            "obj-106": [ "lpres", "lpres", 0 ],
            "obj-108": [ "hpfreq", "hpfreq", 0 ],
            "obj-110": [ "hpres", "hpres", 0 ],
            "obj-112": [ "lfoamount", "lfoamount", 0 ],
            "obj-114": [ "lfofreq", "lfofreq", 0 ],
            "obj-116": [ "lfomodamount", "lfomodamount", 0 ],
            "obj-118": [ "lfomodsrc", "lfomodsrc", 0 ],
            "obj-120": [ "lforetrigger", "lforetrigger", 0 ],
            "obj-122": [ "lfoshape", "lfoshape", 0 ],
            "obj-124": [ "modamt1", "modamt1", 0 ],
            "obj-126": [ "modamt2", "modamt2", 0 ],
            "obj-128": [ "modamt3", "modamt3", 0 ],
            "obj-130": [ "moddst1", "moddst1", 0 ],
            "obj-132": [ "moddst2", "moddst2", 0 ],
            "obj-134": [ "moddst3", "moddst3", 0 ],
            "obj-136": [ "modsrc1", "modsrc1", 0 ],
            "obj-138": [ "modsrc2", "modsrc2", 0 ],
            "obj-140": [ "modsrc3", "modsrc3", 0 ],
            "obj-142": [ "notepitchbend", "notepitchbend", 0 ],
            "obj-144": [ "pitchbendrange", "pitchbendrange", 0 ],
            "obj-146": [ "voice_mode_index", "voice_mode_index", 0 ],
            "obj-148": [ "voice_count_index", "voice_count_index", 0 ],
            "obj-150": [ "drift_amount", "drift_amount", 0 ],
            "obj-152": [ "gain", "gain", 0 ],
            "obj-154": [ "transpose", "transpose", 0 ],
            "obj-156": [ "volume", "volume", 0 ],
            "obj-158": [ "env1attack", "env1attack", 0 ],
            "obj-160": [ "env1decay", "env1decay", 0 ],
            "obj-162": [ "env1sustain", "env1sustain", 0 ],
            "obj-164": [ "env1release", "env1release", 0 ],
            "obj-166": [ "env2attack", "env2attack", 0 ],
            "obj-168": [ "env2decay", "env2decay", 0 ],
            "obj-170": [ "env2sustain", "env2sustain", 0 ],
            "obj-172": [ "env2release", "env2release", 0 ],
            "obj-174": [ "env2tilt", "env2tilt", 0 ],
            "obj-176": [ "env2hold", "env2hold", 0 ],
            "obj-178": [ "env2rate", "env2rate", 0 ],
            "obj-4": [ "live.gain~[5]", "live.gain~", 0 ],
            "obj-56": [ "osc1enable", "osc1enable", 0 ],
            "obj-58": [ "osc1filter", "osc1filter", 0 ],
            "obj-65": [ "osc1gain", "osc1gain", 0 ],
            "obj-70": [ "osc1octave", "osc1octave", 0 ],
            "obj-72": [ "osc1shape", "osc1shape", 0 ],
            "obj-74": [ "osc1shapemod", "osc1shapemod", 0 ],
            "obj-76": [ "osc1shapemodsrc", "osc1shapemodsrc", 0 ],
            "obj-78": [ "osc1type", "osc1type", 0 ],
            "obj-80": [ "osc2detune", "osc2detune", 0 ],
            "obj-82": [ "osc2enable", "osc2enable", 0 ],
            "obj-84": [ "osc2filter", "osc2filter", 0 ],
            "obj-86": [ "osc2gain", "osc2gain", 0 ],
            "obj-88": [ "osc2octave", "osc2octave", 0 ],
            "obj-90": [ "osc2shape", "osc2shape", 0 ],
            "obj-92": [ "osc2shapemod", "osc2shapemod", 0 ],
            "obj-94": [ "osc2shapemodsrc", "osc2shapemodsrc", 0 ],
            "obj-96": [ "osc2type", "osc2type", 0 ],
            "obj-98": [ "noiseenable", "noiseenable", 0 ],
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
        "autosave": 0,
        "snapshot": {
            "filetype": "C74Snapshot",
            "version": 2,
            "minorversion": 0,
            "name": "snapshotlist",
            "origin": "jpatcher",
            "type": "list",
            "subtype": "Undefined",
            "embed": 1,
            "snapshot": {
                "valuedictionary": {
                    "parameter_values": {
                        "live.gain~[5]": -12.0
                    }
                }
            },
            "snapshotlist": {
                "current_snapshot": 1,
                "entries": [
                    {
                        "filetype": "C74Snapshot",
                        "version": 2,
                        "minorversion": 0,
                        "name": "Progress One",
                        "origin": "Untitled2",
                        "type": "patcher",
                        "subtype": "Undefined",
                        "embed": 1,
                        "snapshot": {
                            "valuedictionary": {
                                "parameter_values": {
                                    "live.gain~[5]": -12.0
                                }
                            }
                        },
                        "fileref": {
                            "name": "Untitled2",
                            "filename": "Untitled2.maxsnap",
                            "filepath": "~/Documents/Max 9/Snapshots",
                            "filepos": -1,
                            "snapshotfileid": "5a6eeb66813b60b273d0d8d64e279bc6"
                        }
                    },
                    {
                        "filetype": "C74Snapshot",
                        "version": 2,
                        "minorversion": 0,
                        "name": "Progress two",
                        "origin": "Untitled2",
                        "type": "patcher",
                        "subtype": "Undefined",
                        "embed": 1,
                        "snapshot": {
                            "valuedictionary": {
                                "parameter_values": {
                                    "live.gain~[5]": -12.0
                                }
                            }
                        },
                        "fileref": {
                            "name": "Progress One[1]",
                            "filename": "Progress One[1].maxsnap",
                            "filepath": "~/Documents/Max 9/Snapshots",
                            "filepos": -1,
                            "snapshotfileid": "a60f5e525b94c06af0a8175588b8405a"
                        }
                    }
                ]
            }
        }
    }
}