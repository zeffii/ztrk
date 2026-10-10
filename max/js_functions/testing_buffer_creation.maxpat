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
        "rect": [ 59.0, 107.0, 1000.0, 1027.0 ],
        "boxes": [
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
                    "code": "function bang(){\r\n    var patcher = this.patcher\r\n    var num_tracks = 4;\r\n    init_track_buffers(patcher, num_tracks);\r\n}\r\n\r\nfunction init_track_buffers(patcher, num_tracks) {\r\n    /*\r\n    Initializer for the buffer-holding subpatcher: ensures one buffer~\r\n    per track exists with the correct sr/size/chans, creating only\r\n    what's missing, and returns Buffer() handles keyed by track index.\r\n    */\r\n    opts = {};\r\n    var sr      = opts.sr      || 1000;   // nominal declared sample rate (not audio driver sr)\r\n    var nsamps  = opts.nsamps  || 2048;   // buffer length in samples (ticks)\r\n    var chans   = opts.chans   || 48;     // channels per buffer\r\n    var x       = opts.x       || 20;\r\n    var y       = opts.y       || 20;\r\n    var y_step  = opts.y_step  || 32;\r\n    var name_fn = opts.name_fn || function (i) { return \"t\" + i + \"_buf\"; };\r\n\r\n    var buffers = {};\r\n\r\n    // next step is to do this inside a subpatcher L getnamed(\"your_subpatch_name\").subpatcher()\r\n\r\n    for (var i = 0; i < num_tracks; i++) {\r\n        var buf_name = name_fn(i);\r\n        var box = patcher.getnamed(buf_name); // matches on varname, see note below\r\n\r\n        if (!box) {\r\n            box = patcher.newdefault(x, y + (i * y_step), \"buffer~\", buf_name);\r\n            box.varname = buf_name; // required so future getnamed(buf_name) calls find it\r\n        }\r\n\r\n        // Re-assert spec every time, whether the box was just created or\r\n        // already existed — keeps this function idempotent and makes it\r\n        // double as a \"fix up any buffer that's drifted from spec\" pass.\r\n        box.message(\"sr\", sr);\r\n        box.message(\"size\", nsamps);\r\n        box.message(\"chans\", chans);\r\n\r\n        buffers[i] = new Buffer(buf_name);\r\n    }\r\n\r\n    return buffers;\r\n}",
                    "filename": "none",
                    "fontface": 0,
                    "fontname": "<Monospaced>",
                    "fontsize": 12.0,
                    "id": "obj-1",
                    "maxclass": "v8.codebox",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 80.0, 185.0, 783.0, 702.0 ],
                    "saved_object_attributes": {
                        "parameter_enable": 0
                    }
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "source": [ "obj-3", 0 ]
                }
            }
        ],
        "autosave": 0
    }
}