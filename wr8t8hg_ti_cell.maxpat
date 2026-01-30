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
        "rect": [ 89.0, 85.0, 1240.0, 865.0 ],
        "boxes": [
            {
                "box": {
                    "id": "obj-28",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 803.846230506897, 413.0769624710083, 120.0, 22.0 ],
                    "text": "command set_matrix"
                }
            },
            {
                "box": {
                    "id": "obj-17",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 803.846230506897, 488.46158504486084, 73.0, 22.0 ],
                    "saved_object_attributes": {
                        "filename": "breathe.js",
                        "parameter_enable": 0
                    },
                    "text": "js breathe.js"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.13333333333333333, 0.1411764705882353, 0.21176470588235294, 1.0 ],
                    "fgcolor": [ 1.0, 0.9176470588235294, 0.9176470588235294, 1.0 ],
                    "fontface": 0,
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "hcellcolor": [ 0.06666666666666667, 0.047058823529411764, 0.24313725490196078, 1.0 ],
                    "id": "obj-14",
                    "maxclass": "jit.cellblock",
                    "numinlets": 2,
                    "numoutlets": 4,
                    "outlettype": [ "list", "", "", "" ],
                    "patching_rect": [ 494.5355409383774, 360.6557536125183, 241.53006529808044, 215.30055594444275 ],
                    "varname": "baluga"
                }
            },
            {
                "box": {
                    "id": "obj-6",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 0.0, 0.0, 44.0, 22.0 ],
                    "text": "noise~"
                }
            },
            {
                "box": {
                    "attr": "bgcolor",
                    "id": "obj-15",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 494.535541, 330.601107, 150.0, 22.0 ]
                }
            },
            {
                "box": {
                    "attr": "hcellcolor",
                    "id": "obj-16",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 647.535541, 330.601107, 150.0, 22.0 ]
                }
            },
            {
                "box": {
                    "attr": "fgcolor",
                    "id": "obj-29",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 490.0000467300415, 284.61541175842285, 150.0, 22.0 ]
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-14", 0 ],
                    "source": [ "obj-15", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-14", 0 ],
                    "source": [ "obj-16", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-17", 0 ],
                    "source": [ "obj-28", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-14", 0 ],
                    "source": [ "obj-29", 0 ]
                }
            }
        ],
        "autosave": 0
    }
}