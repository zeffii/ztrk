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
        "rect": [ 281.0, 213.0, 1920.0, 1158.0 ],
        "boxes": [
            {
                "box": {
                    "bgmode": 0,
                    "border": 0,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "obj-8",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "bpatcher_TimeInfo.maxpat",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "" ],
                    "patching_rect": [ 23.89156711101532, 90.0, 500.0000184774399, 42.168676257133484 ],
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "bgmode": 0,
                    "border": 0,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "obj-5",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "bpatch_BuzzerViz.maxpat",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "offset": [ 0.0, 0.0 ],
                    "patching_rect": [ 1.0, 773.0, 697.5887804627419, 235.0 ],
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "id": "obj-71",
                    "lastchannelcount": 0,
                    "maxclass": "live.gain~",
                    "numinlets": 2,
                    "numoutlets": 5,
                    "outlettype": [ "signal", "signal", "", "float", "list" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 2081.9277877807617, 643.3735177516937, 48.0, 136.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "live.gain~[6]",
                            "parameter_mmax": 6.0,
                            "parameter_mmin": -70.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "live.gain~",
                            "parameter_type": 0,
                            "parameter_unitstyle": 4
                        }
                    },
                    "varname": "live.gain~[6]"
                }
            },
            {
                "box": {
                    "id": "obj-72",
                    "maxclass": "ezdac~",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [ 2092.771161675453, 822.8915966749191, 36.0, 36.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-70",
                    "maxclass": "newobj",
                    "numinlets": 0,
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
                        "rect": [ 1372.0, 176.0, 1029.0, 1064.0 ],
                        "boxes": [
                            {
                                "box": {
                                    "id": "obj-93",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 180.0, 78.0, 78.0, 22.0 ],
                                    "text": "r~ trig_signal"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-88",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 5,
                                    "outlettype": [ "signal", "signal", "signal", "signal", "signal" ],
                                    "patching_rect": [ 55.0, 195.0, 146.0, 22.0 ],
                                    "text": "gen~ SamplerOneReader"
                                }
                            },
                            {
                                "box": {
                                    "bubble": 1,
                                    "bubbleside": 2,
                                    "id": "obj-87",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 769.0, 45.0, 206.0, 39.0 ],
                                    "text": " drop samples onto these boxes"
                                }
                            },
                            {
                                "box": {
                                    "buffername": "sample10",
                                    "id": "obj-83",
                                    "maxclass": "waveform~",
                                    "numinlets": 5,
                                    "numoutlets": 6,
                                    "outlettype": [ "float", "float", "float", "float", "list", "" ],
                                    "patching_rect": [ 520.0, 871.0, 256.0, 64.0 ]
                                }
                            },
                            {
                                "box": {
                                    "buffername": "sample9",
                                    "id": "obj-82",
                                    "maxclass": "waveform~",
                                    "numinlets": 5,
                                    "numoutlets": 6,
                                    "outlettype": [ "float", "float", "float", "float", "list", "" ],
                                    "patching_rect": [ 520.0, 789.0, 256.0, 64.0 ]
                                }
                            },
                            {
                                "box": {
                                    "buffername": "sample8",
                                    "id": "obj-81",
                                    "maxclass": "waveform~",
                                    "numinlets": 5,
                                    "numoutlets": 6,
                                    "outlettype": [ "float", "float", "float", "float", "list", "" ],
                                    "patching_rect": [ 520.0, 709.0, 256.0, 64.0 ]
                                }
                            },
                            {
                                "box": {
                                    "buffername": "sample7",
                                    "id": "obj-80",
                                    "maxclass": "waveform~",
                                    "numinlets": 5,
                                    "numoutlets": 6,
                                    "outlettype": [ "float", "float", "float", "float", "list", "" ],
                                    "patching_rect": [ 520.0, 632.0, 256.0, 64.0 ]
                                }
                            },
                            {
                                "box": {
                                    "buffername": "sample6",
                                    "id": "obj-79",
                                    "maxclass": "waveform~",
                                    "numinlets": 5,
                                    "numoutlets": 6,
                                    "outlettype": [ "float", "float", "float", "float", "list", "" ],
                                    "patching_rect": [ 520.0, 553.0, 256.0, 64.0 ]
                                }
                            },
                            {
                                "box": {
                                    "buffername": "sample5",
                                    "id": "obj-78",
                                    "maxclass": "waveform~",
                                    "numinlets": 5,
                                    "numoutlets": 6,
                                    "outlettype": [ "float", "float", "float", "float", "list", "" ],
                                    "patching_rect": [ 520.0, 474.0, 256.0, 64.0 ]
                                }
                            },
                            {
                                "box": {
                                    "buffername": "sample4",
                                    "id": "obj-77",
                                    "maxclass": "waveform~",
                                    "numinlets": 5,
                                    "numoutlets": 6,
                                    "outlettype": [ "float", "float", "float", "float", "list", "" ],
                                    "patching_rect": [ 520.0, 398.0, 256.0, 64.0 ]
                                }
                            },
                            {
                                "box": {
                                    "buffername": "sample3",
                                    "id": "obj-76",
                                    "maxclass": "waveform~",
                                    "numinlets": 5,
                                    "numoutlets": 6,
                                    "outlettype": [ "float", "float", "float", "float", "list", "" ],
                                    "patching_rect": [ 520.0, 319.0, 256.0, 64.0 ]
                                }
                            },
                            {
                                "box": {
                                    "buffername": "sample2",
                                    "id": "obj-75",
                                    "maxclass": "waveform~",
                                    "numinlets": 5,
                                    "numoutlets": 6,
                                    "outlettype": [ "float", "float", "float", "float", "list", "" ],
                                    "patching_rect": [ 520.0, 239.0, 256.0, 64.0 ]
                                }
                            },
                            {
                                "box": {
                                    "buffername": "sample1",
                                    "id": "obj-74",
                                    "maxclass": "waveform~",
                                    "numinlets": 5,
                                    "numoutlets": 6,
                                    "outlettype": [ "float", "float", "float", "float", "list", "" ],
                                    "patching_rect": [ 520.0, 164.0, 256.0, 64.0 ]
                                }
                            },
                            {
                                "box": {
                                    "buffername": "sample0",
                                    "id": "obj-73",
                                    "maxclass": "waveform~",
                                    "numinlets": 5,
                                    "numoutlets": 6,
                                    "outlettype": [ "float", "float", "float", "float", "list", "" ],
                                    "patching_rect": [ 520.0, 86.0, 256.0, 64.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-51",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "float", "bang" ],
                                    "patching_rect": [ 821.0, 888.0, 101.0, 22.0 ],
                                    "text": "buffer~ sample10"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-50",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "float", "bang" ],
                                    "patching_rect": [ 824.0, 805.0, 95.0, 22.0 ],
                                    "text": "buffer~ sample9"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-49",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "float", "bang" ],
                                    "patching_rect": [ 824.0, 730.0, 95.0, 22.0 ],
                                    "text": "buffer~ sample8"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-48",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "float", "bang" ],
                                    "patching_rect": [ 824.0, 653.0, 95.0, 22.0 ],
                                    "text": "buffer~ sample7"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-47",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "float", "bang" ],
                                    "patching_rect": [ 824.0, 574.0, 95.0, 22.0 ],
                                    "text": "buffer~ sample6"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-46",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "float", "bang" ],
                                    "patching_rect": [ 824.0, 495.0, 95.0, 22.0 ],
                                    "text": "buffer~ sample5"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-45",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "float", "bang" ],
                                    "patching_rect": [ 824.0, 412.0, 95.0, 22.0 ],
                                    "text": "buffer~ sample4"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-44",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "float", "bang" ],
                                    "patching_rect": [ 824.0, 332.0, 95.0, 22.0 ],
                                    "text": "buffer~ sample3"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-43",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "float", "bang" ],
                                    "patching_rect": [ 824.0, 260.0, 95.0, 22.0 ],
                                    "text": "buffer~ sample2"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-41",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "float", "bang" ],
                                    "patching_rect": [ 824.0, 185.0, 95.0, 22.0 ],
                                    "text": "buffer~ sample1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-40",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "float", "bang" ],
                                    "patching_rect": [ 824.0, 107.0, 95.0, 22.0 ],
                                    "text": "buffer~ sample0"
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-3",
                                    "index": 2,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 186.5, 446.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-2",
                                    "index": 1,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 50.5, 446.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-91",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "patching_rect": [ 285.0, 36.0, 58.0, 22.0 ],
                                    "text": "loadbang"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-22",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 285.0, 63.0, 42.0, 22.0 ],
                                    "text": "t0_buf"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-63",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 55.0, 78.0, 79.0, 22.0 ],
                                    "text": "r~ tick_signal"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-1",
                                    "maxclass": "newobj",
                                    "numinlets": 5,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "signal" ],
                                    "patching_rect": [ 50.5, 336.0, 155.0, 22.0 ],
                                    "text": "gen~ SamplerOne"
                                }
                            },
                            {
                                "box": {
                                    "attr": "buf",
                                    "id": "obj-89",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 285.0, 96.0, 150.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "attr": "chIndex",
                                    "id": "obj-90",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 285.0, 132.0, 150.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-92",
                                    "maxclass": "number",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 438.0, 102.0, 50.0, 22.0 ]
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "obj-2", 0 ],
                                    "source": [ "obj-1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-3", 0 ],
                                    "source": [ "obj-1", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-89", 0 ],
                                    "source": [ "obj-22", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-88", 0 ],
                                    "source": [ "obj-63", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-1", 4 ],
                                    "source": [ "obj-88", 4 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-1", 3 ],
                                    "source": [ "obj-88", 3 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-1", 2 ],
                                    "source": [ "obj-88", 2 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-1", 1 ],
                                    "source": [ "obj-88", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-1", 0 ],
                                    "source": [ "obj-88", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-88", 0 ],
                                    "source": [ "obj-89", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-88", 0 ],
                                    "source": [ "obj-90", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-22", 0 ],
                                    "source": [ "obj-91", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-90", 0 ],
                                    "source": [ "obj-92", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-88", 1 ],
                                    "source": [ "obj-93", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 2069.879594564438, 595.1807448863983, 70.0, 22.0 ],
                    "text": "p Sampler1"
                }
            },
            {
                "box": {
                    "id": "obj-68",
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
                        "rect": [ 813.0, 333.0, 1157.0, 880.0 ],
                        "visible": 1,
                        "boxes": [
                            {
                                "box": {
                                    "code": "function toStr(val) {\r\n    if (typeof val === \"string\") return val;\r\n    if (typeof val === \"object\" && val !== null) return JSON.stringify(val);\r\n    return String(val);\r\n}\r\n\r\nconst __logging = (obj, kind, msg) => {\r\n    var msg_real = toStr(msg).split(' ');\r\n    msg_real.unshift(kind);\r\n    obj.message(\"set_msg\", msg_real); \r\n}\r\n\r\nconst postMessage = (kind, message) => {\r\n    var zconsole = this.patcher.parentpatcher.getnamed(\"zconsole\");\r\n    if (zconsole){ __logging(zconsole, kind, message); }\r\n    // post('executed');\r\n}\r\n\r\nfunction dictionary(dictName) {\r\n    postMessage('debug', `Returned lint message below:`);\r\n    var d = new Dict(dictName);\r\n    var jsObj = JSON.parse(d.stringify());\r\n    var kind = 'info';\r\n    for (const [key, value] of Object.entries(jsObj)){\r\n        if (value.startsWith('ERROR: ')){   // but it can also bt STDERR: or STDOUT: \r\n            kind = 'error';\r\n            value = value.slice(7);\r\n        }\r\n        postMessage(kind, value);\r\n    }\r\n    const objSize = Object.entries(jsObj).length; \r\n    postMessage('warning', `num_lines in output: ${objSize}`);\r\n}",
                                    "filename": "none",
                                    "fontface": 0,
                                    "fontname": "<Monospaced>",
                                    "fontsize": 12.0,
                                    "id": "obj-1",
                                    "maxclass": "v8.codebox",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 25.0, 299.0, 703.0, 301.0 ],
                                    "saved_object_attributes": {
                                        "parameter_enable": 0
                                    }
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-38",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "patching_rect": [ 164.28570747375488, 131.9327712059021, 67.0, 22.0 ],
                                    "text": "opendialog"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-39",
                                    "maxclass": "button",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 164.28570747375488, 100.0, 24.0, 24.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-41",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 164.28570747375488, 156.3025176525116, 117.0, 22.0 ],
                                    "text": "filepath_to_parse $1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-37",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 50.0, 156.3025176525116, 64.0, 22.0 ],
                                    "text": "script start"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-8",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "" ],
                                    "patching_rect": [ 461.0, 18.0, 79.0, 22.0 ],
                                    "text": "route running"
                                }
                            },
                            {
                                "box": {
                                    "bgmode": 0,
                                    "border": 0,
                                    "clickthrough": 0,
                                    "enablehscroll": 0,
                                    "enablevscroll": 0,
                                    "id": "obj-9",
                                    "lockeddragscroll": 0,
                                    "lockedsize": 0,
                                    "maxclass": "bpatcher",
                                    "name": "n4m.monitor.maxpat",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "offset": [ 0.0, 0.0 ],
                                    "outlettype": [ "bang" ],
                                    "patching_rect": [ 526.0, 50.0, 400.0, 220.0 ],
                                    "viewvisibility": 1
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-12",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 127.31091976165771, 156.3025176525116, 29.5, 22.0 ],
                                    "text": "lint"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-4",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "" ],
                                    "patching_rect": [ 101.26050114631653, 209.24369096755981, 235.0, 22.0 ],
                                    "saved_object_attributes": {
                                        "autostart": 1,
                                        "defer": 0,
                                        "node_bin_path": "",
                                        "npm_bin_path": "",
                                        "watch": 1
                                    },
                                    "text": "node.script ztrk_gendsp_linter_for_node.js",
                                    "textfile": {
                                        "filename": "ztrk_gendsp_linter_for_node.js",
                                        "flags": 0,
                                        "embed": 0,
                                        "autowatch": 1
                                    },
                                    "varname": "ztrk_gendsp_lint"
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "obj-4", 0 ],
                                    "source": [ "obj-12", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-4", 0 ],
                                    "source": [ "obj-37", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-41", 0 ],
                                    "source": [ "obj-38", 0 ]
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
                                    "destination": [ "obj-1", 0 ],
                                    "source": [ "obj-4", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-8", 0 ],
                                    "source": [ "obj-4", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-4", 0 ],
                                    "source": [ "obj-41", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-9", 0 ],
                                    "source": [ "obj-8", 1 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 497.5903798341751, 1022.8916040658951, 181.0, 22.0 ],
                    "text": "p GenDSP_Debugging_Suite"
                }
            },
            {
                "box": {
                    "bgmode": 0,
                    "border": 0,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "obj-6",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "SongConfig.maxpat",
                    "numinlets": 0,
                    "numoutlets": 2,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 0.78315269947052, 11.0, 546.0, 66.0 ],
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "filename": "ztrk_console.js",
                    "id": "obj-145",
                    "maxclass": "v8ui",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1.2048193216323853, 1083.1325701475143, 684.3373746871948, 232.53012907505035 ],
                    "textfile": {
                        "filename": "ztrk_console.js",
                        "flags": 0,
                        "embed": 0,
                        "autowatch": 1
                    },
                    "varname": "zconsole"
                }
            },
            {
                "box": {
                    "id": "obj-66",
                    "lastchannelcount": 0,
                    "maxclass": "live.gain~",
                    "numinlets": 2,
                    "numoutlets": 5,
                    "outlettype": [ "signal", "signal", "", "float", "list" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 1837.3494654893875, 703.614483833313, 48.0, 136.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "live.gain~[5]",
                            "parameter_mmax": 6.0,
                            "parameter_mmin": -70.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "live.gain~[5]",
                            "parameter_type": 0,
                            "parameter_unitstyle": 4
                        }
                    },
                    "varname": "live.gain~[5]"
                }
            },
            {
                "box": {
                    "id": "obj-45",
                    "lastchannelcount": 0,
                    "maxclass": "live.gain~",
                    "numinlets": 2,
                    "numoutlets": 5,
                    "outlettype": [ "signal", "signal", "", "float", "list" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 2031.3253762722015, 960.240999341011, 48.0, 136.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "live.gain~[4]",
                            "parameter_mmax": 6.0,
                            "parameter_mmin": -70.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "live.gain~",
                            "parameter_type": 0,
                            "parameter_unitstyle": 4
                        }
                    },
                    "varname": "live.gain~[4]"
                }
            },
            {
                "box": {
                    "id": "obj-53",
                    "maxclass": "ezdac~",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [ 1962.6506749391556, 1050.60244846344, 36.0, 36.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-63",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 1816.867537021637, 403.61447274684906, 79.0, 22.0 ],
                    "text": "r~ tick_signal"
                }
            },
            {
                "box": {
                    "id": "obj-59",
                    "lastchannelcount": 0,
                    "maxclass": "live.gain~",
                    "numinlets": 2,
                    "numoutlets": 5,
                    "outlettype": [ "signal", "signal", "", "float", "list" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 1926.506095290184, 632.5301438570023, 48.0, 136.0 ],
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
                    "maxclass": "ezdac~",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [ 1932.530191898346, 803.614487528801, 36.0, 36.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-55",
                    "maxclass": "newobj",
                    "numinlets": 1,
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
                        "rect": [ 536.0, 93.0, 1922.0, 1152.0 ],
                        "boxes": [
                            {
                                "box": {
                                    "id": "obj-207",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 848.5293955802917, 1816.1764359474182, 65.44117522239685, 20.0 ],
                                    "text": "bool!"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-199",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 1170.0, 1809.0, 103.0, 22.0 ],
                                    "text": "scale 0. 255. 0. 4."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-200",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 1170.0, 1778.0, 109.0, 22.0 ],
                                    "text": "if $f1 >= 0 then $f1"
                                }
                            },
                            {
                                "box": {
                                    "fontface": 0,
                                    "fontname": "Arial",
                                    "fontsize": 12.0,
                                    "id": "obj-201",
                                    "interval": 20.0,
                                    "maxclass": "number~",
                                    "mode": 2,
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "float" ],
                                    "patching_rect": [ 1170.0, 1748.0, 56.0, 22.0 ],
                                    "sig": 0.0
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-202",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "signal" ],
                                    "patching_rect": [ 1170.0, 1716.0, 94.0, 22.0 ],
                                    "text": "gen~ b5_reader"
                                }
                            },
                            {
                                "box": {
                                    "attr": "kind",
                                    "displaymode": 1,
                                    "id": "obj-203",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 1170.0, 1680.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "kind", 2.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[181]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[14]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[61]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "chIndex",
                                    "displaymode": 1,
                                    "id": "obj-204",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 1170.0, 1653.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "chIndex", 20.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[182]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[35]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[62]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "buf",
                                    "id": "obj-205",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 1170.0, 1627.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "buf", "t2_buf" ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[183]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[4]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[63]"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-192",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 1007.0, 1809.0, 137.0, 22.0 ],
                                    "text": "scale 0. 65535. 0.05 20."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-193",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 1007.0, 1778.0, 109.0, 22.0 ],
                                    "text": "if $f1 >= 0 then $f1"
                                }
                            },
                            {
                                "box": {
                                    "fontface": 0,
                                    "fontname": "Arial",
                                    "fontsize": 12.0,
                                    "id": "obj-194",
                                    "interval": 20.0,
                                    "maxclass": "number~",
                                    "mode": 2,
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "float" ],
                                    "patching_rect": [ 1007.0, 1748.0, 56.0, 22.0 ],
                                    "sig": 0.0
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-195",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "signal" ],
                                    "patching_rect": [ 1007.0, 1716.0, 94.0, 22.0 ],
                                    "text": "gen~ b5_reader"
                                }
                            },
                            {
                                "box": {
                                    "attr": "kind",
                                    "displaymode": 1,
                                    "id": "obj-196",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 1007.0, 1680.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "kind", 4.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[178]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[14]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[58]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "chIndex",
                                    "displaymode": 1,
                                    "id": "obj-197",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 1007.0, 1653.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "chIndex", 19.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[179]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[35]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[59]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "buf",
                                    "id": "obj-198",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 1007.0, 1627.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "buf", "t2_buf" ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[180]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[4]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[60]"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-185",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 735.0, 1809.0, 103.0, 22.0 ],
                                    "text": "scale 0. 255. 0. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-186",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 735.0, 1778.0, 109.0, 22.0 ],
                                    "text": "if $f1 >= 0 then $f1"
                                }
                            },
                            {
                                "box": {
                                    "fontface": 0,
                                    "fontname": "Arial",
                                    "fontsize": 12.0,
                                    "id": "obj-187",
                                    "interval": 20.0,
                                    "maxclass": "number~",
                                    "mode": 2,
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "float" ],
                                    "patching_rect": [ 735.0, 1748.0, 56.0, 22.0 ],
                                    "sig": 0.0
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-188",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "signal" ],
                                    "patching_rect": [ 735.0, 1716.0, 94.0, 22.0 ],
                                    "text": "gen~ b5_reader"
                                }
                            },
                            {
                                "box": {
                                    "attr": "kind",
                                    "displaymode": 1,
                                    "id": "obj-189",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 735.0, 1680.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "kind", 2.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[175]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[14]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[55]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "chIndex",
                                    "displaymode": 1,
                                    "id": "obj-190",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 735.0, 1653.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "chIndex", 18.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[176]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[35]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[56]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "buf",
                                    "id": "obj-191",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 735.0, 1627.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "buf", "t2_buf" ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[177]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[4]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[57]"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-178",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 561.0, 1809.0, 103.0, 22.0 ],
                                    "text": "scale 0. 255. 0. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-179",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 561.0, 1778.0, 109.0, 22.0 ],
                                    "text": "if $f1 >= 0 then $f1"
                                }
                            },
                            {
                                "box": {
                                    "fontface": 0,
                                    "fontname": "Arial",
                                    "fontsize": 12.0,
                                    "id": "obj-180",
                                    "interval": 20.0,
                                    "maxclass": "number~",
                                    "mode": 2,
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "float" ],
                                    "patching_rect": [ 561.0, 1748.0, 56.0, 22.0 ],
                                    "sig": 0.0
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-181",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "signal" ],
                                    "patching_rect": [ 561.0, 1716.0, 94.0, 22.0 ],
                                    "text": "gen~ b5_reader"
                                }
                            },
                            {
                                "box": {
                                    "attr": "kind",
                                    "displaymode": 1,
                                    "id": "obj-182",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 561.0, 1680.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "kind", 2.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[172]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[14]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[52]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "chIndex",
                                    "displaymode": 1,
                                    "id": "obj-183",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 561.0, 1653.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "chIndex", 17.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[173]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[35]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[53]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "buf",
                                    "id": "obj-184",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 561.0, 1627.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "buf", "t2_buf" ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[174]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[4]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[54]"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-171",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 1068.0, 1503.0, 123.0, 22.0 ],
                                    "text": "scale 0. 255. 0.001 8."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-172",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 1068.0, 1472.0, 109.0, 22.0 ],
                                    "text": "if $f1 >= 0 then $f1"
                                }
                            },
                            {
                                "box": {
                                    "fontface": 0,
                                    "fontname": "Arial",
                                    "fontsize": 12.0,
                                    "id": "obj-173",
                                    "interval": 20.0,
                                    "maxclass": "number~",
                                    "mode": 2,
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "float" ],
                                    "patching_rect": [ 1068.0, 1442.0, 56.0, 22.0 ],
                                    "sig": 0.0
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-174",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "signal" ],
                                    "patching_rect": [ 1068.0, 1410.0, 94.0, 22.0 ],
                                    "text": "gen~ b5_reader"
                                }
                            },
                            {
                                "box": {
                                    "attr": "kind",
                                    "displaymode": 1,
                                    "id": "obj-175",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 1068.0, 1374.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "kind", 2.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[169]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[14]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[49]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "chIndex",
                                    "displaymode": 1,
                                    "id": "obj-176",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 1068.0, 1347.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "chIndex", 16.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[170]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[35]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[50]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "buf",
                                    "id": "obj-177",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 1068.0, 1321.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "buf", "t2_buf" ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[171]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[4]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[51]"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-164",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 897.0, 1503.0, 103.0, 22.0 ],
                                    "text": "scale 0. 255. 0. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-165",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 897.0, 1472.0, 109.0, 22.0 ],
                                    "text": "if $f1 >= 0 then $f1"
                                }
                            },
                            {
                                "box": {
                                    "fontface": 0,
                                    "fontname": "Arial",
                                    "fontsize": 12.0,
                                    "id": "obj-166",
                                    "interval": 20.0,
                                    "maxclass": "number~",
                                    "mode": 2,
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "float" ],
                                    "patching_rect": [ 897.0, 1442.0, 56.0, 22.0 ],
                                    "sig": 0.0
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-167",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "signal" ],
                                    "patching_rect": [ 897.0, 1410.0, 94.0, 22.0 ],
                                    "text": "gen~ b5_reader"
                                }
                            },
                            {
                                "box": {
                                    "attr": "kind",
                                    "displaymode": 1,
                                    "id": "obj-168",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 897.0, 1374.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "kind", 2.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[166]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[14]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[46]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "chIndex",
                                    "displaymode": 1,
                                    "id": "obj-169",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 897.0, 1347.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "chIndex", 15.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[167]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[35]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[47]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "buf",
                                    "id": "obj-170",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 897.0, 1321.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "buf", "t2_buf" ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[168]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[4]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[48]"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-157",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 721.6923599243164, 1503.0, 123.0, 22.0 ],
                                    "text": "scale 0. 255. 0.001 8."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-158",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 721.6923599243164, 1472.0, 109.0, 22.0 ],
                                    "text": "if $f1 >= 0 then $f1"
                                }
                            },
                            {
                                "box": {
                                    "fontface": 0,
                                    "fontname": "Arial",
                                    "fontsize": 12.0,
                                    "id": "obj-159",
                                    "interval": 20.0,
                                    "maxclass": "number~",
                                    "mode": 2,
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "float" ],
                                    "patching_rect": [ 721.6923599243164, 1442.0, 56.0, 22.0 ],
                                    "sig": 0.0
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-160",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "signal" ],
                                    "patching_rect": [ 721.6923599243164, 1410.0, 94.0, 22.0 ],
                                    "text": "gen~ b5_reader"
                                }
                            },
                            {
                                "box": {
                                    "attr": "kind",
                                    "displaymode": 1,
                                    "id": "obj-161",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 721.6923599243164, 1374.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "kind", 2.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[163]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[14]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[43]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "chIndex",
                                    "displaymode": 1,
                                    "id": "obj-162",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 721.6923599243164, 1347.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "chIndex", 14.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[164]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[35]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[44]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "buf",
                                    "id": "obj-163",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 721.6923599243164, 1321.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "buf", "t2_buf" ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[165]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[4]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[45]"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-150",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 547.6923599243164, 1503.0, 123.0, 22.0 ],
                                    "text": "scale 0. 255. 0.001 4."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-151",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 547.6923599243164, 1472.0, 109.0, 22.0 ],
                                    "text": "if $f1 >= 0 then $f1"
                                }
                            },
                            {
                                "box": {
                                    "fontface": 0,
                                    "fontname": "Arial",
                                    "fontsize": 12.0,
                                    "id": "obj-152",
                                    "interval": 20.0,
                                    "maxclass": "number~",
                                    "mode": 2,
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "float" ],
                                    "patching_rect": [ 547.6923599243164, 1442.0, 56.0, 22.0 ],
                                    "sig": 0.0
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-153",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "signal" ],
                                    "patching_rect": [ 547.6923599243164, 1410.0, 94.0, 22.0 ],
                                    "text": "gen~ b5_reader"
                                }
                            },
                            {
                                "box": {
                                    "attr": "kind",
                                    "displaymode": 1,
                                    "id": "obj-154",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 547.7941071987152, 1374.2646796703339, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "kind", 2.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[160]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[14]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[40]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "chIndex",
                                    "displaymode": 1,
                                    "id": "obj-155",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 547.6923599243164, 1347.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "chIndex", 13.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[161]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[35]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[41]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "buf",
                                    "id": "obj-156",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 547.6923599243164, 1321.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "buf", "t2_buf" ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[162]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[4]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[42]"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-143",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 1270.0, 1194.0, 103.0, 22.0 ],
                                    "text": "scale 0. 255. 0. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-144",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 1270.0, 1163.0, 109.0, 22.0 ],
                                    "text": "if $f1 >= 0 then $f1"
                                }
                            },
                            {
                                "box": {
                                    "fontface": 0,
                                    "fontname": "Arial",
                                    "fontsize": 12.0,
                                    "id": "obj-145",
                                    "interval": 20.0,
                                    "maxclass": "number~",
                                    "mode": 2,
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "float" ],
                                    "patching_rect": [ 1270.0, 1133.0, 56.0, 22.0 ],
                                    "sig": 0.0
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-146",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "signal" ],
                                    "patching_rect": [ 1270.0, 1101.0, 94.0, 22.0 ],
                                    "text": "gen~ b5_reader"
                                }
                            },
                            {
                                "box": {
                                    "attr": "kind",
                                    "displaymode": 1,
                                    "id": "obj-147",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 1270.0, 1065.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "kind", 2.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[157]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[14]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[37]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "chIndex",
                                    "displaymode": 1,
                                    "id": "obj-148",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 1270.0, 1038.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "chIndex", 12.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[158]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[35]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[38]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "buf",
                                    "id": "obj-149",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 1270.0, 1012.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "buf", "t2_buf" ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[159]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[4]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[39]"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-136",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 1057.0, 1194.0, 103.0, 22.0 ],
                                    "text": "scale 0. 255. 0. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-137",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 1057.0, 1163.0, 109.0, 22.0 ],
                                    "text": "if $f1 >= 0 then $f1"
                                }
                            },
                            {
                                "box": {
                                    "fontface": 0,
                                    "fontname": "Arial",
                                    "fontsize": 12.0,
                                    "id": "obj-138",
                                    "interval": 20.0,
                                    "maxclass": "number~",
                                    "mode": 2,
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "float" ],
                                    "patching_rect": [ 1057.0, 1133.0, 56.0, 22.0 ],
                                    "sig": 0.0
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-139",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "signal" ],
                                    "patching_rect": [ 1057.0, 1101.0, 94.0, 22.0 ],
                                    "text": "gen~ b5_reader"
                                }
                            },
                            {
                                "box": {
                                    "attr": "kind",
                                    "displaymode": 1,
                                    "id": "obj-140",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 1057.0, 1065.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "kind", 2.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[154]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[14]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[33]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "chIndex",
                                    "displaymode": 1,
                                    "id": "obj-141",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 1057.0, 1038.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "chIndex", 11.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[155]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[35]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[34]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "buf",
                                    "id": "obj-142",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 1057.0, 1012.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "buf", "t2_buf" ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[156]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[4]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[36]"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-129",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 893.8462390899658, 1194.0, 107.0, 22.0 ],
                                    "text": "scale 0. 255. -1. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-130",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 893.8462390899658, 1163.0, 109.0, 22.0 ],
                                    "text": "if $f1 >= 0 then $f1"
                                }
                            },
                            {
                                "box": {
                                    "fontface": 0,
                                    "fontname": "Arial",
                                    "fontsize": 12.0,
                                    "id": "obj-131",
                                    "interval": 20.0,
                                    "maxclass": "number~",
                                    "mode": 2,
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "float" ],
                                    "patching_rect": [ 893.8462390899658, 1133.0, 56.0, 22.0 ],
                                    "sig": 0.0
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-132",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "signal" ],
                                    "patching_rect": [ 893.8462390899658, 1101.0, 94.0, 22.0 ],
                                    "text": "gen~ b5_reader"
                                }
                            },
                            {
                                "box": {
                                    "attr": "kind",
                                    "displaymode": 1,
                                    "id": "obj-133",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 893.8462390899658, 1065.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "kind", 2.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[151]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[14]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[30]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "chIndex",
                                    "displaymode": 1,
                                    "id": "obj-134",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 893.8462390899658, 1038.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "chIndex", 10.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[152]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[35]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[31]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "buf",
                                    "id": "obj-135",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 893.8462390899658, 1012.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "buf", "t2_buf" ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[153]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[4]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[32]"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-122",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 720.0000686645508, 1194.0, 103.0, 22.0 ],
                                    "text": "scale 0. 255. 0. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-123",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 720.0000686645508, 1163.0, 109.0, 22.0 ],
                                    "text": "if $f1 >= 0 then $f1"
                                }
                            },
                            {
                                "box": {
                                    "fontface": 0,
                                    "fontname": "Arial",
                                    "fontsize": 12.0,
                                    "id": "obj-124",
                                    "interval": 20.0,
                                    "maxclass": "number~",
                                    "mode": 2,
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "float" ],
                                    "patching_rect": [ 720.0000686645508, 1133.0, 56.0, 22.0 ],
                                    "sig": 0.0
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-125",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "signal" ],
                                    "patching_rect": [ 720.0000686645508, 1101.0, 94.0, 22.0 ],
                                    "text": "gen~ b5_reader"
                                }
                            },
                            {
                                "box": {
                                    "attr": "kind",
                                    "displaymode": 1,
                                    "id": "obj-126",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 720.0000686645508, 1065.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "kind", 2.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[148]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[14]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[27]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "chIndex",
                                    "displaymode": 1,
                                    "id": "obj-127",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 720.0000686645508, 1038.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "chIndex", 9.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[149]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[35]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[28]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "buf",
                                    "id": "obj-128",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 720.0000686645508, 1012.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "buf", "t2_buf" ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[150]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[4]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[29]"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-115",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 547.6923599243164, 1194.0, 150.0, 22.0 ],
                                    "text": "scale 0. 65535. 40. 10000."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-116",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 547.6923599243164, 1163.0, 109.0, 22.0 ],
                                    "text": "if $f1 >= 0 then $f1"
                                }
                            },
                            {
                                "box": {
                                    "fontface": 0,
                                    "fontname": "Arial",
                                    "fontsize": 12.0,
                                    "id": "obj-117",
                                    "interval": 20.0,
                                    "maxclass": "number~",
                                    "mode": 2,
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "float" ],
                                    "patching_rect": [ 547.6923599243164, 1133.0, 56.0, 22.0 ],
                                    "sig": 0.0
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-118",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "signal" ],
                                    "patching_rect": [ 547.6923599243164, 1101.0, 94.0, 22.0 ],
                                    "text": "gen~ b5_reader"
                                }
                            },
                            {
                                "box": {
                                    "attr": "kind",
                                    "displaymode": 1,
                                    "id": "obj-119",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 547.6923599243164, 1065.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "kind", 4.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[145]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[14]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[24]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "chIndex",
                                    "displaymode": 1,
                                    "id": "obj-120",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 547.6923599243164, 1038.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "chIndex", 8.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[146]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[35]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[25]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "buf",
                                    "id": "obj-121",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 547.6923599243164, 1012.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "buf", "t2_buf" ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[147]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[4]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[26]"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-104",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 1829.2309436798096, 864.0, 143.0, 22.0 ],
                                    "text": "scale 0. 65535. 20. 2000."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-105",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 1829.2309436798096, 833.0, 109.0, 22.0 ],
                                    "text": "if $f1 >= 0 then $f1"
                                }
                            },
                            {
                                "box": {
                                    "fontface": 0,
                                    "fontname": "Arial",
                                    "fontsize": 12.0,
                                    "id": "obj-106",
                                    "interval": 20.0,
                                    "maxclass": "number~",
                                    "mode": 2,
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "float" ],
                                    "patching_rect": [ 1829.2309436798096, 803.0, 56.0, 22.0 ],
                                    "sig": 0.0
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-107",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "signal" ],
                                    "patching_rect": [ 1829.2309436798096, 771.0, 94.0, 22.0 ],
                                    "text": "gen~ b5_reader"
                                }
                            },
                            {
                                "box": {
                                    "attr": "kind",
                                    "displaymode": 1,
                                    "id": "obj-108",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 1829.2309436798096, 735.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "kind", 4.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[142]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[14]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[21]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "chIndex",
                                    "displaymode": 1,
                                    "id": "obj-109",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 1829.2309436798096, 708.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "chIndex", 7.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[143]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[35]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[22]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "buf",
                                    "id": "obj-110",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 1829.2309436798096, 682.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "buf", "t2_buf" ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[144]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[4]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[23]"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-97",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 1581.5386123657227, 864.0, 121.0, 22.0 ],
                                    "text": "scale 0. 255. -24. 24."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-98",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 1581.5386123657227, 833.0, 109.0, 22.0 ],
                                    "text": "if $f1 >= 0 then $f1"
                                }
                            },
                            {
                                "box": {
                                    "fontface": 0,
                                    "fontname": "Arial",
                                    "fontsize": 12.0,
                                    "id": "obj-99",
                                    "interval": 20.0,
                                    "maxclass": "number~",
                                    "mode": 2,
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "float" ],
                                    "patching_rect": [ 1581.5386123657227, 803.0, 56.0, 22.0 ],
                                    "sig": 0.0
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-100",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "signal" ],
                                    "patching_rect": [ 1581.5386123657227, 771.0, 94.0, 22.0 ],
                                    "text": "gen~ b5_reader"
                                }
                            },
                            {
                                "box": {
                                    "attr": "kind",
                                    "displaymode": 1,
                                    "id": "obj-101",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 1581.5386123657227, 735.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "kind", 2.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[140]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[14]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[18]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "chIndex",
                                    "displaymode": 1,
                                    "id": "obj-102",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 1581.5386123657227, 708.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "chIndex", 6.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[141]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[35]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[19]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "buf",
                                    "id": "obj-103",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 1581.5386123657227, 682.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "buf", "t2_buf" ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[131]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[4]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[20]"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-84",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 1413.8462886810303, 864.0, 103.0, 22.0 ],
                                    "text": "scale 0. 255. 0. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-85",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 1413.8462886810303, 833.0, 109.0, 22.0 ],
                                    "text": "if $f1 >= 0 then $f1"
                                }
                            },
                            {
                                "box": {
                                    "fontface": 0,
                                    "fontname": "Arial",
                                    "fontsize": 12.0,
                                    "id": "obj-86",
                                    "interval": 20.0,
                                    "maxclass": "number~",
                                    "mode": 2,
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "float" ],
                                    "patching_rect": [ 1413.8462886810303, 803.0, 56.0, 22.0 ],
                                    "sig": 0.0
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-90",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "signal" ],
                                    "patching_rect": [ 1413.8462886810303, 771.0, 94.0, 22.0 ],
                                    "text": "gen~ b5_reader"
                                }
                            },
                            {
                                "box": {
                                    "attr": "kind",
                                    "displaymode": 1,
                                    "id": "obj-92",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 1413.8462886810303, 735.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "kind", 2.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[137]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[14]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[15]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "chIndex",
                                    "displaymode": 1,
                                    "id": "obj-93",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 1413.8462886810303, 708.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "chIndex", 5.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[138]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[35]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[16]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "buf",
                                    "id": "obj-96",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 1413.8462886810303, 682.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "buf", "t2_buf" ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[139]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[4]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[17]"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-55",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 1246.153964996338, 864.0, 103.0, 22.0 ],
                                    "text": "scale 0. 255. 0. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-70",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 1246.153964996338, 833.0, 109.0, 22.0 ],
                                    "text": "if $f1 >= 0 then $f1"
                                }
                            },
                            {
                                "box": {
                                    "fontface": 0,
                                    "fontname": "Arial",
                                    "fontsize": 12.0,
                                    "id": "obj-78",
                                    "interval": 20.0,
                                    "maxclass": "number~",
                                    "mode": 2,
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "float" ],
                                    "patching_rect": [ 1246.153964996338, 803.0, 56.0, 22.0 ],
                                    "sig": 0.0
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-79",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "signal" ],
                                    "patching_rect": [ 1246.153964996338, 771.0, 94.0, 22.0 ],
                                    "text": "gen~ b5_reader"
                                }
                            },
                            {
                                "box": {
                                    "attr": "kind",
                                    "displaymode": 1,
                                    "id": "obj-80",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 1246.153964996338, 735.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "kind", 2.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[134]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[14]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[11]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "chIndex",
                                    "displaymode": 1,
                                    "id": "obj-81",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 1246.153964996338, 708.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "chIndex", 4.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[135]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[35]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[12]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "buf",
                                    "id": "obj-82",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 1246.153964996338, 682.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "buf", "t2_buf" ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[136]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[4]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[13]"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-35",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 1072.3077945709229, 864.0, 103.0, 22.0 ],
                                    "text": "scale 0. 255. 0. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-37",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 1072.3077945709229, 833.0, 109.0, 22.0 ],
                                    "text": "if $f1 >= 0 then $f1"
                                }
                            },
                            {
                                "box": {
                                    "fontface": 0,
                                    "fontname": "Arial",
                                    "fontsize": 12.0,
                                    "id": "obj-38",
                                    "interval": 20.0,
                                    "maxclass": "number~",
                                    "mode": 2,
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "float" ],
                                    "patching_rect": [ 1072.3077945709229, 803.0, 56.0, 22.0 ],
                                    "sig": 0.0
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-39",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "signal" ],
                                    "patching_rect": [ 1072.3077945709229, 771.0, 94.0, 22.0 ],
                                    "text": "gen~ b5_reader"
                                }
                            },
                            {
                                "box": {
                                    "attr": "kind",
                                    "displaymode": 1,
                                    "id": "obj-41",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 1072.3077945709229, 735.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "kind", 2.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[129]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[14]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[8]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "chIndex",
                                    "displaymode": 1,
                                    "id": "obj-49",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 1072.3077945709229, 708.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "chIndex", 3.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[130]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[35]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[9]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "buf",
                                    "id": "obj-53",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 1072.3077945709229, 682.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "buf", "t2_buf" ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[133]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[4]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[10]"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-26",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 893.8462390899658, 864.0, 103.0, 22.0 ],
                                    "text": "scale 0. 255. 0. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-27",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 893.8462390899658, 833.0, 109.0, 22.0 ],
                                    "text": "if $f1 >= 0 then $f1"
                                }
                            },
                            {
                                "box": {
                                    "fontface": 0,
                                    "fontname": "Arial",
                                    "fontsize": 12.0,
                                    "id": "obj-28",
                                    "interval": 20.0,
                                    "maxclass": "number~",
                                    "mode": 2,
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "float" ],
                                    "patching_rect": [ 893.8462390899658, 803.0, 56.0, 22.0 ],
                                    "sig": 0.0
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-29",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "signal" ],
                                    "patching_rect": [ 893.8462390899658, 771.0, 94.0, 22.0 ],
                                    "text": "gen~ b5_reader"
                                }
                            },
                            {
                                "box": {
                                    "attr": "kind",
                                    "displaymode": 1,
                                    "id": "obj-31",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 893.8462390899658, 735.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "kind", 2.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[126]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[14]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[5]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "chIndex",
                                    "displaymode": 1,
                                    "id": "obj-32",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 893.8462390899658, 708.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "chIndex", 2.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[127]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[35]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[6]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "buf",
                                    "id": "obj-34",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 893.8462390899658, 682.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "buf", "t2_buf" ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[128]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[4]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[7]"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-15",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 721.5385303497314, 864.0, 103.0, 22.0 ],
                                    "text": "scale 0. 255. 0. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-18",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 721.5385303497314, 833.0, 109.0, 22.0 ],
                                    "text": "if $f1 >= 0 then $f1"
                                }
                            },
                            {
                                "box": {
                                    "fontface": 0,
                                    "fontname": "Arial",
                                    "fontsize": 12.0,
                                    "id": "obj-19",
                                    "interval": 20.0,
                                    "maxclass": "number~",
                                    "mode": 2,
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "float" ],
                                    "patching_rect": [ 721.5385303497314, 803.0, 56.0, 22.0 ],
                                    "sig": 0.0
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-20",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "signal" ],
                                    "patching_rect": [ 721.5385303497314, 771.0, 94.0, 22.0 ],
                                    "text": "gen~ b5_reader"
                                }
                            },
                            {
                                "box": {
                                    "attr": "kind",
                                    "displaymode": 1,
                                    "id": "obj-21",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 721.5385303497314, 735.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "kind", 2.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[123]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[14]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[1]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "chIndex",
                                    "displaymode": 1,
                                    "id": "obj-23",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 721.5385303497314, 708.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "chIndex", 1.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[124]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[35]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[2]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "buf",
                                    "id": "obj-25",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 721.5385303497314, 682.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "buf", "t2_buf" ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[125]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[4]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[3]"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-14",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 547.6923599243164, 864.0, 103.0, 22.0 ],
                                    "text": "scale 0. 255. 0. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-91",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "patching_rect": [ 546.6923599243164, 586.0, 58.0, 22.0 ],
                                    "text": "loadbang"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-22",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 546.6923599243164, 614.0, 42.0, 22.0 ],
                                    "text": "t2_buf"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-9",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 547.6923599243164, 833.0, 109.0, 22.0 ],
                                    "text": "if $f1 >= 0 then $f1"
                                }
                            },
                            {
                                "box": {
                                    "fontface": 0,
                                    "fontname": "Arial",
                                    "fontsize": 12.0,
                                    "id": "obj-7",
                                    "interval": 20.0,
                                    "maxclass": "number~",
                                    "mode": 2,
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "float" ],
                                    "patching_rect": [ 547.6923599243164, 803.0, 56.0, 22.0 ],
                                    "sig": 0.0
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-8",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "signal" ],
                                    "patching_rect": [ 547.6923599243164, 771.0, 94.0, 22.0 ],
                                    "text": "gen~ b5_reader"
                                }
                            },
                            {
                                "box": {
                                    "attr": "kind",
                                    "displaymode": 1,
                                    "id": "obj-10",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 547.6923599243164, 735.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "kind", 2.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[120]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[14]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[14]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "chIndex",
                                    "displaymode": 1,
                                    "id": "obj-12",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 547.6923599243164, 708.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "chIndex", 0.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[121]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[35]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[35]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "buf",
                                    "id": "obj-13",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 547.6923599243164, 682.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "buf", "t2_buf" ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[122]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[4]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[4]"
                                }
                            },
                            {
                                "box": {
                                    "bgcolor": [ 0.7215686274509804, 0.1568627450980392, 0.3803921568627451, 1.0 ],
                                    "id": "obj-24",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "patching_rect": [ 387.0, 811.0, 22.0, 22.0 ],
                                    "text": "t b"
                                }
                            },
                            {
                                "box": {
                                    "bgcolor": [ 0.7215686274509804, 0.1568627450980392, 0.3803921568627451, 1.0 ],
                                    "id": "obj-17",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "float" ],
                                    "patching_rect": [ 387.0, 874.0, 39.0, 22.0 ],
                                    "text": "/ 101."
                                }
                            },
                            {
                                "box": {
                                    "bgcolor": [ 0.7215686274509804, 0.1568627450980392, 0.3803921568627451, 1.0 ],
                                    "id": "obj-16",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 387.0, 844.0, 73.0, 22.0 ],
                                    "text": "random 100"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-11",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "multichannelsignal" ],
                                    "patching_rect": [ 197.0, 1072.0, 114.0, 22.0 ],
                                    "text": "mc.sig~ @chans 16"
                                }
                            },
                            {
                                "box": {
                                    "bgcolor": [ 0.7215686274509804, 0.1568627450980392, 0.3803921568627451, 1.0 ],
                                    "id": "obj-6",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "setvalue", "int" ],
                                    "patching_rect": [ 387.0, 903.0, 128.0, 22.0 ],
                                    "text": "mc.target"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-4",
                                    "maxclass": "kslider",
                                    "mode": 2,
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "int", "int" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 135.0, 582.0, 336.0, 53.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-88",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 386.74700224399567, 371.08435106277466, 78.0, 22.0 ],
                                    "text": "r~ trig_signal"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-89",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 475.9036320447922, 371.08435106277466, 79.0, 22.0 ],
                                    "text": "r~ tick_signal"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-83",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
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
                                        "rect": [ 339.0, 103.0, 1921.0, 1170.0 ],
                                        "boxes": [
                                            {
                                                "box": {
                                                    "id": "obj-12",
                                                    "maxclass": "message",
                                                    "numinlets": 2,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "" ],
                                                    "patching_rect": [ 556.0, 23.0, 42.0, 22.0 ],
                                                    "text": "t1_buf"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-8",
                                                    "maxclass": "newobj",
                                                    "numinlets": 1,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "bang" ],
                                                    "patching_rect": [ 493.0, 6.0, 58.0, 22.0 ],
                                                    "text": "loadbang"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "comment": "",
                                                    "id": "obj-5",
                                                    "index": 1,
                                                    "maxclass": "outlet",
                                                    "numinlets": 1,
                                                    "numoutlets": 0,
                                                    "patching_rect": [ 947.0, 1051.0, 30.0, 30.0 ]
                                                }
                                            },
                                            {
                                                "box": {
                                                    "comment": "",
                                                    "id": "obj-3",
                                                    "index": 2,
                                                    "maxclass": "inlet",
                                                    "numinlets": 0,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "signal" ],
                                                    "patching_rect": [ 1441.0, 32.0, 30.0, 30.0 ]
                                                }
                                            },
                                            {
                                                "box": {
                                                    "comment": "",
                                                    "id": "obj-1",
                                                    "index": 1,
                                                    "maxclass": "inlet",
                                                    "numinlets": 0,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "signal" ],
                                                    "patching_rect": [ 435.0, 32.0, 30.0, 30.0 ]
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-22",
                                                    "maxclass": "scope~",
                                                    "numinlets": 2,
                                                    "numoutlets": 0,
                                                    "patching_rect": [ 1218.0, 959.0, 232.0, 58.0 ]
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-21",
                                                    "maxclass": "scope~",
                                                    "numinlets": 2,
                                                    "numoutlets": 0,
                                                    "patching_rect": [ 690.0, 981.0, 232.0, 58.0 ]
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-20",
                                                    "maxclass": "scope~",
                                                    "numinlets": 2,
                                                    "numoutlets": 0,
                                                    "patching_rect": [ 452.0, 981.0, 232.0, 58.0 ]
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-26",
                                                    "maxclass": "comment",
                                                    "numinlets": 1,
                                                    "numoutlets": 0,
                                                    "patching_rect": [ 1170.0, 910.0, 102.0, 20.0 ],
                                                    "text": "requires velocity"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-24",
                                                    "maxclass": "comment",
                                                    "numinlets": 1,
                                                    "numoutlets": 0,
                                                    "patching_rect": [ 793.0, 910.0, 115.0, 20.0 ],
                                                    "text": "requires midinotes"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-19",
                                                    "linecount": 2,
                                                    "maxclass": "comment",
                                                    "numinlets": 1,
                                                    "numoutlets": 0,
                                                    "patching_rect": [ 452.0, 916.0, 90.0, 34.0 ],
                                                    "text": "requires ramps\nor bool states"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-17",
                                                    "maxclass": "newobj",
                                                    "numinlets": 5,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "multichannelsignal" ],
                                                    "patching_rect": [ 1278.0, 909.0, 90.0, 22.0 ],
                                                    "text": "mc.combine~ 5"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-16",
                                                    "maxclass": "newobj",
                                                    "numinlets": 5,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "multichannelsignal" ],
                                                    "patching_rect": [ 912.0, 909.0, 90.0, 22.0 ],
                                                    "text": "mc.combine~ 5"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-15",
                                                    "maxclass": "newobj",
                                                    "numinlets": 5,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "multichannelsignal" ],
                                                    "patching_rect": [ 545.0, 915.0, 90.0, 22.0 ],
                                                    "text": "mc.combine~ 5"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "code": "NoteChannel(pTick, nTrig, idx, buf, counter, running, cur_note, v, lookaheadMs) {\r\n    pTick      = floor(pTick);\r\n    loop_len   = dim(buf);\r\n    pTick_next = (pTick + 1) - floor((pTick + 1) / loop_len) * loop_len;\r\n\r\n    note      = peek(buf, pTick, idx, 0, channels=1);\n    velocity  = peek(buf, pTick, idx + 1, 0, channels=1);\n    duration_raw = peek(buf, pTick, idx + 2, 0, channels=1);\n    next_note = peek(buf, pTick_next, idx, 0, channels=1);\n\n    durMin = 10.0;\n    durMax = 4000.0;\n    duration = durMin * pow(durMax / durMin, duration_raw / 255.0);\r\n\r\n    // is_noteoff = (note == 0.5 || note == 0.75);\r\n    is_noteoff = (note > -0.9 && note < -0.3);\r\n    lookaheadSamples = lookaheadMs * samplerate / 1000.0;\r\n\r\n    if (nTrig == 1.0) {\r\n        if (note > 0.0 && !is_noteoff) {\r\n            cur_note = round(note * 127.0);\r\n            v = round(velocity * 255 / 2);\r\n            running = duration * samplerate / 1000.0;\r\n        } else if (is_noteoff) {\r\n            running = 0.0;\r\n        }\r\n    }\r\n\r\n    if (next_note > 0.0 && !(next_note == 0.5 || next_note == 0.75) && running > 0.0 && running <= lookaheadSamples) {\r\n        running = 0.0;\r\n    }\r\n\r\n    if (running > 0.0) {\r\n        running = running - 1.0;\r\n    } else {\r\n        cur_note = 0.0;\r\n        v = 0.0;\r\n    }\r\n\r\n    return running > 0.0 ? 1.0 : 0.0, cur_note, v, counter, running, cur_note, v;\r\n}\r\n\r\nBuffer buf();\r\nParam MainAmp(1.0, min=0.0, max=1.0);\r\nParam lookaheadMs(5.0, min=0.0, max=100.0);\r\n\r\nHistory c1(0), r1(0), n1(0), v1(0);\r\nHistory c2(0), r2(0), n2(0), v2(0);\r\nHistory c3(0), r3(0), n3(0), v3(0);\r\nHistory c4(0), r4(0), n4(0), v4(0);\r\nHistory c5(0), r5(0), n5(0), v5(0);\r\n\r\ntrig = in1;\r\ntick = in2;\r\n\r\nout1, out6, out11, c1, r1, n1, v1     = NoteChannel(tick, trig, 0,  buf, c1, r1, n1, v1, lookaheadMs);\r\nout2, out7, out12, c2, r2, n2, v2     = NoteChannel(tick, trig, 4,  buf, c2, r2, n2, v2, lookaheadMs);\r\nout3, out8, out13, c3, r3, n3, v3     = NoteChannel(tick, trig, 8,  buf, c3, r3, n3, v3, lookaheadMs);\r\nout4, out9, out14, c4, r4, n4, v4     = NoteChannel(tick, trig, 12, buf, c4, r4, n4, v4, lookaheadMs);\r\nout5, out10, out15, c5, r5, n5, v5    = NoteChannel(tick, trig, 16, buf, c5, r5, n5, v5, lookaheadMs);",
                                                    "fontface": 0,
                                                    "fontname": "<Monospaced>",
                                                    "fontsize": 12.0,
                                                    "id": "obj-10",
                                                    "maxclass": "gen.codebox~",
                                                    "numinlets": 2,
                                                    "numoutlets": 15,
                                                    "outlettype": [ "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal" ],
                                                    "patching_rect": [ 435.0, 83.0, 1025.0, 788.0 ]
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-7",
                                                    "maxclass": "newobj",
                                                    "numinlets": 2,
                                                    "numoutlets": 2,
                                                    "outlettype": [ "", "" ],
                                                    "patching_rect": [ 947.0, 1008.0, 91.0, 22.0 ],
                                                    "text": "route midievent"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-2",
                                                    "maxclass": "newobj",
                                                    "numinlets": 3,
                                                    "numoutlets": 2,
                                                    "outlettype": [ "signal", "midievent" ],
                                                    "patching_rect": [ 876.0, 952.0, 90.0, 22.0 ],
                                                    "text": "mc.midiplayer~"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "attr": "triggermode",
                                                    "id": "obj-4",
                                                    "maxclass": "attrui",
                                                    "numinlets": 1,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "" ],
                                                    "parameter_enable": 1,
                                                    "patching_rect": [ 977.0, 952.0, 150.0, 22.0 ],
                                                    "saved_attribute_attributes": {
                                                        "valueof": {
                                                            "parameter_initial": [ "triggermode", 1 ],
                                                            "parameter_initial_enable": 1,
                                                            "parameter_invisible": 1,
                                                            "parameter_longname": "attrui[132]",
                                                            "parameter_modmode": 0,
                                                            "parameter_shortname": "attrui[6]",
                                                            "parameter_type": 3
                                                        }
                                                    },
                                                    "varname": "attrui"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "attr": "buf",
                                                    "id": "obj-6",
                                                    "maxclass": "attrui",
                                                    "numinlets": 1,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "" ],
                                                    "parameter_enable": 0,
                                                    "patching_rect": [ 610.0, 32.0, 150.0, 22.0 ]
                                                }
                                            },
                                            {
                                                "box": {
                                                    "attr": "lookaheadMs",
                                                    "id": "obj-9",
                                                    "maxclass": "attrui",
                                                    "numinlets": 1,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "" ],
                                                    "parameter_enable": 0,
                                                    "patching_rect": [ 763.0, 53.0, 150.0, 22.0 ]
                                                }
                                            }
                                        ],
                                        "lines": [
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-10", 0 ],
                                                    "source": [ "obj-1", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-15", 4 ],
                                                    "midpoints": [ 731.9285714285714, 907.0, 625.5, 907.0 ],
                                                    "source": [ "obj-10", 4 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-15", 3 ],
                                                    "midpoints": [ 660.0714285714286, 901.0, 607.75, 901.0 ],
                                                    "source": [ "obj-10", 3 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-15", 2 ],
                                                    "midpoints": [ 588.2142857142858, 874.0, 590.0, 874.0 ],
                                                    "source": [ "obj-10", 2 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-15", 1 ],
                                                    "midpoints": [ 516.3571428571429, 901.0, 572.25, 901.0 ],
                                                    "source": [ "obj-10", 1 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-15", 0 ],
                                                    "midpoints": [ 444.5, 910.0, 554.5, 910.0 ],
                                                    "source": [ "obj-10", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-16", 4 ],
                                                    "midpoints": [ 1091.2142857142858, 901.0, 992.5, 901.0 ],
                                                    "source": [ "obj-10", 9 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-16", 3 ],
                                                    "midpoints": [ 1019.3571428571429, 895.0, 974.75, 895.0 ],
                                                    "source": [ "obj-10", 8 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-16", 2 ],
                                                    "midpoints": [ 947.5, 895.0, 957.0, 895.0 ],
                                                    "source": [ "obj-10", 7 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-16", 1 ],
                                                    "midpoints": [ 875.6428571428571, 895.0, 939.25, 895.0 ],
                                                    "source": [ "obj-10", 6 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-16", 0 ],
                                                    "midpoints": [ 803.7857142857142, 906.0, 921.5, 906.0 ],
                                                    "source": [ "obj-10", 5 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-17", 4 ],
                                                    "midpoints": [ 1450.5, 903.0, 1358.5, 903.0 ],
                                                    "source": [ "obj-10", 14 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-17", 3 ],
                                                    "midpoints": [ 1378.642857142857, 895.0, 1340.75, 895.0 ],
                                                    "source": [ "obj-10", 13 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-17", 2 ],
                                                    "midpoints": [ 1306.7857142857142, 895.0, 1323.0, 895.0 ],
                                                    "source": [ "obj-10", 12 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-17", 1 ],
                                                    "midpoints": [ 1234.9285714285716, 895.0, 1305.25, 895.0 ],
                                                    "source": [ "obj-10", 11 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-17", 0 ],
                                                    "midpoints": [ 1163.0714285714284, 906.0, 1287.5, 906.0 ],
                                                    "source": [ "obj-10", 10 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-6", 0 ],
                                                    "source": [ "obj-12", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-2", 0 ],
                                                    "midpoints": [ 554.5, 942.0, 885.5, 942.0 ],
                                                    "order": 0,
                                                    "source": [ "obj-15", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-20", 0 ],
                                                    "order": 1,
                                                    "source": [ "obj-15", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-2", 1 ],
                                                    "order": 0,
                                                    "source": [ "obj-16", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-21", 0 ],
                                                    "order": 1,
                                                    "source": [ "obj-16", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-2", 2 ],
                                                    "midpoints": [ 1287.5, 941.0, 956.5, 941.0 ],
                                                    "order": 1,
                                                    "source": [ "obj-17", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-22", 0 ],
                                                    "order": 0,
                                                    "source": [ "obj-17", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-7", 0 ],
                                                    "source": [ "obj-2", 1 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-10", 1 ],
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
                                                    "destination": [ "obj-10", 0 ],
                                                    "source": [ "obj-6", 0 ]
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
                                                    "destination": [ "obj-12", 0 ],
                                                    "source": [ "obj-8", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-10", 0 ],
                                                    "source": [ "obj-9", 0 ]
                                                }
                                            }
                                        ]
                                    },
                                    "patching_rect": [ 395.38465309143066, 441.0, 86.0, 22.0 ],
                                    "text": "p NoteHandler"
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-3",
                                    "index": 1,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 27.0, 274.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-2",
                                    "index": 2,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 218.4615592956543, 1298.4616622924805, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-1",
                                    "index": 1,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 153.8461685180664, 1298.4616622924805, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-40",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "int" ],
                                    "patching_rect": [ 156.0, 853.0, 47.0, 22.0 ],
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
                                    "patching_rect": [ 111.0, 853.0, 32.0, 22.0 ],
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
                                    "patching_rect": [ 111.0, 990.0, 164.0, 22.0 ],
                                    "text": "mc.gen~ JunoXP @chans 16",
                                    "varname": "JUNODSP"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-95",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "" ],
                                    "patching_rect": [ 323.07695388793945, 480.7229093313217, 61.0, 22.0 ],
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
                                    "patching_rect": [ 395.38465309143066, 546.1538982391357, 39.0, 22.0 ],
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
                                    "patching_rect": [ 323.07695388793945, 421.0, 40.0, 22.0 ],
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
                                    "patching_rect": [ 349.23080253601074, 546.1538982391357, 34.0, 22.0 ],
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
                                    "patching_rect": [ 264.0, 820.0, 47.0, 22.0 ],
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
                                    "patching_rect": [ 156.0, 820.0, 97.0, 22.0 ],
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
                                    "patching_rect": [ 294.0, 899.0, 81.0, 22.0 ],
                                    "text": "mc.target"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-52",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "signal" ],
                                    "patching_rect": [ 111.0, 1159.0, 84.0, 22.0 ],
                                    "text": "mc.unpack~ 2"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-56",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "multichannelsignal" ],
                                    "patching_rect": [ 111.0, 1117.0, 204.0, 22.0 ],
                                    "text": "mc.mixdown~ 2 @pancontrolmode 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-63",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "int", "int" ],
                                    "patching_rect": [ 111.0, 790.0, 47.0, 22.0 ],
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
                                    "patching_rect": [ 111.0, 899.0, 59.0, 22.0 ],
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
                                    "patching_rect": [ 154.0, 753.0, 221.0, 22.0 ],
                                    "text": "mc.noteallocator~ @voices 16 @steal 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-67",
                                    "maxclass": "newobj",
                                    "numinlets": 7,
                                    "numoutlets": 2,
                                    "outlettype": [ "int", "" ],
                                    "patching_rect": [ 80.0, 698.0, 82.0, 22.0 ],
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
                                    "patching_rect": [ 135.0, 642.0, 336.0, 22.0 ],
                                    "text": "pack 0 0"
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
                                    "patching_rect": [ 144.61539840698242, 546.1538982391357, 150.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-73",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 306.15387535095215, 546.1538982391357, 35.0, 22.0 ],
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
                                    "patching_rect": [ 547.6923599243164, 892.3077774047852, 150.0, 22.0 ]
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
                                    "patching_rect": [ 720.0000686645508, 892.3077774047852, 150.0, 22.0 ]
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
                                    "patching_rect": [ 893.8462390899658, 892.3077774047852, 150.0, 22.0 ]
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
                                    "patching_rect": [ 1072.3077945709229, 892.3077774047852, 150.0, 22.0 ]
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
                                    "patching_rect": [ 1246.153964996338, 892.3077774047852, 150.0, 22.0 ]
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
                                    "patching_rect": [ 1413.8462886810303, 892.3077774047852, 150.0, 22.0 ]
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
                                    "patching_rect": [ 1581.5386123657227, 892.3077774047852, 150.0, 22.0 ]
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
                                    "patching_rect": [ 1829.2309436798096, 892.3077774047852, 150.0, 22.0 ]
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
                                    "patching_rect": [ 547.6923599243164, 1224.0, 150.0, 22.0 ]
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
                                    "patching_rect": [ 721.6923599243164, 1224.0, 150.0, 22.0 ]
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
                                    "patching_rect": [ 893.6923599243164, 1224.0, 150.0, 22.0 ]
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
                                    "patching_rect": [ 1057.0, 1224.0, 150.0, 22.0 ]
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
                                    "patching_rect": [ 1270.0, 1224.0, 150.0, 22.0 ]
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
                                    "patching_rect": [ 547.6923599243164, 1533.0, 150.0, 22.0 ]
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
                                    "patching_rect": [ 721.6923599243164, 1533.0, 150.0, 22.0 ]
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
                                    "patching_rect": [ 893.6923599243164, 1533.0, 150.0, 22.0 ]
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
                                    "patching_rect": [ 1064.6923599243164, 1533.0, 150.0, 22.0 ]
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
                                    "patching_rect": [ 561.0, 1845.0, 150.0, 22.0 ]
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
                                    "patching_rect": [ 735.0, 1845.0, 150.0, 22.0 ]
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
                                    "patching_rect": [ 1007.0, 1845.0, 150.0, 22.0 ]
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
                                    "patching_rect": [ 1170.0, 1845.0, 150.0, 22.0 ]
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "obj-8", 0 ],
                                    "source": [ "obj-10", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-99", 0 ],
                                    "source": [ "obj-100", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-100", 0 ],
                                    "source": [ "obj-101", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-100", 0 ],
                                    "source": [ "obj-102", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-100", 0 ],
                                    "source": [ "obj-103", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-54", 0 ],
                                    "source": [ "obj-104", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-104", 0 ],
                                    "source": [ "obj-105", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-105", 0 ],
                                    "source": [ "obj-106", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-106", 0 ],
                                    "source": [ "obj-107", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-107", 0 ],
                                    "source": [ "obj-108", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-107", 0 ],
                                    "source": [ "obj-109", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-56", 1 ],
                                    "source": [ "obj-11", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-107", 0 ],
                                    "source": [ "obj-110", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-57", 0 ],
                                    "source": [ "obj-115", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-115", 0 ],
                                    "source": [ "obj-116", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-116", 0 ],
                                    "source": [ "obj-117", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-117", 0 ],
                                    "source": [ "obj-118", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-118", 0 ],
                                    "source": [ "obj-119", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-8", 0 ],
                                    "source": [ "obj-12", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-118", 0 ],
                                    "source": [ "obj-120", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-118", 0 ],
                                    "source": [ "obj-121", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-58", 0 ],
                                    "source": [ "obj-122", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-122", 0 ],
                                    "source": [ "obj-123", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-123", 0 ],
                                    "source": [ "obj-124", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-124", 0 ],
                                    "source": [ "obj-125", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-125", 0 ],
                                    "source": [ "obj-126", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-125", 0 ],
                                    "source": [ "obj-127", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-125", 0 ],
                                    "source": [ "obj-128", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-59", 0 ],
                                    "source": [ "obj-129", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-8", 0 ],
                                    "source": [ "obj-13", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-129", 0 ],
                                    "source": [ "obj-130", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-130", 0 ],
                                    "source": [ "obj-131", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-131", 0 ],
                                    "source": [ "obj-132", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-132", 0 ],
                                    "source": [ "obj-133", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-132", 0 ],
                                    "source": [ "obj-134", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-132", 0 ],
                                    "source": [ "obj-135", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-60", 0 ],
                                    "source": [ "obj-136", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-136", 0 ],
                                    "source": [ "obj-137", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-137", 0 ],
                                    "source": [ "obj-138", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-138", 0 ],
                                    "source": [ "obj-139", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-43", 0 ],
                                    "source": [ "obj-14", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-139", 0 ],
                                    "source": [ "obj-140", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-139", 0 ],
                                    "source": [ "obj-141", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-139", 0 ],
                                    "source": [ "obj-142", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-61", 0 ],
                                    "source": [ "obj-143", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-143", 0 ],
                                    "source": [ "obj-144", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-144", 0 ],
                                    "source": [ "obj-145", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-145", 0 ],
                                    "source": [ "obj-146", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-146", 0 ],
                                    "source": [ "obj-147", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-146", 0 ],
                                    "source": [ "obj-148", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-146", 0 ],
                                    "source": [ "obj-149", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-44", 0 ],
                                    "source": [ "obj-15", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-62", 0 ],
                                    "source": [ "obj-150", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-150", 0 ],
                                    "source": [ "obj-151", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-151", 0 ],
                                    "source": [ "obj-152", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-152", 0 ],
                                    "source": [ "obj-153", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-153", 0 ],
                                    "source": [ "obj-154", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-153", 0 ],
                                    "source": [ "obj-155", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-153", 0 ],
                                    "source": [ "obj-156", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-64", 0 ],
                                    "source": [ "obj-157", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-157", 0 ],
                                    "source": [ "obj-158", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-158", 0 ],
                                    "source": [ "obj-159", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-17", 0 ],
                                    "source": [ "obj-16", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-159", 0 ],
                                    "source": [ "obj-160", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-160", 0 ],
                                    "source": [ "obj-161", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-160", 0 ],
                                    "source": [ "obj-162", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-160", 0 ],
                                    "source": [ "obj-163", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-69", 0 ],
                                    "source": [ "obj-164", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-164", 0 ],
                                    "source": [ "obj-165", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-165", 0 ],
                                    "source": [ "obj-166", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-166", 0 ],
                                    "source": [ "obj-167", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-167", 0 ],
                                    "source": [ "obj-168", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-167", 0 ],
                                    "source": [ "obj-169", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-6", 0 ],
                                    "source": [ "obj-17", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-167", 0 ],
                                    "source": [ "obj-170", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-71", 0 ],
                                    "source": [ "obj-171", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-171", 0 ],
                                    "source": [ "obj-172", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-172", 0 ],
                                    "source": [ "obj-173", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-173", 0 ],
                                    "source": [ "obj-174", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-174", 0 ],
                                    "source": [ "obj-175", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-174", 0 ],
                                    "source": [ "obj-176", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-174", 0 ],
                                    "source": [ "obj-177", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-74", 0 ],
                                    "source": [ "obj-178", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-178", 0 ],
                                    "source": [ "obj-179", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-15", 0 ],
                                    "source": [ "obj-18", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-179", 0 ],
                                    "source": [ "obj-180", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-180", 0 ],
                                    "source": [ "obj-181", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-181", 0 ],
                                    "source": [ "obj-182", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-181", 0 ],
                                    "source": [ "obj-183", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-181", 0 ],
                                    "source": [ "obj-184", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-75", 0 ],
                                    "source": [ "obj-185", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-185", 0 ],
                                    "source": [ "obj-186", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-186", 0 ],
                                    "source": [ "obj-187", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-187", 0 ],
                                    "source": [ "obj-188", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-188", 0 ],
                                    "source": [ "obj-189", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-18", 0 ],
                                    "source": [ "obj-19", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-188", 0 ],
                                    "source": [ "obj-190", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-188", 0 ],
                                    "source": [ "obj-191", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-76", 0 ],
                                    "source": [ "obj-192", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-192", 0 ],
                                    "source": [ "obj-193", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-193", 0 ],
                                    "source": [ "obj-194", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-194", 0 ],
                                    "source": [ "obj-195", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-195", 0 ],
                                    "source": [ "obj-196", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-195", 0 ],
                                    "source": [ "obj-197", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-195", 0 ],
                                    "source": [ "obj-198", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-77", 0 ],
                                    "source": [ "obj-199", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-19", 0 ],
                                    "source": [ "obj-20", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-199", 0 ],
                                    "source": [ "obj-200", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-200", 0 ],
                                    "source": [ "obj-201", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-201", 0 ],
                                    "source": [ "obj-202", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-202", 0 ],
                                    "source": [ "obj-203", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-202", 0 ],
                                    "source": [ "obj-204", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-202", 0 ],
                                    "source": [ "obj-205", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-20", 0 ],
                                    "source": [ "obj-21", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-103", 0 ],
                                    "midpoints": [ 556.1923599243164, 669.0, 1591.0386123657227, 669.0 ],
                                    "order": 1,
                                    "source": [ "obj-22", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-110", 0 ],
                                    "midpoints": [ 556.1923599243164, 669.0, 1838.7309436798096, 669.0 ],
                                    "order": 0,
                                    "source": [ "obj-22", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-121", 0 ],
                                    "midpoints": [ 556.1923599243164, 669.0, 534.0, 669.0, 534.0, 999.0, 557.1923599243164, 999.0 ],
                                    "order": 19,
                                    "source": [ "obj-22", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-128", 0 ],
                                    "midpoints": [ 556.1923599243164, 669.0, 708.0, 669.0, 708.0, 999.0, 729.5000686645508, 999.0 ],
                                    "order": 16,
                                    "source": [ "obj-22", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-13", 0 ],
                                    "order": 20,
                                    "source": [ "obj-22", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-135", 0 ],
                                    "midpoints": [ 556.1923599243164, 669.0, 708.0, 669.0, 708.0, 999.0, 903.3462390899658, 999.0 ],
                                    "order": 11,
                                    "source": [ "obj-22", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-142", 0 ],
                                    "midpoints": [ 556.1923599243164, 669.0, 1059.0, 669.0, 1059.0, 999.0, 1066.5, 999.0 ],
                                    "order": 8,
                                    "source": [ "obj-22", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-149", 0 ],
                                    "midpoints": [ 556.1923599243164, 669.0, 1233.0, 669.0, 1233.0, 999.0, 1279.5, 999.0 ],
                                    "order": 3,
                                    "source": [ "obj-22", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-156", 0 ],
                                    "midpoints": [ 556.1923599243164, 669.0, 534.0, 669.0, 534.0, 1308.0, 557.1923599243164, 1308.0 ],
                                    "order": 18,
                                    "source": [ "obj-22", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-163", 0 ],
                                    "midpoints": [ 556.1923599243164, 669.0, 534.0, 669.0, 534.0, 1308.0, 731.1923599243164, 1308.0 ],
                                    "order": 14,
                                    "source": [ "obj-22", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-170", 0 ],
                                    "midpoints": [ 556.1923599243164, 669.0, 534.0, 669.0, 534.0, 1308.0, 906.5, 1308.0 ],
                                    "order": 10,
                                    "source": [ "obj-22", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-177", 0 ],
                                    "midpoints": [ 556.1923599243164, 669.0, 534.0, 669.0, 534.0, 1308.0, 1077.5, 1308.0 ],
                                    "order": 7,
                                    "source": [ "obj-22", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-184", 0 ],
                                    "midpoints": [ 556.1923599243164, 669.0, 534.0, 669.0, 534.0, 1614.0, 570.5, 1614.0 ],
                                    "order": 17,
                                    "source": [ "obj-22", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-191", 0 ],
                                    "midpoints": [ 556.1923599243164, 669.0, 534.0, 669.0, 534.0, 1614.0, 744.5, 1614.0 ],
                                    "order": 13,
                                    "source": [ "obj-22", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-198", 0 ],
                                    "midpoints": [ 556.1923599243164, 669.0, 534.0, 669.0, 534.0, 1614.0, 1016.5, 1614.0 ],
                                    "order": 9,
                                    "source": [ "obj-22", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-205", 0 ],
                                    "midpoints": [ 556.1923599243164, 669.0, 534.0, 669.0, 534.0, 1614.0, 1179.5, 1614.0 ],
                                    "order": 5,
                                    "source": [ "obj-22", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-25", 0 ],
                                    "midpoints": [ 556.1923599243164, 669.0, 731.0385303497314, 669.0 ],
                                    "order": 15,
                                    "source": [ "obj-22", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-34", 0 ],
                                    "midpoints": [ 556.1923599243164, 669.0, 903.3462390899658, 669.0 ],
                                    "order": 12,
                                    "source": [ "obj-22", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-53", 0 ],
                                    "midpoints": [ 556.1923599243164, 669.0, 1081.8077945709229, 669.0 ],
                                    "order": 6,
                                    "source": [ "obj-22", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-82", 0 ],
                                    "midpoints": [ 556.1923599243164, 669.0, 1255.653964996338, 669.0 ],
                                    "order": 4,
                                    "source": [ "obj-22", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-96", 0 ],
                                    "midpoints": [ 556.1923599243164, 669.0, 1423.3462886810303, 669.0 ],
                                    "order": 2,
                                    "source": [ "obj-22", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-20", 0 ],
                                    "source": [ "obj-23", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-16", 0 ],
                                    "source": [ "obj-24", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-20", 0 ],
                                    "source": [ "obj-25", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-45", 0 ],
                                    "source": [ "obj-26", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-26", 0 ],
                                    "source": [ "obj-27", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-27", 0 ],
                                    "source": [ "obj-28", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-28", 0 ],
                                    "source": [ "obj-29", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-100", 0 ],
                                    "midpoints": [ 36.5, 537.8494026660919, 1591.0386123657227, 537.8494026660919 ],
                                    "order": 1,
                                    "source": [ "obj-3", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-107", 0 ],
                                    "midpoints": [ 36.5, 537.8494026660919, 1838.7309436798096, 537.8494026660919 ],
                                    "order": 0,
                                    "source": [ "obj-3", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-118", 0 ],
                                    "midpoints": [ 36.5, 531.0, 531.0, 531.0, 531.0, 1098.0, 557.1923599243164, 1098.0 ],
                                    "order": 19,
                                    "source": [ "obj-3", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-125", 0 ],
                                    "midpoints": [ 36.5, 531.0, 531.0, 531.0, 531.0, 999.0, 717.0, 999.0, 717.0, 1095.0, 729.5000686645508, 1095.0 ],
                                    "order": 16,
                                    "source": [ "obj-3", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-132", 0 ],
                                    "midpoints": [ 36.5, 531.0, 531.0, 531.0, 531.0, 999.0, 888.0, 999.0, 888.0, 1098.0, 903.3462390899658, 1098.0 ],
                                    "order": 11,
                                    "source": [ "obj-3", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-139", 0 ],
                                    "midpoints": [ 36.5, 531.0, 1053.0, 531.0, 1053.0, 1095.0, 1066.5, 1095.0 ],
                                    "order": 8,
                                    "source": [ "obj-3", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-146", 0 ],
                                    "midpoints": [ 36.5, 531.0, 1233.0, 531.0, 1233.0, 1098.0, 1279.5, 1098.0 ],
                                    "order": 3,
                                    "source": [ "obj-3", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-153", 0 ],
                                    "midpoints": [ 36.5, 531.0, 531.0, 531.0, 531.0, 1407.0, 557.1923599243164, 1407.0 ],
                                    "order": 18,
                                    "source": [ "obj-3", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-160", 0 ],
                                    "midpoints": [ 36.5, 531.0, 531.0, 531.0, 531.0, 1308.0, 708.0, 1308.0, 708.0, 1407.0, 731.1923599243164, 1407.0 ],
                                    "order": 14,
                                    "source": [ "obj-3", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-167", 0 ],
                                    "midpoints": [ 36.5, 531.0, 531.0, 531.0, 531.0, 1308.0, 882.0, 1308.0, 882.0, 1407.0, 906.5, 1407.0 ],
                                    "order": 10,
                                    "source": [ "obj-3", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-174", 0 ],
                                    "midpoints": [ 36.5, 857.3494026660919, 1077.5, 857.3494026660919 ],
                                    "order": 7,
                                    "source": [ "obj-3", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-181", 0 ],
                                    "midpoints": [ 36.5, 531.0, 531.0, 531.0, 531.0, 1713.0, 570.5, 1713.0 ],
                                    "order": 17,
                                    "source": [ "obj-3", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-188", 0 ],
                                    "midpoints": [ 36.5, 531.0, 531.0, 531.0, 531.0, 1614.0, 732.0, 1614.0, 732.0, 1710.0, 744.5, 1710.0 ],
                                    "order": 13,
                                    "source": [ "obj-3", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-195", 0 ],
                                    "midpoints": [ 36.5, 531.0, 531.0, 531.0, 531.0, 1614.0, 993.0, 1614.0, 993.0, 1713.0, 1016.5, 1713.0 ],
                                    "order": 9,
                                    "source": [ "obj-3", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-20", 0 ],
                                    "midpoints": [ 36.5, 531.0, 708.0, 531.0, 708.0, 768.0, 731.0385303497314, 768.0 ],
                                    "order": 15,
                                    "source": [ "obj-3", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-202", 0 ],
                                    "midpoints": [ 36.5, 986.3494026660919, 1179.5, 986.3494026660919 ],
                                    "order": 5,
                                    "source": [ "obj-3", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-29", 0 ],
                                    "midpoints": [ 36.5, 531.0, 888.0, 531.0, 888.0, 768.0, 903.3462390899658, 768.0 ],
                                    "order": 12,
                                    "source": [ "obj-3", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-39", 0 ],
                                    "midpoints": [ 36.5, 531.0, 1059.0, 531.0, 1059.0, 768.0, 1081.8077945709229, 768.0 ],
                                    "order": 6,
                                    "source": [ "obj-3", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-79", 0 ],
                                    "midpoints": [ 36.5, 531.0, 1233.0, 531.0, 1233.0, 768.0, 1255.653964996338, 768.0 ],
                                    "order": 4,
                                    "source": [ "obj-3", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-8", 0 ],
                                    "midpoints": [ 36.5, 531.0, 531.0, 531.0, 531.0, 768.0, 557.1923599243164, 768.0 ],
                                    "order": 20,
                                    "source": [ "obj-3", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-90", 0 ],
                                    "midpoints": [ 36.5, 531.0, 1410.0, 531.0, 1410.0, 765.0, 1423.3462886810303, 765.0 ],
                                    "order": 2,
                                    "source": [ "obj-3", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-65", 0 ],
                                    "source": [ "obj-30", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-29", 0 ],
                                    "source": [ "obj-31", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-29", 0 ],
                                    "source": [ "obj-32", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-4", 0 ],
                                    "source": [ "obj-33", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-29", 0 ],
                                    "source": [ "obj-34", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-46", 0 ],
                                    "source": [ "obj-35", 0 ]
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
                                    "destination": [ "obj-35", 0 ],
                                    "source": [ "obj-37", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-37", 0 ],
                                    "source": [ "obj-38", 1 ]
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
                                    "destination": [ "obj-68", 1 ],
                                    "source": [ "obj-4", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-68", 0 ],
                                    "source": [ "obj-4", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-48", 0 ],
                                    "midpoints": [ 165.5, 893.0, 303.5, 893.0 ],
                                    "source": [ "obj-40", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-39", 0 ],
                                    "source": [ "obj-41", 0 ]
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
                                    "midpoints": [ 557.1923599243164, 941.7693824768066, 120.5, 941.7693824768066 ],
                                    "source": [ "obj-43", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-5", 0 ],
                                    "midpoints": [ 729.5000686645508, 945.7693824768066, 120.5, 945.7693824768066 ],
                                    "source": [ "obj-44", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-5", 0 ],
                                    "midpoints": [ 903.3462390899658, 949.7693824768066, 120.5, 949.7693824768066 ],
                                    "source": [ "obj-45", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-5", 0 ],
                                    "midpoints": [ 1081.8077945709229, 954.7693824768066, 120.5, 954.7693824768066 ],
                                    "source": [ "obj-46", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-5", 0 ],
                                    "midpoints": [ 1255.653964996338, 959.7693824768066, 120.5, 959.7693824768066 ],
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
                                    "destination": [ "obj-39", 0 ],
                                    "source": [ "obj-49", 0 ]
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
                                    "midpoints": [ 120.5, 1054.7693824768066, 97.92318725585938, 1054.7693824768066, 97.92318725585938, 741.7693824768066, 163.5, 741.7693824768066 ],
                                    "order": 0,
                                    "source": [ "obj-5", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-5", 0 ],
                                    "midpoints": [ 1423.3462886810303, 965.7693824768066, 120.5, 965.7693824768066 ],
                                    "source": [ "obj-50", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-5", 0 ],
                                    "midpoints": [ 1591.0386123657227, 969.7693824768066, 120.5, 969.7693824768066 ],
                                    "source": [ "obj-51", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-1", 0 ],
                                    "source": [ "obj-52", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-2", 0 ],
                                    "source": [ "obj-52", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-39", 0 ],
                                    "source": [ "obj-53", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-5", 0 ],
                                    "midpoints": [ 1838.7309436798096, 974.7693824768066, 120.5, 974.7693824768066 ],
                                    "source": [ "obj-54", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-47", 0 ],
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
                                    "midpoints": [ 557.1923599243164, 1260.7693824768066, 352.9231872558594, 1260.7693824768066, 352.9231872558594, 977.7693824768066, 120.5, 977.7693824768066 ],
                                    "source": [ "obj-57", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-5", 0 ],
                                    "midpoints": [ 731.1923599243164, 1265.7693824768066, 346.9231872558594, 1265.7693824768066, 346.9231872558594, 977.7693824768066, 120.5, 977.7693824768066 ],
                                    "source": [ "obj-58", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-5", 0 ],
                                    "midpoints": [ 903.1923599243164, 1268.7693824768066, 339.9231872558594, 1268.7693824768066, 339.9231872558594, 977.7693824768066, 120.5, 977.7693824768066 ],
                                    "source": [ "obj-59", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-11", 0 ],
                                    "source": [ "obj-6", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-5", 0 ],
                                    "midpoints": [ 1066.5, 1273.7693824768066, 332.9231872558594, 1273.7693824768066, 332.9231872558594, 977.7693824768066, 120.5, 977.7693824768066 ],
                                    "source": [ "obj-60", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-5", 0 ],
                                    "midpoints": [ 1279.5, 1278.7693824768066, 326.9231872558594, 1278.7693824768066, 326.9231872558594, 981.7693824768066, 120.5, 981.7693824768066 ],
                                    "source": [ "obj-61", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-5", 0 ],
                                    "midpoints": [ 557.1923599243164, 1561.7693824768066, 384.9231872558594, 1561.7693824768066, 384.9231872558594, 977.7693824768066, 120.5, 977.7693824768066 ],
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
                                    "midpoints": [ 731.1923599243164, 1567.7693824768066, 378.9231872558594, 1567.7693824768066, 378.9231872558594, 977.7693824768066, 120.5, 977.7693824768066 ],
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
                                    "destination": [ "obj-24", 0 ],
                                    "midpoints": [ 163.5, 793.0, 396.5, 793.0 ],
                                    "order": 0,
                                    "source": [ "obj-66", 0 ]
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
                                    "order": 1,
                                    "source": [ "obj-66", 5 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-6", 1 ],
                                    "midpoints": [ 365.5, 785.0, 505.5, 785.0 ],
                                    "order": 0,
                                    "source": [ "obj-66", 5 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-63", 0 ],
                                    "order": 1,
                                    "source": [ "obj-66", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-65", 1 ],
                                    "midpoints": [ 365.5, 882.0, 160.5, 882.0 ],
                                    "order": 2,
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
                                    "midpoints": [ 903.1923599243164, 1576.7693824768066, 372.9231872558594, 1576.7693824768066, 372.9231872558594, 977.7693824768066, 120.5, 977.7693824768066 ],
                                    "source": [ "obj-69", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-9", 0 ],
                                    "source": [ "obj-7", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-55", 0 ],
                                    "source": [ "obj-70", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-5", 0 ],
                                    "midpoints": [ 1074.1923599243164, 1582.7693824768066, 366.9231872558594, 1582.7693824768066, 366.9231872558594, 977.7693824768066, 120.5, 977.7693824768066 ],
                                    "source": [ "obj-71", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-4", 0 ],
                                    "source": [ "obj-72", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-4", 0 ],
                                    "source": [ "obj-73", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-5", 0 ],
                                    "midpoints": [ 570.5, 1880.7693824768066, 416.9231872558594, 1880.7693824768066, 416.9231872558594, 977.7693824768066, 120.5, 977.7693824768066 ],
                                    "source": [ "obj-74", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-5", 0 ],
                                    "midpoints": [ 744.5, 1884.7693824768066, 410.9231872558594, 1884.7693824768066, 410.9231872558594, 977.7693824768066, 120.5, 977.7693824768066 ],
                                    "source": [ "obj-75", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-5", 0 ],
                                    "midpoints": [ 1016.5, 1888.7693824768066, 403.9231872558594, 1888.7693824768066, 403.9231872558594, 1436.7693824768066, 403.9231872558594, 1436.7693824768066, 403.9231872558594, 977.7693824768066, 120.5, 977.7693824768066 ],
                                    "source": [ "obj-76", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-5", 0 ],
                                    "midpoints": [ 1179.5, 1892.7693824768066, 396.9231872558594, 1892.7693824768066, 396.9231872558594, 977.7693824768066, 120.5, 977.7693824768066 ],
                                    "source": [ "obj-77", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-70", 0 ],
                                    "source": [ "obj-78", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-78", 0 ],
                                    "source": [ "obj-79", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-7", 0 ],
                                    "source": [ "obj-8", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-79", 0 ],
                                    "source": [ "obj-80", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-79", 0 ],
                                    "source": [ "obj-81", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-79", 0 ],
                                    "source": [ "obj-82", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-94", 0 ],
                                    "source": [ "obj-83", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-50", 0 ],
                                    "source": [ "obj-84", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-84", 0 ],
                                    "source": [ "obj-85", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-85", 0 ],
                                    "source": [ "obj-86", 1 ]
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
                                    "destination": [ "obj-83", 0 ],
                                    "source": [ "obj-88", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-83", 1 ],
                                    "source": [ "obj-89", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-14", 0 ],
                                    "source": [ "obj-9", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-86", 0 ],
                                    "source": [ "obj-90", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-22", 0 ],
                                    "source": [ "obj-91", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-90", 0 ],
                                    "source": [ "obj-92", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-90", 0 ],
                                    "source": [ "obj-93", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-4", 0 ],
                                    "source": [ "obj-94", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-94", 0 ],
                                    "source": [ "obj-95", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-90", 0 ],
                                    "source": [ "obj-96", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-51", 0 ],
                                    "source": [ "obj-97", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-97", 0 ],
                                    "source": [ "obj-98", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-98", 0 ],
                                    "source": [ "obj-99", 1 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 1920.481998682022, 598.7952028512955, 61.0, 22.0 ],
                    "text": "p JunoXP",
                    "varname": "junoXP"
                }
            },
            {
                "box": {
                    "id": "obj-7",
                    "maxclass": "newobj",
                    "numinlets": 1,
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
                        "rect": [ 414.0, 113.0, 1587.0, 754.0 ],
                        "boxes": [
                            {
                                "box": {
                                    "id": "obj-12",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 440.7080000638962, 299.11506831645966, 103.0, 22.0 ],
                                    "text": "scale 0. 256. 0. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-74",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 410.7080000638962, 416.0442811846733, 199.1150602698326, 20.0 ],
                                    "text": "[expr min * pow(max/min, $f1/N.)]"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-56",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 1246.9027552008629, 270.79648196697235, 109.0, 22.0 ],
                                    "text": "if $f1 >= 0 then $f1"
                                }
                            },
                            {
                                "box": {
                                    "fontface": 0,
                                    "fontname": "Arial",
                                    "fontsize": 12.0,
                                    "id": "obj-57",
                                    "interval": 20.0,
                                    "maxclass": "number~",
                                    "mode": 2,
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "float" ],
                                    "patching_rect": [ 1246.9027552008629, 240.7079839706421, 56.0, 22.0 ],
                                    "sig": 0.0
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-58",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "signal" ],
                                    "patching_rect": [ 1246.9027552008629, 208.84957432746887, 94.0, 22.0 ],
                                    "text": "gen~ b5_reader"
                                }
                            },
                            {
                                "box": {
                                    "attr": "kind",
                                    "displaymode": 1,
                                    "id": "obj-59",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 1246.9027552008629, 172.56638556718826, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "kind", 2.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[96]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[24]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[18]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "chIndex",
                                    "displaymode": 1,
                                    "id": "obj-60",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 1246.9027552008629, 145.13275504112244, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "chIndex", 7.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[97]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[25]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[19]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "buf",
                                    "id": "obj-61",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 1246.9027552008629, 118.58408033847809, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "buf", "t5_buf" ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[98]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[58]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[20]"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-50",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 1084.9558395147324, 270.79648196697235, 109.0, 22.0 ],
                                    "text": "if $f1 >= 0 then $f1"
                                }
                            },
                            {
                                "box": {
                                    "fontface": 0,
                                    "fontname": "Arial",
                                    "fontsize": 12.0,
                                    "id": "obj-51",
                                    "interval": 20.0,
                                    "maxclass": "number~",
                                    "mode": 2,
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "float" ],
                                    "patching_rect": [ 1084.9558395147324, 240.7079839706421, 56.0, 22.0 ],
                                    "sig": 0.0
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-52",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "signal" ],
                                    "patching_rect": [ 1084.9558395147324, 208.84957432746887, 94.0, 22.0 ],
                                    "text": "gen~ b5_reader"
                                }
                            },
                            {
                                "box": {
                                    "attr": "kind",
                                    "displaymode": 1,
                                    "id": "obj-53",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 1084.9558395147324, 172.56638556718826, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "kind", 4.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[99]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[24]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[13]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "chIndex",
                                    "displaymode": 1,
                                    "id": "obj-54",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 1084.9558395147324, 145.13275504112244, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "chIndex", 6.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[100]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[25]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[14]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "buf",
                                    "id": "obj-55",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 1084.9558395147324, 118.58408033847809, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "buf", "t5_buf" ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[101]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[58]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[17]"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-44",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 925.6637912988663, 270.79648196697235, 109.0, 22.0 ],
                                    "text": "if $f1 >= 0 then $f1"
                                }
                            },
                            {
                                "box": {
                                    "fontface": 0,
                                    "fontname": "Arial",
                                    "fontsize": 12.0,
                                    "id": "obj-45",
                                    "interval": 20.0,
                                    "maxclass": "number~",
                                    "mode": 2,
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "float" ],
                                    "patching_rect": [ 925.6637912988663, 240.7079839706421, 56.0, 22.0 ],
                                    "sig": 0.0
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-46",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "signal" ],
                                    "patching_rect": [ 925.6637912988663, 208.84957432746887, 94.0, 22.0 ],
                                    "text": "gen~ b5_reader"
                                }
                            },
                            {
                                "box": {
                                    "attr": "kind",
                                    "displaymode": 1,
                                    "id": "obj-47",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 925.6637912988663, 172.56638556718826, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "kind", 2.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[102]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[24]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[10]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "chIndex",
                                    "displaymode": 1,
                                    "id": "obj-48",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 925.6637912988663, 145.13275504112244, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "chIndex", 5.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[103]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[25]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[11]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "buf",
                                    "id": "obj-49",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 925.6637912988663, 118.58408033847809, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "buf", "t5_buf" ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[104]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[58]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[12]"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-37",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 763.7168756127357, 270.79648196697235, 109.0, 22.0 ],
                                    "text": "if $f1 >= 0 then $f1"
                                }
                            },
                            {
                                "box": {
                                    "fontface": 0,
                                    "fontname": "Arial",
                                    "fontsize": 12.0,
                                    "id": "obj-38",
                                    "interval": 20.0,
                                    "maxclass": "number~",
                                    "mode": 2,
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "float" ],
                                    "patching_rect": [ 763.7168756127357, 240.7079839706421, 56.0, 22.0 ],
                                    "sig": 0.0
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-39",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "signal" ],
                                    "patching_rect": [ 763.7168756127357, 208.84957432746887, 94.0, 22.0 ],
                                    "text": "gen~ b5_reader"
                                }
                            },
                            {
                                "box": {
                                    "attr": "kind",
                                    "displaymode": 1,
                                    "id": "obj-40",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 763.7168756127357, 172.56638556718826, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "kind", 2.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[105]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[24]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[7]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "chIndex",
                                    "displaymode": 1,
                                    "id": "obj-41",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 763.7168756127357, 145.13275504112244, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "chIndex", 4.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[106]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[25]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[8]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "buf",
                                    "id": "obj-43",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 763.7168756127357, 118.58408033847809, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "buf", "t5_buf" ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[107]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[58]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[9]"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-31",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 600.8850041031837, 270.79648196697235, 109.0, 22.0 ],
                                    "text": "if $f1 >= 0 then $f1"
                                }
                            },
                            {
                                "box": {
                                    "fontface": 0,
                                    "fontname": "Arial",
                                    "fontsize": 12.0,
                                    "id": "obj-32",
                                    "interval": 20.0,
                                    "maxclass": "number~",
                                    "mode": 2,
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "float" ],
                                    "patching_rect": [ 600.8850041031837, 240.7079839706421, 56.0, 22.0 ],
                                    "sig": 0.0
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-33",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "signal" ],
                                    "patching_rect": [ 600.8850041031837, 208.84957432746887, 94.0, 22.0 ],
                                    "text": "gen~ b5_reader"
                                }
                            },
                            {
                                "box": {
                                    "attr": "kind",
                                    "displaymode": 1,
                                    "id": "obj-34",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 600.8850041031837, 172.56638556718826, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "kind", 2.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[108]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[24]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[4]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "chIndex",
                                    "displaymode": 1,
                                    "id": "obj-35",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 600.8850041031837, 145.13275504112244, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "chIndex", 3.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[109]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[25]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[5]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "buf",
                                    "id": "obj-36",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 600.8850041031837, 118.58408033847809, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "buf", "t5_buf" ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[110]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[58]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[6]"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-25",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 440.7080000638962, 270.79648196697235, 109.0, 22.0 ],
                                    "text": "if $f1 >= 0 then $f1"
                                }
                            },
                            {
                                "box": {
                                    "fontface": 0,
                                    "fontname": "Arial",
                                    "fontsize": 12.0,
                                    "id": "obj-26",
                                    "interval": 20.0,
                                    "maxclass": "number~",
                                    "mode": 2,
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "float" ],
                                    "patching_rect": [ 440.7080000638962, 240.7079839706421, 56.0, 22.0 ],
                                    "sig": 0.0
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-27",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "signal" ],
                                    "patching_rect": [ 440.7080000638962, 208.84957432746887, 94.0, 22.0 ],
                                    "text": "gen~ b5_reader"
                                }
                            },
                            {
                                "box": {
                                    "attr": "kind",
                                    "displaymode": 1,
                                    "id": "obj-28",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 440.7080000638962, 172.56638556718826, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "kind", 2.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[111]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[24]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[1]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "chIndex",
                                    "displaymode": 1,
                                    "id": "obj-29",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 440.7080000638962, 145.13275504112244, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "chIndex", 2.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[112]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[25]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[2]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "buf",
                                    "id": "obj-30",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 440.7080000638962, 118.58408033847809, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "buf", "t5_buf" ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[113]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[58]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[3]"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-24",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 1246.9027552008629, 299.11506831645966, 107.0, 22.0 ],
                                    "text": "scale 0. 256. 1. 30"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-23",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 1084.9558395147324, 299.11506831645966, 150.0, 22.0 ],
                                    "text": "scale 0. 65535. 800. 6000."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-21",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 925.6637912988663, 299.11506831645966, 103.0, 22.0 ],
                                    "text": "scale 0. 256. 0. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-20",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 763.7168756127357, 299.11506831645966, 103.0, 22.0 ],
                                    "text": "scale 0. 256. 0. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-19",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 600.8850041031837, 299.11506831645966, 117.0, 22.0 ],
                                    "text": "scale 0. 256. 0.02 2."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-18",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 440.7080000638962, 451.3274699449539, 150.0, 22.0 ],
                                    "text": "scale 0. 65535. 800. 6000."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-42",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 38.938056230545044, 285.8407309651375, 50.0, 22.0 ],
                                    "text": ">=~ 0.5"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-9",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 38.938056230545044, 247.78763055801392, 42.0, 22.0 ],
                                    "text": "delta~"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-121",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 282.30090767145157, 299.11506831645966, 103.0, 22.0 ],
                                    "text": "scale 0. 256. 0. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-95",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "signal" ],
                                    "patching_rect": [ 38.938056230545044, 208.84957432746887, 94.0, 22.0 ],
                                    "text": "gen~ b5_reader"
                                }
                            },
                            {
                                "box": {
                                    "attr": "kind",
                                    "displaymode": 1,
                                    "id": "obj-96",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 38.938056230545044, 172.56638556718826, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "kind", 1.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[114]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[24]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[33]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "chIndex",
                                    "displaymode": 1,
                                    "id": "obj-97",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 38.938056230545044, 145.13275504112244, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "chIndex", 0.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[115]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[25]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[34]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "buf",
                                    "id": "obj-99",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 38.938056230545044, 118.58408033847809, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "buf", "t5_buf" ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[116]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[58]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[35]"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-91",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "patching_rect": [ 151.32744580507278, -6.194690763950348, 58.0, 22.0 ],
                                    "text": "loadbang"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-65",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 282.30090767145157, 270.79648196697235, 109.0, 22.0 ],
                                    "text": "if $f1 >= 0 then $f1"
                                }
                            },
                            {
                                "box": {
                                    "fontface": 0,
                                    "fontname": "Arial",
                                    "fontsize": 12.0,
                                    "id": "obj-66",
                                    "interval": 20.0,
                                    "maxclass": "number~",
                                    "mode": 2,
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "float" ],
                                    "patching_rect": [ 282.30090767145157, 240.7079839706421, 56.0, 22.0 ],
                                    "sig": 0.0
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-67",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "signal" ],
                                    "patching_rect": [ 282.30090767145157, 208.84957432746887, 94.0, 22.0 ],
                                    "text": "gen~ b5_reader"
                                }
                            },
                            {
                                "box": {
                                    "attr": "kind",
                                    "displaymode": 1,
                                    "id": "obj-68",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 282.30090767145157, 172.56638556718826, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "kind", 2.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[117]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[24]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[15]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "chIndex",
                                    "displaymode": 1,
                                    "id": "obj-69",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 282.30090767145157, 145.13275504112244, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "chIndex", 1.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[118]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[25]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[16]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "buf",
                                    "id": "obj-71",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 282.30090767145157, 118.58408033847809, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "buf", "t5_buf" ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[119]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[58]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-22",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 151.32744580507278, 21.23893976211548, 42.0, 22.0 ],
                                    "text": "t6_buf"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-10",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
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
                                        "classnamespace": "dsp.gen",
                                        "rect": [ 69.0, 378.0, 939.0, 1134.0 ],
                                        "boxes": [
                                            {
                                                "box": {
                                                    "id": "obj-6",
                                                    "maxclass": "newobj",
                                                    "numinlets": 1,
                                                    "numoutlets": 0,
                                                    "patching_rect": [ 825.0, 1032.0, 35.0, 22.0 ],
                                                    "text": "out 2"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "code": "// 909-style Hi-hat — oscillator cluster + noise, two-stage decay, attack burst\r\n\r\nParam amp(0.8);            // (type=coeff, default=0.8, scale=[0,1])\r\nParam tone(0.5);           // (type=coeff, default=0.5, scale=[0,1])\r\nParam decayRate(0.15);     // (type=s, default=0.15, scale=[0.02,2.0])\r\nParam decayShape(0.3);     // (type=coeff, default=0.3, scale=[0,1])\r\nParam attackEnergy(0.4);   // (type=coeff, default=0.4, scale=[0,1])\r\nParam pitch(2200);         // (type=hz, default=2200, scale=[800,6000])\r\nParam attackTime(4);       // (type=ms, default=4, scale=[1,30])\r\n\r\nHistory trig_prev(0);\r\nHistory env_fast(0), env_slow(0), burst_env(0);\r\nHistory ph1(0), ph2(0), ph3(0), ph4(0), ph5(0), ph6(0);\r\nHistory hp1(0), hp2(0), hp3(0);\r\n\r\n// classic 909-style inharmonic ratio set\r\nr1 = 1.0;\r\nr2 = 1.288;\r\nr3 = 1.483;\r\nr4 = 1.634;\r\nr5 = 1.951;\r\nr6 = 2.546;\r\n\r\n// --- trigger ---\r\ntrig = in1 > 0.5 && trig_prev <= 0.5;\r\ntrig_prev = in1;\r\n\r\n// --- two-stage decay envelope ---\r\nfast_coeff = pow(0.001, 1 / (decayRate * 0.25 * samplerate));\r\nslow_time  = decayRate * (1 + decayShape * 6);\r\nslow_coeff = pow(0.001, 1 / (slow_time * samplerate));\r\n\r\nenv_fast = trig ? 1 : env_fast * fast_coeff;\r\nenv_slow = trig ? 1 : env_slow * slow_coeff;\r\n\r\nenv = env_fast * (1 - decayShape) + env_slow * decayShape;\r\n\r\n// --- attack burst (independent transient layer) ---\r\nburst_coeff = pow(0.001, 1 / ((attackTime / 1000) * samplerate));\r\nburst_env = trig ? 1 : burst_env * burst_coeff;\r\nburst_sig = (noise() * 2 - 1) * burst_env * attackEnergy;\r\n\r\n// --- oscillator cluster ---\r\nph1 = ph1 + pitch * r1 / samplerate;\r\nif (ph1 > 1) ph1 = ph1 - 1;\r\nosc1 = ph1 < 0.5 ? 1 : -1;\r\n\r\nph2 = ph2 + pitch * r2 / samplerate;\r\nif (ph2 > 1) ph2 = ph2 - 1;\r\nosc2 = ph2 < 0.5 ? 1 : -1;\r\n\r\nph3 = ph3 + pitch * r3 / samplerate;\r\nif (ph3 > 1) ph3 = ph3 - 1;\r\nosc3 = ph3 < 0.5 ? 1 : -1;\r\n\r\nph4 = ph4 + pitch * r4 / samplerate;\r\nif (ph4 > 1) ph4 = ph4 - 1;\r\nosc4 = ph4 < 0.5 ? 1 : -1;\r\n\r\nph5 = ph5 + pitch * r5 / samplerate;\r\nif (ph5 > 1) ph5 = ph5 - 1;\r\nosc5 = ph5 < 0.5 ? 1 : -1;\r\n\r\nph6 = ph6 + pitch * r6 / samplerate;\r\nif (ph6 > 1) ph6 = ph6 - 1;\r\nosc6 = ph6 < 0.5 ? 1 : -1;\r\n\r\nosc_mix = (osc1 + osc2 + osc3 + osc4 + osc5 + osc6) / 6;\r\n\r\n// --- noise layer ---\r\nn = noise() * 2 - 1;\r\nhp1 = n  - 0.7 * hp1;\r\nhp2 = hp1 - 0.7 * hp2;\r\nhp3 = hp2 - 0.7 * hp3;\r\nnoise_layer = hp3;\r\n\r\n// --- tone crossfade + envelope + burst ---\r\nbody = osc_mix * (1 - tone) + noise_layer * tone;\r\n\r\nshaped = tanh((body * env + burst_sig) * 2.5) * amp;\r\n\r\nout1 = shaped;\r\nout2 = shaped;",
                                                    "fontface": 0,
                                                    "fontname": "<Monospaced>",
                                                    "fontsize": 12.0,
                                                    "id": "obj-5",
                                                    "maxclass": "codebox",
                                                    "numinlets": 1,
                                                    "numoutlets": 2,
                                                    "outlettype": [ "", "" ],
                                                    "patching_rect": [ 92.0, 35.0, 752.0, 930.0 ]
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-1",
                                                    "maxclass": "newobj",
                                                    "numinlets": 0,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "" ],
                                                    "patching_rect": [ 31.0, 18.0, 28.0, 22.0 ],
                                                    "text": "in 1"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-4",
                                                    "maxclass": "newobj",
                                                    "numinlets": 1,
                                                    "numoutlets": 0,
                                                    "patching_rect": [ 92.0, 1032.0, 35.0, 22.0 ],
                                                    "text": "out 1"
                                                }
                                            }
                                        ],
                                        "lines": [
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-5", 0 ],
                                                    "source": [ "obj-1", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-4", 0 ],
                                                    "source": [ "obj-5", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-6", 0 ],
                                                    "source": [ "obj-5", 1 ]
                                                }
                                            }
                                        ]
                                    },
                                    "patching_rect": [ 38.938056230545044, 415.0442811846733, 103.0, 22.0 ],
                                    "text": "gen~ hihatDSP10",
                                    "varname": "hihatDSP10"
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-6",
                                    "index": 2,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 93.8053172826767, 560.1770362257957, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-5",
                                    "index": 1,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 19.469028115272522, 555.7522571086884, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-4",
                                    "index": 1,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 11.0, 2.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "attr": "amp",
                                    "id": "obj-13",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 282.30090767145157, 338.0531245470047, 150.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "attr": "tone",
                                    "id": "obj-1",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 440.7080000638962, 338.0531245470047, 150.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "attr": "decayRate",
                                    "id": "obj-2",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 604.0, 338.0, 150.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "attr": "decayShape",
                                    "id": "obj-3",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 763.7168756127357, 338.0, 150.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "attr": "attackEnergy",
                                    "id": "obj-7",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 925.6637912988663, 338.0, 150.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "attr": "pitch",
                                    "id": "obj-8",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 1088.0, 338.0, 150.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "attr": "attackTime",
                                    "id": "obj-11",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 1250.0, 338.0, 150.0, 22.0 ]
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "obj-10", 0 ],
                                    "source": [ "obj-1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-5", 0 ],
                                    "source": [ "obj-10", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-6", 0 ],
                                    "source": [ "obj-10", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-10", 0 ],
                                    "source": [ "obj-11", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-1", 0 ],
                                    "source": [ "obj-12", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-13", 0 ],
                                    "source": [ "obj-121", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-10", 0 ],
                                    "source": [ "obj-13", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-2", 0 ],
                                    "source": [ "obj-19", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-10", 0 ],
                                    "source": [ "obj-2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-3", 0 ],
                                    "source": [ "obj-20", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-7", 0 ],
                                    "source": [ "obj-21", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-30", 0 ],
                                    "order": 5,
                                    "source": [ "obj-22", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-36", 0 ],
                                    "order": 4,
                                    "source": [ "obj-22", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-43", 0 ],
                                    "order": 3,
                                    "source": [ "obj-22", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-49", 0 ],
                                    "order": 2,
                                    "source": [ "obj-22", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-55", 0 ],
                                    "order": 1,
                                    "source": [ "obj-22", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-61", 0 ],
                                    "order": 0,
                                    "source": [ "obj-22", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-71", 0 ],
                                    "midpoints": [ 160.82744580507278, 90.23893976211548, 291.80090767145157, 90.23893976211548 ],
                                    "order": 6,
                                    "source": [ "obj-22", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-99", 0 ],
                                    "midpoints": [ 160.82744580507278, 103.23893976211548, 48.438056230545044, 103.23893976211548 ],
                                    "order": 7,
                                    "source": [ "obj-22", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-8", 0 ],
                                    "source": [ "obj-23", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-11", 0 ],
                                    "source": [ "obj-24", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-12", 0 ],
                                    "source": [ "obj-25", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-25", 0 ],
                                    "source": [ "obj-26", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-26", 0 ],
                                    "source": [ "obj-27", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-27", 0 ],
                                    "source": [ "obj-28", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-27", 0 ],
                                    "source": [ "obj-29", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-10", 0 ],
                                    "source": [ "obj-3", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-27", 0 ],
                                    "source": [ "obj-30", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-19", 0 ],
                                    "source": [ "obj-31", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-31", 0 ],
                                    "source": [ "obj-32", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-32", 0 ],
                                    "source": [ "obj-33", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-33", 0 ],
                                    "source": [ "obj-34", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-33", 0 ],
                                    "source": [ "obj-35", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-33", 0 ],
                                    "source": [ "obj-36", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-20", 0 ],
                                    "source": [ "obj-37", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-37", 0 ],
                                    "source": [ "obj-38", 1 ]
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
                                    "destination": [ "obj-27", 0 ],
                                    "order": 5,
                                    "source": [ "obj-4", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-33", 0 ],
                                    "order": 4,
                                    "source": [ "obj-4", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-39", 0 ],
                                    "order": 3,
                                    "source": [ "obj-4", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-46", 0 ],
                                    "order": 2,
                                    "source": [ "obj-4", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-52", 0 ],
                                    "order": 1,
                                    "source": [ "obj-4", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-58", 0 ],
                                    "order": 0,
                                    "source": [ "obj-4", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-67", 0 ],
                                    "order": 6,
                                    "source": [ "obj-4", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-95", 0 ],
                                    "order": 7,
                                    "source": [ "obj-4", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-39", 0 ],
                                    "source": [ "obj-40", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-39", 0 ],
                                    "source": [ "obj-41", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-10", 0 ],
                                    "source": [ "obj-42", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-39", 0 ],
                                    "source": [ "obj-43", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-21", 0 ],
                                    "source": [ "obj-44", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-44", 0 ],
                                    "source": [ "obj-45", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-45", 0 ],
                                    "source": [ "obj-46", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-46", 0 ],
                                    "source": [ "obj-47", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-46", 0 ],
                                    "source": [ "obj-48", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-46", 0 ],
                                    "source": [ "obj-49", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-23", 0 ],
                                    "source": [ "obj-50", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-50", 0 ],
                                    "source": [ "obj-51", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-51", 0 ],
                                    "source": [ "obj-52", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-52", 0 ],
                                    "source": [ "obj-53", 0 ]
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
                                    "destination": [ "obj-52", 0 ],
                                    "source": [ "obj-55", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-24", 0 ],
                                    "source": [ "obj-56", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-56", 0 ],
                                    "source": [ "obj-57", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-57", 0 ],
                                    "source": [ "obj-58", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-58", 0 ],
                                    "source": [ "obj-59", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-58", 0 ],
                                    "source": [ "obj-60", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-58", 0 ],
                                    "source": [ "obj-61", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-121", 0 ],
                                    "source": [ "obj-65", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-65", 0 ],
                                    "source": [ "obj-66", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-66", 0 ],
                                    "source": [ "obj-67", 0 ]
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
                                    "destination": [ "obj-67", 0 ],
                                    "source": [ "obj-69", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-10", 0 ],
                                    "source": [ "obj-7", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-67", 0 ],
                                    "source": [ "obj-71", 0 ]
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
                                    "destination": [ "obj-42", 0 ],
                                    "source": [ "obj-9", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-22", 0 ],
                                    "source": [ "obj-91", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-9", 0 ],
                                    "source": [ "obj-95", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-95", 0 ],
                                    "source": [ "obj-96", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-95", 0 ],
                                    "source": [ "obj-97", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-95", 0 ],
                                    "source": [ "obj-99", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 1768.6747641563416, 598.7952028512955, 53.0, 22.0 ],
                    "text": "p HatXP",
                    "varname": "hihatXP"
                }
            },
            {
                "box": {
                    "id": "obj-18",
                    "lastchannelcount": 0,
                    "maxclass": "live.gain~",
                    "numinlets": 2,
                    "numoutlets": 5,
                    "outlettype": [ "signal", "signal", "", "float", "list" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 1773.494041442871, 627.7108665704727, 48.0, 136.0 ],
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
                    "id": "obj-20",
                    "maxclass": "ezdac~",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [ 1773.494041442871, 803.614487528801, 36.0, 36.0 ]
                }
            },
            {
                "box": {
                    "border": 0,
                    "filename": "ztrk_parameter_at_cursor.js",
                    "id": "obj-49",
                    "maxclass": "v8ui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 714.4578577280045, 120.48193216323853, 264.7109375, 16.0 ],
                    "textfile": {
                        "filename": "ztrk_parameter_at_cursor.js",
                        "flags": 0,
                        "embed": 0,
                        "autowatch": 1
                    },
                    "varname": "v8ui_AD"
                }
            },
            {
                "box": {
                    "id": "obj-65",
                    "maxclass": "newobj",
                    "numinlets": 1,
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
                        "rect": [ 1011.0, 113.0, 722.0, 703.0 ],
                        "boxes": [
                            {
                                "box": {
                                    "id": "obj-74",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 410.7080000638962, 416.0442811846733, 199.1150602698326, 20.0 ],
                                    "text": "[expr min * pow(max/min, $f1/N.)]"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-72",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 410.7080000638962, 299.11506831645966, 180.0, 22.0 ],
                                    "text": "expr 800. * pow(7.5\\, $f1/65535.)"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-56",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 1246.9027552008629, 270.79648196697235, 109.0, 22.0 ],
                                    "text": "if $f1 >= 0 then $f1"
                                }
                            },
                            {
                                "box": {
                                    "fontface": 0,
                                    "fontname": "Arial",
                                    "fontsize": 12.0,
                                    "id": "obj-57",
                                    "interval": 20.0,
                                    "maxclass": "number~",
                                    "mode": 2,
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "float" ],
                                    "patching_rect": [ 1246.9027552008629, 240.7079839706421, 56.0, 22.0 ],
                                    "sig": 0.0
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-58",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "signal" ],
                                    "patching_rect": [ 1246.9027552008629, 208.84957432746887, 94.0, 22.0 ],
                                    "text": "gen~ b5_reader"
                                }
                            },
                            {
                                "box": {
                                    "attr": "kind",
                                    "displaymode": 1,
                                    "id": "obj-59",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 1246.9027552008629, 172.56638556718826, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "kind", 2.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[93]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[24]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[18]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "chIndex",
                                    "displaymode": 1,
                                    "id": "obj-60",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 1246.9027552008629, 145.13275504112244, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "chIndex", 7.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[94]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[25]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[19]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "buf",
                                    "id": "obj-61",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 1246.9027552008629, 118.58408033847809, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "buf", "t5_buf" ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[95]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[58]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[20]"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-50",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 1084.9558395147324, 270.79648196697235, 109.0, 22.0 ],
                                    "text": "if $f1 >= 0 then $f1"
                                }
                            },
                            {
                                "box": {
                                    "fontface": 0,
                                    "fontname": "Arial",
                                    "fontsize": 12.0,
                                    "id": "obj-51",
                                    "interval": 20.0,
                                    "maxclass": "number~",
                                    "mode": 2,
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "float" ],
                                    "patching_rect": [ 1084.9558395147324, 240.7079839706421, 56.0, 22.0 ],
                                    "sig": 0.0
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-52",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "signal" ],
                                    "patching_rect": [ 1084.9558395147324, 208.84957432746887, 94.0, 22.0 ],
                                    "text": "gen~ b5_reader"
                                }
                            },
                            {
                                "box": {
                                    "attr": "kind",
                                    "displaymode": 1,
                                    "id": "obj-53",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 1084.9558395147324, 172.56638556718826, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "kind", 4.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[90]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[24]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[13]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "chIndex",
                                    "displaymode": 1,
                                    "id": "obj-54",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 1084.9558395147324, 145.13275504112244, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "chIndex", 6.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[91]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[25]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[14]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "buf",
                                    "id": "obj-55",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 1084.9558395147324, 118.58408033847809, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "buf", "t5_buf" ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[92]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[58]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[17]"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-44",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 925.6637912988663, 270.79648196697235, 109.0, 22.0 ],
                                    "text": "if $f1 >= 0 then $f1"
                                }
                            },
                            {
                                "box": {
                                    "fontface": 0,
                                    "fontname": "Arial",
                                    "fontsize": 12.0,
                                    "id": "obj-45",
                                    "interval": 20.0,
                                    "maxclass": "number~",
                                    "mode": 2,
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "float" ],
                                    "patching_rect": [ 925.6637912988663, 240.7079839706421, 56.0, 22.0 ],
                                    "sig": 0.0
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-46",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "signal" ],
                                    "patching_rect": [ 925.6637912988663, 208.84957432746887, 94.0, 22.0 ],
                                    "text": "gen~ b5_reader"
                                }
                            },
                            {
                                "box": {
                                    "attr": "kind",
                                    "displaymode": 1,
                                    "id": "obj-47",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 925.6637912988663, 172.56638556718826, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "kind", 2.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[87]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[24]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[10]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "chIndex",
                                    "displaymode": 1,
                                    "id": "obj-48",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 925.6637912988663, 145.13275504112244, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "chIndex", 5.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[88]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[25]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[11]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "buf",
                                    "id": "obj-49",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 925.6637912988663, 118.58408033847809, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "buf", "t5_buf" ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[89]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[58]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[12]"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-37",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 763.7168756127357, 270.79648196697235, 109.0, 22.0 ],
                                    "text": "if $f1 >= 0 then $f1"
                                }
                            },
                            {
                                "box": {
                                    "fontface": 0,
                                    "fontname": "Arial",
                                    "fontsize": 12.0,
                                    "id": "obj-38",
                                    "interval": 20.0,
                                    "maxclass": "number~",
                                    "mode": 2,
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "float" ],
                                    "patching_rect": [ 763.7168756127357, 240.7079839706421, 56.0, 22.0 ],
                                    "sig": 0.0
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-39",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "signal" ],
                                    "patching_rect": [ 763.7168756127357, 208.84957432746887, 94.0, 22.0 ],
                                    "text": "gen~ b5_reader"
                                }
                            },
                            {
                                "box": {
                                    "attr": "kind",
                                    "displaymode": 1,
                                    "id": "obj-40",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 763.7168756127357, 172.56638556718826, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "kind", 2.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[84]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[24]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[7]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "chIndex",
                                    "displaymode": 1,
                                    "id": "obj-41",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 763.7168756127357, 145.13275504112244, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "chIndex", 4.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[85]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[25]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[8]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "buf",
                                    "id": "obj-43",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 763.7168756127357, 118.58408033847809, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "buf", "t5_buf" ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[86]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[58]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[9]"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-31",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 600.8850041031837, 270.79648196697235, 109.0, 22.0 ],
                                    "text": "if $f1 >= 0 then $f1"
                                }
                            },
                            {
                                "box": {
                                    "fontface": 0,
                                    "fontname": "Arial",
                                    "fontsize": 12.0,
                                    "id": "obj-32",
                                    "interval": 20.0,
                                    "maxclass": "number~",
                                    "mode": 2,
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "float" ],
                                    "patching_rect": [ 600.8850041031837, 240.7079839706421, 56.0, 22.0 ],
                                    "sig": 0.0
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-33",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "signal" ],
                                    "patching_rect": [ 600.8850041031837, 208.84957432746887, 94.0, 22.0 ],
                                    "text": "gen~ b5_reader"
                                }
                            },
                            {
                                "box": {
                                    "attr": "kind",
                                    "displaymode": 1,
                                    "id": "obj-34",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 600.8850041031837, 172.56638556718826, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "kind", 2.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[81]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[24]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[4]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "chIndex",
                                    "displaymode": 1,
                                    "id": "obj-35",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 600.8850041031837, 145.13275504112244, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "chIndex", 3.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[82]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[25]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[5]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "buf",
                                    "id": "obj-36",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 600.8850041031837, 118.58408033847809, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "buf", "t5_buf" ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[83]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[58]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[6]"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-25",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 440.7080000638962, 270.79648196697235, 109.0, 22.0 ],
                                    "text": "if $f1 >= 0 then $f1"
                                }
                            },
                            {
                                "box": {
                                    "fontface": 0,
                                    "fontname": "Arial",
                                    "fontsize": 12.0,
                                    "id": "obj-26",
                                    "interval": 20.0,
                                    "maxclass": "number~",
                                    "mode": 2,
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "float" ],
                                    "patching_rect": [ 440.7080000638962, 240.7079839706421, 56.0, 22.0 ],
                                    "sig": 0.0
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-27",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "signal" ],
                                    "patching_rect": [ 440.7080000638962, 208.84957432746887, 94.0, 22.0 ],
                                    "text": "gen~ b5_reader"
                                }
                            },
                            {
                                "box": {
                                    "attr": "kind",
                                    "displaymode": 1,
                                    "id": "obj-28",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 440.7080000638962, 172.56638556718826, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "kind", 4.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[78]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[24]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[1]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "chIndex",
                                    "displaymode": 1,
                                    "id": "obj-29",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 440.7080000638962, 145.13275504112244, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "chIndex", 2.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[79]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[25]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[2]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "buf",
                                    "id": "obj-30",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 440.7080000638962, 118.58408033847809, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "buf", "t5_buf" ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[80]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[58]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[3]"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-24",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 1246.9027552008629, 299.11506831645966, 110.0, 22.0 ],
                                    "text": "scale 0. 256. 0. 0.9"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-23",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 1084.9558395147324, 299.11506831645966, 150.0, 22.0 ],
                                    "text": "scale 0. 65535. 150. 8000."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-21",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 925.6637912988663, 299.11506831645966, 117.0, 22.0 ],
                                    "text": "scale 0. 256. 0. 0.95"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-20",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 763.7168756127357, 299.11506831645966, 120.0, 22.0 ],
                                    "text": "scale 0. 256. 0.02. 2."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-19",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 600.8850041031837, 299.11506831645966, 117.0, 22.0 ],
                                    "text": "scale 0. 256. 0. 0.95"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-18",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 440.7080000638962, 451.3274699449539, 150.0, 22.0 ],
                                    "text": "scale 0. 65535. 800. 6000."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-42",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 38.938056230545044, 285.8407309651375, 50.0, 22.0 ],
                                    "text": ">=~ 0.5"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-9",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 38.938056230545044, 247.78763055801392, 42.0, 22.0 ],
                                    "text": "delta~"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-121",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 282.30090767145157, 299.11506831645966, 103.0, 22.0 ],
                                    "text": "scale 0. 256. 0. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-95",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "signal" ],
                                    "patching_rect": [ 38.938056230545044, 208.84957432746887, 94.0, 22.0 ],
                                    "text": "gen~ b5_reader"
                                }
                            },
                            {
                                "box": {
                                    "attr": "kind",
                                    "displaymode": 1,
                                    "id": "obj-96",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 38.938056230545044, 172.56638556718826, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "kind", 1.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[72]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[24]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[33]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "chIndex",
                                    "displaymode": 1,
                                    "id": "obj-97",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 38.938056230545044, 145.13275504112244, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "chIndex", 0.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[73]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[25]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[34]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "buf",
                                    "id": "obj-99",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 38.938056230545044, 118.58408033847809, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "buf", "t5_buf" ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[74]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[58]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[35]"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-91",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "patching_rect": [ 151.32744580507278, -6.194690763950348, 58.0, 22.0 ],
                                    "text": "loadbang"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-65",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 282.30090767145157, 270.79648196697235, 109.0, 22.0 ],
                                    "text": "if $f1 >= 0 then $f1"
                                }
                            },
                            {
                                "box": {
                                    "fontface": 0,
                                    "fontname": "Arial",
                                    "fontsize": 12.0,
                                    "id": "obj-66",
                                    "interval": 20.0,
                                    "maxclass": "number~",
                                    "mode": 2,
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "float" ],
                                    "patching_rect": [ 282.30090767145157, 240.7079839706421, 56.0, 22.0 ],
                                    "sig": 0.0
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-67",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "signal" ],
                                    "patching_rect": [ 282.30090767145157, 208.84957432746887, 94.0, 22.0 ],
                                    "text": "gen~ b5_reader"
                                }
                            },
                            {
                                "box": {
                                    "attr": "kind",
                                    "displaymode": 1,
                                    "id": "obj-68",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 282.30090767145157, 172.56638556718826, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "kind", 2.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[75]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[24]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[15]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "chIndex",
                                    "displaymode": 1,
                                    "id": "obj-69",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 282.30090767145157, 145.13275504112244, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "chIndex", 1.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[76]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[25]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[16]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "buf",
                                    "id": "obj-71",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 282.30090767145157, 118.58408033847809, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "buf", "t5_buf" ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[77]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[58]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-22",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 151.32744580507278, 21.23893976211548, 42.0, 22.0 ],
                                    "text": "t5_buf"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-10",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
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
                                        "classnamespace": "dsp.gen",
                                        "rect": [ -95.0, 756.0, 1273.0, 621.0 ],
                                        "boxes": [
                                            {
                                                "box": {
                                                    "id": "obj-6",
                                                    "maxclass": "newobj",
                                                    "numinlets": 1,
                                                    "numoutlets": 0,
                                                    "patching_rect": [ 825.0, 1032.0, 35.0, 22.0 ],
                                                    "text": "out 2"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "code": "// Hi-hat v10 — testing multichannel Data instead of 6 separate Data objects\r\n\r\nhihatVoice(idx, exciter, delaymem, posD, pitch_hz, ratio, decay_time, dampAmt) {\r\n    History lp;\r\n\r\n    delay_size = dim(delaymem);\r\n    delay_samps = samplerate / (pitch_hz * ratio);\r\n\r\n    fb = pow(0.001, delay_samps / (decay_time * samplerate));\r\n\r\n    p = peek(posD, idx);\r\n\r\n    rp = p - delay_samps;\r\n    rp = rp < 0 ? rp + delay_size : rp;\r\n\r\n    // channel argument selects which of the 6 channels to read/write\r\n    y = peek(delaymem, rp, idx);\r\n    lp = y + dampAmt * (lp - y);\r\n    poke(delaymem, exciter + lp * fb, p, idx);\r\n\r\n    p = p + 1;\r\n    if (p >= delay_size) p = 0;\r\n    poke(posD, p, idx);\r\n\r\n    return y;\r\n}\r\n\r\nHistory trig_prev(0);\r\nHistory env(0);\r\nHistory hp1(0), hp2(0), hp3(0);\r\nHistory res1(0);\r\n\r\nData delaymem(2048, 6);   // single multichannel Data: 2048 samples x 6 voice-channels\r\nData posD(6);\r\n\r\nParam decay(0.12);\r\nParam brightness(0.7);\r\nParam amp(0.8);\r\nParam res_freq(4000);\r\nParam res_amount(0.85);\r\nParam pitch(2200);\r\nParam damp(0.35);\r\n\r\ntrig = in1 > 0.5 && trig_prev <= 0.5;\r\ntrig_prev = in1;\r\n\r\nenv_coeff = pow(0.001, 1 / (decay * samplerate));\r\nenv = trig ? 1 : env * env_coeff;\r\n\r\nn = noise() * 2 - 1;\r\n\r\nhp1 = n - brightness * hp1;\r\nhp2 = hp1 - brightness * hp2;\r\nhp3 = hp2 - brightness * hp3;\r\n\r\nres_coeff = cos(twopi * res_freq / samplerate);\r\nres1 = hp3 + res_amount * (res1 * res_coeff - res1 * 0);\r\nmixed = hp3 * 0.6 + res1 * 0.4;\r\n\r\nexciter = mixed * env;\r\n\r\ny1 = hihatVoice(0, exciter, delaymem, posD, pitch, 1.00, decay, damp);\r\ny2 = hihatVoice(1, exciter, delaymem, posD, pitch, 1.19, decay, damp);\r\ny3 = hihatVoice(2, exciter, delaymem, posD, pitch, 1.47, decay, damp);\r\ny4 = hihatVoice(3, exciter, delaymem, posD, pitch, 1.72, decay, damp);\r\ny5 = hihatVoice(4, exciter, delaymem, posD, pitch, 2.01, decay, damp);\r\ny6 = hihatVoice(5, exciter, delaymem, posD, pitch, 2.38, decay, damp);\r\n\r\nvoices = (y1 + y2 + y3 + y4 + y5 + y6) / 6;\r\n\r\nshaped = tanh((mixed * 0.4 + voices * 0.6) * env * 3) * amp;\r\n\r\nout1 = shaped;\r\nout2 = shaped;",
                                                    "fontface": 0,
                                                    "fontname": "<Monospaced>",
                                                    "fontsize": 12.0,
                                                    "id": "obj-5",
                                                    "maxclass": "codebox",
                                                    "numinlets": 1,
                                                    "numoutlets": 2,
                                                    "outlettype": [ "", "" ],
                                                    "patching_rect": [ 92.0, 35.0, 752.0, 930.0 ]
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-1",
                                                    "maxclass": "newobj",
                                                    "numinlets": 0,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "" ],
                                                    "patching_rect": [ 31.0, 18.0, 28.0, 22.0 ],
                                                    "text": "in 1"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-4",
                                                    "maxclass": "newobj",
                                                    "numinlets": 1,
                                                    "numoutlets": 0,
                                                    "patching_rect": [ 92.0, 1032.0, 35.0, 22.0 ],
                                                    "text": "out 1"
                                                }
                                            }
                                        ],
                                        "lines": [
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-5", 0 ],
                                                    "source": [ "obj-1", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-4", 0 ],
                                                    "source": [ "obj-5", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-6", 0 ],
                                                    "source": [ "obj-5", 1 ]
                                                }
                                            }
                                        ]
                                    },
                                    "patching_rect": [ 14.159293174743652, 415.0442811846733, 99.0, 22.0 ],
                                    "text": "gen~ clapDSP10",
                                    "varname": "clapDSP10"
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-6",
                                    "index": 2,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 93.8053172826767, 560.1770362257957, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-5",
                                    "index": 1,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 19.469028115272522, 555.7522571086884, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-4",
                                    "index": 1,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 11.0, 2.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "attr": "decay",
                                    "id": "obj-11",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 763.7168756127357, 338.0531245470047, 150.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "attr": "brightness",
                                    "id": "obj-12",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 600.8850041031837, 338.0531245470047, 150.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "attr": "amp",
                                    "id": "obj-13",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 282.30090767145157, 338.0531245470047, 150.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "attr": "res_freq",
                                    "id": "obj-14",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 1084.9558395147324, 338.0531245470047, 150.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "attr": "res_amount",
                                    "id": "obj-15",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 1246.9027552008629, 338.0531245470047, 150.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "attr": "pitch",
                                    "id": "obj-16",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 440.7080000638962, 338.0531245470047, 150.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "attr": "damp",
                                    "id": "obj-17",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 925.6637912988663, 338.0531245470047, 150.0, 22.0 ]
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "obj-5", 0 ],
                                    "source": [ "obj-10", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-6", 0 ],
                                    "source": [ "obj-10", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-10", 0 ],
                                    "source": [ "obj-11", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-10", 0 ],
                                    "source": [ "obj-12", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-13", 0 ],
                                    "source": [ "obj-121", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-10", 0 ],
                                    "source": [ "obj-13", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-10", 0 ],
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
                                    "destination": [ "obj-10", 0 ],
                                    "source": [ "obj-16", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-10", 0 ],
                                    "source": [ "obj-17", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-12", 0 ],
                                    "source": [ "obj-19", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-11", 0 ],
                                    "source": [ "obj-20", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-17", 0 ],
                                    "source": [ "obj-21", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-30", 0 ],
                                    "order": 5,
                                    "source": [ "obj-22", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-36", 0 ],
                                    "order": 4,
                                    "source": [ "obj-22", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-43", 0 ],
                                    "order": 3,
                                    "source": [ "obj-22", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-49", 0 ],
                                    "order": 2,
                                    "source": [ "obj-22", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-55", 0 ],
                                    "order": 1,
                                    "source": [ "obj-22", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-61", 0 ],
                                    "order": 0,
                                    "source": [ "obj-22", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-71", 0 ],
                                    "midpoints": [ 160.82744580507278, 90.23893976211548, 291.80090767145157, 90.23893976211548 ],
                                    "order": 6,
                                    "source": [ "obj-22", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-99", 0 ],
                                    "midpoints": [ 160.82744580507278, 103.23893976211548, 48.438056230545044, 103.23893976211548 ],
                                    "order": 7,
                                    "source": [ "obj-22", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-14", 0 ],
                                    "source": [ "obj-23", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-15", 0 ],
                                    "source": [ "obj-24", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-72", 0 ],
                                    "source": [ "obj-25", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-25", 0 ],
                                    "source": [ "obj-26", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-26", 0 ],
                                    "source": [ "obj-27", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-27", 0 ],
                                    "source": [ "obj-28", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-27", 0 ],
                                    "source": [ "obj-29", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-27", 0 ],
                                    "source": [ "obj-30", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-19", 0 ],
                                    "source": [ "obj-31", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-31", 0 ],
                                    "source": [ "obj-32", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-32", 0 ],
                                    "source": [ "obj-33", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-33", 0 ],
                                    "source": [ "obj-34", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-33", 0 ],
                                    "source": [ "obj-35", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-33", 0 ],
                                    "source": [ "obj-36", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-20", 0 ],
                                    "source": [ "obj-37", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-37", 0 ],
                                    "source": [ "obj-38", 1 ]
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
                                    "destination": [ "obj-27", 0 ],
                                    "order": 5,
                                    "source": [ "obj-4", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-33", 0 ],
                                    "order": 4,
                                    "source": [ "obj-4", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-39", 0 ],
                                    "order": 3,
                                    "source": [ "obj-4", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-46", 0 ],
                                    "order": 2,
                                    "source": [ "obj-4", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-52", 0 ],
                                    "order": 1,
                                    "source": [ "obj-4", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-58", 0 ],
                                    "order": 0,
                                    "source": [ "obj-4", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-67", 0 ],
                                    "order": 6,
                                    "source": [ "obj-4", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-95", 0 ],
                                    "order": 7,
                                    "source": [ "obj-4", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-39", 0 ],
                                    "source": [ "obj-40", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-39", 0 ],
                                    "source": [ "obj-41", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-10", 0 ],
                                    "source": [ "obj-42", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-39", 0 ],
                                    "source": [ "obj-43", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-21", 0 ],
                                    "source": [ "obj-44", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-44", 0 ],
                                    "source": [ "obj-45", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-45", 0 ],
                                    "source": [ "obj-46", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-46", 0 ],
                                    "source": [ "obj-47", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-46", 0 ],
                                    "source": [ "obj-48", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-46", 0 ],
                                    "source": [ "obj-49", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-23", 0 ],
                                    "source": [ "obj-50", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-50", 0 ],
                                    "source": [ "obj-51", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-51", 0 ],
                                    "source": [ "obj-52", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-52", 0 ],
                                    "source": [ "obj-53", 0 ]
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
                                    "destination": [ "obj-52", 0 ],
                                    "source": [ "obj-55", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-24", 0 ],
                                    "source": [ "obj-56", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-56", 0 ],
                                    "source": [ "obj-57", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-57", 0 ],
                                    "source": [ "obj-58", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-58", 0 ],
                                    "source": [ "obj-59", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-58", 0 ],
                                    "source": [ "obj-60", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-58", 0 ],
                                    "source": [ "obj-61", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-121", 0 ],
                                    "source": [ "obj-65", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-65", 0 ],
                                    "source": [ "obj-66", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-66", 0 ],
                                    "source": [ "obj-67", 0 ]
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
                                    "destination": [ "obj-67", 0 ],
                                    "source": [ "obj-69", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-67", 0 ],
                                    "source": [ "obj-71", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-16", 0 ],
                                    "source": [ "obj-72", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-42", 0 ],
                                    "source": [ "obj-9", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-22", 0 ],
                                    "source": [ "obj-91", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-9", 0 ],
                                    "source": [ "obj-95", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-95", 0 ],
                                    "source": [ "obj-96", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-95", 0 ],
                                    "source": [ "obj-97", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-95", 0 ],
                                    "source": [ "obj-99", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 1727.7109072208405, 868.6747308969498, 59.0, 22.0 ],
                    "text": "p ClapXP",
                    "varname": "clapXP"
                }
            },
            {
                "box": {
                    "id": "obj-58",
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
                        "rect": [ 134.0, 134.0, 1000.0, 915.0 ],
                        "boxes": [
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-5",
                                    "index": 2,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 223.0, 19.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-4",
                                    "index": 2,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 288.0, 778.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-3",
                                    "index": 1,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 132.0, 784.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-2",
                                    "index": 1,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 110.0, 19.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "code": "// Gently Improved Smooth Reverb based on Arguru and FreeVerb\r\n\r\ncomb(fb, dampK, modSig, modAmt, pd, posC, in1, in2, bufL, bufR, idx, ds, extraOffs, modCoefL, modCoefR) {\r\n    History p;\r\n    History dampL;\r\n    History dampR;\r\n\r\n    p = peek(posC, idx);\r\n    poke(bufL, in1, p);\r\n    poke(bufR, in2, p);\r\n\r\n    rl = p - ds - pd + modSig * modAmt * modCoefL;\r\n    rr = p - ds - pd + extraOffs + modSig * modAmt * modCoefR;\r\n    rl = rl < 0 ? rl + 8192 : rl;\r\n    rr = rr < 0 ? rr + 8192 : rr;\r\n\r\n    cl = peek(bufL, rl);\r\n    cr = peek(bufR, rr);\r\n\r\n    dampL = cl * (1 - dampK) + dampL * dampK;\r\n    dampR = cr * (1 - dampK) + dampR * dampK;\r\n\r\n    poke(bufL, in1 + dampL * fb, p);\r\n    poke(bufR, in2 + dampR * fb, p);\r\n\r\n    p = p + 1;\r\n    if (p >= 8192) p = 0;\r\n    poke(posC, p, idx);\r\n\r\n    return cl, cr;\r\n}\r\n\r\nParam predelay(18);\r\nParam size(0.65);\r\nParam decay(0.78);\r\nParam damp(0.35);\r\nParam mod(0.22);         // very gentle modulation depth\r\nParam dry(1.0);\r\nParam wet(0.42);\r\nParam width(1.0);\r\n\r\n// Buffers\r\nData combL0(8192); Data combR0(8192);\r\nData combL1(8192); Data combR1(8192);\r\nData combL2(8192); Data combR2(8192);\r\nData combL3(8192); Data combR3(8192);\r\n\r\nData apL(6*2048);\r\nData apR(6*2048);\r\n\r\nData posC(4);\r\nData posA(6);\r\n\r\nHistory dampL0(0); History dampR0(0);\r\nHistory dampL1(0); History dampR1(0);\r\nHistory dampL2(0); History dampR2(0);\r\nHistory dampL3(0); History dampR3(0);\r\n\r\nHistory lpL(0); History lpR(0);\r\nHistory modPhase(0);\r\n\r\n// -------------------------------------------------\r\nms = samplerate * 0.001;\r\n\r\n// Comb delay times\r\nd0 = 29.7 + size * 38;\r\nd1 = 37.1 + size * 41;\r\nd2 = 41.3 + size * 47;\r\nd3 = 43.7 + size * 53;\r\n\r\nd0s = clamp(d0 * ms, 50, 7000);\r\nd1s = clamp(d1 * ms, 50, 7000);\r\nd2s = clamp(d2 * ms, 50, 7000);\r\nd3s = clamp(d3 * ms, 50, 7000);\r\n\r\npd    = clamp(predelay * ms, 1, 4000);\r\nfb    = clamp(decay, 0.1, 0.93);\r\ndampK = clamp(damp, 0.05, 0.9);\r\ng     = clamp(0.5 + decay * 0.25, 0.4, 0.75);\r\n\r\n// Very slow, gentle modulation\r\nmodPhase = modPhase + (0.11 / samplerate);   // ~0.11 Hz\r\nif (modPhase > 1) modPhase = modPhase - 1;\r\nmodSig = sin(modPhase * 2 * pi);             // smooth sine\r\nmodAmt = mod * 7.5;                          // very small depth\r\n\r\n// ========== Call the 4 combs (4 separate lexical instances) ==========\r\ncl0, cr0 = comb(fb, dampK, modSig, modAmt, pd, posC, in1, in2, combL0, combR0, 0, d0s, -23,  1.0,   -0.6);\r\ncl1, cr1 = comb(fb, dampK, modSig, modAmt, pd, posC, in1, in2, combL1, combR1, 1, d1s, -29,  0.8,   -0.5);\r\ncl2, cr2 = comb(fb, dampK, modSig, modAmt, pd, posC, in1, in2, combL2, combR2, 2, d2s, -37, -0.7,    0.45);\r\ncl3, cr3 = comb(fb, dampK, modSig, modAmt, pd, posC, in1, in2, combL3, combR3, 3, d3s, -43,  1.05,  -0.55);\r\n\r\n// Sum combs\r\nsumL = (cl0 + cl1 + cl2 + cl3) * 0.25;\r\nsumR = (cr0 + cr1 + cr2 + cr3) * 0.25;\r\n\r\n// ========== Series Allpasses ==========\r\nl = sumL;\r\nr = sumR;\r\n\r\napd0 = 12.7 + size * 9;\r\napd1 = 9.3  + size * 8;\r\napd2 = 7.1  + size * 7;\r\napd3 = 5.9  + size * 6;\r\napd4 = 4.3  + size * 5;\r\napd5 = 3.1  + size * 4;\r\n\r\nfor (i = 0; i < 6; i += 1) {\r\n    dly = apd0;\r\n    if (i == 1) dly = apd1;\r\n    if (i == 2) dly = apd2;\r\n    if (i == 3) dly = apd3;\r\n    if (i == 4) dly = apd4;\r\n    if (i == 5) dly = apd5;\r\n\r\n    // tiny modulation on allpasses\r\n    dlys = clamp(dly * ms, 20, 1800);\r\n    dlys = dlys + modSig * mod * 2.8;\r\n\r\n    base = i * 2048;\r\n    pos  = peek(posA, i);\r\n\r\n    // Left\r\n    rpl = pos - dlys;\r\n    rpl = rpl < 0 ? rpl + 2048 : rpl;\r\n    bl  = peek(apL, base + rpl);\r\n    tl  = l + g * bl;\r\n    ol  = bl - g * tl;\r\n    poke(apL, tl, base + pos);\r\n\r\n    // Right\r\n    rpr = pos - (dlys + 13 + i * 3.5);\r\n    rpr = rpr < 0 ? rpr + 2048 : rpr;\r\n    br  = peek(apR, base + rpr);\r\n    tr  = r + g * br;\r\n    or_ = br - g * tr;\r\n    poke(apR, tr, base + pos);\r\n\r\n    l = ol;\r\n    r = or_;\r\n\r\n    pos = pos + 1;\r\n    if (pos >= 2048) pos = 0;\r\n    poke(posA, pos, i);\r\n}\r\n\r\n// Smoother final absorption\r\ncoeff = exp(-2 * pi * (4200 + (1 - dampK) * 6500) / samplerate);\r\nlpL = l + (lpL - l) * coeff;\r\nlpR = r + (lpR - r) * coeff;\r\n\r\n// Stereo width\r\nmid  = (lpL + lpR) * 0.5;\r\nside = (lpL - lpR) * 0.5 * width;\r\n\r\nout1 = in1 * dry + (mid + side) * wet;\r\nout2 = in2 * dry + (mid - side) * wet;\r\n",
                                    "fontface": 0,
                                    "fontname": "<Monospaced>",
                                    "fontsize": 12.0,
                                    "id": "obj-1",
                                    "maxclass": "gen.codebox~",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "signal" ],
                                    "patching_rect": [ 52.0, 75.0, 813.0, 641.0 ]
                                }
                            },
                            {
                                "box": {
                                    "attr": "size",
                                    "id": "obj-6",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 256.0, 45.0, 150.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "attr": "decay",
                                    "id": "obj-7",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 409.0, 45.0, 150.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "attr": "dry",
                                    "id": "obj-8",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 562.0, 45.0, 150.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "attr": "predelay",
                                    "id": "obj-9",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 715.0, 45.0, 150.0, 22.0 ]
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "obj-3", 0 ],
                                    "source": [ "obj-1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-4", 0 ],
                                    "source": [ "obj-1", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-1", 0 ],
                                    "source": [ "obj-2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-1", 1 ],
                                    "source": [ "obj-5", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-1", 0 ],
                                    "source": [ "obj-6", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-1", 0 ],
                                    "source": [ "obj-7", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-1", 0 ],
                                    "source": [ "obj-8", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-1", 0 ],
                                    "source": [ "obj-9", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 2007.2289898395538, 916.8675037622452, 80.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1357.0, 924.0, 100.0, 22.0 ],
                    "text": "p TorqReverb"
                }
            },
            {
                "box": {
                    "id": "obj-50",
                    "lastchannelcount": 0,
                    "maxclass": "live.gain~",
                    "numinlets": 2,
                    "numoutlets": 5,
                    "outlettype": [ "signal", "signal", "", "float", "list" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 1630.1205421686172, 632.5301438570023, 48.0, 136.0 ],
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
                    "id": "obj-52",
                    "maxclass": "ezdac~",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [ 1630.1205421686172, 800.0000295639038, 36.0, 36.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-34",
                    "maxclass": "newobj",
                    "numinlets": 1,
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
                        "rect": [ 134.0, 134.0, 2156.0, 783.0 ],
                        "boxes": [
                            {
                                "box": {
                                    "id": "obj-42",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 65.0, 305.0, 50.0, 22.0 ],
                                    "text": ">=~ 0.5"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-9",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 65.0, 267.0, 42.0, 22.0 ],
                                    "text": "delta~"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-122",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 558.0, 319.0, 103.0, 22.0 ],
                                    "text": "scale 0. 255. 0. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-121",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 232.0, 319.0, 143.0, 22.0 ],
                                    "text": "scale 0. 65535. 40. 1471."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-119",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 1737.5, 319.0, 137.0, 22.0 ],
                                    "text": "scale 0. 65535. 40. 771."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-118",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 1557.0, 319.0, 103.0, 22.0 ],
                                    "text": "scale 0. 255. 0. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-117",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 1381.0, 319.0, 103.0, 22.0 ],
                                    "text": "scale 0. 255. 0. 3."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-116",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 1223.0, 319.0, 103.0, 22.0 ],
                                    "text": "scale 0. 255. 0. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-115",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 1054.0, 319.0, 103.0, 22.0 ],
                                    "text": "scale 0. 255. 0. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-114",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 896.0, 319.0, 103.0, 22.0 ],
                                    "text": "scale 0. 255. 0. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-113",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 716.0, 319.0, 103.0, 22.0 ],
                                    "text": "scale 0. 255. 0. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-112",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 390.0, 319.0, 103.0, 22.0 ],
                                    "text": "scale 0. 255. 0. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-111",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 1884.0, 319.0, 103.0, 22.0 ],
                                    "text": "scale 0. 255. 0. 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-95",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "signal" ],
                                    "patching_rect": [ 65.0, 228.0, 94.0, 22.0 ],
                                    "text": "gen~ b5_reader"
                                }
                            },
                            {
                                "box": {
                                    "attr": "kind",
                                    "displaymode": 1,
                                    "id": "obj-96",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 65.0, 192.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "kind", 1.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[69]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[24]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[33]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "chIndex",
                                    "displaymode": 1,
                                    "id": "obj-97",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 65.0, 165.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "chIndex", 0.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[70]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[25]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[34]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "buf",
                                    "id": "obj-99",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 65.0, 138.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "buf", "t3_buf" ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[71]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[58]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[35]"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-91",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "patching_rect": [ 101.0, 13.0, 58.0, 22.0 ],
                                    "text": "loadbang"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-84",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 1884.0, 290.0, 109.0, 22.0 ],
                                    "text": "if $f1 >= 0 then $f1"
                                }
                            },
                            {
                                "box": {
                                    "fontface": 0,
                                    "fontname": "Arial",
                                    "fontsize": 12.0,
                                    "id": "obj-85",
                                    "interval": 20.0,
                                    "maxclass": "number~",
                                    "mode": 2,
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "float" ],
                                    "patching_rect": [ 1884.0, 260.0, 56.0, 22.0 ],
                                    "sig": 0.0
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-86",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "signal" ],
                                    "patching_rect": [ 1884.0, 228.0, 94.0, 22.0 ],
                                    "text": "gen~ b5_reader"
                                }
                            },
                            {
                                "box": {
                                    "attr": "kind",
                                    "displaymode": 1,
                                    "id": "obj-87",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 1884.0, 192.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "kind", 2.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[56]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[24]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[19]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "chIndex",
                                    "displaymode": 1,
                                    "id": "obj-88",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 1884.0, 165.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "chIndex", 11.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[57]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[25]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[20]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "buf",
                                    "id": "obj-90",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 1884.0, 138.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "buf", "t3_buf" ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[68]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[68]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[32]"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-65",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 232.0, 290.0, 109.0, 22.0 ],
                                    "text": "if $f1 >= 0 then $f1"
                                }
                            },
                            {
                                "box": {
                                    "fontface": 0,
                                    "fontname": "Arial",
                                    "fontsize": 12.0,
                                    "id": "obj-66",
                                    "interval": 20.0,
                                    "maxclass": "number~",
                                    "mode": 2,
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "float" ],
                                    "patching_rect": [ 232.0, 260.0, 56.0, 22.0 ],
                                    "sig": 0.0
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-67",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "signal" ],
                                    "patching_rect": [ 232.0, 228.0, 94.0, 22.0 ],
                                    "text": "gen~ b5_reader"
                                }
                            },
                            {
                                "box": {
                                    "attr": "kind",
                                    "displaymode": 1,
                                    "id": "obj-68",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 232.0, 192.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "kind", 4.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[52]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[24]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[15]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "chIndex",
                                    "displaymode": 1,
                                    "id": "obj-69",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 232.0, 165.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "chIndex", 1.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[53]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[25]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[16]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "buf",
                                    "id": "obj-71",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 232.0, 138.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "buf", "t3_buf" ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[58]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[58]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-77",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 390.0, 290.0, 109.0, 22.0 ],
                                    "text": "if $f1 >= 0 then $f1"
                                }
                            },
                            {
                                "box": {
                                    "fontface": 0,
                                    "fontname": "Arial",
                                    "fontsize": 12.0,
                                    "id": "obj-78",
                                    "interval": 20.0,
                                    "maxclass": "number~",
                                    "mode": 2,
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "float" ],
                                    "patching_rect": [ 390.0, 260.0, 56.0, 22.0 ],
                                    "sig": 0.0
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-79",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "signal" ],
                                    "patching_rect": [ 390.0, 228.0, 94.0, 22.0 ],
                                    "text": "gen~ b5_reader"
                                }
                            },
                            {
                                "box": {
                                    "attr": "kind",
                                    "displaymode": 1,
                                    "id": "obj-80",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 390.0, 192.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "kind", 2.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[54]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[24]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[17]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "chIndex",
                                    "displaymode": 1,
                                    "id": "obj-81",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 390.0, 165.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "chIndex", 2.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[55]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[25]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[18]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "buf",
                                    "id": "obj-83",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 390.0, 138.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "buf", "t3_buf" ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[59]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[59]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[21]"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-51",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 559.0, 290.0, 109.0, 22.0 ],
                                    "text": "if $f1 >= 0 then $f1"
                                }
                            },
                            {
                                "box": {
                                    "fontface": 0,
                                    "fontname": "Arial",
                                    "fontsize": 12.0,
                                    "id": "obj-52",
                                    "interval": 20.0,
                                    "maxclass": "number~",
                                    "mode": 2,
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "float" ],
                                    "patching_rect": [ 559.0, 260.0, 56.0, 22.0 ],
                                    "sig": 0.0
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-53",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "signal" ],
                                    "patching_rect": [ 559.0, 228.0, 94.0, 22.0 ],
                                    "text": "gen~ b5_reader"
                                }
                            },
                            {
                                "box": {
                                    "attr": "kind",
                                    "displaymode": 1,
                                    "id": "obj-54",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 559.0, 192.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "kind", 2.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[48]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[24]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[11]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "chIndex",
                                    "displaymode": 1,
                                    "id": "obj-55",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 559.0, 165.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "chIndex", 3.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[49]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[25]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[12]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "buf",
                                    "id": "obj-57",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 559.0, 138.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "buf", "t3_buf" ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[60]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[60]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[22]"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-58",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 717.0, 290.0, 109.0, 22.0 ],
                                    "text": "if $f1 >= 0 then $f1"
                                }
                            },
                            {
                                "box": {
                                    "fontface": 0,
                                    "fontname": "Arial",
                                    "fontsize": 12.0,
                                    "id": "obj-59",
                                    "interval": 20.0,
                                    "maxclass": "number~",
                                    "mode": 2,
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "float" ],
                                    "patching_rect": [ 717.0, 260.0, 56.0, 22.0 ],
                                    "sig": 0.0
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-60",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "signal" ],
                                    "patching_rect": [ 717.0, 228.0, 94.0, 22.0 ],
                                    "text": "gen~ b5_reader"
                                }
                            },
                            {
                                "box": {
                                    "attr": "kind",
                                    "displaymode": 1,
                                    "id": "obj-61",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 717.0, 192.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "kind", 2.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[50]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[24]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[13]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "chIndex",
                                    "displaymode": 1,
                                    "id": "obj-62",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 717.0, 165.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "chIndex", 4.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[51]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[25]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[14]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "buf",
                                    "id": "obj-64",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 717.0, 138.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "buf", "t3_buf" ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[61]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[61]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[23]"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-37",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 897.0, 290.0, 109.0, 22.0 ],
                                    "text": "if $f1 >= 0 then $f1"
                                }
                            },
                            {
                                "box": {
                                    "fontface": 0,
                                    "fontname": "Arial",
                                    "fontsize": 12.0,
                                    "id": "obj-38",
                                    "interval": 20.0,
                                    "maxclass": "number~",
                                    "mode": 2,
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "float" ],
                                    "patching_rect": [ 897.0, 260.0, 56.0, 22.0 ],
                                    "sig": 0.0
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-39",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "signal" ],
                                    "patching_rect": [ 897.0, 228.0, 94.0, 22.0 ],
                                    "text": "gen~ b5_reader"
                                }
                            },
                            {
                                "box": {
                                    "attr": "kind",
                                    "displaymode": 1,
                                    "id": "obj-40",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 897.0, 192.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "kind", 2.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[46]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[24]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[7]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "chIndex",
                                    "displaymode": 1,
                                    "id": "obj-41",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 897.0, 165.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "chIndex", 5.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[38]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[25]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[8]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "buf",
                                    "id": "obj-43",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 897.0, 138.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "buf", "t3_buf" ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[62]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[62]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[26]"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-44",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 1055.0, 290.0, 109.0, 22.0 ],
                                    "text": "if $f1 >= 0 then $f1"
                                }
                            },
                            {
                                "box": {
                                    "fontface": 0,
                                    "fontname": "Arial",
                                    "fontsize": 12.0,
                                    "id": "obj-45",
                                    "interval": 20.0,
                                    "maxclass": "number~",
                                    "mode": 2,
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "float" ],
                                    "patching_rect": [ 1055.0, 260.0, 56.0, 22.0 ],
                                    "sig": 0.0
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-46",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "signal" ],
                                    "patching_rect": [ 1055.0, 228.0, 94.0, 22.0 ],
                                    "text": "gen~ b5_reader"
                                }
                            },
                            {
                                "box": {
                                    "attr": "kind",
                                    "displaymode": 1,
                                    "id": "obj-47",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 1055.0, 192.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "kind", 2.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[47]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[24]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[9]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "chIndex",
                                    "displaymode": 1,
                                    "id": "obj-48",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 1055.0, 165.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "chIndex", 6.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[39]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[25]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[10]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "buf",
                                    "id": "obj-50",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 1055.0, 138.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "buf", "t3_buf" ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[63]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[63]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[27]"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-23",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 1225.0, 290.0, 109.0, 22.0 ],
                                    "text": "if $f1 >= 0 then $f1"
                                }
                            },
                            {
                                "box": {
                                    "fontface": 0,
                                    "fontname": "Arial",
                                    "fontsize": 12.0,
                                    "id": "obj-24",
                                    "interval": 20.0,
                                    "maxclass": "number~",
                                    "mode": 2,
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "float" ],
                                    "patching_rect": [ 1225.0, 260.0, 56.0, 22.0 ],
                                    "sig": 0.0
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-25",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "signal" ],
                                    "patching_rect": [ 1225.0, 228.0, 94.0, 22.0 ],
                                    "text": "gen~ b5_reader"
                                }
                            },
                            {
                                "box": {
                                    "attr": "kind",
                                    "displaymode": 1,
                                    "id": "obj-26",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 1225.0, 192.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "kind", 2.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[42]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[24]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[3]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "chIndex",
                                    "displaymode": 1,
                                    "id": "obj-27",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 1225.0, 165.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "chIndex", 7.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[43]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[25]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[4]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "buf",
                                    "id": "obj-29",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 1225.0, 138.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "buf", "t3_buf" ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[64]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[64]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[28]"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-30",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 1383.0, 290.0, 109.0, 22.0 ],
                                    "text": "if $f1 >= 0 then $f1"
                                }
                            },
                            {
                                "box": {
                                    "fontface": 0,
                                    "fontname": "Arial",
                                    "fontsize": 12.0,
                                    "id": "obj-31",
                                    "interval": 20.0,
                                    "maxclass": "number~",
                                    "mode": 2,
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "float" ],
                                    "patching_rect": [ 1383.0, 260.0, 56.0, 22.0 ],
                                    "sig": 0.0
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-32",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "signal" ],
                                    "patching_rect": [ 1383.0, 228.0, 94.0, 22.0 ],
                                    "text": "gen~ b5_reader"
                                }
                            },
                            {
                                "box": {
                                    "attr": "kind",
                                    "displaymode": 1,
                                    "id": "obj-33",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 1383.0, 192.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "kind", 2.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[44]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[24]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[5]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "chIndex",
                                    "displaymode": 1,
                                    "id": "obj-34",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 1383.0, 165.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "chIndex", 8.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[45]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[25]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[6]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "buf",
                                    "id": "obj-36",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 1383.0, 138.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "buf", "t3_buf" ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[65]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[65]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[29]"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-22",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 101.0, 41.0, 42.0, 22.0 ],
                                    "text": "t4_buf"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-14",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 1556.0, 290.0, 109.0, 22.0 ],
                                    "text": "if $f1 >= 0 then $f1"
                                }
                            },
                            {
                                "box": {
                                    "fontface": 0,
                                    "fontname": "Arial",
                                    "fontsize": 12.0,
                                    "id": "obj-15",
                                    "interval": 20.0,
                                    "maxclass": "number~",
                                    "mode": 2,
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "float" ],
                                    "patching_rect": [ 1556.0, 260.0, 56.0, 22.0 ],
                                    "sig": 0.0
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-16",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "signal" ],
                                    "patching_rect": [ 1556.0, 228.0, 94.0, 22.0 ],
                                    "text": "gen~ b5_reader"
                                }
                            },
                            {
                                "box": {
                                    "attr": "kind",
                                    "displaymode": 1,
                                    "id": "obj-17",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 1556.0, 192.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "kind", 2.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[40]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[24]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[1]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "chIndex",
                                    "displaymode": 1,
                                    "id": "obj-18",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 1556.0, 165.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "chIndex", 9.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[41]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[25]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[2]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "buf",
                                    "id": "obj-20",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 1556.0, 138.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "buf", "t3_buf" ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[66]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[66]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[30]"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-72",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 1714.0, 290.0, 109.0, 22.0 ],
                                    "text": "if $f1 >= 0 then $f1"
                                }
                            },
                            {
                                "box": {
                                    "fontface": 0,
                                    "fontname": "Arial",
                                    "fontsize": 12.0,
                                    "id": "obj-73",
                                    "interval": 20.0,
                                    "maxclass": "number~",
                                    "mode": 2,
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "float" ],
                                    "patching_rect": [ 1714.0, 260.0, 56.0, 22.0 ],
                                    "sig": 0.0
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-74",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "signal" ],
                                    "patching_rect": [ 1714.0, 228.0, 94.0, 22.0 ],
                                    "text": "gen~ b5_reader"
                                }
                            },
                            {
                                "box": {
                                    "attr": "kind",
                                    "displaymode": 1,
                                    "id": "obj-75",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 1714.0, 192.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "kind", 4.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[36]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[24]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[24]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "chIndex",
                                    "displaymode": 1,
                                    "id": "obj-76",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 1714.0, 165.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "chIndex", 10.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[37]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[25]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[25]"
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-4",
                                    "index": 2,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 123.0, 516.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-3",
                                    "index": 1,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 74.0, 516.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-2",
                                    "index": 1,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 24.0, 33.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-1",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
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
                                        "classnamespace": "dsp.gen",
                                        "rect": [ 530.0, 351.0, 1121.0, 1072.0 ],
                                        "boxes": [
                                            {
                                                "box": {
                                                    "id": "obj-6",
                                                    "maxclass": "newobj",
                                                    "numinlets": 1,
                                                    "numoutlets": 0,
                                                    "patching_rect": [ 618.0, 978.0, 35.0, 22.0 ],
                                                    "text": "out 2"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "code": "// Advanced Stereo Snare – with manual decay + lowcut\r\n// --- Envelopes (manual t60-style decay) ---\r\nHistory env_noise(0), env_tone(0), env_snap(0), pitch_mod(0);\r\n\r\n// persistent variables\r\nHistory hp, phase, lc_state, trig_prev, n2;\r\n\r\n// params\r\nParam pitch(185);\r\nParam pitch_env(0.45);\r\nParam decay(0.28);\r\nParam noise_amount(0.78);\r\nParam tone_amount(0.55);\r\nParam snap(0.42);\r\nParam brightness(0.58);\r\nParam tone_decay(1.1);\r\nParam noise_decay(0.52);\r\nParam lowcut(120);          // Hz – high-pass frequency\r\nParam stereo(0.35);         // 0 = mono, 1 = wide\r\n\r\n// --- Trigger ---\r\n\r\ntrig = in1 > 0.5 && trig_prev <= 0.5;  // trigger (rising edge)\r\ntrig_prev = in1;\r\n\r\n// manual per-sample decay coefficients: reach -60dB (0.001) after N seconds\r\nnoise_coeff = pow(0.001, 1 / (decay * noise_decay * samplerate));\r\ntone_coeff  = pow(0.001, 1 / (decay * tone_decay  * samplerate));\r\nsnap_coeff  = pow(0.001, 1 / (0.0085 * samplerate));\r\npitch_coeff = pow(0.001, 1 / (0.032  * samplerate));\r\n\r\nenv_noise = trig ? 1 : env_noise * noise_coeff;\r\nenv_tone  = trig ? 1 : env_tone  * tone_coeff;\r\nenv_snap  = trig ? 1 : env_snap  * snap_coeff;\r\npitch_mod = trig ? 1 : pitch_mod * pitch_coeff;\r\n\r\ncurrent_pitch = pitch * (1 + pitch_mod * pitch_env * 1.9);\r\n\r\n// --- Noise (shared) ---\r\nn = noise() * 2 - 1;\r\n\r\n// High-pass for brightness\r\nhp = n - brightness * hp;\r\nn = hp;\r\n\r\n// --- Tonal body ---\r\nphase = phase + current_pitch / samplerate;\r\nphase = phase - floor(phase);\r\ntone = sin(phase * twopi) * env_tone;\r\ntone = tanh(tone * 1.45) * 0.8;\r\n\r\n// --- Snap ---\r\nsnap_sig = (noise() * 2 - 1) * env_snap * snap;\r\n\r\n// --- Mono mix before stereo & filtering ---\r\nmono = tone * tone_amount + n * env_noise * noise_amount + snap_sig;\r\n\r\n// --- Low-cut (1-pole highpass) ---\r\ncoeff = exp(-2 * pi * lowcut / samplerate);\r\nlc_state = mono + coeff * (lc_state - mono);   // simple 1-pole HP approximation\r\nfiltered = mono - lc_state;\r\n\r\n// --- Stereo width ---\r\nn2 = noise() * 2 - 1;\r\nside = (n2 * env_noise * 0.4 + snap_sig * 0.25) * stereo;\r\n\r\nout1 = (filtered + side) * 0.58;\r\nout2 = (filtered - side) * 0.58;",
                                                    "fontface": 0,
                                                    "fontname": "<Monospaced>",
                                                    "fontsize": 12.0,
                                                    "id": "obj-5",
                                                    "maxclass": "codebox",
                                                    "numinlets": 1,
                                                    "numoutlets": 2,
                                                    "outlettype": [ "", "" ],
                                                    "patching_rect": [ 118.0, 52.0, 652.0, 890.0 ]
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-1",
                                                    "maxclass": "newobj",
                                                    "numinlets": 0,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "" ],
                                                    "patching_rect": [ 50.0, 14.0, 28.0, 22.0 ],
                                                    "text": "in 1"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-4",
                                                    "maxclass": "newobj",
                                                    "numinlets": 1,
                                                    "numoutlets": 0,
                                                    "patching_rect": [ 50.0, 969.0, 35.0, 22.0 ],
                                                    "text": "out 1"
                                                }
                                            }
                                        ],
                                        "lines": [
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-5", 0 ],
                                                    "source": [ "obj-1", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-4", 0 ],
                                                    "source": [ "obj-5", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-6", 0 ],
                                                    "source": [ "obj-5", 1 ]
                                                }
                                            }
                                        ]
                                    },
                                    "patching_rect": [ 74.0, 465.0, 96.0, 22.0 ],
                                    "text": "gen~ SnareDSP",
                                    "varname": "gen_snaredsp"
                                }
                            },
                            {
                                "box": {
                                    "attr": "buf",
                                    "id": "obj-13",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 1714.0, 138.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "buf", "t3_buf" ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[67]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[67]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[31]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "pitch",
                                    "id": "obj-100",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 232.0, 345.0, 150.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "attr": "pitch_env",
                                    "id": "obj-101",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 395.0, 345.0, 150.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "attr": "decay",
                                    "id": "obj-102",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 559.0, 345.0, 150.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "attr": "noise_amount",
                                    "id": "obj-103",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 717.0, 345.0, 150.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "attr": "snap",
                                    "id": "obj-104",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 1055.0, 349.0, 150.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "attr": "brightness",
                                    "id": "obj-105",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 1213.0, 349.0, 150.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "attr": "tone_decay",
                                    "id": "obj-106",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 1383.0, 349.0, 150.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "attr": "lowcut",
                                    "id": "obj-107",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 1714.0, 349.0, 150.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "attr": "stereo",
                                    "id": "obj-108",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 1884.0, 349.0, 150.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "attr": "tone_amount",
                                    "id": "obj-109",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 897.0, 349.0, 150.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "attr": "noise_decay",
                                    "id": "obj-110",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 1556.0, 349.0, 150.0, 22.0 ]
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "obj-3", 0 ],
                                    "source": [ "obj-1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-4", 0 ],
                                    "source": [ "obj-1", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-1", 0 ],
                                    "midpoints": [ 241.5, 403.0, 83.5, 403.0 ],
                                    "source": [ "obj-100", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-1", 0 ],
                                    "midpoints": [ 404.5, 406.0, 83.5, 406.0 ],
                                    "source": [ "obj-101", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-1", 0 ],
                                    "midpoints": [ 568.5, 407.0, 83.5, 407.0 ],
                                    "source": [ "obj-102", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-1", 0 ],
                                    "midpoints": [ 726.5, 411.0, 83.5, 411.0 ],
                                    "source": [ "obj-103", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-1", 0 ],
                                    "midpoints": [ 1064.5, 421.0, 83.5, 421.0 ],
                                    "source": [ "obj-104", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-1", 0 ],
                                    "midpoints": [ 1222.5, 426.0, 83.5, 426.0 ],
                                    "source": [ "obj-105", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-1", 0 ],
                                    "midpoints": [ 1392.5, 432.0, 83.5, 432.0 ],
                                    "source": [ "obj-106", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-1", 0 ],
                                    "midpoints": [ 1723.5, 442.0, 83.5, 442.0 ],
                                    "source": [ "obj-107", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-1", 0 ],
                                    "midpoints": [ 1893.5, 447.0, 83.5, 447.0 ],
                                    "source": [ "obj-108", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-1", 0 ],
                                    "midpoints": [ 906.5, 415.0, 83.5, 415.0 ],
                                    "source": [ "obj-109", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-1", 0 ],
                                    "midpoints": [ 1565.5, 438.0, 83.5, 438.0 ],
                                    "source": [ "obj-110", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-108", 0 ],
                                    "source": [ "obj-111", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-101", 0 ],
                                    "source": [ "obj-112", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-103", 0 ],
                                    "source": [ "obj-113", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-109", 0 ],
                                    "source": [ "obj-114", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-104", 0 ],
                                    "source": [ "obj-115", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-105", 0 ],
                                    "source": [ "obj-116", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-106", 0 ],
                                    "source": [ "obj-117", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-110", 0 ],
                                    "source": [ "obj-118", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-107", 0 ],
                                    "source": [ "obj-119", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-100", 0 ],
                                    "source": [ "obj-121", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-102", 0 ],
                                    "source": [ "obj-122", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-74", 0 ],
                                    "source": [ "obj-13", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-118", 0 ],
                                    "source": [ "obj-14", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-14", 0 ],
                                    "source": [ "obj-15", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-15", 0 ],
                                    "source": [ "obj-16", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-16", 0 ],
                                    "source": [ "obj-17", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-16", 0 ],
                                    "source": [ "obj-18", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-16", 0 ],
                                    "order": 2,
                                    "source": [ "obj-2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-25", 0 ],
                                    "order": 4,
                                    "source": [ "obj-2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-32", 0 ],
                                    "order": 3,
                                    "source": [ "obj-2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-39", 0 ],
                                    "order": 6,
                                    "source": [ "obj-2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-46", 0 ],
                                    "order": 5,
                                    "source": [ "obj-2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-53", 0 ],
                                    "order": 8,
                                    "source": [ "obj-2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-60", 0 ],
                                    "order": 7,
                                    "source": [ "obj-2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-67", 0 ],
                                    "order": 10,
                                    "source": [ "obj-2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-74", 0 ],
                                    "order": 1,
                                    "source": [ "obj-2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-79", 0 ],
                                    "order": 9,
                                    "source": [ "obj-2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-86", 0 ],
                                    "order": 0,
                                    "source": [ "obj-2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-95", 0 ],
                                    "order": 11,
                                    "source": [ "obj-2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-16", 0 ],
                                    "source": [ "obj-20", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-13", 0 ],
                                    "midpoints": [ 110.5, 110.0, 1723.5, 110.0 ],
                                    "order": 1,
                                    "source": [ "obj-22", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-20", 0 ],
                                    "midpoints": [ 110.5, 109.0, 1565.5, 109.0 ],
                                    "order": 2,
                                    "source": [ "obj-22", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-29", 0 ],
                                    "midpoints": [ 110.5, 111.0, 1234.5, 111.0 ],
                                    "order": 4,
                                    "source": [ "obj-22", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-36", 0 ],
                                    "midpoints": [ 110.5, 110.0, 1392.5, 110.0 ],
                                    "order": 3,
                                    "source": [ "obj-22", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-43", 0 ],
                                    "midpoints": [ 110.5, 109.0, 906.5, 109.0 ],
                                    "order": 6,
                                    "source": [ "obj-22", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-50", 0 ],
                                    "midpoints": [ 110.5, 111.0, 1064.5, 111.0 ],
                                    "order": 5,
                                    "source": [ "obj-22", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-57", 0 ],
                                    "midpoints": [ 110.5, 111.0, 568.5, 111.0 ],
                                    "order": 8,
                                    "source": [ "obj-22", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-64", 0 ],
                                    "midpoints": [ 110.5, 110.0, 726.5, 110.0 ],
                                    "order": 7,
                                    "source": [ "obj-22", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-71", 0 ],
                                    "midpoints": [ 110.5, 110.0, 241.5, 110.0 ],
                                    "order": 10,
                                    "source": [ "obj-22", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-83", 0 ],
                                    "midpoints": [ 110.5, 109.0, 399.5, 109.0 ],
                                    "order": 9,
                                    "source": [ "obj-22", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-90", 0 ],
                                    "midpoints": [ 110.5, 108.0, 1893.5, 108.0 ],
                                    "order": 0,
                                    "source": [ "obj-22", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-99", 0 ],
                                    "midpoints": [ 110.5, 123.0, 74.5, 123.0 ],
                                    "order": 11,
                                    "source": [ "obj-22", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-116", 0 ],
                                    "source": [ "obj-23", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-23", 0 ],
                                    "source": [ "obj-24", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-24", 0 ],
                                    "source": [ "obj-25", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-25", 0 ],
                                    "source": [ "obj-26", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-25", 0 ],
                                    "source": [ "obj-27", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-25", 0 ],
                                    "source": [ "obj-29", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-117", 0 ],
                                    "source": [ "obj-30", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-30", 0 ],
                                    "source": [ "obj-31", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-31", 0 ],
                                    "source": [ "obj-32", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-32", 0 ],
                                    "source": [ "obj-33", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-32", 0 ],
                                    "source": [ "obj-34", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-32", 0 ],
                                    "source": [ "obj-36", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-114", 0 ],
                                    "source": [ "obj-37", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-37", 0 ],
                                    "source": [ "obj-38", 1 ]
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
                                    "destination": [ "obj-39", 0 ],
                                    "source": [ "obj-40", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-39", 0 ],
                                    "source": [ "obj-41", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-1", 0 ],
                                    "source": [ "obj-42", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-39", 0 ],
                                    "source": [ "obj-43", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-115", 0 ],
                                    "source": [ "obj-44", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-44", 0 ],
                                    "source": [ "obj-45", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-45", 0 ],
                                    "source": [ "obj-46", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-46", 0 ],
                                    "source": [ "obj-47", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-46", 0 ],
                                    "source": [ "obj-48", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-46", 0 ],
                                    "source": [ "obj-50", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-122", 0 ],
                                    "source": [ "obj-51", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-51", 0 ],
                                    "source": [ "obj-52", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-52", 0 ],
                                    "source": [ "obj-53", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-53", 0 ],
                                    "source": [ "obj-54", 0 ]
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
                                    "destination": [ "obj-53", 0 ],
                                    "source": [ "obj-57", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-113", 0 ],
                                    "source": [ "obj-58", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-58", 0 ],
                                    "source": [ "obj-59", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-59", 0 ],
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
                                    "destination": [ "obj-60", 0 ],
                                    "source": [ "obj-64", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-121", 0 ],
                                    "source": [ "obj-65", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-65", 0 ],
                                    "source": [ "obj-66", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-66", 0 ],
                                    "source": [ "obj-67", 0 ]
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
                                    "destination": [ "obj-67", 0 ],
                                    "source": [ "obj-69", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-67", 0 ],
                                    "source": [ "obj-71", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-119", 0 ],
                                    "source": [ "obj-72", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-72", 0 ],
                                    "source": [ "obj-73", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-73", 0 ],
                                    "source": [ "obj-74", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-74", 0 ],
                                    "source": [ "obj-75", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-74", 0 ],
                                    "source": [ "obj-76", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-112", 0 ],
                                    "source": [ "obj-77", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-77", 0 ],
                                    "source": [ "obj-78", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-78", 0 ],
                                    "source": [ "obj-79", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-79", 0 ],
                                    "source": [ "obj-80", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-79", 0 ],
                                    "source": [ "obj-81", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-79", 0 ],
                                    "source": [ "obj-83", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-111", 0 ],
                                    "source": [ "obj-84", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-84", 0 ],
                                    "source": [ "obj-85", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-85", 0 ],
                                    "source": [ "obj-86", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-86", 0 ],
                                    "source": [ "obj-87", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-86", 0 ],
                                    "source": [ "obj-88", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-42", 0 ],
                                    "source": [ "obj-9", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-86", 0 ],
                                    "source": [ "obj-90", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-22", 0 ],
                                    "source": [ "obj-91", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-9", 0 ],
                                    "source": [ "obj-95", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-95", 0 ],
                                    "source": [ "obj-96", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-95", 0 ],
                                    "source": [ "obj-97", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-95", 0 ],
                                    "source": [ "obj-99", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 1612.0482523441315, 598.7952028512955, 80.0, 22.0 ],
                    "text": "p SnareXP__",
                    "varname": "snareXP"
                }
            },
            {
                "box": {
                    "id": "obj-130",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
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
                        "rect": [ 282.0, 742.0, 2197.0, 568.0 ],
                        "boxes": [
                            {
                                "box": {
                                    "id": "obj-91",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "patching_rect": [ 101.0, 13.0, 58.0, 22.0 ],
                                    "text": "loadbang"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-22",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 101.0, 41.0, 42.0, 22.0 ],
                                    "text": "t5_buf"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-72",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 1967.0, 251.0, 109.0, 22.0 ],
                                    "text": "if $f1 >= 0 then $f1"
                                }
                            },
                            {
                                "box": {
                                    "fontface": 0,
                                    "fontname": "Arial",
                                    "fontsize": 12.0,
                                    "id": "obj-73",
                                    "interval": 20.0,
                                    "maxclass": "number~",
                                    "mode": 2,
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "float" ],
                                    "patching_rect": [ 1967.0, 221.0, 56.0, 22.0 ],
                                    "sig": 0.0
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-74",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "signal" ],
                                    "patching_rect": [ 1967.0, 189.0, 94.0, 22.0 ],
                                    "text": "gen~ b5_reader"
                                }
                            },
                            {
                                "box": {
                                    "attr": "kind",
                                    "displaymode": 1,
                                    "id": "obj-75",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 1967.0, 153.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "kind", 2.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[24]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[24]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[24]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "chIndex",
                                    "displaymode": 1,
                                    "id": "obj-76",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 1967.0, 126.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "chIndex", 11.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[25]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[25]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[25]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "buf",
                                    "id": "obj-77",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 1967.0, 100.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "buf", "t4_buf" ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[13]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[13]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[13]"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-65",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 1792.0, 251.0, 109.0, 22.0 ],
                                    "text": "if $f1 >= 0 then $f1"
                                }
                            },
                            {
                                "box": {
                                    "fontface": 0,
                                    "fontname": "Arial",
                                    "fontsize": 12.0,
                                    "id": "obj-66",
                                    "interval": 20.0,
                                    "maxclass": "number~",
                                    "mode": 2,
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "float" ],
                                    "patching_rect": [ 1792.0, 221.0, 56.0, 22.0 ],
                                    "sig": 0.0
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-67",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "signal" ],
                                    "patching_rect": [ 1792.0, 189.0, 94.0, 22.0 ],
                                    "text": "gen~ b5_reader"
                                }
                            },
                            {
                                "box": {
                                    "attr": "kind",
                                    "displaymode": 1,
                                    "id": "obj-68",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 1792.0, 153.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "kind", 2.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[23]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[23]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[23]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "chIndex",
                                    "displaymode": 1,
                                    "id": "obj-69",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 1792.0, 126.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "chIndex", 10.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[26]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[26]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[26]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "buf",
                                    "id": "obj-70",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 1792.0, 100.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "buf", "t4_buf" ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[12]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[12]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[12]"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-58",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 1620.0, 251.0, 109.0, 22.0 ],
                                    "text": "if $f1 >= 0 then $f1"
                                }
                            },
                            {
                                "box": {
                                    "fontface": 0,
                                    "fontname": "Arial",
                                    "fontsize": 12.0,
                                    "id": "obj-59",
                                    "interval": 20.0,
                                    "maxclass": "number~",
                                    "mode": 2,
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "float" ],
                                    "patching_rect": [ 1620.0, 221.0, 56.0, 22.0 ],
                                    "sig": 0.0
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-60",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "signal" ],
                                    "patching_rect": [ 1620.0, 189.0, 94.0, 22.0 ],
                                    "text": "gen~ b5_reader"
                                }
                            },
                            {
                                "box": {
                                    "attr": "kind",
                                    "displaymode": 1,
                                    "id": "obj-61",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 1620.0, 153.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "kind", 2.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[22]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[22]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[22]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "chIndex",
                                    "displaymode": 1,
                                    "id": "obj-62",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 1620.0, 126.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "chIndex", 9.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[27]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[27]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[27]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "buf",
                                    "id": "obj-63",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 1620.0, 100.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "buf", "t4_buf" ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[11]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[11]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[11]"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-51",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 1448.0, 251.0, 109.0, 22.0 ],
                                    "text": "if $f1 >= 0 then $f1"
                                }
                            },
                            {
                                "box": {
                                    "fontface": 0,
                                    "fontname": "Arial",
                                    "fontsize": 12.0,
                                    "id": "obj-52",
                                    "interval": 20.0,
                                    "maxclass": "number~",
                                    "mode": 2,
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "float" ],
                                    "patching_rect": [ 1448.0, 221.0, 56.0, 22.0 ],
                                    "sig": 0.0
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-53",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "signal" ],
                                    "patching_rect": [ 1448.0, 189.0, 94.0, 22.0 ],
                                    "text": "gen~ b5_reader"
                                }
                            },
                            {
                                "box": {
                                    "attr": "kind",
                                    "displaymode": 1,
                                    "id": "obj-54",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 1448.0, 153.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "kind", 2.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[21]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[21]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[21]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "chIndex",
                                    "displaymode": 1,
                                    "id": "obj-55",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 1448.0, 126.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "chIndex", 8.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[28]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[28]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[28]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "buf",
                                    "id": "obj-56",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 1448.0, 100.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "buf", "t4_buf" ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[10]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[10]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[10]"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-44",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 1278.0, 251.0, 109.0, 22.0 ],
                                    "text": "if $f1 >= 0 then $f1"
                                }
                            },
                            {
                                "box": {
                                    "fontface": 0,
                                    "fontname": "Arial",
                                    "fontsize": 12.0,
                                    "id": "obj-45",
                                    "interval": 20.0,
                                    "maxclass": "number~",
                                    "mode": 2,
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "float" ],
                                    "patching_rect": [ 1278.0, 221.0, 56.0, 22.0 ],
                                    "sig": 0.0
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-46",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "signal" ],
                                    "patching_rect": [ 1278.0, 189.0, 94.0, 22.0 ],
                                    "text": "gen~ b5_reader"
                                }
                            },
                            {
                                "box": {
                                    "attr": "kind",
                                    "displaymode": 1,
                                    "id": "obj-47",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 1278.0, 153.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "kind", 2.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[20]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[20]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[20]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "chIndex",
                                    "displaymode": 1,
                                    "id": "obj-48",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 1278.0, 126.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "chIndex", 7.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[29]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[29]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[29]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "buf",
                                    "id": "obj-49",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 1278.0, 100.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "buf", "t4_buf" ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[9]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[9]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[9]"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-37",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 1110.0, 251.0, 109.0, 22.0 ],
                                    "text": "if $f1 >= 0 then $f1"
                                }
                            },
                            {
                                "box": {
                                    "fontface": 0,
                                    "fontname": "Arial",
                                    "fontsize": 12.0,
                                    "id": "obj-38",
                                    "interval": 20.0,
                                    "maxclass": "number~",
                                    "mode": 2,
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "float" ],
                                    "patching_rect": [ 1110.0, 221.0, 56.0, 22.0 ],
                                    "sig": 0.0
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-39",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "signal" ],
                                    "patching_rect": [ 1110.0, 189.0, 94.0, 22.0 ],
                                    "text": "gen~ b5_reader"
                                }
                            },
                            {
                                "box": {
                                    "attr": "kind",
                                    "displaymode": 1,
                                    "id": "obj-40",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 1110.0, 153.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "kind", 2.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[19]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[19]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[19]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "chIndex",
                                    "displaymode": 1,
                                    "id": "obj-41",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 1110.0, 126.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "chIndex", 6.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[30]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[30]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[30]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "buf",
                                    "id": "obj-42",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 1110.0, 100.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "buf", "t4_buf" ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[8]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[8]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[8]"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-30",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 948.0, 251.0, 109.0, 22.0 ],
                                    "text": "if $f1 >= 0 then $f1"
                                }
                            },
                            {
                                "box": {
                                    "fontface": 0,
                                    "fontname": "Arial",
                                    "fontsize": 12.0,
                                    "id": "obj-31",
                                    "interval": 20.0,
                                    "maxclass": "number~",
                                    "mode": 2,
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "float" ],
                                    "patching_rect": [ 948.0, 221.0, 56.0, 22.0 ],
                                    "sig": 0.0
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-32",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "signal" ],
                                    "patching_rect": [ 948.0, 189.0, 94.0, 22.0 ],
                                    "text": "gen~ b5_reader"
                                }
                            },
                            {
                                "box": {
                                    "attr": "kind",
                                    "displaymode": 1,
                                    "id": "obj-33",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 948.0, 153.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "kind", 2.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[18]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[18]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[18]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "chIndex",
                                    "displaymode": 1,
                                    "id": "obj-34",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 948.0, 126.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "chIndex", 5.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[31]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[31]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[31]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "buf",
                                    "id": "obj-35",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 948.0, 100.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "buf", "t4_buf" ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[7]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[7]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[7]"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-23",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 782.0, 251.0, 109.0, 22.0 ],
                                    "text": "if $f1 >= 0 then $f1"
                                }
                            },
                            {
                                "box": {
                                    "fontface": 0,
                                    "fontname": "Arial",
                                    "fontsize": 12.0,
                                    "id": "obj-24",
                                    "interval": 20.0,
                                    "maxclass": "number~",
                                    "mode": 2,
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "float" ],
                                    "patching_rect": [ 782.0, 221.0, 56.0, 22.0 ],
                                    "sig": 0.0
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-25",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "signal" ],
                                    "patching_rect": [ 782.0, 189.0, 94.0, 22.0 ],
                                    "text": "gen~ b5_reader"
                                }
                            },
                            {
                                "box": {
                                    "attr": "kind",
                                    "displaymode": 1,
                                    "id": "obj-26",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 782.0, 153.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "kind", 2.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[17]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[17]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[17]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "chIndex",
                                    "displaymode": 1,
                                    "id": "obj-27",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 782.0, 126.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "chIndex", 4.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[32]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[32]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[32]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "buf",
                                    "id": "obj-28",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 782.0, 100.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "buf", "t4_buf" ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[6]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[6]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[6]"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-16",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 608.0, 251.0, 113.0, 22.0 ],
                                    "text": "if $f1 >= 0 then $f1"
                                }
                            },
                            {
                                "box": {
                                    "fontface": 0,
                                    "fontname": "Arial",
                                    "fontsize": 12.0,
                                    "id": "obj-17",
                                    "interval": 20.0,
                                    "maxclass": "number~",
                                    "mode": 2,
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "float" ],
                                    "patching_rect": [ 608.0, 221.0, 60.0, 22.0 ],
                                    "sig": 0.0
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-18",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "signal" ],
                                    "patching_rect": [ 608.0, 189.0, 98.0, 22.0 ],
                                    "text": "gen~ b5_reader"
                                }
                            },
                            {
                                "box": {
                                    "attr": "kind",
                                    "displaymode": 1,
                                    "id": "obj-19",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 608.0, 153.0, 154.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "kind", 2.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[16]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[16]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[16]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "chIndex",
                                    "displaymode": 1,
                                    "id": "obj-20",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 608.0, 126.0, 154.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "chIndex", 3.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[33]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[33]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[33]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "buf",
                                    "id": "obj-21",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 608.0, 100.0, 154.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "buf", "t4_buf" ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[5]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[5]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[5]"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-10",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 437.0, 251.0, 109.0, 22.0 ],
                                    "text": "if $f1 >= 0 then $f1"
                                }
                            },
                            {
                                "box": {
                                    "fontface": 0,
                                    "fontname": "Arial",
                                    "fontsize": 12.0,
                                    "id": "obj-11",
                                    "interval": 20.0,
                                    "maxclass": "number~",
                                    "mode": 2,
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "float" ],
                                    "patching_rect": [ 437.0, 221.0, 56.0, 22.0 ],
                                    "sig": 0.0
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-12",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "signal" ],
                                    "patching_rect": [ 437.0, 189.0, 94.0, 22.0 ],
                                    "text": "gen~ b5_reader"
                                }
                            },
                            {
                                "box": {
                                    "attr": "kind",
                                    "displaymode": 1,
                                    "id": "obj-13",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 437.0, 153.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "kind", 2.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[15]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[15]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[15]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "chIndex",
                                    "displaymode": 1,
                                    "id": "obj-14",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 437.0, 126.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "chIndex", 2.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[34]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[34]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[34]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "buf",
                                    "id": "obj-15",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 437.0, 100.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "buf", "t4_buf" ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[3]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[3]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[3]"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-9",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 230.0, 251.0, 109.0, 22.0 ],
                                    "text": "if $f1 >= 0 then $f1"
                                }
                            },
                            {
                                "box": {
                                    "fontface": 0,
                                    "fontname": "Arial",
                                    "fontsize": 12.0,
                                    "id": "obj-6",
                                    "interval": 20.0,
                                    "maxclass": "number~",
                                    "mode": 2,
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "float" ],
                                    "patching_rect": [ 230.0, 221.0, 56.0, 22.0 ],
                                    "sig": 0.0
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-1",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "signal" ],
                                    "patching_rect": [ 230.0, 189.0, 94.0, 22.0 ],
                                    "text": "gen~ b5_reader"
                                }
                            },
                            {
                                "box": {
                                    "attr": "kind",
                                    "displaymode": 1,
                                    "id": "obj-2",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 230.0, 153.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "kind", 2.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[14]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[14]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[14]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "chIndex",
                                    "displaymode": 1,
                                    "id": "obj-3",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 230.0, 126.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "chIndex", 1.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[35]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[35]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[35]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "buf",
                                    "id": "obj-4",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 230.0, 100.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "buf", "t4_buf" ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[4]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[4]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[4]"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-120",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "signal" ],
                                    "patching_rect": [ 27.0, 189.0, 94.0, 22.0 ],
                                    "text": "gen~ b5_reader"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-90",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patcher": {
                                        "fileversion": 1,
                                        "appversion": {
                                            "major": 9,
                                            "minor": 1,
                                            "revision": 5,
                                            "architecture": "x64",
                                            "modernui": 1
                                        },
                                        "classnamespace": "dsp.gen",
                                        "rect": [ 59.0, 107.0, 934.0, 1143.0 ],
                                        "boxes": [
                                            {
                                                "box": {
                                                    "code": "// ============================================================\r\n// FSM KickXP-inspired kick  –  Param version\r\n// ============================================================\r\n\r\n// ---- State ----\r\nHistory prevTrig(0);\r\nHistory envPhase(0);\r\nHistory oscPhase(0);\r\nHistory amp(0);\r\nHistory decAmp(0);\r\nHistory bAmp(0);\r\nHistory cAmp(0);\r\nHistory freq(50);\r\nHistory lastOut(0);\r\nHistory antiClick(0);\r\n\r\n// latched values (sampled on trigger)\r\nHistory startFrqL(145);\r\nHistory endFrqL(50);\r\nHistory buzzL(55);\r\nHistory clickL(28);\r\nHistory punchL(47);\r\nHistory tDecayL(30);\r\nHistory tShapeL(27);\r\nHistory bDecayL(55);\r\nHistory cDecayL(55);\r\nHistory dSlopeL(1);\r\nHistory dTimeL(32);\r\nHistory rSlopeL(105);\r\nHistory volL(200);\r\n\r\n// ---- Parameters (with original-style defaults) ----\r\nParam Start(145);     // 1-240\r\nParam End(50);        // 1-240\r\nParam Buzz(55);       // 0-100\r\nParam Click(28);      // 0-100\r\nParam Punch(47);      // 0-100\r\nParam TDecay(30);     // 1-240\r\nParam TShape(27);     // 1-240\r\nParam BDecay(55);     // 1-240\r\nParam CDecay(55);     // 1-240\r\nParam DSlope(1);      // 1-240\r\nParam DTime(32);      // 1-240\r\nParam RSlope(105);    // 1-240\r\nParam Volume(200);    // 0-240   (velocity / overall level)\r\n\r\n// ---- Trigger (inlet 1) ----\r\nTrig = in1;\r\nrising = (Trig > 0.5) && (prevTrig <= 0.5);\r\nprevTrig = Trig;\r\n\r\n// ---- Latch parameters on rising edge ----\r\nstartFrqL = rising ? Start  : startFrqL;\r\nendFrqL   = rising ? End    : endFrqL;\r\nbuzzL     = rising ? Buzz   : buzzL;\r\nclickL    = rising ? Click  : clickL;\r\npunchL    = rising ? Punch  : punchL;\r\ntDecayL   = rising ? TDecay : tDecayL;\r\ntShapeL   = rising ? TShape : tShapeL;\r\nbDecayL   = rising ? BDecay : bDecayL;\r\ncDecayL   = rising ? CDecay : cDecayL;\r\ndSlopeL   = rising ? DSlope : dSlopeL;\r\ndTimeL    = rising ? DTime  : dTimeL;\r\nrSlopeL   = rising ? RSlope : rSlopeL;\r\nvolL      = rising ? Volume : volL;\r\n\r\n// ---- Map to internal ranges ----\r\nsr   = samplerate;\r\nodsr = 1 / sr;\r\n\r\nstartHz = 33 * pow(128, startFrqL / 240);\r\nendHz   = 33 * pow(16,  endFrqL   / 240);\r\nratio   = endHz / max(startHz, 1);\r\n\r\ntDecay  = (tDecayL / 240) * (1/400) * (44100 * odsr);\r\ntShape  = tShapeL / 240;\r\n\r\ndSlope  = pow(20, dSlopeL/240 - 1) * 25 * odsr;\r\ndTime   = dTimeL * sr / 240;\r\nrSlope  = pow(20, rSlopeL/240 - 1) * 25 * odsr;\r\n\r\nbDecay  = bDecayL / 240;\r\ncDecay  = cDecayL / 240;\r\nbuzzAmt = 3 * (buzzL / 100);\r\nclickAmt= clickL / 100;\r\npunchAmt= punchL / 100;\r\nvol     = 0.5 * (volL / 128) * 0.7;\r\n\r\n// ---- Trigger reset ----\r\nenvPhase  = rising ? 0 : envPhase + 1;\r\noscPhase  = rising ? clickAmt : oscPhase;\r\nantiClick = rising ? lastOut : antiClick * 0.98;\r\namp       = rising ? 1 : amp;\r\nbAmp      = rising ? buzzAmt : bAmp;\r\ncAmp      = rising ? clickAmt : cAmp;\r\n\r\n// ---- Frequency envelope ----\r\nenvPoint = envPhase * tDecay;\r\nshaped   = pow(max(envPoint, 0), tShape * 2);\r\ncurFreq  = startHz * pow(ratio, shaped);\r\n\r\ncVal     = pow(1/256, cDecay * envPhase * (odsr * 20));\r\ncurFreq  = curFreq * (1 + 2 * punchAmt * cVal * cVal * cVal);\r\ncurFreq  = min(curFreq, 10000);\r\nfreq     = curFreq;\r\n\r\n// ---- Amplitude envelope ----\r\nif (envPhase < dTime) {\r\n    decAmp = dSlope;\r\n    amp    = 1 - decAmp * envPhase;\r\n} else {\r\n    amp = 1 - dSlope * dTime;\r\n    if (amp > 0) {\r\n        decAmp = rSlope;\r\n        amp    = amp - decAmp * (envPhase - dTime);\r\n    }\r\n}\r\namp = max(amp, 0);\r\n\r\n// decays\r\nbAmp = buzzAmt * pow(1/256, bDecay * envPhase * (odsr * 10));\r\ncAmp = clickAmt * cVal;\r\n\r\n// ---- Oscillator ----\r\ninc = freq / sr;\r\noscPhase = wrap(oscPhase + inc, 0, 1);\r\nxSin = sin(oscPhase * twopi);\r\n\r\n// Buzz (classic KickXP positive-half trick)\r\nbuzzSig = 0;\r\nif (xSin > 0) {\r\n    buzzSig = amp * vol * bAmp * xSin * cos(oscPhase * twopi);\r\n}\r\n\r\nbody = antiClick + amp * vol * xSin - buzzSig;\r\n\r\n// Click approximation\r\nclickEnv = pow(1/256, cDecay * envPhase * (odsr * 30));\r\nclickSig = amp * vol * clickAmt * clickEnv * noise() * 0.55;\r\n\r\nout1 = body + clickSig;\r\nlastOut = out1;",
                                                    "fontface": 0,
                                                    "fontname": "<Monospaced>",
                                                    "fontsize": 12.0,
                                                    "id": "obj-5",
                                                    "maxclass": "codebox",
                                                    "numinlets": 1,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "" ],
                                                    "patching_rect": [ 50.0, 92.0, 639.0, 923.0 ]
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-1",
                                                    "maxclass": "newobj",
                                                    "numinlets": 0,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "" ],
                                                    "patching_rect": [ 50.0, 14.0, 28.0, 22.0 ],
                                                    "text": "in 1"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-4",
                                                    "maxclass": "newobj",
                                                    "numinlets": 1,
                                                    "numoutlets": 0,
                                                    "patching_rect": [ 83.0, 1067.0, 35.0, 22.0 ],
                                                    "text": "out 1"
                                                }
                                            }
                                        ],
                                        "lines": [
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-5", 0 ],
                                                    "source": [ "obj-1", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-4", 0 ],
                                                    "source": [ "obj-5", 0 ]
                                                }
                                            }
                                        ]
                                    },
                                    "patching_rect": [ 27.0, 447.0, 155.5, 22.0 ],
                                    "text": "gen~ KickXP_"
                                }
                            },
                            {
                                "box": {
                                    "attr": "Start",
                                    "id": "obj-101",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 230.0, 306.0, 150.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "attr": "End",
                                    "id": "obj-102",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 437.0, 306.0, 150.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "attr": "Buzz",
                                    "id": "obj-103",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 608.0, 306.0, 154.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "attr": "Click",
                                    "id": "obj-104",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 782.0, 306.0, 150.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "attr": "Punch",
                                    "id": "obj-105",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 948.0, 306.0, 150.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "attr": "TDecay",
                                    "id": "obj-106",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 1110.0, 306.0, 150.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "attr": "TShape",
                                    "id": "obj-107",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 1278.0, 306.0, 150.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "attr": "BDecay",
                                    "id": "obj-108",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 1448.0, 306.0, 150.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "attr": "DSlope",
                                    "id": "obj-109",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 1620.0, 306.0, 150.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "attr": "DTime",
                                    "id": "obj-110",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 1792.0, 306.0, 150.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "attr": "RSlope",
                                    "id": "obj-111",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 1967.0, 306.0, 150.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "attr": "kind",
                                    "displaymode": 1,
                                    "id": "obj-121",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 50.0, 153.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "kind", 1.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[2]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[2]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[2]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "chIndex",
                                    "displaymode": 1,
                                    "id": "obj-122",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 50.0, 126.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "chIndex", 0.0 ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui[1]",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui[1]",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui[1]"
                                }
                            },
                            {
                                "box": {
                                    "attr": "buf",
                                    "id": "obj-127",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 1,
                                    "patching_rect": [ 50.0, 100.0, 150.0, 22.0 ],
                                    "saved_attribute_attributes": {
                                        "valueof": {
                                            "parameter_initial": [ "buf", "t4_buf" ],
                                            "parameter_initial_enable": 1,
                                            "parameter_invisible": 1,
                                            "parameter_longname": "attrui",
                                            "parameter_modmode": 0,
                                            "parameter_shortname": "attrui",
                                            "parameter_type": 3
                                        }
                                    },
                                    "varname": "attrui"
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-128",
                                    "index": 1,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 27.0, 26.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-129",
                                    "index": 1,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 27.0, 494.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-7",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 72.0, 484.0, 35.0, 22.0 ],
                                    "text": "open"
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "obj-6", 0 ],
                                    "source": [ "obj-1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-102", 0 ],
                                    "source": [ "obj-10", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-90", 0 ],
                                    "midpoints": [ 239.5, 351.0, 36.5, 351.0 ],
                                    "source": [ "obj-101", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-90", 0 ],
                                    "midpoints": [ 446.5, 358.0, 36.5, 358.0 ],
                                    "source": [ "obj-102", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-90", 0 ],
                                    "midpoints": [ 617.5, 366.0, 36.5, 366.0 ],
                                    "source": [ "obj-103", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-90", 0 ],
                                    "midpoints": [ 791.5, 373.0, 36.5, 373.0 ],
                                    "source": [ "obj-104", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-90", 0 ],
                                    "midpoints": [ 957.5, 382.0, 36.5, 382.0 ],
                                    "source": [ "obj-105", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-90", 0 ],
                                    "midpoints": [ 1119.5, 391.0, 36.5, 391.0 ],
                                    "source": [ "obj-106", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-90", 0 ],
                                    "midpoints": [ 1287.5, 398.0, 36.5, 398.0 ],
                                    "source": [ "obj-107", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-90", 0 ],
                                    "midpoints": [ 1457.5, 405.0, 36.5, 405.0 ],
                                    "source": [ "obj-108", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-90", 0 ],
                                    "midpoints": [ 1629.5, 413.0, 36.5, 413.0 ],
                                    "source": [ "obj-109", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-10", 0 ],
                                    "source": [ "obj-11", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-90", 0 ],
                                    "midpoints": [ 1801.5, 421.0, 36.5, 421.0 ],
                                    "source": [ "obj-110", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-90", 0 ],
                                    "midpoints": [ 1976.5, 428.0, 36.5, 428.0 ],
                                    "source": [ "obj-111", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-11", 0 ],
                                    "source": [ "obj-12", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-90", 0 ],
                                    "source": [ "obj-120", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-120", 0 ],
                                    "source": [ "obj-121", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-120", 0 ],
                                    "source": [ "obj-122", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-120", 0 ],
                                    "source": [ "obj-127", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-1", 0 ],
                                    "midpoints": [ 36.5, 87.0, 216.0, 87.0, 216.0, 186.0, 239.5, 186.0 ],
                                    "order": 10,
                                    "source": [ "obj-128", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-12", 0 ],
                                    "midpoints": [ 36.5, 87.0, 423.0, 87.0, 423.0, 186.0, 446.5, 186.0 ],
                                    "order": 9,
                                    "source": [ "obj-128", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-120", 0 ],
                                    "order": 11,
                                    "source": [ "obj-128", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-18", 0 ],
                                    "midpoints": [ 36.5, 88.0, 597.0, 88.0, 597.0, 186.0, 617.5, 186.0 ],
                                    "order": 8,
                                    "source": [ "obj-128", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-25", 0 ],
                                    "midpoints": [ 36.5, 87.0, 772.0, 87.0, 772.0, 183.0, 791.5, 183.0 ],
                                    "order": 7,
                                    "source": [ "obj-128", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-32", 0 ],
                                    "midpoints": [ 36.5, 87.0, 941.0, 87.0, 941.0, 183.0, 957.5, 183.0 ],
                                    "order": 6,
                                    "source": [ "obj-128", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-39", 0 ],
                                    "midpoints": [ 36.5, 87.0, 1104.0, 87.0, 1104.0, 183.0, 1119.5, 183.0 ],
                                    "order": 5,
                                    "source": [ "obj-128", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-46", 0 ],
                                    "midpoints": [ 36.5, 87.0, 1270.0, 87.0, 1270.0, 183.0, 1287.5, 183.0 ],
                                    "order": 4,
                                    "source": [ "obj-128", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-53", 0 ],
                                    "midpoints": [ 36.5, 87.0, 1438.0, 87.0, 1438.0, 183.0, 1457.5, 183.0 ],
                                    "order": 3,
                                    "source": [ "obj-128", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-60", 0 ],
                                    "midpoints": [ 36.5, 87.0, 1610.0, 87.0, 1610.0, 183.0, 1629.5, 183.0 ],
                                    "order": 2,
                                    "source": [ "obj-128", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-67", 0 ],
                                    "midpoints": [ 36.5, 87.0, 1784.0, 87.0, 1784.0, 183.0, 1801.5, 183.0 ],
                                    "order": 1,
                                    "source": [ "obj-128", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-74", 0 ],
                                    "midpoints": [ 36.5, 87.0, 1953.0, 87.0, 1953.0, 186.0, 1976.5, 186.0 ],
                                    "order": 0,
                                    "source": [ "obj-128", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-12", 0 ],
                                    "source": [ "obj-13", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-12", 0 ],
                                    "source": [ "obj-14", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-12", 0 ],
                                    "source": [ "obj-15", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-103", 0 ],
                                    "source": [ "obj-16", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-16", 0 ],
                                    "source": [ "obj-17", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-17", 0 ],
                                    "source": [ "obj-18", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-18", 0 ],
                                    "source": [ "obj-19", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-1", 0 ],
                                    "source": [ "obj-2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-18", 0 ],
                                    "source": [ "obj-20", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-18", 0 ],
                                    "source": [ "obj-21", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-127", 0 ],
                                    "order": 11,
                                    "source": [ "obj-22", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-15", 0 ],
                                    "order": 9,
                                    "source": [ "obj-22", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-21", 0 ],
                                    "order": 8,
                                    "source": [ "obj-22", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-28", 0 ],
                                    "order": 7,
                                    "source": [ "obj-22", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-35", 0 ],
                                    "order": 6,
                                    "source": [ "obj-22", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-4", 0 ],
                                    "order": 10,
                                    "source": [ "obj-22", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-42", 0 ],
                                    "order": 5,
                                    "source": [ "obj-22", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-49", 0 ],
                                    "order": 4,
                                    "source": [ "obj-22", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-56", 0 ],
                                    "order": 3,
                                    "source": [ "obj-22", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-63", 0 ],
                                    "order": 2,
                                    "source": [ "obj-22", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-70", 0 ],
                                    "order": 1,
                                    "source": [ "obj-22", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-77", 0 ],
                                    "order": 0,
                                    "source": [ "obj-22", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-104", 0 ],
                                    "source": [ "obj-23", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-23", 0 ],
                                    "source": [ "obj-24", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-24", 0 ],
                                    "source": [ "obj-25", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-25", 0 ],
                                    "source": [ "obj-26", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-25", 0 ],
                                    "source": [ "obj-27", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-25", 0 ],
                                    "source": [ "obj-28", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-1", 0 ],
                                    "source": [ "obj-3", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-105", 0 ],
                                    "source": [ "obj-30", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-30", 0 ],
                                    "source": [ "obj-31", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-31", 0 ],
                                    "source": [ "obj-32", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-32", 0 ],
                                    "source": [ "obj-33", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-32", 0 ],
                                    "source": [ "obj-34", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-32", 0 ],
                                    "source": [ "obj-35", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-106", 0 ],
                                    "source": [ "obj-37", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-37", 0 ],
                                    "source": [ "obj-38", 1 ]
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
                                    "destination": [ "obj-1", 0 ],
                                    "source": [ "obj-4", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-39", 0 ],
                                    "source": [ "obj-40", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-39", 0 ],
                                    "source": [ "obj-41", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-39", 0 ],
                                    "source": [ "obj-42", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-107", 0 ],
                                    "source": [ "obj-44", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-44", 0 ],
                                    "source": [ "obj-45", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-45", 0 ],
                                    "source": [ "obj-46", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-46", 0 ],
                                    "source": [ "obj-47", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-46", 0 ],
                                    "source": [ "obj-48", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-46", 0 ],
                                    "source": [ "obj-49", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-108", 0 ],
                                    "source": [ "obj-51", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-51", 0 ],
                                    "source": [ "obj-52", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-52", 0 ],
                                    "source": [ "obj-53", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-53", 0 ],
                                    "source": [ "obj-54", 0 ]
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
                                    "destination": [ "obj-53", 0 ],
                                    "source": [ "obj-56", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-109", 0 ],
                                    "source": [ "obj-58", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-58", 0 ],
                                    "source": [ "obj-59", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-9", 0 ],
                                    "source": [ "obj-6", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-59", 0 ],
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
                                    "destination": [ "obj-60", 0 ],
                                    "source": [ "obj-63", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-110", 0 ],
                                    "source": [ "obj-65", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-65", 0 ],
                                    "source": [ "obj-66", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-66", 0 ],
                                    "source": [ "obj-67", 0 ]
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
                                    "destination": [ "obj-67", 0 ],
                                    "source": [ "obj-69", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-90", 0 ],
                                    "source": [ "obj-7", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-67", 0 ],
                                    "source": [ "obj-70", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-111", 0 ],
                                    "source": [ "obj-72", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-72", 0 ],
                                    "source": [ "obj-73", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-73", 0 ],
                                    "source": [ "obj-74", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-74", 0 ],
                                    "source": [ "obj-75", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-74", 0 ],
                                    "source": [ "obj-76", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-74", 0 ],
                                    "source": [ "obj-77", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-101", 0 ],
                                    "source": [ "obj-9", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-129", 0 ],
                                    "source": [ "obj-90", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-22", 0 ],
                                    "source": [ "obj-91", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 1691.566327571869, 598.7952028512955, 71.0, 22.0 ],
                    "text": "p KickXP__",
                    "varname": "kickxp"
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
                    "patching_rect": [ 1703.6145207881927, 632.5301438570023, 48.0, 136.0 ],
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
                    "id": "obj-40",
                    "maxclass": "ezdac~",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [ 1703.6145207881927, 800.0000295639038, 36.0, 36.0 ]
                }
            },
            {
                "box": {
                    "hidden": 1,
                    "id": "obj-29",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 451.0, 729.0, 77.0, 22.0 ],
                    "text": "s gfx_update"
                }
            },
            {
                "box": {
                    "hidden": 1,
                    "id": "obj-22",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
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
                        "rect": [ 946.0, 206.0, 1276.0, 822.0 ],
                        "boxes": [
                            {
                                "box": {
                                    "id": "obj-5",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 3,
                                    "outlettype": [ "bang", "bang", "" ],
                                    "patching_rect": [ 570.0, 117.0, 57.0, 22.0 ],
                                    "text": "sel 95 43"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-4",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 3,
                                    "outlettype": [ "bang", "bang", "" ],
                                    "patching_rect": [ 749.0, 115.0, 57.0, 22.0 ],
                                    "text": "sel 95 43"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-2",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 471.0, 63.0, 150.0, 20.0 ],
                                    "text": "95, 43 are plus and minus"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-18",
                                    "maxclass": "live.scope~",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "patching_rect": [ 485.0, 387.6666662096977, 184.6666721701622, 30.666667580604553 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-17",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 484.87806034088135, 360.00000858306885, 39.0, 22.0 ],
                                    "text": "click~"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-20",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "patching_rect": [ 485.0, 293.92308807373047, 63.0, 22.0 ],
                                    "text": "metro 105"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-23",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "patching_rect": [ 485.0, 258.92308807373047, 61.0, 22.0 ],
                                    "text": "delay 200"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-24",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 485.0, 216.92308807373047, 37.0, 22.0 ],
                                    "text": "bang"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-26",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 527.0, 216.92308807373047, 31.0, 22.0 ],
                                    "text": "stop"
                                }
                            },
                            {
                                "box": {
                                    "bgcolor": [ 0.42745098039215684, 0.7411764705882353, 0.32941176470588235, 1.0 ],
                                    "bgcolor2": [ 0.42745098039215684, 0.7411764705882353, 0.32941176470588235, 1.0 ],
                                    "bgfillcolor_angle": 270.0,
                                    "bgfillcolor_autogradient": 0.0,
                                    "bgfillcolor_color": [ 0.27058823529411763, 0.6862745098039216, 0.10980392156862745, 1.0 ],
                                    "bgfillcolor_color1": [ 0.42745098039215684, 0.7411764705882353, 0.32941176470588235, 1.0 ],
                                    "bgfillcolor_color2": [ 0.155775393210821, 0.174257207209253, 0.193751291175729, 1.0 ],
                                    "bgfillcolor_proportion": 0.5,
                                    "bgfillcolor_type": "color",
                                    "fontface": 1,
                                    "fontsize": 14.0,
                                    "gradient": 1,
                                    "id": "obj-37",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 336.0, 334.92308807373047, 56.0, 25.0 ],
                                    "text": "13",
                                    "textcolor": [ 0.10980392156862745, 0.10196078431372549, 0.10196078431372549, 1.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-29",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "" ],
                                    "patching_rect": [ 367.0, 187.69231605529785, 77.0, 22.0 ],
                                    "text": "array.index 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-34",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "patching_rect": [ 664.0, 172.0, 22.0, 22.0 ],
                                    "text": "t b"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-35",
                                    "maxclass": "newobj",
                                    "numinlets": 5,
                                    "numoutlets": 5,
                                    "outlettype": [ "bang", "bang", "bang", "bang", "" ],
                                    "patching_rect": [ 646.0, 115.0, 91.0, 22.0 ],
                                    "text": "sel 28 29 30 31"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-36",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "bang", "bang" ],
                                    "patching_rect": [ 485.0, 172.0, 32.0, 22.0 ],
                                    "text": "t b b"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-9",
                                    "maxclass": "newobj",
                                    "numinlets": 5,
                                    "numoutlets": 5,
                                    "outlettype": [ "bang", "bang", "bang", "bang", "" ],
                                    "patching_rect": [ 467.0, 117.0, 91.0, 22.0 ],
                                    "text": "sel 28 29 30 31"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-3",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 4,
                                    "outlettype": [ "int", "int", "int", "int" ],
                                    "patching_rect": [ 675.0, 62.0, 50.5, 22.0 ],
                                    "text": "keyup"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-6",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 137.69231605529785, 149.23077392578125, 154.0, 22.0 ],
                                    "text": "36",
                                    "varname": "input_keys[3]"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-92",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "" ],
                                    "patching_rect": [ 199.2307834625244, 187.69231605529785, 77.0, 22.0 ],
                                    "text": "array.index 2"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-27",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "bang", "" ],
                                    "patching_rect": [ 137.69231605529785, 216.92308807373047, 29.5, 22.0 ],
                                    "text": "t b l"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-22",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 137.69231605529785, 334.92308807373047, 154.0, 22.0 ],
                                    "text": "keys 13 36 0 -4",
                                    "varname": "input_keys[1]"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-19",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 96.15385055541992, 187.69231605529785, 81.0, 22.0 ],
                                    "text": "prepend keys"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-16",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 50.0, 334.92308807373047, 74.0, 22.0 ],
                                    "text": "key_handler"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-14",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "bang", "" ],
                                    "patching_rect": [ 50.0, 156.92308235168457, 29.5, 22.0 ],
                                    "text": "t b l"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-13",
                                    "maxclass": "newobj",
                                    "numinlets": 4,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 50.0, 130.76923370361328, 58.0, 22.0 ],
                                    "text": "pack i i i i"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-7",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 4,
                                    "outlettype": [ "int", "int", "int", "int" ],
                                    "patching_rect": [ 50.0, 100.0, 50.5, 22.0 ],
                                    "text": "key"
                                }
                            },
                            {
                                "box": {
                                    "comment": "Trigger the KeyHandler function",
                                    "id": "obj-8",
                                    "index": 1,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 50.0, 388.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "Passes the Keys list ( 4 long )",
                                    "id": "obj-15",
                                    "index": 2,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 138.0, 388.0, 30.0, 30.0 ]
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "obj-14", 0 ],
                                    "source": [ "obj-13", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-16", 0 ],
                                    "source": [ "obj-14", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-19", 0 ],
                                    "source": [ "obj-14", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-8", 0 ],
                                    "source": [ "obj-16", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-18", 0 ],
                                    "source": [ "obj-17", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-27", 0 ],
                                    "source": [ "obj-19", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-16", 0 ],
                                    "midpoints": [ 494.5, 328.0, 59.5, 328.0 ],
                                    "source": [ "obj-20", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-17", 0 ],
                                    "disabled": 1,
                                    "midpoints": [ 494.5, 329.9230838418007, 494.37806034088135, 329.9230838418007 ],
                                    "source": [ "obj-20", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-15", 0 ],
                                    "source": [ "obj-22", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-20", 0 ],
                                    "source": [ "obj-23", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-23", 0 ],
                                    "midpoints": [ 494.5, 250.2564173936844, 494.5, 250.2564173936844 ],
                                    "source": [ "obj-24", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-20", 1 ],
                                    "midpoints": [ 536.5, 247.58975064754486, 565.6666598320007, 247.58975064754486, 565.6666598320007, 282.2564172744751, 538.5, 282.2564172744751 ],
                                    "order": 0,
                                    "source": [ "obj-26", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-23", 1 ],
                                    "midpoints": [ 536.5, 243.58975052833557, 536.5, 243.58975052833557 ],
                                    "order": 1,
                                    "source": [ "obj-26", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-22", 1 ],
                                    "order": 1,
                                    "source": [ "obj-27", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-22", 0 ],
                                    "source": [ "obj-27", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-29", 0 ],
                                    "order": 0,
                                    "source": [ "obj-27", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-92", 0 ],
                                    "order": 2,
                                    "source": [ "obj-27", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-37", 1 ],
                                    "order": 2,
                                    "source": [ "obj-29", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-5", 0 ],
                                    "order": 0,
                                    "source": [ "obj-29", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-9", 0 ],
                                    "order": 1,
                                    "source": [ "obj-29", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-35", 0 ],
                                    "order": 1,
                                    "source": [ "obj-3", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-4", 0 ],
                                    "order": 0,
                                    "source": [ "obj-3", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-26", 0 ],
                                    "source": [ "obj-34", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-34", 0 ],
                                    "source": [ "obj-35", 3 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-34", 0 ],
                                    "source": [ "obj-35", 2 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-34", 0 ],
                                    "source": [ "obj-35", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-34", 0 ],
                                    "source": [ "obj-35", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-24", 0 ],
                                    "source": [ "obj-36", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-34", 0 ],
                                    "source": [ "obj-4", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-34", 0 ],
                                    "source": [ "obj-4", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-36", 0 ],
                                    "source": [ "obj-5", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-36", 0 ],
                                    "source": [ "obj-5", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-13", 3 ],
                                    "source": [ "obj-7", 3 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-13", 2 ],
                                    "source": [ "obj-7", 2 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-13", 1 ],
                                    "source": [ "obj-7", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-13", 0 ],
                                    "source": [ "obj-7", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-36", 0 ],
                                    "source": [ "obj-9", 3 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-36", 0 ],
                                    "source": [ "obj-9", 2 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-36", 0 ],
                                    "source": [ "obj-9", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-36", 0 ],
                                    "source": [ "obj-9", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-6", 1 ],
                                    "source": [ "obj-92", 0 ]
                                }
                            }
                        ],
                        "patchlinecolor": [ 0.2196078431372549, 0.2196078431372549, 0.2196078431372549, 1.0 ],
                        "bgcolor": [ 0.5725490196078431, 0.5725490196078431, 0.5725490196078431, 1.0 ],
                        "editing_bgcolor": [ 0.5725490196078431, 0.5725490196078431, 0.5725490196078431, 1.0 ]
                    },
                    "patching_rect": [ 591.5887804627419, 90.0, 107.0, 22.0 ],
                    "saved_object_attributes": {
                        "editing_bgcolor": [ 0.5725490196078431, 0.5725490196078431, 0.5725490196078431, 1.0 ],
                        "locked_bgcolor": [ 0.5725490196078431, 0.5725490196078431, 0.5725490196078431, 1.0 ],
                        "patchlinecolor": [ 0.2196078431372549, 0.2196078431372549, 0.2196078431372549, 1.0 ]
                    },
                    "text": "p KEY_HANDLER"
                }
            },
            {
                "box": {
                    "filename": "hex_tracker.js",
                    "id": "obj-2",
                    "maxclass": "v8ui",
                    "numinlets": 4,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 714.4578577280045, 138.5542219877243, 525.0, 428.0 ],
                    "textfile": {
                        "filename": "hex_tracker.js",
                        "flags": 0,
                        "embed": 0,
                        "autowatch": 1
                    },
                    "varname": "v8ui_AB"
                }
            },
            {
                "box": {
                    "filename": "zen_tracker_seq_ui_E.js",
                    "id": "obj-1",
                    "maxclass": "v8ui",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1.2048193216323853, 138.5542219877243, 614.4578540325165, 583.1325516700745 ],
                    "textfile": {
                        "filename": "zen_tracker_seq_ui_E.js",
                        "flags": 0,
                        "embed": 0,
                        "autowatch": 1
                    },
                    "varname": "v8ui_AA"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.28627450980392155, 0.3411764705882353, 0.7411764705882353, 1.0 ],
                    "color": [ 0.17254901960784313, 0.3176470588235294, 0.5019607843137255, 1.0 ],
                    "id": "obj-3",
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
                        "rect": [ 59.0, 107.0, 200.0, 400.0 ],
                        "boxes": [
                            {
                                "box": {
                                    "id": "obj-1",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "float", "bang" ],
                                    "patching_rect": [ 20.0, 20.0, 100.0, 22.0 ],
                                    "text": "buffer~ t0_buf",
                                    "varname": "t0_buf"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-2",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "float", "bang" ],
                                    "patching_rect": [ 20.0, 52.0, 100.0, 22.0 ],
                                    "text": "buffer~ t1_buf",
                                    "varname": "t1_buf"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-3",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "float", "bang" ],
                                    "patching_rect": [ 20.0, 84.0, 100.0, 22.0 ],
                                    "text": "buffer~ t2_buf",
                                    "varname": "t2_buf"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-4",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "float", "bang" ],
                                    "patching_rect": [ 20.0, 116.0, 100.0, 22.0 ],
                                    "text": "buffer~ t3_buf",
                                    "varname": "t3_buf"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-5",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "float", "bang" ],
                                    "patching_rect": [ 20.0, 148.0, 100.0, 22.0 ],
                                    "text": "buffer~ t4_buf",
                                    "varname": "t4_buf"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-6",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "float", "bang" ],
                                    "patching_rect": [ 20.0, 180.0, 100.0, 22.0 ],
                                    "text": "buffer~ t5_buf",
                                    "varname": "t5_buf"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-7",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "float", "bang" ],
                                    "patching_rect": [ 20.0, 212.0, 100.0, 22.0 ],
                                    "text": "buffer~ t6_buf",
                                    "varname": "t6_buf"
                                }
                            }
                        ],
                        "lines": []
                    },
                    "patching_rect": [ 9.638554573059082, 1013.253049492836, 100.0, 22.0 ],
                    "text": "p buffer_storage",
                    "varname": "buffer_storage"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "color": [ 0.03137254901960784, 0.6078431372549019, 0.9411764705882353, 1.0 ],
                    "destination": [ "obj-2", 0 ],
                    "hidden": 1,
                    "midpoints": [ 606.1626733541489, 752.0, 568.0, 752.0, 568.0, 149.0, 723.9578577280045, 149.0 ],
                    "source": [ "obj-1", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 0 ],
                    "hidden": 1,
                    "source": [ "obj-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-43", 1 ],
                    "order": 0,
                    "source": [ "obj-130", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-43", 0 ],
                    "order": 1,
                    "source": [ "obj-130", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20", 1 ],
                    "order": 1,
                    "source": [ "obj-18", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20", 0 ],
                    "order": 1,
                    "source": [ "obj-18", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-66", 1 ],
                    "order": 0,
                    "source": [ "obj-18", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-66", 0 ],
                    "order": 0,
                    "source": [ "obj-18", 0 ]
                }
            },
            {
                "patchline": {
                    "color": [ 0.6352941176470588, 0.2784313725490196, 0.2784313725490196, 1.0 ],
                    "destination": [ "obj-1", 0 ],
                    "hidden": 1,
                    "midpoints": [ 976.9578577280045, 514.0, 576.0, 514.0, 576.0, 123.0, 15.0, 123.0, 15.0, 150.0, 10.704819321632385, 150.0 ],
                    "order": 1,
                    "source": [ "obj-2", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-29", 0 ],
                    "hidden": 1,
                    "order": 0,
                    "source": [ "obj-2", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-49", 0 ],
                    "hidden": 1,
                    "midpoints": [ 1229.9578577280045, 439.31325590610504, 686.5060287714005, 439.31325590610504, 686.5060287714005, 124.0, 723.9578577280045, 124.0 ],
                    "source": [ "obj-2", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-2", 2 ],
                    "hidden": 1,
                    "source": [ "obj-22", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-2", 0 ],
                    "hidden": 1,
                    "source": [ "obj-22", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-50", 1 ],
                    "order": 1,
                    "source": [ "obj-34", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-50", 0 ],
                    "order": 1,
                    "source": [ "obj-34", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-66", 1 ],
                    "order": 0,
                    "source": [ "obj-34", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-66", 0 ],
                    "order": 0,
                    "source": [ "obj-34", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-40", 1 ],
                    "source": [ "obj-43", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-40", 0 ],
                    "source": [ "obj-43", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-53", 1 ],
                    "source": [ "obj-45", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-53", 0 ],
                    "source": [ "obj-45", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-52", 1 ],
                    "source": [ "obj-50", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-52", 0 ],
                    "source": [ "obj-50", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-58", 1 ],
                    "order": 0,
                    "source": [ "obj-55", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-58", 0 ],
                    "order": 0,
                    "source": [ "obj-55", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-59", 1 ],
                    "order": 1,
                    "source": [ "obj-55", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-59", 0 ],
                    "order": 1,
                    "source": [ "obj-55", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-45", 1 ],
                    "source": [ "obj-58", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-45", 0 ],
                    "source": [ "obj-58", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-61", 1 ],
                    "source": [ "obj-59", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-61", 0 ],
                    "source": [ "obj-59", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 1 ],
                    "hidden": 1,
                    "source": [ "obj-6", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "hidden": 1,
                    "source": [ "obj-6", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-130", 0 ],
                    "order": 2,
                    "source": [ "obj-63", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-34", 0 ],
                    "order": 3,
                    "source": [ "obj-63", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-55", 0 ],
                    "order": 0,
                    "source": [ "obj-63", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-7", 0 ],
                    "order": 1,
                    "source": [ "obj-63", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-58", 1 ],
                    "source": [ "obj-66", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-58", 0 ],
                    "source": [ "obj-66", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-18", 1 ],
                    "source": [ "obj-7", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-18", 0 ],
                    "source": [ "obj-7", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-71", 1 ],
                    "source": [ "obj-70", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-71", 0 ],
                    "source": [ "obj-70", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-58", 1 ],
                    "order": 1,
                    "source": [ "obj-71", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-58", 0 ],
                    "order": 1,
                    "source": [ "obj-71", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-72", 1 ],
                    "order": 0,
                    "source": [ "obj-71", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-72", 0 ],
                    "order": 0,
                    "source": [ "obj-71", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-2", 1 ],
                    "hidden": 1,
                    "source": [ "obj-8", 0 ]
                }
            }
        ],
        "parameters": {
            "obj-130::obj-121": [ "attrui[2]", "attrui[2]", 0 ],
            "obj-130::obj-122": [ "attrui[1]", "attrui[1]", 0 ],
            "obj-130::obj-127": [ "attrui", "attrui", 0 ],
            "obj-130::obj-13": [ "attrui[15]", "attrui[15]", 0 ],
            "obj-130::obj-14": [ "attrui[34]", "attrui[34]", 0 ],
            "obj-130::obj-15": [ "attrui[3]", "attrui[3]", 0 ],
            "obj-130::obj-19": [ "attrui[16]", "attrui[16]", 0 ],
            "obj-130::obj-2": [ "attrui[14]", "attrui[14]", 0 ],
            "obj-130::obj-20": [ "attrui[33]", "attrui[33]", 0 ],
            "obj-130::obj-21": [ "attrui[5]", "attrui[5]", 0 ],
            "obj-130::obj-26": [ "attrui[17]", "attrui[17]", 0 ],
            "obj-130::obj-27": [ "attrui[32]", "attrui[32]", 0 ],
            "obj-130::obj-28": [ "attrui[6]", "attrui[6]", 0 ],
            "obj-130::obj-3": [ "attrui[35]", "attrui[35]", 0 ],
            "obj-130::obj-33": [ "attrui[18]", "attrui[18]", 0 ],
            "obj-130::obj-34": [ "attrui[31]", "attrui[31]", 0 ],
            "obj-130::obj-35": [ "attrui[7]", "attrui[7]", 0 ],
            "obj-130::obj-4": [ "attrui[4]", "attrui[4]", 0 ],
            "obj-130::obj-40": [ "attrui[19]", "attrui[19]", 0 ],
            "obj-130::obj-41": [ "attrui[30]", "attrui[30]", 0 ],
            "obj-130::obj-42": [ "attrui[8]", "attrui[8]", 0 ],
            "obj-130::obj-47": [ "attrui[20]", "attrui[20]", 0 ],
            "obj-130::obj-48": [ "attrui[29]", "attrui[29]", 0 ],
            "obj-130::obj-49": [ "attrui[9]", "attrui[9]", 0 ],
            "obj-130::obj-54": [ "attrui[21]", "attrui[21]", 0 ],
            "obj-130::obj-55": [ "attrui[28]", "attrui[28]", 0 ],
            "obj-130::obj-56": [ "attrui[10]", "attrui[10]", 0 ],
            "obj-130::obj-61": [ "attrui[22]", "attrui[22]", 0 ],
            "obj-130::obj-62": [ "attrui[27]", "attrui[27]", 0 ],
            "obj-130::obj-63": [ "attrui[11]", "attrui[11]", 0 ],
            "obj-130::obj-68": [ "attrui[23]", "attrui[23]", 0 ],
            "obj-130::obj-69": [ "attrui[26]", "attrui[26]", 0 ],
            "obj-130::obj-70": [ "attrui[12]", "attrui[12]", 0 ],
            "obj-130::obj-75": [ "attrui[24]", "attrui[24]", 0 ],
            "obj-130::obj-76": [ "attrui[25]", "attrui[25]", 0 ],
            "obj-130::obj-77": [ "attrui[13]", "attrui[13]", 0 ],
            "obj-18": [ "live.gain~[3]", "live.gain~", 0 ],
            "obj-34::obj-13": [ "attrui[67]", "attrui[67]", 0 ],
            "obj-34::obj-17": [ "attrui[40]", "attrui[24]", 0 ],
            "obj-34::obj-18": [ "attrui[41]", "attrui[25]", 0 ],
            "obj-34::obj-20": [ "attrui[66]", "attrui[66]", 0 ],
            "obj-34::obj-26": [ "attrui[42]", "attrui[24]", 0 ],
            "obj-34::obj-27": [ "attrui[43]", "attrui[25]", 0 ],
            "obj-34::obj-29": [ "attrui[64]", "attrui[64]", 0 ],
            "obj-34::obj-33": [ "attrui[44]", "attrui[24]", 0 ],
            "obj-34::obj-34": [ "attrui[45]", "attrui[25]", 0 ],
            "obj-34::obj-36": [ "attrui[65]", "attrui[65]", 0 ],
            "obj-34::obj-40": [ "attrui[46]", "attrui[24]", 0 ],
            "obj-34::obj-41": [ "attrui[38]", "attrui[25]", 0 ],
            "obj-34::obj-43": [ "attrui[62]", "attrui[62]", 0 ],
            "obj-34::obj-47": [ "attrui[47]", "attrui[24]", 0 ],
            "obj-34::obj-48": [ "attrui[39]", "attrui[25]", 0 ],
            "obj-34::obj-50": [ "attrui[63]", "attrui[63]", 0 ],
            "obj-34::obj-54": [ "attrui[48]", "attrui[24]", 0 ],
            "obj-34::obj-55": [ "attrui[49]", "attrui[25]", 0 ],
            "obj-34::obj-57": [ "attrui[60]", "attrui[60]", 0 ],
            "obj-34::obj-61": [ "attrui[50]", "attrui[24]", 0 ],
            "obj-34::obj-62": [ "attrui[51]", "attrui[25]", 0 ],
            "obj-34::obj-64": [ "attrui[61]", "attrui[61]", 0 ],
            "obj-34::obj-68": [ "attrui[52]", "attrui[24]", 0 ],
            "obj-34::obj-69": [ "attrui[53]", "attrui[25]", 0 ],
            "obj-34::obj-71": [ "attrui[58]", "attrui[58]", 0 ],
            "obj-34::obj-75": [ "attrui[36]", "attrui[24]", 0 ],
            "obj-34::obj-76": [ "attrui[37]", "attrui[25]", 0 ],
            "obj-34::obj-80": [ "attrui[54]", "attrui[24]", 0 ],
            "obj-34::obj-81": [ "attrui[55]", "attrui[25]", 0 ],
            "obj-34::obj-83": [ "attrui[59]", "attrui[59]", 0 ],
            "obj-34::obj-87": [ "attrui[56]", "attrui[24]", 0 ],
            "obj-34::obj-88": [ "attrui[57]", "attrui[25]", 0 ],
            "obj-34::obj-90": [ "attrui[68]", "attrui[68]", 0 ],
            "obj-34::obj-96": [ "attrui[69]", "attrui[24]", 0 ],
            "obj-34::obj-97": [ "attrui[70]", "attrui[25]", 0 ],
            "obj-34::obj-99": [ "attrui[71]", "attrui[58]", 0 ],
            "obj-43": [ "live.gain~", "live.gain~", 0 ],
            "obj-45": [ "live.gain~[4]", "live.gain~", 0 ],
            "obj-50": [ "live.gain~[1]", "live.gain~", 0 ],
            "obj-55::obj-10": [ "attrui[120]", "attrui[14]", 0 ],
            "obj-55::obj-101": [ "attrui[140]", "attrui[14]", 0 ],
            "obj-55::obj-102": [ "attrui[141]", "attrui[35]", 0 ],
            "obj-55::obj-103": [ "attrui[131]", "attrui[4]", 0 ],
            "obj-55::obj-108": [ "attrui[142]", "attrui[14]", 0 ],
            "obj-55::obj-109": [ "attrui[143]", "attrui[35]", 0 ],
            "obj-55::obj-110": [ "attrui[144]", "attrui[4]", 0 ],
            "obj-55::obj-119": [ "attrui[145]", "attrui[14]", 0 ],
            "obj-55::obj-12": [ "attrui[121]", "attrui[35]", 0 ],
            "obj-55::obj-120": [ "attrui[146]", "attrui[35]", 0 ],
            "obj-55::obj-121": [ "attrui[147]", "attrui[4]", 0 ],
            "obj-55::obj-126": [ "attrui[148]", "attrui[14]", 0 ],
            "obj-55::obj-127": [ "attrui[149]", "attrui[35]", 0 ],
            "obj-55::obj-128": [ "attrui[150]", "attrui[4]", 0 ],
            "obj-55::obj-13": [ "attrui[122]", "attrui[4]", 0 ],
            "obj-55::obj-133": [ "attrui[151]", "attrui[14]", 0 ],
            "obj-55::obj-134": [ "attrui[152]", "attrui[35]", 0 ],
            "obj-55::obj-135": [ "attrui[153]", "attrui[4]", 0 ],
            "obj-55::obj-140": [ "attrui[154]", "attrui[14]", 0 ],
            "obj-55::obj-141": [ "attrui[155]", "attrui[35]", 0 ],
            "obj-55::obj-142": [ "attrui[156]", "attrui[4]", 0 ],
            "obj-55::obj-147": [ "attrui[157]", "attrui[14]", 0 ],
            "obj-55::obj-148": [ "attrui[158]", "attrui[35]", 0 ],
            "obj-55::obj-149": [ "attrui[159]", "attrui[4]", 0 ],
            "obj-55::obj-154": [ "attrui[160]", "attrui[14]", 0 ],
            "obj-55::obj-155": [ "attrui[161]", "attrui[35]", 0 ],
            "obj-55::obj-156": [ "attrui[162]", "attrui[4]", 0 ],
            "obj-55::obj-161": [ "attrui[163]", "attrui[14]", 0 ],
            "obj-55::obj-162": [ "attrui[164]", "attrui[35]", 0 ],
            "obj-55::obj-163": [ "attrui[165]", "attrui[4]", 0 ],
            "obj-55::obj-168": [ "attrui[166]", "attrui[14]", 0 ],
            "obj-55::obj-169": [ "attrui[167]", "attrui[35]", 0 ],
            "obj-55::obj-170": [ "attrui[168]", "attrui[4]", 0 ],
            "obj-55::obj-175": [ "attrui[169]", "attrui[14]", 0 ],
            "obj-55::obj-176": [ "attrui[170]", "attrui[35]", 0 ],
            "obj-55::obj-177": [ "attrui[171]", "attrui[4]", 0 ],
            "obj-55::obj-182": [ "attrui[172]", "attrui[14]", 0 ],
            "obj-55::obj-183": [ "attrui[173]", "attrui[35]", 0 ],
            "obj-55::obj-184": [ "attrui[174]", "attrui[4]", 0 ],
            "obj-55::obj-189": [ "attrui[175]", "attrui[14]", 0 ],
            "obj-55::obj-190": [ "attrui[176]", "attrui[35]", 0 ],
            "obj-55::obj-191": [ "attrui[177]", "attrui[4]", 0 ],
            "obj-55::obj-196": [ "attrui[178]", "attrui[14]", 0 ],
            "obj-55::obj-197": [ "attrui[179]", "attrui[35]", 0 ],
            "obj-55::obj-198": [ "attrui[180]", "attrui[4]", 0 ],
            "obj-55::obj-203": [ "attrui[181]", "attrui[14]", 0 ],
            "obj-55::obj-204": [ "attrui[182]", "attrui[35]", 0 ],
            "obj-55::obj-205": [ "attrui[183]", "attrui[4]", 0 ],
            "obj-55::obj-21": [ "attrui[123]", "attrui[14]", 0 ],
            "obj-55::obj-23": [ "attrui[124]", "attrui[35]", 0 ],
            "obj-55::obj-25": [ "attrui[125]", "attrui[4]", 0 ],
            "obj-55::obj-31": [ "attrui[126]", "attrui[14]", 0 ],
            "obj-55::obj-32": [ "attrui[127]", "attrui[35]", 0 ],
            "obj-55::obj-34": [ "attrui[128]", "attrui[4]", 0 ],
            "obj-55::obj-41": [ "attrui[129]", "attrui[14]", 0 ],
            "obj-55::obj-49": [ "attrui[130]", "attrui[35]", 0 ],
            "obj-55::obj-53": [ "attrui[133]", "attrui[4]", 0 ],
            "obj-55::obj-80": [ "attrui[134]", "attrui[14]", 0 ],
            "obj-55::obj-81": [ "attrui[135]", "attrui[35]", 0 ],
            "obj-55::obj-82": [ "attrui[136]", "attrui[4]", 0 ],
            "obj-55::obj-83::obj-4": [ "attrui[132]", "attrui[6]", 0 ],
            "obj-55::obj-92": [ "attrui[137]", "attrui[14]", 0 ],
            "obj-55::obj-93": [ "attrui[138]", "attrui[35]", 0 ],
            "obj-55::obj-96": [ "attrui[139]", "attrui[4]", 0 ],
            "obj-59": [ "live.gain~[2]", "live.gain~", 0 ],
            "obj-65::obj-28": [ "attrui[78]", "attrui[24]", 0 ],
            "obj-65::obj-29": [ "attrui[79]", "attrui[25]", 0 ],
            "obj-65::obj-30": [ "attrui[80]", "attrui[58]", 0 ],
            "obj-65::obj-34": [ "attrui[81]", "attrui[24]", 0 ],
            "obj-65::obj-35": [ "attrui[82]", "attrui[25]", 0 ],
            "obj-65::obj-36": [ "attrui[83]", "attrui[58]", 0 ],
            "obj-65::obj-40": [ "attrui[84]", "attrui[24]", 0 ],
            "obj-65::obj-41": [ "attrui[85]", "attrui[25]", 0 ],
            "obj-65::obj-43": [ "attrui[86]", "attrui[58]", 0 ],
            "obj-65::obj-47": [ "attrui[87]", "attrui[24]", 0 ],
            "obj-65::obj-48": [ "attrui[88]", "attrui[25]", 0 ],
            "obj-65::obj-49": [ "attrui[89]", "attrui[58]", 0 ],
            "obj-65::obj-53": [ "attrui[90]", "attrui[24]", 0 ],
            "obj-65::obj-54": [ "attrui[91]", "attrui[25]", 0 ],
            "obj-65::obj-55": [ "attrui[92]", "attrui[58]", 0 ],
            "obj-65::obj-59": [ "attrui[93]", "attrui[24]", 0 ],
            "obj-65::obj-60": [ "attrui[94]", "attrui[25]", 0 ],
            "obj-65::obj-61": [ "attrui[95]", "attrui[58]", 0 ],
            "obj-65::obj-68": [ "attrui[75]", "attrui[24]", 0 ],
            "obj-65::obj-69": [ "attrui[76]", "attrui[25]", 0 ],
            "obj-65::obj-71": [ "attrui[77]", "attrui[58]", 0 ],
            "obj-65::obj-96": [ "attrui[72]", "attrui[24]", 0 ],
            "obj-65::obj-97": [ "attrui[73]", "attrui[25]", 0 ],
            "obj-65::obj-99": [ "attrui[74]", "attrui[58]", 0 ],
            "obj-66": [ "live.gain~[5]", "live.gain~[5]", 0 ],
            "obj-71": [ "live.gain~[6]", "live.gain~", 0 ],
            "obj-7::obj-28": [ "attrui[111]", "attrui[24]", 0 ],
            "obj-7::obj-29": [ "attrui[112]", "attrui[25]", 0 ],
            "obj-7::obj-30": [ "attrui[113]", "attrui[58]", 0 ],
            "obj-7::obj-34": [ "attrui[108]", "attrui[24]", 0 ],
            "obj-7::obj-35": [ "attrui[109]", "attrui[25]", 0 ],
            "obj-7::obj-36": [ "attrui[110]", "attrui[58]", 0 ],
            "obj-7::obj-40": [ "attrui[105]", "attrui[24]", 0 ],
            "obj-7::obj-41": [ "attrui[106]", "attrui[25]", 0 ],
            "obj-7::obj-43": [ "attrui[107]", "attrui[58]", 0 ],
            "obj-7::obj-47": [ "attrui[102]", "attrui[24]", 0 ],
            "obj-7::obj-48": [ "attrui[103]", "attrui[25]", 0 ],
            "obj-7::obj-49": [ "attrui[104]", "attrui[58]", 0 ],
            "obj-7::obj-53": [ "attrui[99]", "attrui[24]", 0 ],
            "obj-7::obj-54": [ "attrui[100]", "attrui[25]", 0 ],
            "obj-7::obj-55": [ "attrui[101]", "attrui[58]", 0 ],
            "obj-7::obj-59": [ "attrui[96]", "attrui[24]", 0 ],
            "obj-7::obj-60": [ "attrui[97]", "attrui[25]", 0 ],
            "obj-7::obj-61": [ "attrui[98]", "attrui[58]", 0 ],
            "obj-7::obj-68": [ "attrui[117]", "attrui[24]", 0 ],
            "obj-7::obj-69": [ "attrui[118]", "attrui[25]", 0 ],
            "obj-7::obj-71": [ "attrui[119]", "attrui[58]", 0 ],
            "obj-7::obj-96": [ "attrui[114]", "attrui[24]", 0 ],
            "obj-7::obj-97": [ "attrui[115]", "attrui[25]", 0 ],
            "obj-7::obj-99": [ "attrui[116]", "attrui[58]", 0 ],
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
        "styles": [
            {
                "name": "rnbohighcontrast",
                "default": {
                    "accentcolor": [ 0.666666666666667, 0.666666666666667, 0.666666666666667, 1.0 ],
                    "bgcolor": [ 0.0, 0.0, 0.0, 1.0 ],
                    "bgfillcolor": {
                        "angle": 270.0,
                        "autogradient": 0.0,
                        "color": [ 0.0, 0.0, 0.0, 1.0 ],
                        "color1": [ 0.090196078431373, 0.090196078431373, 0.090196078431373, 1.0 ],
                        "color2": [ 0.156862745098039, 0.168627450980392, 0.164705882352941, 1.0 ],
                        "proportion": 0.5,
                        "type": "color"
                    },
                    "clearcolor": [ 1.0, 1.0, 1.0, 0.0 ],
                    "color": [ 1.0, 0.874509803921569, 0.141176470588235, 1.0 ],
                    "editing_bgcolor": [ 0.258823529411765, 0.258823529411765, 0.258823529411765, 1.0 ],
                    "elementcolor": [ 0.223386004567146, 0.254748553037643, 0.998085916042328, 1.0 ],
                    "fontsize": [ 13.0 ],
                    "locked_bgcolor": [ 0.258823529411765, 0.258823529411765, 0.258823529411765, 1.0 ],
                    "selectioncolor": [ 0.301960784313725, 0.694117647058824, 0.949019607843137, 1.0 ],
                    "stripecolor": [ 0.258823529411765, 0.258823529411765, 0.258823529411765, 1.0 ],
                    "textcolor": [ 1.0, 1.0, 1.0, 1.0 ],
                    "textcolor_inverse": [ 1.0, 1.0, 1.0, 1.0 ]
                },
                "parentstyle": "",
                "multi": 0
            },
            {
                "name": "rnbomonokai",
                "default": {
                    "accentcolor": [ 0.501960784313725, 0.501960784313725, 0.501960784313725, 1.0 ],
                    "bgcolor": [ 0.0, 0.0, 0.0, 1.0 ],
                    "bgfillcolor": {
                        "angle": 270.0,
                        "autogradient": 0.0,
                        "color": [ 0.0, 0.0, 0.0, 1.0 ],
                        "color1": [ 0.031372549019608, 0.125490196078431, 0.211764705882353, 1.0 ],
                        "color2": [ 0.263682, 0.004541, 0.038797, 1.0 ],
                        "proportion": 0.39,
                        "type": "color"
                    },
                    "clearcolor": [ 0.976470588235294, 0.96078431372549, 0.917647058823529, 1.0 ],
                    "color": [ 0.611764705882353, 0.125490196078431, 0.776470588235294, 1.0 ],
                    "editing_bgcolor": [ 0.976470588235294, 0.96078431372549, 0.917647058823529, 1.0 ],
                    "elementcolor": [ 0.749019607843137, 0.83921568627451, 1.0, 1.0 ],
                    "fontname": [ "Lato" ],
                    "locked_bgcolor": [ 0.976470588235294, 0.96078431372549, 0.917647058823529, 1.0 ],
                    "stripecolor": [ 0.796078431372549, 0.207843137254902, 1.0, 1.0 ],
                    "textcolor": [ 0.129412, 0.129412, 0.129412, 1.0 ]
                },
                "parentstyle": "",
                "multi": 0
            }
        ]
    }
}