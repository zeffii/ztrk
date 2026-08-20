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
        "rect": [ 228.0, 174.0, 1000.0, 1141.0 ],
        "boxes": [
            {
                "box": {
                    "id": "obj-29",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 227.0, 837.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "code": "Buffer window4();\r\n\r\nfor (i = 0; i < dim(window4); i+= 1){\r\n    val = i / dim(window4) * pi;\r\n    fade = sin(val);\r\n    fade = pow(fade, 0.2);\r\n    poke(window4, fade, i);\r\n}\r\n\r\nout = 0;",
                    "fontface": 0,
                    "fontname": "<Monospaced>",
                    "fontsize": 12.0,
                    "id": "obj-30",
                    "maxclass": "gen.codebox",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 105.0, 928.0, 343.0, 136.0 ]
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
                    "patching_rect": [ 71.0, 928.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "buffername": "window4",
                    "id": "obj-32",
                    "maxclass": "waveform~",
                    "numinlets": 5,
                    "numoutlets": 6,
                    "outlettype": [ "float", "float", "float", "float", "list", "" ],
                    "patching_rect": [ 284.0, 843.0, 256.0, 64.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-33",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "float", "bang" ],
                    "patching_rect": [ 99.0, 885.0, 177.0, 22.0 ],
                    "text": "buffer~ window4 @samps 1000"
                }
            },
            {
                "box": {
                    "id": "obj-34",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 99.0, 838.0, 118.0, 22.0 ],
                    "text": "fill 1, apply hamming"
                }
            },
            {
                "box": {
                    "id": "obj-23",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 221.0, 531.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "code": "Buffer window3();\r\n\r\nfor (i = 0; i < dim(window3); i+= 1){\r\n    val = i / dim(window3) * pi;\r\n    fade = sin(val);\r\n    poke(window3, fade, i);\r\n}\r\n\r\nout = 0;",
                    "fontface": 0,
                    "fontname": "<Monospaced>",
                    "fontsize": 12.0,
                    "id": "obj-24",
                    "maxclass": "gen.codebox",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 99.0, 622.0, 343.0, 136.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-25",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 65.0, 622.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "buffername": "window3",
                    "id": "obj-26",
                    "maxclass": "waveform~",
                    "numinlets": 5,
                    "numoutlets": 6,
                    "outlettype": [ "float", "float", "float", "float", "list", "" ],
                    "patching_rect": [ 278.0, 537.0, 256.0, 64.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-27",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "float", "bang" ],
                    "patching_rect": [ 93.0, 579.0, 177.0, 22.0 ],
                    "text": "buffer~ window3 @samps 1000"
                }
            },
            {
                "box": {
                    "id": "obj-28",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 93.0, 532.0, 118.0, 22.0 ],
                    "text": "fill 1, apply hamming"
                }
            },
            {
                "box": {
                    "code": "Buffer win(\"window2\");\r\n\r\nfor (i = 0; i < dim(win); i+= 1){\r\n    val = i / dim(win);\r\n    poke(win, val, i);\r\n}\r\n\r\nout = 0;",
                    "fontface": 0,
                    "fontname": "<Monospaced>",
                    "fontsize": 12.0,
                    "id": "obj-21",
                    "maxclass": "gen.codebox",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 479.0, 332.0, 329.0, 136.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-22",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 450.0, 332.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-20",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 215.0, 241.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "code": "Buffer window2();\r\n\r\nfor (i = 0; i < dim(window2); i+= 1){\r\n    val = i / dim(window2);\r\n    poke(window2, val, i);\r\n}\r\n\r\nout = 0;",
                    "fontface": 0,
                    "fontname": "<Monospaced>",
                    "fontsize": 12.0,
                    "id": "obj-18",
                    "maxclass": "gen.codebox",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 93.0, 332.0, 343.0, 136.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-17",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 59.0, 332.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "buffername": "window2",
                    "id": "obj-11",
                    "maxclass": "waveform~",
                    "numinlets": 5,
                    "numoutlets": 6,
                    "outlettype": [ "float", "float", "float", "float", "list", "" ],
                    "patching_rect": [ 272.0, 247.0, 256.0, 64.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-12",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "float", "bang" ],
                    "patching_rect": [ 87.0, 289.0, 177.0, 22.0 ],
                    "text": "buffer~ window2 @samps 1000"
                }
            },
            {
                "box": {
                    "id": "obj-13",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 87.0, 242.0, 118.0, 22.0 ],
                    "text": "fill 1, apply hamming"
                }
            },
            {
                "box": {
                    "buffername": "window",
                    "id": "obj-10",
                    "maxclass": "waveform~",
                    "numinlets": 5,
                    "numoutlets": 6,
                    "outlettype": [ "float", "float", "float", "float", "list", "" ],
                    "patching_rect": [ 272.0, 74.0, 256.0, 64.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-3",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "float", "bang" ],
                    "patching_rect": [ 87.0, 116.0, 170.0, 22.0 ],
                    "text": "buffer~ window @samps 1000"
                }
            },
            {
                "box": {
                    "id": "obj-2",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 87.0, 50.0, 118.0, 22.0 ],
                    "text": "fill 1, apply hamming"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-12", 0 ],
                    "source": [ "obj-13", 0 ]
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
                    "destination": [ "obj-3", 0 ],
                    "source": [ "obj-2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-12", 0 ],
                    "source": [ "obj-20", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-21", 0 ],
                    "source": [ "obj-22", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-27", 0 ],
                    "source": [ "obj-23", 0 ]
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
                    "destination": [ "obj-27", 0 ],
                    "source": [ "obj-28", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-33", 0 ],
                    "source": [ "obj-29", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-30", 0 ],
                    "source": [ "obj-31", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-33", 0 ],
                    "source": [ "obj-34", 0 ]
                }
            }
        ],
        "autosave": 0
    }
}