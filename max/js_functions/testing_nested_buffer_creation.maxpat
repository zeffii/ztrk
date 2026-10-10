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
        "rect": [ 967.0, 216.0, 1000.0, 1027.0 ],
        "boxes": [
            {
                "box": {
                    "code": "function bang(){\r\n    var main_patcher = this.patcher;\r\n    var buffer_storage_obj = main_patcher.getnamed(\"buffer_storage\");\r\n    \r\n    \r\n}",
                    "filename": "none",
                    "fontface": 0,
                    "fontname": "<Monospaced>",
                    "fontsize": 12.0,
                    "id": "obj-31",
                    "maxclass": "v8.codebox",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 214.0, 746.0, 562.0, 220.0 ],
                    "saved_object_attributes": {
                        "parameter_enable": 0
                    }
                }
            },
            {
                "box": {
                    "id": "obj-30",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 100.0, 710.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-3",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 112.0, 63.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "code": "function bang(){\r\n    var patcher = this.patcher;\r\n    var num_tracks = 4;\r\n    init_track_buffers(patcher, num_tracks);\r\n}\r\n\r\nfunction init_track_buffers(patcher, num_tracks) {\n    /*\n    Initializer for the buffer-holding subpatcher: ensures one buffer~\n    per track exists with the correct sr/size/chans, creating only\n    what's missing, and returns Buffer() handles keyed by track index.\n    */\n    opts = {};\n    var sr      = opts.sr      || 1000;   // nominal declared sample rate (not audio driver sr)\n    var nsamps  = opts.nsamps  || 2048;   // buffer length in samples (ticks)\n    var chans   = opts.chans   || 48;     // channels per buffer\n    var x       = opts.x       || 20;\n    var y       = opts.y       || 20;\n    var y_step  = opts.y_step  || 32;\n    var name_fn = opts.name_fn || function (i) { return \"t\" + i + \"_buf\"; };\n\n    var buffers = {};\n\n    // check if the subpatcher box already exists before creating a new one\n    var subpatch = patcher.getnamed(\"buffer_storage\");\n\n    if (!subpatch) {\n        subpatch = patcher.newdefault(100, 100, \"p\", \"buffer_storage\");\n        subpatch.varname = \"buffer_storage\";\n    }\n\n    var internalPatcher = subpatch.subpatcher();\n    internalPatcher.wind.size = [200, 400];\n    internalPatcher.wind.visible = 0;\n\n    for (var i = 0; i < num_tracks; i++) {\n        var buf_name = name_fn(i);\n        var box = internalPatcher.getnamed(buf_name); // matches on varname, see note below\n\n        if (!box) {\n            box = internalPatcher.newdefault(x, y + (i * y_step), \"buffer~\", buf_name);\n            box.varname = buf_name; // required so future getnamed(buf_name) calls find it\n        }\n\n        // Re-assert spec every time, whether the box was just created or\n        // already existed — keeps this function idempotent and makes it\n        // double as a \"fix up any buffer that's drifted from spec\" pass.\n        box.message(\"sr\", sr);\n        box.message(\"size\", nsamps);\n        box.message(\"chans\", chans);\n\n        buffers[i] = new Buffer(buf_name);\n    }\n\n    return buffers;\n}",
                    "filename": "none",
                    "fontface": 0,
                    "fontname": "<Monospaced>",
                    "fontsize": 12.0,
                    "id": "obj-1",
                    "maxclass": "v8.codebox",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 207.0, 15.0, 781.0, 642.0 ],
                    "saved_object_attributes": {
                        "parameter_enable": 0
                    }
                }
            },
            {
                "box": {
                    "id": "obj-57",
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
                        "rect": [ 59.0, 107.0, 132.0, 332.0 ],
                        "boxes": [
                            {
                                "box": {
                                    "id": "obj-5",
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
                                    "id": "obj-6",
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
                                    "id": "obj-7",
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
                                    "id": "obj-8",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "float", "bang" ],
                                    "patching_rect": [ 20.0, 116.0, 100.0, 22.0 ],
                                    "text": "buffer~ t3_buf",
                                    "varname": "t3_buf"
                                }
                            }
                        ],
                        "lines": []
                    },
                    "patching_rect": [ 100.0, 100.0, 100.0, 22.0 ],
                    "text": "p buffer_storage",
                    "varname": "buffer_storage"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "source": [ "obj-3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-31", 0 ],
                    "source": [ "obj-30", 0 ]
                }
            }
        ],
        "autosave": 0
    }
}