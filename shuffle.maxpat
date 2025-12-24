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
        "rect": [ 230.0, 93.0, 1006.0, 757.0 ],
        "openinpresentation": 1,
        "boxes": [
            {
                "box": {
                    "comment": "",
                    "id": "obj-19",
                    "index": 0,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 423.0, 703.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "activegridcolor": [ 0.13333333333333333, 0.2901960784313726, 0.35294117647058826, 1.0 ],
                    "activelinecolor": [ 0.0, 0.7843137254901961, 1.0, 1.0 ],
                    "grid": 3,
                    "gridcolor": [ 0.5725490196078431, 0.4627450980392157, 0.4627450980392157, 1.0 ],
                    "id": "obj-64",
                    "maxclass": "live.scope~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 423.0, 646.0, 207.0, 28.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 264.6154098510742, 17.692309379577637, 207.69232749938965, 23.07692527770996 ],
                    "range": [ 1.0, 0.0 ],
                    "trigger_direction": 1,
                    "vertical_divisions": 4
                }
            },
            {
                "box": {
                    "id": "obj-63",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 423.0, 613.0, 29.5, 22.0 ],
                    "text": "+~"
                }
            },
            {
                "box": {
                    "id": "obj-62",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 462.0, 578.0, 29.5, 22.0 ],
                    "text": "+~"
                }
            },
            {
                "box": {
                    "id": "obj-61",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 423.0, 578.0, 29.5, 22.0 ],
                    "text": "+~"
                }
            },
            {
                "box": {
                    "activegridcolor": [ 0.13333333333333333, 0.2901960784313726, 0.35294117647058826, 1.0 ],
                    "activelinecolor": [ 0.0, 0.7843137254901961, 1.0, 1.0 ],
                    "grid": 3,
                    "gridcolor": [ 0.5725490196078431, 0.4627450980392157, 0.4627450980392157, 1.0 ],
                    "id": "obj-56",
                    "maxclass": "live.scope~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 190.0, 681.0, 207.0, 28.0 ],
                    "range": [ 1.0, 0.0 ],
                    "trigger_direction": 1,
                    "vertical_divisions": 4
                }
            },
            {
                "box": {
                    "activegridcolor": [ 0.13333333333333333, 0.2901960784313726, 0.35294117647058826, 1.0 ],
                    "activelinecolor": [ 0.0, 0.7843137254901961, 1.0, 1.0 ],
                    "grid": 3,
                    "gridcolor": [ 0.5725490196078431, 0.4627450980392157, 0.4627450980392157, 1.0 ],
                    "id": "obj-55",
                    "maxclass": "live.scope~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 190.0, 646.0, 207.0, 28.0 ],
                    "range": [ 1.0, 0.0 ],
                    "trigger_direction": 1,
                    "vertical_divisions": 4
                }
            },
            {
                "box": {
                    "id": "obj-52",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 363.0, 510.0, 38.0, 22.0 ],
                    "text": ">~ 0"
                }
            },
            {
                "box": {
                    "id": "obj-53",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 363.0, 483.0, 47.0, 22.0 ],
                    "text": "delta~"
                }
            },
            {
                "box": {
                    "id": "obj-54",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 363.0, 455.0, 35.0, 22.0 ],
                    "text": ">=~"
                }
            },
            {
                "box": {
                    "id": "obj-49",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 305.0, 510.0, 38.0, 22.0 ],
                    "text": ">~ 0"
                }
            },
            {
                "box": {
                    "id": "obj-50",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 305.0, 483.0, 47.0, 22.0 ],
                    "text": "delta~"
                }
            },
            {
                "box": {
                    "id": "obj-51",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 305.0, 455.0, 35.0, 22.0 ],
                    "text": ">=~"
                }
            },
            {
                "box": {
                    "activegridcolor": [ 0.13333333333333333, 0.2901960784313726, 0.35294117647058826, 1.0 ],
                    "activelinecolor": [ 0.0, 0.7843137254901961, 1.0, 1.0 ],
                    "grid": 3,
                    "gridcolor": [ 0.5725490196078431, 0.4627450980392157, 0.4627450980392157, 1.0 ],
                    "id": "obj-45",
                    "maxclass": "live.scope~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 190.0, 610.0, 207.0, 28.0 ],
                    "range": [ 1.0, 0.0 ],
                    "trigger_direction": 1,
                    "vertical_divisions": 4
                }
            },
            {
                "box": {
                    "id": "obj-46",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 243.0, 510.0, 38.0, 22.0 ],
                    "text": ">~ 0"
                }
            },
            {
                "box": {
                    "id": "obj-47",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 243.0, 483.0, 47.0, 22.0 ],
                    "text": "delta~"
                }
            },
            {
                "box": {
                    "id": "obj-48",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 243.0, 455.0, 35.0, 22.0 ],
                    "text": ">=~"
                }
            },
            {
                "box": {
                    "id": "obj-36",
                    "maxclass": "live.scope~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 132.0, 436.0, 27.0, 185.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-35",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 275.0, 321.0, 44.0, 22.0 ],
                    "text": "sig~ 1."
                }
            },
            {
                "box": {
                    "id": "obj-34",
                    "maxclass": "live.scope~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 103.0, 436.0, 27.0, 185.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-33",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 202.0, 321.0, 58.0, 22.0 ],
                    "text": "sig~ 0.75"
                }
            },
            {
                "box": {
                    "id": "obj-32",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "float" ],
                    "patching_rect": [ 202.0, 226.0, 29.5, 22.0 ],
                    "text": "t b f"
                }
            },
            {
                "box": {
                    "id": "obj-29",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 202.0, 293.0, 29.5, 22.0 ],
                    "text": "+ 1."
                }
            },
            {
                "box": {
                    "id": "obj-27",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 130.0, 194.0, 33.0, 22.0 ],
                    "text": "* 0.5"
                }
            },
            {
                "box": {
                    "id": "obj-24",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 130.0, 168.0, 29.5, 22.0 ],
                    "text": "!- 1."
                }
            },
            {
                "box": {
                    "id": "obj-22",
                    "maxclass": "live.scope~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 47.0, 436.0, 25.0, 185.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-23",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 77.0, 321.0, 44.0, 22.0 ],
                    "text": "sig~ 0."
                }
            },
            {
                "box": {
                    "id": "obj-18",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 77.0, 168.0, 33.0, 22.0 ],
                    "text": "* 0.5"
                }
            },
            {
                "box": {
                    "id": "obj-17",
                    "maxclass": "live.scope~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 20.0, 436.0, 24.0, 185.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-16",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 18.0, 321.0, 44.0, 22.0 ],
                    "text": "sig~ 0."
                }
            },
            {
                "box": {
                    "activegridcolor": [ 0.13333333333333333, 0.2901960784313726, 0.35294117647058826, 1.0 ],
                    "activelinecolor": [ 0.0, 0.7843137254901961, 1.0, 1.0 ],
                    "grid": 3,
                    "gridcolor": [ 0.5725490196078431, 0.4627450980392157, 0.4627450980392157, 1.0 ],
                    "id": "obj-15",
                    "maxclass": "live.scope~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 190.0, 575.0, 207.0, 28.0 ],
                    "range": [ 1.0, 0.0 ],
                    "trigger_direction": 1,
                    "vertical_divisions": 4
                }
            },
            {
                "box": {
                    "id": "obj-11",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 190.0, 510.0, 33.0, 22.0 ],
                    "text": "<~ 0"
                }
            },
            {
                "box": {
                    "id": "obj-3",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 190.0, 483.0, 47.0, 22.0 ],
                    "text": "delta~"
                }
            },
            {
                "box": {
                    "id": "obj-13",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 190.0, 455.0, 30.0, 22.0 ],
                    "text": ">=~"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-12",
                    "maxclass": "flonum",
                    "maximum": 0.9,
                    "minimum": 0.5,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 45.0, 126.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 195.38463401794434, 17.692309379577637, 50.769235610961914, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-10",
                    "maxclass": "live.scope~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 74.0, 436.0, 27.0, 185.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-9",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 135.0, 321.0, 58.0, 22.0 ],
                    "text": "sig~ 0.75"
                }
            },
            {
                "box": {
                    "id": "obj-8",
                    "maxclass": "live.scope~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 436.0, 423.0, 184.0, 23.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-7",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 412.0, 373.0, 116.0, 22.0 ],
                    "text": "phasor~ 1n @lock 1"
                }
            },
            {
                "box": {
                    "id": "obj-6",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 2.0, 17.0, 24.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 5.69230842590332, 16.384615898132324, 24.615386962890625, 24.615386962890625 ]
                }
            },
            {
                "box": {
                    "id": "obj-1",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 9,
                    "outlettype": [ "int", "int", "float", "float", "float", "", "int", "float", "" ],
                    "patching_rect": [ 18.0, 57.0, 103.0, 22.0 ],
                    "text": "transport"
                }
            },
            {
                "box": {
                    "attr": "tempo",
                    "id": "obj-2",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 47.0, 18.0, 150.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 32.307695388793945, 17.692309379577637, 150.76924514770508, 22.0 ]
                }
            },
            {
                "box": {
                    "attr": "minimum",
                    "id": "obj-5",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 45.0, 99.0, 150.0, 22.0 ]
                }
            },
            {
                "box": {
                    "angle": 270.0,
                    "bgcolor": [ 0.4823529411764706, 0.4823529411764706, 0.4823529411764706, 1.0 ],
                    "id": "obj-4",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 341.0, 441.0, 128.0, 128.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1.0, 7.0, 488.0, 43.0 ],
                    "proportion": 0.5
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-15", 0 ],
                    "order": 1,
                    "source": [ "obj-11", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-61", 0 ],
                    "midpoints": [ 199.5, 561.0, 432.5, 561.0 ],
                    "order": 0,
                    "source": [ "obj-11", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-18", 0 ],
                    "midpoints": [ 54.5, 162.0, 86.5, 162.0 ],
                    "order": 3,
                    "source": [ "obj-12", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-24", 0 ],
                    "midpoints": [ 54.5, 158.0, 139.5, 158.0 ],
                    "order": 2,
                    "source": [ "obj-12", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-29", 0 ],
                    "midpoints": [ 54.5, 278.0, 211.5, 278.0 ],
                    "order": 0,
                    "source": [ "obj-12", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9", 0 ],
                    "midpoints": [ 54.5, 286.0, 144.5, 286.0 ],
                    "order": 1,
                    "source": [ "obj-12", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-3", 0 ],
                    "source": [ "obj-13", 0 ]
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
                    "destination": [ "obj-23", 0 ],
                    "source": [ "obj-18", 0 ]
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
                    "destination": [ "obj-22", 0 ],
                    "midpoints": [ 86.5, 354.9736841917038, 56.5, 354.9736841917038 ],
                    "order": 1,
                    "source": [ "obj-23", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-48", 1 ],
                    "midpoints": [ 86.5, 353.0, 268.5, 353.0 ],
                    "order": 0,
                    "source": [ "obj-23", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-27", 0 ],
                    "source": [ "obj-24", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-32", 0 ],
                    "midpoints": [ 139.5, 221.0, 211.5, 221.0 ],
                    "source": [ "obj-27", 0 ]
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
                    "destination": [ "obj-11", 0 ],
                    "source": [ "obj-3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-29", 1 ],
                    "source": [ "obj-32", 1 ]
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
                    "destination": [ "obj-34", 0 ],
                    "midpoints": [ 211.5, 385.5789475440979, 112.5, 385.5789475440979 ],
                    "order": 1,
                    "source": [ "obj-33", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-54", 1 ],
                    "midpoints": [ 211.5, 387.0, 388.5, 387.0 ],
                    "order": 0,
                    "source": [ "obj-33", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-36", 0 ],
                    "midpoints": [ 284.5, 401.0, 141.5, 401.0 ],
                    "source": [ "obj-35", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-45", 0 ],
                    "midpoints": [ 252.5, 570.0, 153.0, 570.0, 153.0, 615.0, 199.5, 615.0 ],
                    "order": 1,
                    "source": [ "obj-46", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-61", 1 ],
                    "midpoints": [ 252.5, 556.0, 443.0, 556.0 ],
                    "order": 0,
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
                    "destination": [ "obj-47", 0 ],
                    "source": [ "obj-48", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-55", 0 ],
                    "midpoints": [ 314.5, 570.0, 153.0, 570.0, 153.0, 651.0, 199.5, 651.0 ],
                    "order": 1,
                    "source": [ "obj-49", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-62", 0 ],
                    "midpoints": [ 314.5, 549.0, 471.5, 549.0 ],
                    "order": 0,
                    "source": [ "obj-49", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-12", 0 ],
                    "source": [ "obj-5", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-49", 0 ],
                    "source": [ "obj-50", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-50", 0 ],
                    "source": [ "obj-51", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-56", 0 ],
                    "midpoints": [ 372.5, 570.0, 153.0, 570.0, 153.0, 684.0, 199.5, 684.0 ],
                    "order": 1,
                    "source": [ "obj-52", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-62", 1 ],
                    "midpoints": [ 372.5, 543.0, 482.0, 543.0 ],
                    "order": 0,
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
                    "destination": [ "obj-53", 0 ],
                    "source": [ "obj-54", 0 ]
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
                    "destination": [ "obj-63", 0 ],
                    "source": [ "obj-61", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-63", 1 ],
                    "source": [ "obj-62", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-19", 0 ],
                    "order": 0,
                    "source": [ "obj-63", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-64", 0 ],
                    "order": 1,
                    "source": [ "obj-63", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-13", 0 ],
                    "midpoints": [ 421.5, 426.0, 199.5, 426.0 ],
                    "order": 4,
                    "source": [ "obj-7", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-48", 0 ],
                    "midpoints": [ 421.5, 434.0, 252.5, 434.0 ],
                    "order": 3,
                    "source": [ "obj-7", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-51", 0 ],
                    "midpoints": [ 421.5, 440.0, 314.5, 440.0 ],
                    "order": 2,
                    "source": [ "obj-7", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-54", 0 ],
                    "midpoints": [ 421.5, 448.0, 372.5, 448.0 ],
                    "order": 1,
                    "source": [ "obj-7", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-8", 0 ],
                    "order": 0,
                    "source": [ "obj-7", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-10", 0 ],
                    "midpoints": [ 144.5, 368.0, 83.5, 368.0 ],
                    "order": 2,
                    "source": [ "obj-9", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-13", 1 ],
                    "midpoints": [ 144.5, 368.0, 210.5, 368.0 ],
                    "order": 1,
                    "source": [ "obj-9", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-51", 1 ],
                    "midpoints": [ 144.5, 368.0, 330.5, 368.0 ],
                    "order": 0,
                    "source": [ "obj-9", 0 ]
                }
            }
        ],
        "autosave": 0
    }
}