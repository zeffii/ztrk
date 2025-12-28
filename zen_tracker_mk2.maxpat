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
        "rect": [ -1604.0, 84.0, 1338.0, 787.0 ],
        "toolbars_unpinned_last_save": 4,
        "boxes": [
            {
                "box": {
                    "bgmode": 1,
                    "border": 0,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "obj-34",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "SequencerControls.maxpat",
                    "numinlets": 2,
                    "numoutlets": 3,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "", "", "int" ],
                    "patching_rect": [ 748.0, 204.0, 338.0, 30.060250759124756 ],
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
                    "id": "obj-16",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "TrackerTempo.maxpat",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 25.30120575428009, 200.00000739097595, 212.8674705028534, 28.915663719177246 ],
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "id": "obj-42",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "signal" ],
                    "patching_rect": [ 563.8554425239563, 415.6626659631729, 84.0, 22.0 ],
                    "text": "mc.unpack~ 2"
                }
            },
            {
                "box": {
                    "id": "obj-88",
                    "lastchannelcount": 0,
                    "maxclass": "live.gain~",
                    "numinlets": 2,
                    "numoutlets": 5,
                    "outlettype": [ "signal", "signal", "", "float", "list" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 567.4699004888535, 456.626522898674, 48.0, 136.0 ],
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
                    "id": "obj-89",
                    "maxclass": "ezdac~",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [ 575.9036357402802, 598.7952028512955, 32.274096608161926, 32.274096608161926 ]
                }
            },
            {
                "box": {
                    "id": "obj-87",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "multichannelsignal" ],
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
                        "rect": [ 59.0, 107.0, 1000.0, 730.0 ],
                        "boxes": [
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-14",
                                    "index": 1,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 64.0, 419.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-5",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "" ],
                                    "patching_rect": [ 282.5, 58.0, 29.5, 22.0 ],
                                    "text": "t l l"
                                }
                            },
                            {
                                "box": {
                                    "fontsize": 11.454545454545455,
                                    "id": "obj-7",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 356.0, 307.0, 49.0, 22.0 ],
                                    "text": "80"
                                }
                            },
                            {
                                "box": {
                                    "fontsize": 11.454545454545455,
                                    "id": "obj-8",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 321.0, 334.0, 93.0, 22.0 ],
                                    "text": "scale 0 255 0. 1."
                                }
                            },
                            {
                                "box": {
                                    "fontsize": 11.454545454545455,
                                    "id": "obj-9",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 321.0, 213.0, 29.0, 22.0 ],
                                    "text": "0x"
                                }
                            },
                            {
                                "box": {
                                    "fontsize": 11.454545454545455,
                                    "id": "obj-10",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 321.0, 270.0, 69.0, 22.0 ],
                                    "text": "fromsymbol"
                                }
                            },
                            {
                                "box": {
                                    "fontsize": 11.454545454545455,
                                    "id": "obj-11",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 321.0, 244.0, 75.0, 22.0 ],
                                    "text": "string.concat"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-2",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "" ],
                                    "patching_rect": [ 293.0, 129.0, 46.0, 22.0 ],
                                    "text": "route .."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-13",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "" ],
                                    "patching_rect": [ 293.0, 100.0, 57.0, 22.0 ],
                                    "text": "zl.mth 10"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-34",
                                    "maxclass": "newobj",
                                    "numinlets": 5,
                                    "numoutlets": 4,
                                    "outlettype": [ "multichannelsignal", "signal", "signal", "" ],
                                    "patching_rect": [ 58.4337352514267, 251.80723452568054, 88.0, 22.0 ],
                                    "text": "Abl.AutoFilter~",
                                    "varname": "Abl.AutoFilter~[1]"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-81",
                                    "maxclass": "newobj",
                                    "numinlets": 4,
                                    "numoutlets": 4,
                                    "outlettype": [ "multichannelsignal", "signal", "signal", "" ],
                                    "patching_rect": [ 57.22891592979431, 224.09639012813568, 75.0, 22.0 ],
                                    "text": "Abl.Chorus~",
                                    "varname": "Abl.Chorus~"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-15",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "bang", "" ],
                                    "patching_rect": [ 50.0, 126.50602507591248, 34.0, 22.0 ],
                                    "text": "sel 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-12",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "" ],
                                    "patching_rect": [ 50.0, 100.0, 51.0, 22.0 ],
                                    "text": "zl.mth 9"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-70",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 50.0, 161.44578540325165, 29.5, 22.0 ],
                                    "text": "60"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-67",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 103.01205015182495, 161.44578540325165, 120.0, 22.0 ],
                                    "text": "read kick_lieb_1.wav"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-62",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "float", "bang" ],
                                    "patching_rect": [ 103.01205015182495, 126.50602507591248, 99.0, 22.0 ],
                                    "text": "buffer~ smp_kick"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-55",
                                    "maxclass": "newobj",
                                    "numinlets": 4,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 57.22891592979431, 193.97590708732605, 87.0, 22.0 ],
                                    "text": "ZSamplerMAX"
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-86",
                                    "index": 1,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 52.0, 15.0, 30.0, 30.0 ]
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "obj-7", 1 ],
                                    "order": 0,
                                    "source": [ "obj-10", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-8", 0 ],
                                    "order": 1,
                                    "source": [ "obj-10", 0 ]
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
                                    "destination": [ "obj-15", 0 ],
                                    "source": [ "obj-12", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-2", 0 ],
                                    "source": [ "obj-13", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-70", 0 ],
                                    "source": [ "obj-15", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-11", 1 ],
                                    "midpoints": [ 329.5, 165.43902373313904, 374.6951425075531, 165.43902373313904, 374.6951425075531, 164.99999809265137, 386.5, 164.99999809265137 ],
                                    "order": 0,
                                    "source": [ "obj-2", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-9", 0 ],
                                    "midpoints": [ 329.5, 177.0, 330.5, 177.0 ],
                                    "order": 1,
                                    "source": [ "obj-2", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-14", 0 ],
                                    "source": [ "obj-34", 0 ]
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
                                    "destination": [ "obj-13", 0 ],
                                    "source": [ "obj-5", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-81", 0 ],
                                    "source": [ "obj-55", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-55", 3 ],
                                    "source": [ "obj-67", 0 ]
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
                                    "destination": [ "obj-55", 2 ],
                                    "source": [ "obj-8", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-34", 0 ],
                                    "source": [ "obj-81", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-5", 0 ],
                                    "source": [ "obj-86", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-11", 0 ],
                                    "source": [ "obj-9", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 563.8554425239563, 383.1325442790985, 57.0, 22.0 ],
                    "text": "p MyKick",
                    "varname": "patcher[1]"
                }
            },
            {
                "box": {
                    "id": "obj-61",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
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
                        "rect": [ 59.0, 107.0, 1000.0, 730.0 ],
                        "boxes": [
                            {
                                "box": {
                                    "fontsize": 11.454545454545455,
                                    "id": "obj-30",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 705.0, 175.0, 49.0, 22.0 ],
                                    "text": "32768"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-29",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 762.0, 204.0, 29.5, 22.0 ],
                                    "text": "1"
                                }
                            },
                            {
                                "box": {
                                    "fontsize": 11.454545454545455,
                                    "id": "obj-26",
                                    "linecount": 2,
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 643.0, 341.0, 49.0, 35.0 ],
                                    "text": "0.62501"
                                }
                            },
                            {
                                "box": {
                                    "fontsize": 11.454545454545455,
                                    "id": "obj-12",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 649.0, 253.0, 49.0, 22.0 ],
                                    "text": "40960"
                                }
                            },
                            {
                                "box": {
                                    "fontsize": 11.454545454545455,
                                    "id": "obj-13",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 615.0, 288.0, 105.0, 22.0 ],
                                    "text": "scale 0 65535 0. 1."
                                }
                            },
                            {
                                "box": {
                                    "fontsize": 11.454545454545455,
                                    "id": "obj-14",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 615.0, 161.0, 29.0, 22.0 ],
                                    "text": "0x"
                                }
                            },
                            {
                                "box": {
                                    "fontsize": 11.454545454545455,
                                    "id": "obj-15",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 615.0, 218.0, 69.0, 22.0 ],
                                    "text": "fromsymbol"
                                }
                            },
                            {
                                "box": {
                                    "fontsize": 11.454545454545455,
                                    "id": "obj-16",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 615.0, 192.0, 75.0, 22.0 ],
                                    "text": "string.concat"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-24",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "" ],
                                    "patching_rect": [ 588.0, 95.0, 53.0, 22.0 ],
                                    "text": "route ...."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-25",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "" ],
                                    "patching_rect": [ 588.0, 66.0, 51.0, 22.0 ],
                                    "text": "zl.mth 2"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-10",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 508.0, 192.0, 29.5, 22.0 ],
                                    "text": "1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-6",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "", "", "" ],
                                    "patching_rect": [ 152.0, 53.0, 40.0, 22.0 ],
                                    "text": "t l l l"
                                }
                            },
                            {
                                "box": {
                                    "fontsize": 11.454545454545455,
                                    "id": "obj-17",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 412.0, 258.0, 49.0, 22.0 ],
                                    "text": "96"
                                }
                            },
                            {
                                "box": {
                                    "fontsize": 11.454545454545455,
                                    "id": "obj-1",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 378.0, 288.0, 93.0, 22.0 ],
                                    "text": "scale 0 255 0. 1."
                                }
                            },
                            {
                                "box": {
                                    "fontsize": 11.454545454545455,
                                    "id": "obj-19",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 378.0, 166.0, 29.0, 22.0 ],
                                    "text": "0x"
                                }
                            },
                            {
                                "box": {
                                    "fontsize": 11.454545454545455,
                                    "id": "obj-20",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 378.0, 223.0, 69.0, 22.0 ],
                                    "text": "fromsymbol"
                                }
                            },
                            {
                                "box": {
                                    "fontsize": 11.454545454545455,
                                    "id": "obj-2",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 378.0, 197.0, 75.0, 22.0 ],
                                    "text": "string.concat"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-22",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "" ],
                                    "patching_rect": [ 351.0, 100.0, 46.0, 22.0 ],
                                    "text": "route .."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-3",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "" ],
                                    "patching_rect": [ 351.0, 71.0, 51.0, 22.0 ],
                                    "text": "zl.mth 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-80",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 176.8614491224289, 109.63855457305908, 29.5, 22.0 ],
                                    "text": "60"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-38",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "bang", "" ],
                                    "patching_rect": [ 142.3614491224289, 109.63855457305908, 31.0, 22.0 ],
                                    "text": "t b s"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-28",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "" ],
                                    "patching_rect": [ 52.0, 185.54217183589935, 60.0, 22.0 ],
                                    "text": "route ==="
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-21",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "bang", "" ],
                                    "patching_rect": [ 76.0963864326477, 154.21686947345734, 44.0, 22.0 ],
                                    "text": "sel ^^^"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-18",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 44.524096608161926, 238.0, 64.0, 22.0 ],
                                    "text": "C-4"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-84",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "" ],
                                    "patching_rect": [ 58.024096608161926, 100.0, 51.0, 22.0 ],
                                    "text": "zl.mth 0"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-100",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "bang", "" ],
                                    "patching_rect": [ 58.024096608161926, 126.50602507591248, 37.0, 22.0 ],
                                    "text": "sel ..."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-23",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
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
                                        "rect": [ 854.0, 128.0, 728.0, 730.0 ],
                                        "boxes": [
                                            {
                                                "box": {
                                                    "id": "obj-17",
                                                    "maxclass": "newobj",
                                                    "numinlets": 3,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "" ],
                                                    "patching_rect": [ 474.0, 190.0, 53.0, 22.0 ],
                                                    "text": "clip 0. 1."
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-15",
                                                    "maxclass": "newobj",
                                                    "numinlets": 3,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "" ],
                                                    "patching_rect": [ 607.0, 190.0, 53.0, 22.0 ],
                                                    "text": "clip 0. 1."
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-11",
                                                    "maxclass": "newobj",
                                                    "numinlets": 1,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "" ],
                                                    "patching_rect": [ 606.0, 374.0, 95.0, 22.0 ],
                                                    "text": "prepend volume"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-10",
                                                    "maxclass": "newobj",
                                                    "numinlets": 1,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "" ],
                                                    "patching_rect": [ 474.0, 374.0, 85.0, 22.0 ],
                                                    "text": "prepend offset"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-9",
                                                    "maxclass": "newobj",
                                                    "numinlets": 1,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "bang" ],
                                                    "patching_rect": [ 110.0, 100.0, 58.0, 22.0 ],
                                                    "text": "loadbang"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-8",
                                                    "maxclass": "message",
                                                    "numinlets": 2,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "" ],
                                                    "patching_rect": [ 150.0, 127.0, 114.0, 22.0 ],
                                                    "text": "read stereo_bb.wav"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "bgcolor": [ 0.12941176470588237, 0.12941176470588237, 0.12941176470588237, 0.0 ],
                                                    "elementcolor": [ 0.677757118578373, 0.677756958075356, 0.677757000017359, 0.0 ],
                                                    "floatoutput": 1,
                                                    "id": "obj-40",
                                                    "ignoreclick": 1,
                                                    "knobcolor": [ 1.0, 0.611764705882353, 0.09019607843137255, 1.0 ],
                                                    "knobshape": 5,
                                                    "maxclass": "slider",
                                                    "numinlets": 1,
                                                    "numoutlets": 1,
                                                    "orientation": 1,
                                                    "outlettype": [ "" ],
                                                    "parameter_enable": 1,
                                                    "patching_rect": [ 207.0, 242.0, 256.2133251428604, 37.76595717668533 ],
                                                    "saved_attribute_attributes": {
                                                        "valueof": {
                                                            "parameter_longname": "slider",
                                                            "parameter_mmax": 1.0,
                                                            "parameter_modmode": 3,
                                                            "parameter_shortname": "slider",
                                                            "parameter_type": 0
                                                        }
                                                    },
                                                    "size": 1.0,
                                                    "thickness": 20.0,
                                                    "varname": "slider"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-37",
                                                    "maxclass": "newobj",
                                                    "numinlets": 2,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "float" ],
                                                    "patching_rect": [ 295.0, 132.0, 81.0, 22.0 ],
                                                    "text": "snapshot~ 33"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-36",
                                                    "maxclass": "newobj",
                                                    "numinlets": 1,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "signal" ],
                                                    "patching_rect": [ 295.0, 105.0, 74.0, 22.0 ],
                                                    "text": "r~ readhead"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-35",
                                                    "maxclass": "newobj",
                                                    "numinlets": 1,
                                                    "numoutlets": 0,
                                                    "patching_rect": [ 287.0, 547.0, 76.0, 22.0 ],
                                                    "text": "s~ readhead"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-32",
                                                    "maxclass": "newobj",
                                                    "numinlets": 1,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "" ],
                                                    "patching_rect": [ 279.0, 374.0, 111.0, 22.0 ],
                                                    "text": "prepend sample_sr"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-30",
                                                    "maxclass": "live.scope~",
                                                    "numinlets": 2,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "bang" ],
                                                    "patching_rect": [ 295.0, 465.0, 184.0, 68.0 ],
                                                    "range": [ 0.0, 65324.0 ]
                                                }
                                            },
                                            {
                                                "box": {
                                                    "fontface": 0,
                                                    "fontname": "Arial",
                                                    "fontsize": 12.0,
                                                    "id": "obj-29",
                                                    "maxclass": "number~",
                                                    "mode": 2,
                                                    "numinlets": 2,
                                                    "numoutlets": 2,
                                                    "outlettype": [ "signal", "float" ],
                                                    "patching_rect": [ 299.0, 426.0, 78.94736766815186, 22.0 ],
                                                    "sig": 0.0
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-27",
                                                    "maxclass": "newobj",
                                                    "numinlets": 1,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "signal" ],
                                                    "patching_rect": [ 50.0, 263.0, 39.0, 22.0 ],
                                                    "text": "click~"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-26",
                                                    "maxclass": "newobj",
                                                    "numinlets": 1,
                                                    "numoutlets": 2,
                                                    "outlettype": [ "bang", "int" ],
                                                    "patching_rect": [ 82.0, 203.0, 29.5, 22.0 ],
                                                    "text": "t b i"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-24",
                                                    "maxclass": "number",
                                                    "numinlets": 1,
                                                    "numoutlets": 2,
                                                    "outlettype": [ "", "bang" ],
                                                    "parameter_enable": 0,
                                                    "patching_rect": [ 82.0, 165.0, 50.0, 22.0 ]
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-7",
                                                    "maxclass": "newobj",
                                                    "numinlets": 1,
                                                    "numoutlets": 10,
                                                    "outlettype": [ "float", "list", "float", "float", "float", "float", "float", "", "int", "" ],
                                                    "patching_rect": [ 279.0, 347.0, 113.5, 22.0 ],
                                                    "text": "info~ SampleData"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "buffername": "SampleData",
                                                    "id": "obj-5",
                                                    "maxclass": "waveform~",
                                                    "numinlets": 5,
                                                    "numoutlets": 6,
                                                    "outlettype": [ "float", "float", "float", "float", "list", "" ],
                                                    "patching_rect": [ 207.0, 231.0, 256.0, 64.0 ]
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-4",
                                                    "maxclass": "newobj",
                                                    "numinlets": 1,
                                                    "numoutlets": 2,
                                                    "outlettype": [ "float", "bang" ],
                                                    "patching_rect": [ 183.0, 301.0, 115.0, 22.0 ],
                                                    "text": "buffer~ SampleData"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-1",
                                                    "maxclass": "newobj",
                                                    "numinlets": 2,
                                                    "numoutlets": 2,
                                                    "outlettype": [ "signal", "signal" ],
                                                    "patcher": {
                                                        "fileversion": 1,
                                                        "appversion": {
                                                            "major": 9,
                                                            "minor": 1,
                                                            "revision": 1,
                                                            "architecture": "x64",
                                                            "modernui": 1
                                                        },
                                                        "classnamespace": "dsp.gen",
                                                        "rect": [ 84.0, 132.0, 739.0, 576.0 ],
                                                        "boxes": [
                                                            {
                                                                "box": {
                                                                    "id": "obj-26",
                                                                    "maxclass": "newobj",
                                                                    "numinlets": 2,
                                                                    "numoutlets": 1,
                                                                    "outlettype": [ "" ],
                                                                    "patching_rect": [ 386.0, 210.0, 88.0, 22.0 ],
                                                                    "text": "*"
                                                                }
                                                            },
                                                            {
                                                                "box": {
                                                                    "id": "obj-25",
                                                                    "maxclass": "newobj",
                                                                    "numinlets": 2,
                                                                    "numoutlets": 1,
                                                                    "outlettype": [ "" ],
                                                                    "patching_rect": [ 87.5, 412.0, 29.5, 22.0 ],
                                                                    "text": "*"
                                                                }
                                                            },
                                                            {
                                                                "box": {
                                                                    "id": "obj-8",
                                                                    "maxclass": "newobj",
                                                                    "numinlets": 0,
                                                                    "numoutlets": 1,
                                                                    "outlettype": [ "" ],
                                                                    "patching_rect": [ 479.0, 62.0, 98.0, 22.0 ],
                                                                    "text": "param volume 1."
                                                                }
                                                            },
                                                            {
                                                                "box": {
                                                                    "id": "obj-3",
                                                                    "maxclass": "newobj",
                                                                    "numinlets": 0,
                                                                    "numoutlets": 1,
                                                                    "outlettype": [ "" ],
                                                                    "patching_rect": [ 380.0, 62.0, 88.0, 22.0 ],
                                                                    "text": "param offset 0."
                                                                }
                                                            },
                                                            {
                                                                "box": {
                                                                    "id": "obj-24",
                                                                    "maxclass": "newobj",
                                                                    "numinlets": 2,
                                                                    "numoutlets": 1,
                                                                    "outlettype": [ "" ],
                                                                    "patching_rect": [ 289.0, 383.0, 29.5, 22.0 ],
                                                                    "text": "/"
                                                                }
                                                            },
                                                            {
                                                                "box": {
                                                                    "id": "obj-23",
                                                                    "maxclass": "newobj",
                                                                    "numinlets": 2,
                                                                    "numoutlets": 1,
                                                                    "outlettype": [ "" ],
                                                                    "patching_rect": [ 154.0, 214.0, 34.0, 22.0 ],
                                                                    "text": "latch"
                                                                }
                                                            },
                                                            {
                                                                "box": {
                                                                    "id": "obj-22",
                                                                    "maxclass": "newobj",
                                                                    "numinlets": 2,
                                                                    "numoutlets": 1,
                                                                    "outlettype": [ "" ],
                                                                    "patching_rect": [ 154.0, 131.0, 88.0, 22.0 ],
                                                                    "text": "*"
                                                                }
                                                            },
                                                            {
                                                                "box": {
                                                                    "id": "obj-21",
                                                                    "maxclass": "newobj",
                                                                    "numinlets": 1,
                                                                    "numoutlets": 1,
                                                                    "outlettype": [ "" ],
                                                                    "patching_rect": [ 223.0, 92.0, 75.0, 22.0 ],
                                                                    "text": "/ samplerate"
                                                                }
                                                            },
                                                            {
                                                                "box": {
                                                                    "id": "obj-20",
                                                                    "maxclass": "newobj",
                                                                    "numinlets": 0,
                                                                    "numoutlets": 1,
                                                                    "outlettype": [ "" ],
                                                                    "patching_rect": [ 223.0, 62.0, 138.0, 22.0 ],
                                                                    "text": "param sample_sr 44100"
                                                                }
                                                            },
                                                            {
                                                                "box": {
                                                                    "id": "obj-19",
                                                                    "maxclass": "newobj",
                                                                    "numinlets": 1,
                                                                    "numoutlets": 1,
                                                                    "outlettype": [ "" ],
                                                                    "patching_rect": [ 154.0, 92.0, 35.0, 22.0 ],
                                                                    "text": "exp2"
                                                                }
                                                            },
                                                            {
                                                                "box": {
                                                                    "id": "obj-18",
                                                                    "maxclass": "newobj",
                                                                    "numinlets": 1,
                                                                    "numoutlets": 1,
                                                                    "outlettype": [ "" ],
                                                                    "patching_rect": [ 154.0, 62.0, 32.0, 22.0 ],
                                                                    "text": "/ 12."
                                                                }
                                                            },
                                                            {
                                                                "box": {
                                                                    "id": "obj-17",
                                                                    "maxclass": "newobj",
                                                                    "numinlets": 1,
                                                                    "numoutlets": 1,
                                                                    "outlettype": [ "" ],
                                                                    "patching_rect": [ 154.0, 35.0, 29.0, 22.0 ],
                                                                    "text": "- 60"
                                                                }
                                                            },
                                                            {
                                                                "box": {
                                                                    "id": "obj-16",
                                                                    "maxclass": "newobj",
                                                                    "numinlets": 1,
                                                                    "numoutlets": 1,
                                                                    "outlettype": [ "" ],
                                                                    "patching_rect": [ 20.0, 103.0, 26.0, 22.0 ],
                                                                    "text": "> 0"
                                                                }
                                                            },
                                                            {
                                                                "box": {
                                                                    "id": "obj-15",
                                                                    "maxclass": "newobj",
                                                                    "numinlets": 1,
                                                                    "numoutlets": 1,
                                                                    "outlettype": [ "" ],
                                                                    "patching_rect": [ 20.0, 74.0, 48.0, 22.0 ],
                                                                    "text": "change"
                                                                }
                                                            },
                                                            {
                                                                "box": {
                                                                    "id": "obj-14",
                                                                    "maxclass": "newobj",
                                                                    "numinlets": 1,
                                                                    "numoutlets": 1,
                                                                    "outlettype": [ "" ],
                                                                    "patching_rect": [ 20.0, 43.0, 31.0, 22.0 ],
                                                                    "text": "bool"
                                                                }
                                                            },
                                                            {
                                                                "box": {
                                                                    "id": "obj-13",
                                                                    "maxclass": "newobj",
                                                                    "numinlets": 1,
                                                                    "numoutlets": 1,
                                                                    "outlettype": [ "" ],
                                                                    "patching_rect": [ 87.5, 369.0, 49.0, 22.0 ],
                                                                    "text": "dcblock"
                                                                }
                                                            },
                                                            {
                                                                "box": {
                                                                    "id": "obj-12",
                                                                    "maxclass": "newobj",
                                                                    "numinlets": 3,
                                                                    "numoutlets": 1,
                                                                    "outlettype": [ "" ],
                                                                    "patching_rect": [ 20.0, 269.0, 40.0, 22.0 ],
                                                                    "text": "?"
                                                                }
                                                            },
                                                            {
                                                                "box": {
                                                                    "id": "obj-11",
                                                                    "maxclass": "newobj",
                                                                    "numinlets": 1,
                                                                    "numoutlets": 0,
                                                                    "patching_rect": [ 289.0, 412.0, 35.0, 22.0 ],
                                                                    "text": "out 2"
                                                                }
                                                            },
                                                            {
                                                                "box": {
                                                                    "id": "obj-10",
                                                                    "maxclass": "newobj",
                                                                    "numinlets": 0,
                                                                    "numoutlets": 1,
                                                                    "outlettype": [ "" ],
                                                                    "patching_rect": [ 196.0, 181.0, 97.0, 22.0 ],
                                                                    "text": "dim SampleData"
                                                                }
                                                            },
                                                            {
                                                                "box": {
                                                                    "id": "obj-9",
                                                                    "maxclass": "newobj",
                                                                    "numinlets": 1,
                                                                    "numoutlets": 1,
                                                                    "outlettype": [ "" ],
                                                                    "patching_rect": [ 245.0, 221.0, 44.0, 22.0 ],
                                                                    "text": "history"
                                                                }
                                                            },
                                                            {
                                                                "box": {
                                                                    "id": "obj-7",
                                                                    "maxclass": "newobj",
                                                                    "numinlets": 3,
                                                                    "numoutlets": 1,
                                                                    "outlettype": [ "" ],
                                                                    "patching_rect": [ 154.0, 269.0, 61.0, 22.0 ],
                                                                    "text": "clip"
                                                                }
                                                            },
                                                            {
                                                                "box": {
                                                                    "id": "obj-6",
                                                                    "maxclass": "newobj",
                                                                    "numinlets": 2,
                                                                    "numoutlets": 2,
                                                                    "outlettype": [ "", "" ],
                                                                    "patching_rect": [ 87.5, 337.0, 181.0, 22.0 ],
                                                                    "text": "peek SampleData @interp cubic"
                                                                }
                                                            },
                                                            {
                                                                "box": {
                                                                    "id": "obj-5",
                                                                    "maxclass": "newobj",
                                                                    "numinlets": 0,
                                                                    "numoutlets": 2,
                                                                    "outlettype": [ "", "" ],
                                                                    "patching_rect": [ 223.0, 10.0, 108.0, 22.0 ],
                                                                    "text": "buffer SampleData"
                                                                }
                                                            },
                                                            {
                                                                "box": {
                                                                    "id": "obj-1",
                                                                    "maxclass": "newobj",
                                                                    "numinlets": 0,
                                                                    "numoutlets": 1,
                                                                    "outlettype": [ "" ],
                                                                    "patching_rect": [ 20.0, 14.0, 28.0, 22.0 ],
                                                                    "text": "in 1"
                                                                }
                                                            },
                                                            {
                                                                "box": {
                                                                    "id": "obj-2",
                                                                    "maxclass": "newobj",
                                                                    "numinlets": 0,
                                                                    "numoutlets": 1,
                                                                    "outlettype": [ "" ],
                                                                    "patching_rect": [ 154.0, 10.0, 28.0, 22.0 ],
                                                                    "text": "in 2"
                                                                }
                                                            },
                                                            {
                                                                "box": {
                                                                    "id": "obj-4",
                                                                    "maxclass": "newobj",
                                                                    "numinlets": 1,
                                                                    "numoutlets": 0,
                                                                    "patching_rect": [ 87.5, 477.0, 35.0, 22.0 ],
                                                                    "text": "out 1"
                                                                }
                                                            }
                                                        ],
                                                        "lines": [
                                                            {
                                                                "patchline": {
                                                                    "destination": [ "obj-14", 0 ],
                                                                    "source": [ "obj-1", 0 ]
                                                                }
                                                            },
                                                            {
                                                                "patchline": {
                                                                    "destination": [ "obj-24", 1 ],
                                                                    "order": 1,
                                                                    "source": [ "obj-10", 0 ]
                                                                }
                                                            },
                                                            {
                                                                "patchline": {
                                                                    "destination": [ "obj-26", 0 ],
                                                                    "order": 0,
                                                                    "source": [ "obj-10", 0 ]
                                                                }
                                                            },
                                                            {
                                                                "patchline": {
                                                                    "destination": [ "obj-7", 2 ],
                                                                    "order": 2,
                                                                    "source": [ "obj-10", 0 ]
                                                                }
                                                            },
                                                            {
                                                                "patchline": {
                                                                    "destination": [ "obj-24", 0 ],
                                                                    "midpoints": [ 29.5, 324.0, 279.0, 324.0, 279.0, 353.0, 298.5, 353.0 ],
                                                                    "order": 0,
                                                                    "source": [ "obj-12", 0 ]
                                                                }
                                                            },
                                                            {
                                                                "patchline": {
                                                                    "destination": [ "obj-6", 0 ],
                                                                    "midpoints": [ 29.5, 308.0, 97.0, 308.0 ],
                                                                    "order": 2,
                                                                    "source": [ "obj-12", 0 ]
                                                                }
                                                            },
                                                            {
                                                                "patchline": {
                                                                    "destination": [ "obj-9", 0 ],
                                                                    "midpoints": [ 29.5, 297.0, 234.0, 297.0, 234.0, 212.0, 254.5, 212.0 ],
                                                                    "order": 1,
                                                                    "source": [ "obj-12", 0 ]
                                                                }
                                                            },
                                                            {
                                                                "patchline": {
                                                                    "destination": [ "obj-25", 0 ],
                                                                    "source": [ "obj-13", 0 ]
                                                                }
                                                            },
                                                            {
                                                                "patchline": {
                                                                    "destination": [ "obj-15", 0 ],
                                                                    "source": [ "obj-14", 0 ]
                                                                }
                                                            },
                                                            {
                                                                "patchline": {
                                                                    "destination": [ "obj-16", 0 ],
                                                                    "source": [ "obj-15", 0 ]
                                                                }
                                                            },
                                                            {
                                                                "patchline": {
                                                                    "destination": [ "obj-12", 0 ],
                                                                    "order": 1,
                                                                    "source": [ "obj-16", 0 ]
                                                                }
                                                            },
                                                            {
                                                                "patchline": {
                                                                    "destination": [ "obj-23", 1 ],
                                                                    "midpoints": [ 29.5, 179.0, 178.5, 179.0 ],
                                                                    "order": 0,
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
                                                                    "destination": [ "obj-19", 0 ],
                                                                    "source": [ "obj-18", 0 ]
                                                                }
                                                            },
                                                            {
                                                                "patchline": {
                                                                    "destination": [ "obj-22", 0 ],
                                                                    "source": [ "obj-19", 0 ]
                                                                }
                                                            },
                                                            {
                                                                "patchline": {
                                                                    "destination": [ "obj-17", 0 ],
                                                                    "source": [ "obj-2", 0 ]
                                                                }
                                                            },
                                                            {
                                                                "patchline": {
                                                                    "destination": [ "obj-21", 0 ],
                                                                    "source": [ "obj-20", 0 ]
                                                                }
                                                            },
                                                            {
                                                                "patchline": {
                                                                    "destination": [ "obj-22", 1 ],
                                                                    "source": [ "obj-21", 0 ]
                                                                }
                                                            },
                                                            {
                                                                "patchline": {
                                                                    "destination": [ "obj-23", 0 ],
                                                                    "source": [ "obj-22", 0 ]
                                                                }
                                                            },
                                                            {
                                                                "patchline": {
                                                                    "destination": [ "obj-7", 0 ],
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
                                                                    "destination": [ "obj-4", 0 ],
                                                                    "source": [ "obj-25", 0 ]
                                                                }
                                                            },
                                                            {
                                                                "patchline": {
                                                                    "destination": [ "obj-7", 1 ],
                                                                    "source": [ "obj-26", 0 ]
                                                                }
                                                            },
                                                            {
                                                                "patchline": {
                                                                    "destination": [ "obj-26", 1 ],
                                                                    "source": [ "obj-3", 0 ]
                                                                }
                                                            },
                                                            {
                                                                "patchline": {
                                                                    "destination": [ "obj-13", 0 ],
                                                                    "source": [ "obj-6", 0 ]
                                                                }
                                                            },
                                                            {
                                                                "patchline": {
                                                                    "destination": [ "obj-12", 2 ],
                                                                    "midpoints": [ 163.5, 303.0, 143.0, 303.0, 143.0, 263.0, 50.5, 263.0 ],
                                                                    "source": [ "obj-7", 0 ]
                                                                }
                                                            },
                                                            {
                                                                "patchline": {
                                                                    "destination": [ "obj-25", 1 ],
                                                                    "source": [ "obj-8", 0 ]
                                                                }
                                                            },
                                                            {
                                                                "patchline": {
                                                                    "destination": [ "obj-7", 0 ],
                                                                    "midpoints": [ 254.5, 263.0, 225.0, 263.0, 225.0, 263.0, 163.5, 263.0 ],
                                                                    "source": [ "obj-9", 0 ]
                                                                }
                                                            }
                                                        ]
                                                    },
                                                    "patching_rect": [ 104.0, 420.0, 152.0, 22.0 ],
                                                    "text": "gen~ @title offset_sampler",
                                                    "varname": "gen~_AA"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "attr": "buffername",
                                                    "id": "obj-6",
                                                    "maxclass": "attrui",
                                                    "numinlets": 1,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "" ],
                                                    "parameter_enable": 0,
                                                    "patching_rect": [ 207.0, 200.0, 202.0, 22.0 ]
                                                }
                                            },
                                            {
                                                "box": {
                                                    "attr": "file",
                                                    "id": "obj-16",
                                                    "maxclass": "attrui",
                                                    "numinlets": 1,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "" ],
                                                    "parameter_enable": 0,
                                                    "patching_rect": [ 207.0, 160.0, 219.0, 22.0 ]
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-20",
                                                    "maxclass": "message",
                                                    "numinlets": 2,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "" ],
                                                    "patching_rect": [ 150.0, 160.0, 49.0, 22.0 ],
                                                    "text": "read $1"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "comment": "",
                                                    "id": "obj-18",
                                                    "index": 1,
                                                    "maxclass": "inlet",
                                                    "numinlets": 0,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "" ],
                                                    "patching_rect": [ 82.0, 40.0, 30.0, 30.0 ]
                                                }
                                            },
                                            {
                                                "box": {
                                                    "comment": "",
                                                    "id": "obj-19",
                                                    "index": 2,
                                                    "maxclass": "inlet",
                                                    "numinlets": 0,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "" ],
                                                    "patching_rect": [ 474.0, 40.0, 30.0, 30.0 ]
                                                }
                                            },
                                            {
                                                "box": {
                                                    "comment": "",
                                                    "id": "obj-21",
                                                    "index": 3,
                                                    "maxclass": "inlet",
                                                    "numinlets": 0,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "" ],
                                                    "patching_rect": [ 607.0, 40.0, 30.0, 30.0 ]
                                                }
                                            },
                                            {
                                                "box": {
                                                    "comment": "",
                                                    "id": "obj-22",
                                                    "index": 1,
                                                    "maxclass": "outlet",
                                                    "numinlets": 1,
                                                    "numoutlets": 0,
                                                    "patching_rect": [ 104.0, 629.0, 30.0, 30.0 ]
                                                }
                                            }
                                        ],
                                        "lines": [
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-22", 0 ],
                                                    "source": [ "obj-1", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-29", 0 ],
                                                    "midpoints": [ 246.5, 451.48663079738617, 284.0, 451.48663079738617, 284.0, 420.0, 308.5, 420.0 ],
                                                    "order": 0,
                                                    "source": [ "obj-1", 1 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-30", 0 ],
                                                    "midpoints": [ 246.5, 459.0, 304.5, 459.0 ],
                                                    "order": 1,
                                                    "source": [ "obj-1", 1 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-35", 0 ],
                                                    "order": 2,
                                                    "source": [ "obj-1", 1 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-1", 0 ],
                                                    "midpoints": [ 483.5, 407.0, 113.5, 407.0 ],
                                                    "source": [ "obj-10", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-1", 0 ],
                                                    "midpoints": [ 615.5, 407.0, 113.5, 407.0 ],
                                                    "source": [ "obj-11", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-11", 0 ],
                                                    "source": [ "obj-15", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-4", 0 ],
                                                    "midpoints": [ 216.5, 189.28897708654404, 192.7058328986168, 189.28897708654404, 192.7058328986168, 194.28897708654404, 192.5, 194.28897708654404 ],
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
                                                    "destination": [ "obj-24", 0 ],
                                                    "source": [ "obj-18", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-17", 0 ],
                                                    "source": [ "obj-19", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-4", 0 ],
                                                    "source": [ "obj-20", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-15", 0 ],
                                                    "source": [ "obj-21", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-26", 0 ],
                                                    "source": [ "obj-24", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-1", 1 ],
                                                    "midpoints": [ 102.0, 388.1063818335533, 246.5, 388.1063818335533 ],
                                                    "source": [ "obj-26", 1 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-27", 0 ],
                                                    "source": [ "obj-26", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-1", 0 ],
                                                    "midpoints": [ 59.5, 403.3957219719887, 113.5, 403.3957219719887 ],
                                                    "source": [ "obj-27", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-1", 0 ],
                                                    "midpoints": [ 288.5, 406.0, 113.5, 406.0 ],
                                                    "source": [ "obj-32", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-37", 0 ],
                                                    "source": [ "obj-36", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-40", 0 ],
                                                    "source": [ "obj-37", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-1", 0 ],
                                                    "midpoints": [ 192.5, 406.1914886236191, 113.5, 406.1914886236191 ],
                                                    "source": [ "obj-4", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-7", 0 ],
                                                    "source": [ "obj-4", 1 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-5", 0 ],
                                                    "source": [ "obj-6", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-32", 0 ],
                                                    "source": [ "obj-7", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-4", 0 ],
                                                    "source": [ "obj-8", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-8", 0 ],
                                                    "source": [ "obj-9", 0 ]
                                                }
                                            }
                                        ]
                                    },
                                    "patching_rect": [ 142.3614491224289, 258.0, 84.0, 22.0 ],
                                    "text": "p ZSampler01"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-75",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
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
                                        "rect": [ 59.0, 107.0, 1000.0, 730.0 ],
                                        "boxes": [
                                            {
                                                "box": {
                                                    "comment": "",
                                                    "id": "obj-2",
                                                    "index": 1,
                                                    "maxclass": "outlet",
                                                    "numinlets": 1,
                                                    "numoutlets": 0,
                                                    "patching_rect": [ 151.0, 445.0, 30.0, 30.0 ]
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
                                                    "outlettype": [ "bang" ],
                                                    "patching_rect": [ 217.0, 37.0, 30.0, 30.0 ]
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-53",
                                                    "maxclass": "message",
                                                    "numinlets": 2,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "" ],
                                                    "patching_rect": [ 359.0, 100.0, 31.0, 22.0 ],
                                                    "text": "C#5"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-52",
                                                    "maxclass": "message",
                                                    "numinlets": 2,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "" ],
                                                    "patching_rect": [ 340.0, 124.0, 29.5, 22.0 ],
                                                    "text": "C-5"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-51",
                                                    "maxclass": "newobj",
                                                    "numinlets": 1,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "" ],
                                                    "patching_rect": [ 407.0, 272.0, 73.0, 22.0 ],
                                                    "text": "fromsymbol"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-47",
                                                    "maxclass": "message",
                                                    "numinlets": 2,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "" ],
                                                    "patching_rect": [ 300.0, 124.0, 29.5, 22.0 ],
                                                    "text": "B-4"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-46",
                                                    "maxclass": "message",
                                                    "numinlets": 2,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "" ],
                                                    "patching_rect": [ 283.0, 100.0, 30.0, 22.0 ],
                                                    "text": "A#4"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-45",
                                                    "maxclass": "message",
                                                    "numinlets": 2,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "" ],
                                                    "patching_rect": [ 261.0, 124.0, 29.5, 22.0 ],
                                                    "text": "A-4"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-44",
                                                    "maxclass": "message",
                                                    "numinlets": 2,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "" ],
                                                    "patching_rect": [ 245.0, 100.0, 31.0, 22.0 ],
                                                    "text": "G#4"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-43",
                                                    "maxclass": "message",
                                                    "numinlets": 2,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "" ],
                                                    "patching_rect": [ 223.0, 124.0, 29.5, 22.0 ],
                                                    "text": "G-4"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-42",
                                                    "maxclass": "message",
                                                    "numinlets": 2,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "" ],
                                                    "patching_rect": [ 205.0, 100.0, 29.5, 22.0 ],
                                                    "text": "F#4"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-41",
                                                    "maxclass": "message",
                                                    "numinlets": 2,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "" ],
                                                    "patching_rect": [ 184.0, 124.0, 29.5, 22.0 ],
                                                    "text": "F-4"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-39",
                                                    "maxclass": "message",
                                                    "numinlets": 2,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "" ],
                                                    "patching_rect": [ 143.0, 124.0, 29.5, 22.0 ],
                                                    "text": "E-4"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-38",
                                                    "maxclass": "message",
                                                    "numinlets": 2,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "" ],
                                                    "patching_rect": [ 118.0, 100.0, 31.0, 22.0 ],
                                                    "text": "D#4"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-37",
                                                    "maxclass": "message",
                                                    "numinlets": 2,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "" ],
                                                    "patching_rect": [ 96.0, 124.0, 29.5, 22.0 ],
                                                    "text": "D-4"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-36",
                                                    "maxclass": "message",
                                                    "numinlets": 2,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "" ],
                                                    "patching_rect": [ 50.0, 124.0, 29.5, 22.0 ],
                                                    "text": "C-4"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-33",
                                                    "maxclass": "newobj",
                                                    "numinlets": 2,
                                                    "numoutlets": 2,
                                                    "outlettype": [ "", "" ],
                                                    "patching_rect": [ 289.0, 236.0, 73.0, 22.0 ],
                                                    "text": "string.split 2"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-28",
                                                    "maxclass": "newobj",
                                                    "numinlets": 2,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "" ],
                                                    "patching_rect": [ 289.0, 301.0, 137.0, 22.0 ],
                                                    "text": "expr ($i1 + $i2 * 12)"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "coll_data": {
                                                        "count": 12,
                                                        "data": [
                                                            {
                                                                "key": "C-",
                                                                "value": [ 0 ]
                                                            },
                                                            {
                                                                "key": "C#",
                                                                "value": [ 1 ]
                                                            },
                                                            {
                                                                "key": "D-",
                                                                "value": [ 2 ]
                                                            },
                                                            {
                                                                "key": "D#",
                                                                "value": [ 3 ]
                                                            },
                                                            {
                                                                "key": "E-",
                                                                "value": [ 4 ]
                                                            },
                                                            {
                                                                "key": "F-",
                                                                "value": [ 5 ]
                                                            },
                                                            {
                                                                "key": "F#",
                                                                "value": [ 6 ]
                                                            },
                                                            {
                                                                "key": "G-",
                                                                "value": [ 7 ]
                                                            },
                                                            {
                                                                "key": "G#",
                                                                "value": [ 8 ]
                                                            },
                                                            {
                                                                "key": "A-",
                                                                "value": [ 9 ]
                                                            },
                                                            {
                                                                "key": "A#",
                                                                "value": [ 10 ]
                                                            },
                                                            {
                                                                "key": "B-",
                                                                "value": [ 11 ]
                                                            }
                                                        ]
                                                    },
                                                    "id": "obj-26",
                                                    "maxclass": "newobj",
                                                    "numinlets": 1,
                                                    "numoutlets": 4,
                                                    "outlettype": [ "", "", "", "" ],
                                                    "patching_rect": [ 289.0, 272.0, 59.0, 22.0 ],
                                                    "saved_object_attributes": {
                                                        "embed": 1,
                                                        "precision": 6
                                                    },
                                                    "text": "coll notes"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-18",
                                                    "maxclass": "message",
                                                    "numinlets": 2,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "" ],
                                                    "patching_rect": [ 258.0, 345.0, 50.0, 22.0 ],
                                                    "text": "48"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-4",
                                                    "maxclass": "message",
                                                    "numinlets": 2,
                                                    "numoutlets": 1,
                                                    "outlettype": [ "" ],
                                                    "patching_rect": [ 75.0, 100.0, 31.0, 22.0 ],
                                                    "text": "C#4"
                                                }
                                            }
                                        ],
                                        "lines": [
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-33", 0 ],
                                                    "source": [ "obj-1", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-28", 0 ],
                                                    "source": [ "obj-26", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-18", 1 ],
                                                    "order": 0,
                                                    "source": [ "obj-28", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-2", 0 ],
                                                    "order": 1,
                                                    "source": [ "obj-28", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-26", 0 ],
                                                    "source": [ "obj-33", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-51", 0 ],
                                                    "source": [ "obj-33", 1 ]
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
                                                    "destination": [ "obj-33", 0 ],
                                                    "source": [ "obj-37", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-33", 0 ],
                                                    "source": [ "obj-38", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-33", 0 ],
                                                    "source": [ "obj-39", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-33", 0 ],
                                                    "source": [ "obj-4", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-33", 0 ],
                                                    "source": [ "obj-41", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-33", 0 ],
                                                    "source": [ "obj-42", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-33", 0 ],
                                                    "source": [ "obj-43", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-33", 0 ],
                                                    "source": [ "obj-44", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-33", 0 ],
                                                    "source": [ "obj-45", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-33", 0 ],
                                                    "source": [ "obj-46", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-33", 0 ],
                                                    "source": [ "obj-47", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-28", 1 ],
                                                    "source": [ "obj-51", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-33", 0 ],
                                                    "source": [ "obj-52", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-33", 0 ],
                                                    "source": [ "obj-53", 0 ]
                                                }
                                            }
                                        ]
                                    },
                                    "patching_rect": [ 142.3614491224289, 140.9638569355011, 64.0, 22.0 ],
                                    "text": "p NoteInfo"
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-49",
                                    "index": 1,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 58.02411530623624, 39.99999665069578, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-53",
                                    "index": 1,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 142.36145630623628, 303.99529765069576, 30.0, 30.0 ]
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "obj-23", 2 ],
                                    "source": [ "obj-1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-1", 5 ],
                                    "source": [ "obj-10", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-21", 0 ],
                                    "source": [ "obj-100", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-23", 1 ],
                                    "order": 1,
                                    "source": [ "obj-13", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-26", 1 ],
                                    "order": 0,
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
                                    "destination": [ "obj-12", 1 ],
                                    "order": 0,
                                    "source": [ "obj-15", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-13", 0 ],
                                    "order": 1,
                                    "source": [ "obj-15", 0 ]
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
                                    "destination": [ "obj-2", 0 ],
                                    "source": [ "obj-19", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-20", 0 ],
                                    "source": [ "obj-2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-1", 0 ],
                                    "order": 1,
                                    "source": [ "obj-20", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-17", 1 ],
                                    "order": 0,
                                    "source": [ "obj-20", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-28", 0 ],
                                    "source": [ "obj-21", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-19", 0 ],
                                    "midpoints": [ 387.5, 148.0, 387.5, 148.0 ],
                                    "order": 1,
                                    "source": [ "obj-22", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-2", 1 ],
                                    "midpoints": [ 387.5, 136.43902373313904, 432.6951425075531, 136.43902373313904, 432.6951425075531, 135.99999809265137, 443.5, 135.99999809265137 ],
                                    "order": 0,
                                    "source": [ "obj-22", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-53", 0 ],
                                    "source": [ "obj-23", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-14", 0 ],
                                    "midpoints": [ 631.5, 143.0, 624.5, 143.0 ],
                                    "order": 1,
                                    "source": [ "obj-24", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-16", 1 ],
                                    "midpoints": [ 631.5, 131.43902373313904, 669.6951425075531, 131.43902373313904, 669.6951425075531, 130.99999809265137, 680.5, 130.99999809265137 ],
                                    "order": 0,
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
                                    "destination": [ "obj-18", 1 ],
                                    "midpoints": [ 102.5, 220.93122005462646, 99.02409660816193, 220.93122005462646 ],
                                    "order": 1,
                                    "source": [ "obj-28", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-38", 0 ],
                                    "midpoints": [ 102.5, 207.3326154947281, 127.02269637584686, 207.3326154947281, 127.02269637584686, 105.33261549472809, 151.8614491224289, 105.33261549472809 ],
                                    "order": 0,
                                    "source": [ "obj-28", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-13", 5 ],
                                    "source": [ "obj-29", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-22", 0 ],
                                    "source": [ "obj-3", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-13", 0 ],
                                    "source": [ "obj-30", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-75", 0 ],
                                    "source": [ "obj-38", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-75", 0 ],
                                    "source": [ "obj-38", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-6", 0 ],
                                    "source": [ "obj-49", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-25", 0 ],
                                    "source": [ "obj-6", 2 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-3", 0 ],
                                    "source": [ "obj-6", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-84", 0 ],
                                    "source": [ "obj-6", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-23", 0 ],
                                    "source": [ "obj-75", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-23", 0 ],
                                    "source": [ "obj-80", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-100", 0 ],
                                    "source": [ "obj-84", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 474.6988127231598, 383.1325442790985, 71.0, 22.0 ],
                    "text": "p Drumloop"
                }
            },
            {
                "box": {
                    "id": "obj-47",
                    "lastchannelcount": 0,
                    "maxclass": "live.gain~",
                    "numinlets": 2,
                    "numoutlets": 5,
                    "outlettype": [ "signal", "signal", "", "float", "list" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 474.6988127231598, 456.626522898674, 48.0, 136.0 ],
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
                    "id": "obj-120",
                    "lastchannelcount": 0,
                    "maxclass": "live.gain~",
                    "numinlets": 2,
                    "numoutlets": 5,
                    "outlettype": [ "signal", "signal", "", "float", "list" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 667.4699041843414, 456.626522898674, 48.0, 136.0 ],
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
                    "id": "obj-119",
                    "maxclass": "ezdac~",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [ 673.4940007925034, 598.7952028512955, 32.274096608161926, 32.274096608161926 ]
                }
            },
            {
                "box": {
                    "id": "obj-118",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "signal" ],
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
                        "rect": [ 35.0, 107.0, 1276.0, 730.0 ],
                        "boxes": [
                            {
                                "box": {
                                    "id": "obj-5",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "patching_rect": [ 27.0, 329.0, 58.0, 22.0 ],
                                    "text": "loadbang"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-26",
                                    "linecount": 2,
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 910.7693176269531, 386.1538829803467, 83.0, 36.0 ],
                                    "text": "A::DelR 1398.980392"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-25",
                                    "linecount": 2,
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 650.7692928314209, 393.0, 83.0, 36.0 ],
                                    "text": "A::DelL 767.921569"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-15",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 1010.7693271636963, 401.5384998321533, 97.0, 22.0 ],
                                    "text": "prepend A::DelR"
                                }
                            },
                            {
                                "box": {
                                    "fontsize": 11.454545454545455,
                                    "format": 6,
                                    "id": "obj-16",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 1131.0, 285.7973783016205, 49.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "fontsize": 11.454545454545455,
                                    "id": "obj-17",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 1052.3077926635742, 312.3077220916748, 49.0, 22.0 ],
                                    "text": "118"
                                }
                            },
                            {
                                "box": {
                                    "fontsize": 11.454545454545455,
                                    "id": "obj-18",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 1018.4616355895996, 341.5384941101074, 118.0, 22.0 ],
                                    "text": "scale 0 255 20. 3000."
                                }
                            },
                            {
                                "box": {
                                    "fontsize": 11.454545454545455,
                                    "id": "obj-19",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 1018.4616355895996, 220.00002098083496, 29.0, 22.0 ],
                                    "text": "0x"
                                }
                            },
                            {
                                "box": {
                                    "fontsize": 11.454545454545455,
                                    "id": "obj-20",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 1018.4616355895996, 276.92310333251953, 69.0, 22.0 ],
                                    "text": "fromsymbol"
                                }
                            },
                            {
                                "box": {
                                    "fontsize": 11.454545454545455,
                                    "id": "obj-21",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 1018.4616355895996, 250.76925468444824, 75.0, 22.0 ],
                                    "text": "string.concat"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-22",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "" ],
                                    "patching_rect": [ 990.7693252563477, 153.8461685180664, 46.0, 22.0 ],
                                    "text": "route .."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-23",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "" ],
                                    "patching_rect": [ 990.7693252563477, 124.61539649963379, 57.0, 22.0 ],
                                    "text": "zl.mth 14"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-14",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 764.0, 386.1538829803467, 95.0, 22.0 ],
                                    "text": "prepend A::DelL"
                                }
                            },
                            {
                                "box": {
                                    "fontsize": 11.454545454545455,
                                    "format": 6,
                                    "id": "obj-6",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 871.6923179626465, 285.7973783016205, 49.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "fontsize": 11.454545454545455,
                                    "id": "obj-7",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 799.3846187591553, 325.79738211631775, 49.0, 22.0 ],
                                    "text": "64"
                                }
                            },
                            {
                                "box": {
                                    "fontsize": 11.454545454545455,
                                    "id": "obj-8",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 764.0, 353.4896924495697, 118.0, 22.0 ],
                                    "text": "scale 0 255 20. 3000."
                                }
                            },
                            {
                                "box": {
                                    "fontsize": 11.454545454545455,
                                    "id": "obj-9",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 764.0, 231.95121932029724, 29.0, 22.0 ],
                                    "text": "0x"
                                }
                            },
                            {
                                "box": {
                                    "fontsize": 11.454545454545455,
                                    "id": "obj-10",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 764.0, 288.8743016719818, 69.0, 22.0 ],
                                    "text": "fromsymbol"
                                }
                            },
                            {
                                "box": {
                                    "fontsize": 11.454545454545455,
                                    "id": "obj-11",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 764.0, 262.7204530239105, 75.0, 22.0 ],
                                    "text": "string.concat"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-12",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "" ],
                                    "patching_rect": [ 736.0, 148.0, 46.0, 22.0 ],
                                    "text": "route .."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-13",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "" ],
                                    "patching_rect": [ 736.0, 119.0, 57.0, 22.0 ],
                                    "text": "zl.mth 13"
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
                                    "patching_rect": [ 145.53846549987793, 841.5385417938232, 30.0, 30.0 ]
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
                                    "patching_rect": [ 104.0, 841.5385417938232, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-2",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 4,
                                    "outlettype": [ "", "", "", "" ],
                                    "patching_rect": [ 103.6524543762207, 104.0, 50.5, 22.0 ],
                                    "text": "t s s s s"
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
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 103.6524543762207, 28.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "fontsize": 11.454545454545455,
                                    "format": 6,
                                    "id": "obj-139",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 672.2307796478271, 280.00002670288086, 49.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "fontsize": 11.454545454545455,
                                    "id": "obj-96",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 598.3846187591553, 320.0000305175781, 49.0, 22.0 ],
                                    "text": "73"
                                }
                            },
                            {
                                "box": {
                                    "fontsize": 11.454545454545455,
                                    "id": "obj-93",
                                    "maxclass": "newobj",
                                    "numinlets": 6,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 563.0, 347.6923408508301, 127.0, 22.0 ],
                                    "text": "scale 0 255 20. 20000."
                                }
                            },
                            {
                                "box": {
                                    "fontsize": 11.454545454545455,
                                    "id": "obj-82",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 563.0, 226.15386772155762, 29.0, 22.0 ],
                                    "text": "0x"
                                }
                            },
                            {
                                "box": {
                                    "fontsize": 11.454545454545455,
                                    "id": "obj-68",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 563.0, 283.0769500732422, 69.0, 22.0 ],
                                    "text": "fromsymbol"
                                }
                            },
                            {
                                "box": {
                                    "fontsize": 11.454545454545455,
                                    "id": "obj-63",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 563.0, 256.9231014251709, 75.0, 22.0 ],
                                    "text": "string.concat"
                                }
                            },
                            {
                                "box": {
                                    "fontsize": 11.454545454545455,
                                    "id": "obj-45",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 255.38463973999023, 400.0, 100.0, 22.0 ],
                                    "text": "A::Drive 0.241732"
                                }
                            },
                            {
                                "box": {
                                    "fontsize": 11.454545454545455,
                                    "id": "obj-33",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 149.0, 620.0000591278076, 142.0, 22.0 ],
                                    "text": "recall 2"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-27",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 173.0, 400.0, 47.0, 22.0 ],
                                    "text": "recall 3"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-131",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "" ],
                                    "patching_rect": [ 535.0, 158.4615535736084, 46.0, 22.0 ],
                                    "text": "route .."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-130",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "" ],
                                    "patching_rect": [ 535.0, 129.23078155517578, 57.0, 22.0 ],
                                    "text": "zl.mth 12"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-126",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 173.0, 533.8462047576904, 145.12195467948914, 22.0 ],
                                    "text": "recall 3"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-125",
                                    "maxclass": "number",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 424.6154251098633, 386.1538829803467, 50.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-112",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 424.6154251098633, 418.4615783691406, 95.0, 22.0 ],
                                    "text": "prepend A::Freq"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-111",
                                    "maxclass": "newobj",
                                    "numinlets": 5,
                                    "numoutlets": 4,
                                    "outlettype": [ "multichannelsignal", "signal", "signal", "" ],
                                    "patching_rect": [ 104.0, 483.0, 88.0, 22.0 ],
                                    "text": "Abl.AutoFilter~",
                                    "varname": "Abl.AutoFilter~"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-108",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "signal" ],
                                    "patching_rect": [ 104.0, 703.0769901275635, 84.0, 22.0 ],
                                    "text": "mc.unpack~ 2"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-107",
                                    "maxclass": "newobj",
                                    "numinlets": 4,
                                    "numoutlets": 4,
                                    "outlettype": [ "multichannelsignal", "signal", "signal", "" ],
                                    "patching_rect": [ 104.0, 675.3846797943115, 64.0, 22.0 ],
                                    "text": "Abl.Echo~",
                                    "varname": "Abl.Echo~"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-106",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 211.21953010559082, 268.5365860462189, 39.0, 22.0 ],
                                    "text": "click~"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-101",
                                    "maxclass": "newobj",
                                    "numinlets": 11,
                                    "numoutlets": 3,
                                    "outlettype": [ "signal", "signal", "" ],
                                    "patching_rect": [ 311.6951425075531, 275.8536593914032, 124.0, 22.0 ],
                                    "text": "live.adsr~"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-97",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 103.9024543762207, 302.6829283237457, 34.0, 22.0 ],
                                    "text": "*~ 1."
                                }
                            },
                            {
                                "box": {
                                    "attack_slope": -0.46092057875092196,
                                    "decay_time": 8817.752932469302,
                                    "id": "obj-95",
                                    "initial": 0.09728813327369043,
                                    "maxclass": "live.adsrui",
                                    "numinlets": 10,
                                    "numoutlets": 10,
                                    "outlettype": [ "", "", "", "", "", "", "", "", "", "" ],
                                    "patching_rect": [ 305.0, 203.95121932029724, 226.8292737007141, 50.0 ],
                                    "peak": 0.6199999999999999,
                                    "release_time": 1231.2212117126007,
                                    "sustain": 0.43999999999999995
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-86",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "bang", "" ],
                                    "patching_rect": [ 103.9024543762207, 196.585364818573, 34.0, 22.0 ],
                                    "text": "sel 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-87",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "" ],
                                    "patching_rect": [ 103.9024543762207, 170.97560811042786, 56.0, 22.0 ],
                                    "text": "zl.mth 11"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-88",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 103.9024543762207, 231.95121932029724, 29.5, 22.0 ],
                                    "text": "57"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-89",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 156.34148001670837, 231.95121932029724, 83.0, 22.0 ],
                                    "text": "read stab.wav"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-91",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "float", "bang" ],
                                    "patching_rect": [ 162.0, 36.0, 122.0, 22.0 ],
                                    "text": "buffer~ stabbuffer_01"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-85",
                                    "maxclass": "newobj",
                                    "numinlets": 4,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 103.9024543762207, 268.5365860462189, 93.0, 22.0 ],
                                    "text": "ZSamplerMAX2"
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
                                    "destination": [ "obj-7", 1 ],
                                    "order": 0,
                                    "source": [ "obj-10", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-8", 0 ],
                                    "order": 1,
                                    "source": [ "obj-10", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-97", 1 ],
                                    "source": [ "obj-101", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-101", 0 ],
                                    "source": [ "obj-106", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-108", 0 ],
                                    "source": [ "obj-107", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-3", 0 ],
                                    "source": [ "obj-108", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-4", 0 ],
                                    "source": [ "obj-108", 1 ]
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
                                    "destination": [ "obj-107", 0 ],
                                    "source": [ "obj-111", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-126", 1 ],
                                    "source": [ "obj-111", 3 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-111", 4 ],
                                    "midpoints": [ 434.1154251098633, 445.9230842590332, 182.5, 445.9230842590332 ],
                                    "source": [ "obj-112", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-11", 1 ],
                                    "midpoints": [ 772.5, 184.43902373313904, 817.6951425075531, 184.43902373313904, 817.6951425075531, 183.99999809265137, 829.5, 183.99999809265137 ],
                                    "order": 0,
                                    "source": [ "obj-12", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-9", 0 ],
                                    "midpoints": [ 772.5, 196.0, 773.5, 196.0 ],
                                    "order": 1,
                                    "source": [ "obj-12", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-112", 0 ],
                                    "source": [ "obj-125", 0 ]
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
                                    "destination": [ "obj-131", 0 ],
                                    "source": [ "obj-130", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-63", 1 ],
                                    "midpoints": [ 571.5, 213.0, 628.5, 213.0 ],
                                    "order": 0,
                                    "source": [ "obj-131", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-82", 0 ],
                                    "midpoints": [ 571.5, 196.0, 572.5, 196.0 ],
                                    "order": 1,
                                    "source": [ "obj-131", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-93", 5 ],
                                    "source": [ "obj-139", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-107", 3 ],
                                    "order": 1,
                                    "source": [ "obj-14", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-25", 1 ],
                                    "order": 0,
                                    "source": [ "obj-14", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-107", 3 ],
                                    "order": 1,
                                    "source": [ "obj-15", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-26", 1 ],
                                    "order": 0,
                                    "source": [ "obj-15", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-18", 5 ],
                                    "source": [ "obj-16", 0 ]
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
                                    "destination": [ "obj-21", 0 ],
                                    "source": [ "obj-19", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-13", 0 ],
                                    "source": [ "obj-2", 2 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-130", 0 ],
                                    "source": [ "obj-2", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-23", 0 ],
                                    "source": [ "obj-2", 3 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-87", 0 ],
                                    "source": [ "obj-2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-17", 1 ],
                                    "order": 0,
                                    "source": [ "obj-20", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-18", 0 ],
                                    "order": 1,
                                    "source": [ "obj-20", 0 ]
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
                                    "destination": [ "obj-19", 0 ],
                                    "midpoints": [ 1027.2693252563477, 201.6153964996338, 1027.9616355895996, 201.6153964996338 ],
                                    "order": 1,
                                    "source": [ "obj-22", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-21", 1 ],
                                    "midpoints": [ 1027.2693252563477, 190.05442023277283, 1072.4644677639008, 190.05442023277283, 1072.4644677639008, 189.61539459228516, 1083.9616355895996, 189.61539459228516 ],
                                    "order": 0,
                                    "source": [ "obj-22", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-22", 0 ],
                                    "source": [ "obj-23", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-111", 4 ],
                                    "source": [ "obj-27", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-107", 3 ],
                                    "source": [ "obj-33", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-111", 4 ],
                                    "midpoints": [ 264.88463973999023, 436.6923141479492, 182.5, 436.6923141479492 ],
                                    "source": [ "obj-45", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-27", 0 ],
                                    "order": 1,
                                    "source": [ "obj-5", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-33", 0 ],
                                    "order": 2,
                                    "source": [ "obj-5", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-45", 0 ],
                                    "order": 0,
                                    "source": [ "obj-5", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-8", 5 ],
                                    "source": [ "obj-6", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-68", 0 ],
                                    "source": [ "obj-63", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-93", 0 ],
                                    "order": 1,
                                    "source": [ "obj-68", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-96", 1 ],
                                    "order": 0,
                                    "source": [ "obj-68", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-14", 0 ],
                                    "source": [ "obj-8", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-63", 0 ],
                                    "source": [ "obj-82", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-97", 0 ],
                                    "source": [ "obj-85", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-106", 0 ],
                                    "order": 0,
                                    "source": [ "obj-86", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-88", 0 ],
                                    "order": 1,
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
                                    "destination": [ "obj-85", 0 ],
                                    "source": [ "obj-88", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-85", 3 ],
                                    "source": [ "obj-89", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-11", 0 ],
                                    "source": [ "obj-9", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-125", 0 ],
                                    "midpoints": [ 572.5, 378.4728012084961, 434.1154251098633, 378.4728012084961 ],
                                    "source": [ "obj-93", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-101", 10 ],
                                    "source": [ "obj-95", 9 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-101", 9 ],
                                    "source": [ "obj-95", 8 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-101", 8 ],
                                    "source": [ "obj-95", 7 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-101", 7 ],
                                    "source": [ "obj-95", 6 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-101", 6 ],
                                    "source": [ "obj-95", 5 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-101", 5 ],
                                    "source": [ "obj-95", 4 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-101", 4 ],
                                    "source": [ "obj-95", 3 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-101", 3 ],
                                    "source": [ "obj-95", 2 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-101", 2 ],
                                    "source": [ "obj-95", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-101", 1 ],
                                    "source": [ "obj-95", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-111", 0 ],
                                    "source": [ "obj-97", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 666.265084862709, 383.1325442790985, 49.0, 22.0 ],
                    "text": "p Stabz",
                    "varname": "patcher"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.4823529411764706, 0.19607843137254902, 0.19607843137254902, 1.0 ],
                    "bgcolor2": [ 0.4823529411764706, 0.19607843137254902, 0.19607843137254902, 1.0 ],
                    "bgfillcolor_angle": 270.0,
                    "bgfillcolor_autogradient": 0.0,
                    "bgfillcolor_color": [ 1.0, 0.25882352941176473, 0.09411764705882353, 1.0 ],
                    "bgfillcolor_color1": [ 0.4823529411764706, 0.19607843137254902, 0.19607843137254902, 1.0 ],
                    "bgfillcolor_color2": [ 0.748005250274626, 0.748005074384469, 0.748005120347377, 1.0 ],
                    "bgfillcolor_proportion": 0.5,
                    "bgfillcolor_type": "color",
                    "gradient": 1,
                    "id": "obj-48",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 225.30121314525604, 145.78313791751862, 46.0, 22.0 ],
                    "text": "refresh",
                    "textcolor": [ 1.0, 0.9882352941176471, 0.9882352941176471, 1.0 ]
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.748005250274626, 0.748005074384469, 0.748005120347377, 1.0 ],
                    "bgcolor2": [ 0.748005250274626, 0.748005074384469, 0.748005120347377, 1.0 ],
                    "bgfillcolor_angle": 270.0,
                    "bgfillcolor_autogradient": 0.0,
                    "bgfillcolor_color": [ 0.054901960784313725, 0.17647058823529413, 0.1843137254901961, 1.0 ],
                    "bgfillcolor_color1": [ 0.748005250274626, 0.748005074384469, 0.748005120347377, 1.0 ],
                    "bgfillcolor_color2": [ 0.748005250274626, 0.748005074384469, 0.748005120347377, 1.0 ],
                    "bgfillcolor_proportion": 0.5,
                    "bgfillcolor_type": "color",
                    "fontname": "Consolas Bold",
                    "fontsize": 10.0,
                    "gradient": 1,
                    "id": "obj-8",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 468.96990048885345, 645.7831563949585, 245.0, 20.0 ],
                    "text": "... .. .... . .. . .. . .. . .. . .. .. ..",
                    "textcolor": [ 0.9058823529411765, 0.8196078431372549, 0.8196078431372549, 1.0 ],
                    "varname": "input_keys[1]"
                }
            },
            {
                "box": {
                    "id": "obj-32",
                    "maxclass": "ezdac~",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [ 482.5617644190788, 598.7952028512955, 32.274096608161926, 32.274096608161926 ]
                }
            },
            {
                "box": {
                    "id": "obj-14",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 474.6988127231598, 334.9397714138031, 71.0, 22.0 ],
                    "text": "fromsymbol"
                }
            },
            {
                "box": {
                    "id": "obj-26",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "" ],
                    "patching_rect": [ 467.4698967933655, 95.18072640895844, 29.5, 22.0 ],
                    "text": "t b l"
                }
            },
            {
                "box": {
                    "id": "obj-20",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 478.31327068805695, 127.71084809303284, 100.00000369548798, 22.0 ],
                    "text": "dictionary Alan"
                }
            },
            {
                "box": {
                    "id": "obj-19",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 479.51809000968933, 154.2168731689453, 162.0, 22.0 ],
                    "text": "import pattern_data.json 1"
                }
            },
            {
                "box": {
                    "id": "obj-13",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 486.74700593948364, 34.93976032733917, 196.0, 22.0 ],
                    "text": "import ~/Desktop/pattern_data.json"
                }
            },
            {
                "box": {
                    "id": "obj-7",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 390.3614602088928, 701.2048451900482, 162.650608420372, 22.0 ],
                    "text": "export pattern_data.json 1"
                }
            },
            {
                "box": {
                    "id": "obj-6",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 185.54217553138733, 701.2048451900482, 196.0, 22.0 ],
                    "text": "export ~/Desktop/pattern_data.json"
                }
            },
            {
                "box": {
                    "id": "obj-52",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 851.8072603940964, 691.5662906169891, 210.0, 22.0 ],
                    "text": "export ~/Desktop/sequence_data.json"
                }
            },
            {
                "box": {
                    "id": "obj-51",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1075.90365421772, 691.5662906169891, 234.93976771831512, 22.0 ],
                    "text": "export ~/Desktop/sequence_data.json 1"
                }
            },
            {
                "box": {
                    "id": "obj-22",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "bang" ],
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
                        "rect": [ 293.0, 93.0, 1094.0, 644.0 ],
                        "boxes": [
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
                                    "id": "obj-37",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 336.0, 334.92308807373047, 50.0, 22.0 ],
                                    "text": "127"
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
                                    "patching_rect": [ 610.0, 153.0, 22.0, 22.0 ],
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
                                    "patching_rect": [ 592.0, 117.0, 91.0, 22.0 ],
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
                                    "patching_rect": [ 621.0, 64.0, 50.5, 22.0 ],
                                    "text": "keyup"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-91",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "bang", "" ],
                                    "patching_rect": [ 291.53848457336426, 216.92308807373047, 34.0, 22.0 ],
                                    "text": "sel 1"
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
                                    "text": "117",
                                    "varname": "input_keys[3]"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-93",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "int" ],
                                    "patching_rect": [ 291.53848457336426, 187.69231605529785, 46.0, 22.0 ],
                                    "text": "== 100"
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
                                    "text": "keys 127 117 0 -6",
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
                                    "comment": "",
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
                                    "comment": "",
                                    "id": "obj-15",
                                    "index": 2,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 138.0, 388.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-21",
                                    "index": 3,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 291.53848457336426, 388.0, 30.0, 30.0 ]
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
                                    "order": 1,
                                    "source": [ "obj-29", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-9", 0 ],
                                    "order": 0,
                                    "source": [ "obj-29", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-35", 0 ],
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
                                    "destination": [ "obj-21", 0 ],
                                    "source": [ "obj-91", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-6", 1 ],
                                    "order": 1,
                                    "source": [ "obj-92", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-93", 0 ],
                                    "order": 0,
                                    "source": [ "obj-92", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-91", 0 ],
                                    "source": [ "obj-93", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 17.0, 145.78313791751862, 107.0, 22.0 ],
                    "text": "p KEY_HANDLER"
                }
            },
            {
                "box": {
                    "id": "obj-59",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 748.1927987337112, 690.3614712953568, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-60",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 5,
                    "outlettype": [ "dictionary", "", "", "", "" ],
                    "patching_rect": [ 779.5181010961533, 691.5662906169891, 61.0, 22.0 ],
                    "saved_object_attributes": {
                        "legacy": 0,
                        "parameter_enable": 0,
                        "parameter_mappable": 0
                    },
                    "text": "dict Watts"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.748005250274626, 0.748005074384469, 0.748005120347377, 1.0 ],
                    "bgcolor2": [ 0.748005250274626, 0.748005074384469, 0.748005120347377, 1.0 ],
                    "bgfillcolor_angle": 270.0,
                    "bgfillcolor_autogradient": 0.0,
                    "bgfillcolor_color": [ 0.1607843137254902, 0.8901960784313725, 0.35294117647058826, 1.0 ],
                    "bgfillcolor_color1": [ 0.748005250274626, 0.748005074384469, 0.748005120347377, 1.0 ],
                    "bgfillcolor_color2": [ 0.748005250274626, 0.748005074384469, 0.748005120347377, 1.0 ],
                    "bgfillcolor_proportion": 0.5,
                    "bgfillcolor_type": "color",
                    "gradient": 1,
                    "id": "obj-58",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1106.0241372585297, 203.6144653558731, 187.0, 22.0 ],
                    "text": "command export_sequence_data"
                }
            },
            {
                "box": {
                    "id": "obj-11",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 455.4217035770416, 33.73494100570679, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-10",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 5,
                    "outlettype": [ "dictionary", "", "", "", "" ],
                    "patching_rect": [ 455.4217035770416, 67.46988201141357, 61.0, 22.0 ],
                    "saved_object_attributes": {
                        "legacy": 0,
                        "parameter_enable": 0,
                        "parameter_mappable": 0
                    },
                    "text": "dict Alan"
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
                    "patching_rect": [ 79.51807522773743, 700.0000258684158, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-29",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 5,
                    "outlettype": [ "dictionary", "", "", "", "" ],
                    "patching_rect": [ 113.25301623344421, 701.2048451900482, 61.0, 22.0 ],
                    "saved_object_attributes": {
                        "legacy": 0,
                        "parameter_enable": 0,
                        "parameter_mappable": 0
                    },
                    "text": "dict Alan"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.748005250274626, 0.748005074384469, 0.748005120347377, 1.0 ],
                    "bgcolor2": [ 0.748005250274626, 0.748005074384469, 0.748005120347377, 1.0 ],
                    "bgfillcolor_angle": 270.0,
                    "bgfillcolor_autogradient": 0.0,
                    "bgfillcolor_color": [ 0.2235294117647059, 0.9254901960784314, 0.40784313725490196, 1.0 ],
                    "bgfillcolor_color1": [ 0.748005250274626, 0.748005074384469, 0.748005120347377, 1.0 ],
                    "bgfillcolor_color2": [ 0.748005250274626, 0.748005074384469, 0.748005120347377, 1.0 ],
                    "bgfillcolor_proportion": 0.5,
                    "bgfillcolor_type": "color",
                    "gradient": 1,
                    "id": "obj-98",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 284.3373599052429, 145.78313791751862, 142.0, 22.0 ],
                    "text": "command export_pattern"
                }
            },
            {
                "box": {
                    "id": "obj-46",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 247.30121314525604, 202.45783925056458, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-77",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 0,
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
                        "rect": [ 59.0, 107.0, 1000.0, 730.0 ],
                        "boxes": [
                            {
                                "box": {
                                    "id": "obj-72",
                                    "maxclass": "number",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 50.0, 123.0, 50.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-63",
                                    "maxclass": "ezdac~",
                                    "numinlets": 2,
                                    "numoutlets": 0,
                                    "patching_rect": [ 52.0, 277.0, 45.0, 45.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-62",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 2,
                                    "outlettype": [ "multichannelsignal", "multichannelsignal" ],
                                    "patching_rect": [ 52.0, 229.0, 182.0, 22.0 ],
                                    "text": "mc.groove~ Kickdrum @chans 2"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-61",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "multichannelsignal" ],
                                    "patching_rect": [ 52.0, 178.0, 50.0, 22.0 ],
                                    "text": "mc.sig~"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-60",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 271.0, 187.0, 133.0, 22.0 ],
                                    "text": "loadmess set Kickdrum"
                                }
                            },
                            {
                                "box": {
                                    "buffername": "Kickdrum",
                                    "id": "obj-59",
                                    "maxclass": "waveform~",
                                    "numinlets": 5,
                                    "numoutlets": 6,
                                    "outlettype": [ "float", "float", "float", "float", "list", "" ],
                                    "patching_rect": [ 271.0, 232.0, 256.0, 64.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-58",
                                    "maxclass": "button",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 131.0, 100.0, 24.0, 24.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-55",
                                    "maxclass": "number",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 195.0, 193.0, 50.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-49",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 10,
                                    "outlettype": [ "float", "list", "float", "float", "float", "float", "float", "", "int", "" ],
                                    "patching_rect": [ 131.0, 157.0, 113.5, 22.0 ],
                                    "text": "info~ Kickdrum"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-48",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "float", "bang" ],
                                    "patching_rect": [ 271.0, 150.0, 139.0, 22.0 ],
                                    "text": "buffer~ Kickdrum 3500 2"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-40",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 271.0, 109.0, 48.0, 22.0 ],
                                    "text": "replace"
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "obj-48", 0 ],
                                    "source": [ "obj-40", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-55", 0 ],
                                    "source": [ "obj-49", 6 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-49", 0 ],
                                    "source": [ "obj-58", 0 ]
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
                                    "destination": [ "obj-62", 0 ],
                                    "source": [ "obj-61", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-63", 0 ],
                                    "source": [ "obj-62", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-61", 0 ],
                                    "source": [ "obj-72", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 563.8554425239563, 278.313263297081, 94.0, 22.0 ],
                    "text": "p bufferSampler"
                }
            },
            {
                "box": {
                    "filename": "zen_tracker_seq_ui.js",
                    "id": "obj-2",
                    "maxclass": "jsui",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 748.1927987337112, 248.19278025627136, 537.3494174480438, 425.80721974372864 ]
                }
            },
            {
                "box": {
                    "id": "obj-9",
                    "maxclass": "newobj",
                    "numinlets": 5,
                    "numoutlets": 4,
                    "outlettype": [ "int", "", "", "int" ],
                    "patching_rect": [ 359.0, 212.06025075912476, 65.0, 22.0 ],
                    "text": "counter 31"
                }
            },
            {
                "box": {
                    "id": "obj-5",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 17.0, 701.0000258684158, 50.0, 22.0 ],
                    "text": "13"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.4823529411764706, 0.19607843137254902, 0.19607843137254902, 1.0 ],
                    "bgcolor2": [ 0.4823529411764706, 0.19607843137254902, 0.19607843137254902, 1.0 ],
                    "bgfillcolor_angle": 270.0,
                    "bgfillcolor_autogradient": 0.0,
                    "bgfillcolor_color": [ 1.0, 0.25882352941176473, 0.09411764705882353, 1.0 ],
                    "bgfillcolor_color1": [ 0.4823529411764706, 0.19607843137254902, 0.19607843137254902, 1.0 ],
                    "bgfillcolor_color2": [ 0.748005250274626, 0.748005074384469, 0.748005120347377, 1.0 ],
                    "bgfillcolor_proportion": 0.5,
                    "bgfillcolor_type": "color",
                    "gradient": 1,
                    "id": "obj-3",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 178.31325960159302, 145.78313791751862, 35.0, 22.0 ],
                    "text": "clear",
                    "textcolor": [ 1.0, 0.9882352941176471, 0.9882352941176471, 1.0 ]
                }
            },
            {
                "box": {
                    "filename": "zen_tracker_ui.js",
                    "id": "obj-1",
                    "maxclass": "jsui",
                    "numinlets": 4,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 17.0, 248.0, 407.0, 426.0 ]
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-14", 0 ],
                    "midpoints": [ 220.5, 683.4096386432648, 441.32529497146606, 683.4096386432648, 441.32529497146606, 322.91566371917725, 484.1988127231598, 322.91566371917725 ],
                    "source": [ "obj-1", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-29", 0 ],
                    "midpoints": [ 414.5, 689.4096386432648, 122.75301623344421, 689.4096386432648 ],
                    "source": [ "obj-1", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 1 ],
                    "source": [ "obj-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 3 ],
                    "midpoints": [ 464.9217035770416, 246.83513069152832, 414.5, 246.83513069152832 ],
                    "order": 1,
                    "source": [ "obj-10", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-19", 1 ],
                    "source": [ "obj-10", 4 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-26", 0 ],
                    "order": 0,
                    "source": [ "obj-10", 0 ]
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
                    "destination": [ "obj-120", 1 ],
                    "source": [ "obj-118", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-120", 0 ],
                    "source": [ "obj-118", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-119", 1 ],
                    "source": [ "obj-120", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-119", 0 ],
                    "source": [ "obj-120", 0 ]
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
                    "destination": [ "obj-118", 0 ],
                    "midpoints": [ 484.1988127231598, 373.25301253795624, 675.765084862709, 373.25301253795624 ],
                    "order": 1,
                    "source": [ "obj-14", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-61", 0 ],
                    "order": 3,
                    "source": [ "obj-14", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-8", 1 ],
                    "midpoints": [ 484.1988127231598, 375.0240966081619, 454.9156526327133, 375.0240966081619, 454.9156526327133, 640.1325294971466, 704.4699004888535, 640.1325294971466 ],
                    "order": 0,
                    "source": [ "obj-14", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-87", 0 ],
                    "midpoints": [ 484.1988127231598, 372.9638569355011, 573.3554425239563, 372.9638569355011 ],
                    "order": 2,
                    "source": [ "obj-14", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-46", 0 ],
                    "midpoints": [ 34.80120575428009, 231.0, 12.0, 231.0, 12.0, 194.4337352514267, 256.80121314525604, 194.4337352514267 ],
                    "source": [ "obj-16", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-60", 0 ],
                    "midpoints": [ 1276.042216181755, 683.5033755302429, 789.0181010961533, 683.5033755302429 ],
                    "source": [ "obj-2", 1 ]
                }
            },
            {
                "patchline": {
                    "color": [ 0.058823529411764705, 0.6470588235294118, 0.984313725490196, 1.0 ],
                    "destination": [ "obj-1", 2 ],
                    "midpoints": [ 70.5, 177.59416460990906, 285.1666666666667, 177.59416460990906 ],
                    "source": [ "obj-22", 1 ]
                }
            },
            {
                "patchline": {
                    "color": [ 0.058823529411764705, 0.6470588235294118, 0.984313725490196, 1.0 ],
                    "destination": [ "obj-1", 0 ],
                    "midpoints": [ 26.5, 202.10018968582153, 26.5, 202.10018968582153 ],
                    "source": [ "obj-22", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-16", 0 ],
                    "midpoints": [ 114.5, 186.0, 34.80120575428009, 186.0 ],
                    "source": [ "obj-22", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20", 1 ],
                    "midpoints": [ 487.4698967933655, 121.52275502681732, 568.8132743835449, 121.52275502681732 ],
                    "source": [ "obj-26", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-48", 0 ],
                    "midpoints": [ 476.9698967933655, 133.79898023605347, 234.80121314525604, 133.79898023605347 ],
                    "source": [ "obj-26", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-7", 1 ],
                    "midpoints": [ 164.7530162334442, 734.4337352514267, 180.0, 734.4337352514267, 180.0, 733.987953543663, 543.5120686292648, 733.987953543663 ],
                    "source": [ "obj-29", 4 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "midpoints": [ 187.81325960159302, 186.0, 7.180722713470459, 186.0, 7.180722713470459, 240.0, 26.5, 240.0 ],
                    "source": [ "obj-3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-2", 0 ],
                    "midpoints": [ 1076.5, 239.43374264240265, 757.6927987337112, 239.43374264240265 ],
                    "source": [ "obj-34", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-2", 0 ],
                    "midpoints": [ 917.0, 239.59036874771118, 757.6927987337112, 239.59036874771118 ],
                    "source": [ "obj-34", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-48", 0 ],
                    "midpoints": [ 757.5, 237.72289085388184, 458.0, 237.72289085388184, 458.0, 137.28915560245514, 234.80121314525604, 137.28915560245514 ],
                    "order": 1,
                    "source": [ "obj-34", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9", 3 ],
                    "midpoints": [ 757.5, 234.92771017551422, 724.5180715322495, 234.92771017551422, 724.5180715322495, 205.18072271347046, 403.0, 205.18072271347046 ],
                    "order": 0,
                    "source": [ "obj-34", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-29", 0 ],
                    "source": [ "obj-39", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-88", 1 ],
                    "source": [ "obj-42", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-88", 0 ],
                    "source": [ "obj-42", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "midpoints": [ 256.80121314525604, 230.19472193717957, 26.5, 230.19472193717957 ],
                    "order": 1,
                    "source": [ "obj-46", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-34", 0 ],
                    "midpoints": [ 256.80121314525604, 228.0, 345.0, 228.0, 345.0, 201.61445796489716, 757.5, 201.61445796489716 ],
                    "order": 2,
                    "source": [ "obj-46", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9", 0 ],
                    "midpoints": [ 256.80121314525604, 228.0, 345.0, 228.0, 345.0, 207.0, 368.5, 207.0 ],
                    "order": 0,
                    "source": [ "obj-46", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-32", 1 ],
                    "source": [ "obj-47", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-32", 0 ],
                    "source": [ "obj-47", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "midpoints": [ 234.80121314525604, 186.0, 4.7710840702056885, 186.0, 4.7710840702056885, 240.0, 26.5, 240.0 ],
                    "source": [ "obj-48", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-60", 1 ],
                    "midpoints": [ 861.3072603940964, 722.2289159297943, 848.8795169591904, 722.2289159297943, 848.8795169591904, 686.7951806783676, 831.0181010961533, 686.7951806783676 ],
                    "source": [ "obj-52", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-2", 0 ],
                    "midpoints": [ 1115.5241372585297, 239.28916668891907, 757.6927987337112, 239.28916668891907 ],
                    "source": [ "obj-58", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-60", 0 ],
                    "source": [ "obj-59", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-29", 0 ],
                    "midpoints": [ 195.04217553138733, 726.0, 180.02409660816193, 726.0, 180.02409660816193, 695.4337352514267, 122.75301623344421, 695.4337352514267 ],
                    "source": [ "obj-6", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-51", 1 ],
                    "midpoints": [ 831.0181010961533, 727.7055535316467, 1301.3434219360352, 727.7055535316467 ],
                    "source": [ "obj-60", 4 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-47", 1 ],
                    "order": 0,
                    "source": [ "obj-61", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-47", 0 ],
                    "order": 1,
                    "source": [ "obj-61", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-42", 0 ],
                    "source": [ "obj-87", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-89", 1 ],
                    "source": [ "obj-88", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-89", 0 ],
                    "source": [ "obj-88", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 1 ],
                    "midpoints": [ 368.5, 236.46163511276245, 155.83333333333334, 236.46163511276245 ],
                    "source": [ "obj-9", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "midpoints": [ 293.8373599052429, 234.0093675851822, 26.5, 234.0093675851822 ],
                    "source": [ "obj-98", 0 ]
                }
            }
        ],
        "parameters": {
            "obj-118::obj-107::obj-13": [ "View[4]", "View", 0 ],
            "obj-118::obj-107::obj-154": [ "Abl.Echo", "Abl.Echo", 0 ],
            "obj-118::obj-107::obj-167": [ "ModOutB[5]", "ModOutB", -1 ],
            "obj-118::obj-107::obj-27::obj-116": [ "Location", "Location", 0 ],
            "obj-118::obj-107::obj-27::obj-16": [ "Mix[5]", "Mix", 0 ],
            "obj-118::obj-107::obj-27::obj-18": [ "Width[1]", "Width", 0 ],
            "obj-118::obj-107::obj-27::obj-19": [ "Output", "Output", 0 ],
            "obj-118::obj-107::obj-27::obj-22": [ "DryWet", "DryWet", 0 ],
            "obj-118::obj-107::obj-27::obj-6": [ "Reverb", "Reverb", 0 ],
            "obj-118::obj-107::obj-27::obj-8": [ "Decay", "Decay", 0 ],
            "obj-118::obj-107::obj-27::obj-9": [ "Channel", "Channel", 0 ],
            "obj-118::obj-107::obj-45": [ "ModInALed[5]", "ModInALed", 0 ],
            "obj-118::obj-107::obj-47": [ "ModInBLed[5]", "ModInBLed", 0 ],
            "obj-118::obj-107::obj-49": [ "ModInA[5]", "ModInA", -1 ],
            "obj-118::obj-107::obj-50": [ "ModInB[5]", "ModInB", -1 ],
            "obj-118::obj-107::obj-52": [ "ModOutA[5]", "ModOutA", -1 ],
            "obj-118::obj-107::obj-59": [ "ModOutALed[5]", "ModOutALed", 0 ],
            "obj-118::obj-107::obj-60": [ "ModOutBLed[5]", "ModOutBLed", 0 ],
            "obj-118::obj-107::obj-83::obj-17": [ "Clip", "Clip", 0 ],
            "obj-118::obj-107::obj-83::obj-23": [ "Invert[1]", "Invert", 0 ],
            "obj-118::obj-107::obj-83::obj-53": [ "Feed[1]", "Feed", 0 ],
            "obj-118::obj-107::obj-83::obj-58": [ "Link", "Link", -1 ],
            "obj-118::obj-107::obj-83::obj-6": [ "Input", "Input", 0 ],
            "obj-118::obj-107::obj-83::obj-7": [ "Repitch", "Repitch", 0 ],
            "obj-118::obj-107::obj-83::obj-8": [ "DelL", "DelL", 0 ],
            "obj-118::obj-107::obj-83::obj-9": [ "DelR", "DelR", 0 ],
            "obj-118::obj-107::obj-90::obj-116": [ "MWave", "MWave", 0 ],
            "obj-118::obj-107::obj-90::obj-18": [ "MEnv", "MEnv", 0 ],
            "obj-118::obj-107::obj-90::obj-33": [ "MMult", "MMult", 0 ],
            "obj-118::obj-107::obj-90::obj-39": [ "Display", "Display", 0 ],
            "obj-118::obj-107::obj-90::obj-53": [ "MDel", "MDel", 0 ],
            "obj-118::obj-107::obj-90::obj-8": [ "MFreq", "MFreq", 0 ],
            "obj-118::obj-107::obj-90::obj-9": [ "MPha", "MPha", 0 ],
            "obj-118::obj-107::obj-92::obj-16": [ "WAmt", "WAmt", 0 ],
            "obj-118::obj-107::obj-92::obj-18": [ "NAmt", "NAmt", 0 ],
            "obj-118::obj-107::obj-92::obj-19": [ "NMor", "NMor", 0 ],
            "obj-118::obj-107::obj-92::obj-3": [ "WMor", "WMor", 0 ],
            "obj-118::obj-107::obj-92::obj-32": [ "Ducking", "Ducking", 1 ],
            "obj-118::obj-107::obj-92::obj-34": [ "Gate", "Gate", 1 ],
            "obj-118::obj-107::obj-92::obj-53": [ "DThr", "DThr", 0 ],
            "obj-118::obj-107::obj-92::obj-6": [ "GRel", "GRel", 0 ],
            "obj-118::obj-107::obj-92::obj-8": [ "GThr", "GThr", 0 ],
            "obj-118::obj-107::obj-92::obj-9": [ "DRel", "DRel", 0 ],
            "obj-118::obj-107::obj-99": [ "Active[5]", "Active", 0 ],
            "obj-118::obj-111::obj-13": [ "View[5]", "View", 0 ],
            "obj-118::obj-111::obj-154": [ "Abl.AutoFilter", "Abl.AutoFilter", 0 ],
            "obj-118::obj-111::obj-167": [ "ModOutB[6]", "ModOutB", -1 ],
            "obj-118::obj-111::obj-45": [ "ModInALed[6]", "ModInALed", 0 ],
            "obj-118::obj-111::obj-47": [ "ModInBLed[6]", "ModInBLed", 0 ],
            "obj-118::obj-111::obj-49": [ "ModInA[6]", "ModInA", -1 ],
            "obj-118::obj-111::obj-50": [ "ModInB[6]", "ModInB", -1 ],
            "obj-118::obj-111::obj-52": [ "ModOutA[6]", "ModOutA", -1 ],
            "obj-118::obj-111::obj-59": [ "ModOutALed[6]", "ModOutALed", 0 ],
            "obj-118::obj-111::obj-60": [ "ModOutBLed[6]", "ModOutBLed", 0 ],
            "obj-118::obj-111::obj-83::obj-116": [ "Type", "Type", 0 ],
            "obj-118::obj-111::obj-83::obj-124": [ "Gain[3]", "Gain", 0 ],
            "obj-118::obj-111::obj-83::obj-190": [ "Drive", "Drive", 0 ],
            "obj-118::obj-111::obj-83::obj-195": [ "Softclip", "Softclip", 0 ],
            "obj-118::obj-111::obj-83::obj-196": [ "Mix[6]", "Mix", 0 ],
            "obj-118::obj-111::obj-83::obj-204": [ "Oversample", "Oversample", 0 ],
            "obj-118::obj-111::obj-83::obj-210": [ "Env", "Env", 0 ],
            "obj-118::obj-111::obj-83::obj-214": [ "Att", "Att", 0 ],
            "obj-118::obj-111::obj-83::obj-216": [ "Rel", "Rel", 0 ],
            "obj-118::obj-111::obj-83::obj-218": [ "Hold", "Hold", 0 ],
            "obj-118::obj-111::obj-83::obj-34": [ "Freq", "Freq", 0 ],
            "obj-118::obj-111::obj-83::obj-54": [ "Circuit", "Circuit", 0 ],
            "obj-118::obj-111::obj-83::obj-65": [ "Pitch", "Pitch", 0 ],
            "obj-118::obj-111::obj-83::obj-78": [ "Morph", "Morph", 0 ],
            "obj-118::obj-111::obj-83::obj-81": [ "Slope", "Slope", 0 ],
            "obj-118::obj-111::obj-83::obj-82": [ "MorphSlope", "Slope", 0 ],
            "obj-118::obj-111::obj-83::obj-83": [ "Ctrl", "Ctrl", 0 ],
            "obj-118::obj-111::obj-83::obj-86": [ "Res", "Res", 0 ],
            "obj-118::obj-111::obj-83::obj-87": [ "Form", "Form", 0 ],
            "obj-118::obj-111::obj-90::obj-250": [ "LFOAmount", "LFO", 0 ],
            "obj-118::obj-111::obj-90::obj-254": [ "LFORate", "Rate", 0 ],
            "obj-118::obj-111::obj-90::obj-255": [ "LFOWave", "Wave", 0 ],
            "obj-118::obj-111::obj-90::obj-259": [ "LFOMorph", "Morph", 0 ],
            "obj-118::obj-111::obj-90::obj-263": [ "LFOPhase[3]", "Phase", 0 ],
            "obj-118::obj-111::obj-90::obj-269": [ "LFOOffset", "Offset", 0 ],
            "obj-118::obj-111::obj-90::obj-273": [ "LFOSmooth", "Smooth", 0 ],
            "obj-118::obj-111::obj-90::obj-280": [ "LFOQuantize", "Quantize", 0 ],
            "obj-118::obj-111::obj-90::obj-292": [ "LFOSteps", "Steps", 0 ],
            "obj-118::obj-111::obj-90::obj-3": [ "LFOMode", "Mode", 0 ],
            "obj-118::obj-111::obj-90::obj-55": [ "LFOSpin[3]", "Spin", 0 ],
            "obj-118::obj-111::obj-92::obj-309": [ "SCIntern", "Intern", 0 ],
            "obj-118::obj-111::obj-92::obj-310": [ "SCExternal", "External", 0 ],
            "obj-118::obj-111::obj-92::obj-311": [ "SCMono", "Mono", 0 ],
            "obj-118::obj-111::obj-92::obj-318": [ "SCSolo", "Solo", 0 ],
            "obj-118::obj-111::obj-92::obj-323": [ "SCExtern", "Extern", 0 ],
            "obj-118::obj-111::obj-92::obj-325": [ "SCFreq", "Freq", 0 ],
            "obj-118::obj-111::obj-92::obj-327": [ "SCEQ", "EQ", 0 ],
            "obj-118::obj-111::obj-92::obj-329": [ "SCRes", "Res", 0 ],
            "obj-118::obj-111::obj-92::obj-330": [ "SCType", "Type", 0 ],
            "obj-118::obj-111::obj-99": [ "Active[6]", "Active", 0 ],
            "obj-118::obj-85::obj-40": [ "slider[2]", "slider", 0 ],
            "obj-120": [ "live.gain~", "live.gain~", 0 ],
            "obj-16::obj-14": [ "live.slider", "live.slider", 0 ],
            "obj-47": [ "live.gain~[1]", "live.gain~", 0 ],
            "obj-61::obj-23::obj-40": [ "slider", "slider", 0 ],
            "obj-87::obj-34::obj-13": [ "View", "View", 0 ],
            "obj-87::obj-34::obj-154": [ "Abl.AutoFilter[1]", "Abl.AutoFilter", 0 ],
            "obj-87::obj-34::obj-167": [ "ModOutB[7]", "ModOutB", -1 ],
            "obj-87::obj-34::obj-45": [ "ModInALed[7]", "ModInALed", 0 ],
            "obj-87::obj-34::obj-47": [ "ModInBLed[7]", "ModInBLed", 0 ],
            "obj-87::obj-34::obj-49": [ "ModInA[7]", "ModInA", -1 ],
            "obj-87::obj-34::obj-50": [ "ModInB[7]", "ModInB", -1 ],
            "obj-87::obj-34::obj-52": [ "ModOutA[7]", "ModOutA", -1 ],
            "obj-87::obj-34::obj-59": [ "ModOutALed[7]", "ModOutALed", 0 ],
            "obj-87::obj-34::obj-60": [ "ModOutBLed[7]", "ModOutBLed", 0 ],
            "obj-87::obj-34::obj-83::obj-116": [ "Type[1]", "Type", 0 ],
            "obj-87::obj-34::obj-83::obj-124": [ "Gain[4]", "Gain", 0 ],
            "obj-87::obj-34::obj-83::obj-190": [ "Drive[1]", "Drive", 0 ],
            "obj-87::obj-34::obj-83::obj-195": [ "Softclip[1]", "Softclip", 0 ],
            "obj-87::obj-34::obj-83::obj-196": [ "Mix[7]", "Mix", 0 ],
            "obj-87::obj-34::obj-83::obj-204": [ "Oversample[1]", "Oversample", 0 ],
            "obj-87::obj-34::obj-83::obj-210": [ "Env[1]", "Env", 0 ],
            "obj-87::obj-34::obj-83::obj-214": [ "Att[1]", "Att", 0 ],
            "obj-87::obj-34::obj-83::obj-216": [ "Rel[1]", "Rel", 0 ],
            "obj-87::obj-34::obj-83::obj-218": [ "Hold[1]", "Hold", 0 ],
            "obj-87::obj-34::obj-83::obj-34": [ "Freq[1]", "Freq", 0 ],
            "obj-87::obj-34::obj-83::obj-54": [ "Circuit[1]", "Circuit", 0 ],
            "obj-87::obj-34::obj-83::obj-65": [ "Pitch[1]", "Pitch", 0 ],
            "obj-87::obj-34::obj-83::obj-78": [ "Morph[1]", "Morph", 0 ],
            "obj-87::obj-34::obj-83::obj-81": [ "Slope[1]", "Slope", 0 ],
            "obj-87::obj-34::obj-83::obj-82": [ "MorphSlope[1]", "Slope", 0 ],
            "obj-87::obj-34::obj-83::obj-83": [ "Ctrl[1]", "Ctrl", 0 ],
            "obj-87::obj-34::obj-83::obj-86": [ "Res[1]", "Res", 0 ],
            "obj-87::obj-34::obj-83::obj-87": [ "Form[1]", "Form", 0 ],
            "obj-87::obj-34::obj-90::obj-250": [ "LFOAmount[1]", "LFO", 0 ],
            "obj-87::obj-34::obj-90::obj-254": [ "LFORate[1]", "Rate", 0 ],
            "obj-87::obj-34::obj-90::obj-255": [ "LFOWave[1]", "Wave", 0 ],
            "obj-87::obj-34::obj-90::obj-259": [ "LFOMorph[1]", "Morph", 0 ],
            "obj-87::obj-34::obj-90::obj-263": [ "LFOPhase", "Phase", 0 ],
            "obj-87::obj-34::obj-90::obj-269": [ "LFOOffset[1]", "Offset", 0 ],
            "obj-87::obj-34::obj-90::obj-273": [ "LFOSmooth[1]", "Smooth", 0 ],
            "obj-87::obj-34::obj-90::obj-280": [ "LFOQuantize[1]", "Quantize", 0 ],
            "obj-87::obj-34::obj-90::obj-292": [ "LFOSteps[1]", "Steps", 0 ],
            "obj-87::obj-34::obj-90::obj-3": [ "LFOMode[1]", "Mode", 0 ],
            "obj-87::obj-34::obj-90::obj-55": [ "LFOSpin", "Spin", 0 ],
            "obj-87::obj-34::obj-92::obj-309": [ "SCIntern[1]", "Intern", 0 ],
            "obj-87::obj-34::obj-92::obj-310": [ "SCExternal[1]", "External", 0 ],
            "obj-87::obj-34::obj-92::obj-311": [ "SCMono[1]", "Mono", 0 ],
            "obj-87::obj-34::obj-92::obj-318": [ "SCSolo[1]", "Solo", 0 ],
            "obj-87::obj-34::obj-92::obj-323": [ "SCExtern[1]", "Extern", 0 ],
            "obj-87::obj-34::obj-92::obj-325": [ "SCFreq[1]", "Freq", 0 ],
            "obj-87::obj-34::obj-92::obj-327": [ "SCEQ[1]", "EQ", 0 ],
            "obj-87::obj-34::obj-92::obj-329": [ "SCRes[1]", "Res", 0 ],
            "obj-87::obj-34::obj-92::obj-330": [ "SCType[1]", "Type", 0 ],
            "obj-87::obj-34::obj-99": [ "Active[7]", "Active", 0 ],
            "obj-87::obj-55::obj-40": [ "slider[1]", "slider", 0 ],
            "obj-87::obj-81::obj-112": [ "Invert", "Invert", 0 ],
            "obj-87::obj-81::obj-154": [ "Abl.Chorus", "Abl.Chorus", 0 ],
            "obj-87::obj-81::obj-167": [ "ModOutB", "ModOutB", -1 ],
            "obj-87::obj-81::obj-4": [ "Mix", "Mix", 0 ],
            "obj-87::obj-81::obj-45": [ "ModInALed", "ModInALed", 0 ],
            "obj-87::obj-81::obj-47": [ "ModInBLed", "ModInBLed", 0 ],
            "obj-87::obj-81::obj-49": [ "ModInA", "ModInA", -1 ],
            "obj-87::obj-81::obj-50": [ "ModInB", "ModInB", -1 ],
            "obj-87::obj-81::obj-52": [ "ModOutA", "ModOutA", -1 ],
            "obj-87::obj-81::obj-59": [ "ModOutALed", "ModOutALed", 0 ],
            "obj-87::obj-81::obj-6": [ "Rate", "Rate", 0 ],
            "obj-87::obj-81::obj-60": [ "ModOutBLed", "ModOutBLed", 0 ],
            "obj-87::obj-81::obj-8": [ "Feed", "Feed", 0 ],
            "obj-87::obj-81::obj-81": [ "Mod", "Mod", 0 ],
            "obj-87::obj-81::obj-82": [ "Gain", "Gain", 0 ],
            "obj-87::obj-81::obj-9": [ "Width", "Width", 0 ],
            "obj-87::obj-81::obj-99": [ "Active", "Active", 0 ],
            "obj-88": [ "live.gain~[2]", "live.gain~", 0 ],
            "parameterbanks": {
                "0": {
                    "index": 0,
                    "name": "",
                    "parameters": [ "-", "-", "-", "-", "-", "-", "-", "-" ],
                    "buttons": [ "-", "-", "-", "-", "-", "-", "-", "-" ]
                }
            },
            "parameter_overrides": {
                "obj-118::obj-107::obj-27::obj-16": {
                    "parameter_longname": "Mix[5]"
                },
                "obj-118::obj-107::obj-27::obj-18": {
                    "parameter_longname": "Width[1]"
                },
                "obj-118::obj-107::obj-45": {
                    "parameter_longname": "ModInALed[5]"
                },
                "obj-118::obj-107::obj-47": {
                    "parameter_longname": "ModInBLed[5]"
                },
                "obj-118::obj-107::obj-59": {
                    "parameter_longname": "ModOutALed[5]"
                },
                "obj-118::obj-107::obj-60": {
                    "parameter_longname": "ModOutBLed[5]"
                },
                "obj-118::obj-107::obj-83::obj-23": {
                    "parameter_longname": "Invert[1]"
                },
                "obj-118::obj-107::obj-83::obj-53": {
                    "parameter_longname": "Feed[1]"
                },
                "obj-118::obj-107::obj-99": {
                    "parameter_longname": "Active[5]"
                },
                "obj-118::obj-111::obj-45": {
                    "parameter_longname": "ModInALed[6]"
                },
                "obj-118::obj-111::obj-47": {
                    "parameter_longname": "ModInBLed[6]"
                },
                "obj-118::obj-111::obj-59": {
                    "parameter_longname": "ModOutALed[6]"
                },
                "obj-118::obj-111::obj-60": {
                    "parameter_longname": "ModOutBLed[6]"
                },
                "obj-118::obj-111::obj-83::obj-124": {
                    "parameter_longname": "Gain[3]"
                },
                "obj-118::obj-111::obj-83::obj-196": {
                    "parameter_longname": "Mix[6]"
                },
                "obj-118::obj-111::obj-90::obj-263": {
                    "parameter_longname": "LFOPhase[3]"
                },
                "obj-118::obj-111::obj-90::obj-55": {
                    "parameter_longname": "LFOSpin[3]"
                },
                "obj-118::obj-111::obj-99": {
                    "parameter_longname": "Active[6]"
                },
                "obj-87::obj-34::obj-154": {
                    "parameter_longname": "Abl.AutoFilter[1]"
                },
                "obj-87::obj-34::obj-45": {
                    "parameter_longname": "ModInALed[7]"
                },
                "obj-87::obj-34::obj-47": {
                    "parameter_longname": "ModInBLed[7]"
                },
                "obj-87::obj-34::obj-59": {
                    "parameter_longname": "ModOutALed[7]"
                },
                "obj-87::obj-34::obj-60": {
                    "parameter_longname": "ModOutBLed[7]"
                },
                "obj-87::obj-34::obj-83::obj-116": {
                    "parameter_longname": "Type[1]"
                },
                "obj-87::obj-34::obj-83::obj-124": {
                    "parameter_longname": "Gain[4]"
                },
                "obj-87::obj-34::obj-83::obj-190": {
                    "parameter_longname": "Drive[1]"
                },
                "obj-87::obj-34::obj-83::obj-195": {
                    "parameter_longname": "Softclip[1]"
                },
                "obj-87::obj-34::obj-83::obj-196": {
                    "parameter_longname": "Mix[7]"
                },
                "obj-87::obj-34::obj-83::obj-204": {
                    "parameter_longname": "Oversample[1]"
                },
                "obj-87::obj-34::obj-83::obj-210": {
                    "parameter_longname": "Env[1]"
                },
                "obj-87::obj-34::obj-83::obj-214": {
                    "parameter_longname": "Att[1]"
                },
                "obj-87::obj-34::obj-83::obj-216": {
                    "parameter_longname": "Rel[1]"
                },
                "obj-87::obj-34::obj-83::obj-218": {
                    "parameter_longname": "Hold[1]"
                },
                "obj-87::obj-34::obj-83::obj-34": {
                    "parameter_longname": "Freq[1]"
                },
                "obj-87::obj-34::obj-83::obj-54": {
                    "parameter_longname": "Circuit[1]"
                },
                "obj-87::obj-34::obj-83::obj-65": {
                    "parameter_longname": "Pitch[1]"
                },
                "obj-87::obj-34::obj-83::obj-78": {
                    "parameter_longname": "Morph[1]"
                },
                "obj-87::obj-34::obj-83::obj-81": {
                    "parameter_longname": "Slope[1]"
                },
                "obj-87::obj-34::obj-83::obj-82": {
                    "parameter_longname": "MorphSlope[1]"
                },
                "obj-87::obj-34::obj-83::obj-83": {
                    "parameter_longname": "Ctrl[1]"
                },
                "obj-87::obj-34::obj-83::obj-86": {
                    "parameter_longname": "Res[1]"
                },
                "obj-87::obj-34::obj-83::obj-87": {
                    "parameter_longname": "Form[1]"
                },
                "obj-87::obj-34::obj-90::obj-250": {
                    "parameter_longname": "LFOAmount[1]"
                },
                "obj-87::obj-34::obj-90::obj-254": {
                    "parameter_longname": "LFORate[1]"
                },
                "obj-87::obj-34::obj-90::obj-255": {
                    "parameter_longname": "LFOWave[1]"
                },
                "obj-87::obj-34::obj-90::obj-259": {
                    "parameter_longname": "LFOMorph[1]"
                },
                "obj-87::obj-34::obj-90::obj-269": {
                    "parameter_longname": "LFOOffset[1]"
                },
                "obj-87::obj-34::obj-90::obj-273": {
                    "parameter_longname": "LFOSmooth[1]"
                },
                "obj-87::obj-34::obj-90::obj-280": {
                    "parameter_longname": "LFOQuantize[1]"
                },
                "obj-87::obj-34::obj-90::obj-292": {
                    "parameter_longname": "LFOSteps[1]"
                },
                "obj-87::obj-34::obj-90::obj-3": {
                    "parameter_longname": "LFOMode[1]"
                },
                "obj-87::obj-34::obj-92::obj-309": {
                    "parameter_longname": "SCIntern[1]"
                },
                "obj-87::obj-34::obj-92::obj-310": {
                    "parameter_longname": "SCExternal[1]"
                },
                "obj-87::obj-34::obj-92::obj-311": {
                    "parameter_longname": "SCMono[1]"
                },
                "obj-87::obj-34::obj-92::obj-318": {
                    "parameter_longname": "SCSolo[1]"
                },
                "obj-87::obj-34::obj-92::obj-323": {
                    "parameter_longname": "SCExtern[1]"
                },
                "obj-87::obj-34::obj-92::obj-325": {
                    "parameter_longname": "SCFreq[1]"
                },
                "obj-87::obj-34::obj-92::obj-327": {
                    "parameter_longname": "SCEQ[1]"
                },
                "obj-87::obj-34::obj-92::obj-329": {
                    "parameter_longname": "SCRes[1]"
                },
                "obj-87::obj-34::obj-92::obj-330": {
                    "parameter_longname": "SCType[1]"
                },
                "obj-87::obj-34::obj-99": {
                    "parameter_longname": "Active[7]"
                }
            },
            "inherited_shortname": 1
        },
        "autosave": 0,
        "elementcolor": [ 0.3333333333333333, 0.24313725490196078, 0.24313725490196078, 1.0 ]
    }
}