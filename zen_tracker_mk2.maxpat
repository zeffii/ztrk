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
        "rect": [ -1673.0, 77.0, 1673.0, 802.0 ],
        "toolbars_unpinned_last_save": 4,
        "boxes": [
            {
                "box": {
                    "id": "obj-120",
                    "lastchannelcount": 0,
                    "maxclass": "live.gain~",
                    "numinlets": 2,
                    "numoutlets": 5,
                    "outlettype": [ "signal", "signal", "", "float", "list" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 568.5, 804.0, 48.0, 136.0 ],
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
                    "patching_rect": [ 570.0, 955.0, 45.0, 45.0 ]
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
                                    "id": "obj-26",
                                    "linecount": 2,
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 910.7693176269531, 386.1538829803467, 83.0, 36.0 ],
                                    "presentation_linecount": 2,
                                    "text": "A::DelR 370.588235"
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
                                    "text": "A::DelL 242.039216"
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
                                    "patching_rect": [ 1126.153953552246, 273.8461799621582, 49.0, 22.0 ]
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
                                    "text": "30"
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
                                    "text": "19"
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
                                    "text": "9"
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
                                    "patching_rect": [ 255.38463973999023, 400.0, 142.0, 22.0 ],
                                    "text": "A::Drive 0.141732"
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
                                    "text": "A::Freq 725."
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
                                    "decay_slope": 0.2659409126232797,
                                    "decay_time": 5443.6065094478145,
                                    "id": "obj-95",
                                    "initial": 0.09728813327369043,
                                    "maxclass": "live.adsrui",
                                    "numinlets": 10,
                                    "numoutlets": 10,
                                    "outlettype": [ "", "", "", "", "", "", "", "", "", "" ],
                                    "patching_rect": [ 311.6951425075531, 203.90243816375732, 226.8292737007141, 50.0 ],
                                    "peak": 0.895932209685697,
                                    "release_slope": 0.8333333333333368,
                                    "release_time": 266.4260238747677,
                                    "sustain": 0.6799999999999999
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
                    "patching_rect": [ 568.0, 748.780505657196, 49.0, 22.0 ],
                    "text": "p Stabz",
                    "varname": "patcher"
                }
            },
            {
                "box": {
                    "id": "obj-34",
                    "maxclass": "newobj",
                    "numinlets": 5,
                    "numoutlets": 4,
                    "outlettype": [ "multichannelsignal", "signal", "signal", "" ],
                    "patching_rect": [ 306.0, 884.0, 88.0, 22.0 ],
                    "text": "Abl.AutoFilter~",
                    "varname": "Abl.AutoFilter~[1]"
                }
            },
            {
                "box": {
                    "floatoutput": 1,
                    "id": "obj-109",
                    "maxclass": "slider",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 475.6097674369812, 831.0, 26.70732855796814, 145.9756314754486 ],
                    "size": 1.0
                }
            },
            {
                "box": {
                    "floatoutput": 1,
                    "id": "obj-83",
                    "maxclass": "slider",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 248.7804937362671, 742.6829445362091, 28.048781156539917, 73.21951341629028 ],
                    "size": 2.0
                }
            },
            {
                "box": {
                    "id": "obj-81",
                    "maxclass": "newobj",
                    "numinlets": 4,
                    "numoutlets": 4,
                    "outlettype": [ "multichannelsignal", "signal", "signal", "" ],
                    "patching_rect": [ 304.8780560493469, 856.0975813865662, 75.0, 22.0 ],
                    "text": "Abl.Chorus~",
                    "varname": "Abl.Chorus~"
                }
            },
            {
                "box": {
                    "id": "obj-42",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "signal" ],
                    "patching_rect": [ 304.8780560493469, 944.0, 84.0, 22.0 ],
                    "text": "mc.unpack~ 2"
                }
            },
            {
                "box": {
                    "id": "obj-36",
                    "maxclass": "newobj",
                    "numinlets": 4,
                    "numoutlets": 4,
                    "outlettype": [ "multichannelsignal", "signal", "signal", "" ],
                    "patching_rect": [ 178.0, 911.0, 77.0, 22.0 ],
                    "text": "Abl.Flanger~",
                    "varname": "Abl.Flanger~"
                }
            },
            {
                "box": {
                    "id": "obj-15",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "" ],
                    "patching_rect": [ 297.5609827041626, 758.5366034507751, 34.0, 22.0 ],
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
                    "patching_rect": [ 297.5609827041626, 732.92684674263, 51.0, 22.0 ],
                    "text": "zl.mth 9"
                }
            },
            {
                "box": {
                    "id": "obj-80",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 9.737805604934692, 731.7073345184326, 29.5, 22.0 ],
                    "text": "60"
                }
            },
            {
                "box": {
                    "id": "obj-78",
                    "maxclass": "ezdac~",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [ 308.8780560493469, 972.0, 45.0, 45.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-70",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 297.5609827041626, 793.9024579524994, 29.5, 22.0 ],
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
                    "patching_rect": [ 350.00000834465027, 793.9024579524994, 120.0, 22.0 ],
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
                    "patching_rect": [ 350.00000834465027, 758.5366034507751, 99.0, 22.0 ],
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
                    "patching_rect": [ 304.8780560493469, 826.0, 87.0, 22.0 ],
                    "text": "ZSamplerMAX"
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
                    "patching_rect": [ 442.68293738365173, 356.0975694656372, 46.0, 22.0 ],
                    "text": "refresh",
                    "textcolor": [ 1.0, 0.9882352941176471, 0.9882352941176471, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-47",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 118.2926857471466, 71.95122122764587, 32.0, 22.0 ],
                    "text": "26.9"
                }
            },
            {
                "box": {
                    "id": "obj-43",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 52.43902564048767, 77.0, 32.0, 22.0 ],
                    "text": "50.2"
                }
            },
            {
                "box": {
                    "id": "obj-41",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 52.43902564048767, 40.243903398513794, 58.0, 22.0 ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "id": "obj-40",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 192.68293142318726, 101.21951460838318, 91.0, 22.0 ],
                    "text": "prepend shuffle"
                }
            },
            {
                "box": {
                    "id": "obj-37",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 192.68293142318726, 71.95122122764587, 41.0, 22.0 ],
                    "text": "pak f f"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-72",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 118.2926857471466, 101.21951460838318, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-76",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 52.43902564048767, 108.75047898292542, 50.0, 22.0 ]
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
                    "patching_rect": [ 42.68292784690857, 692.6829433441162, 245.0, 20.0 ],
                    "text": "... .. .... . .. . .. . .. . .. . .. .. ..",
                    "textcolor": [ 0.9058823529411765, 0.8196078431372549, 0.8196078431372549, 1.0 ],
                    "varname": "input_keys[1]"
                }
            },
            {
                "box": {
                    "id": "obj-38",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "" ],
                    "patching_rect": [ 156.09756469726562, 731.7073345184326, 31.0, 22.0 ],
                    "text": "t b s"
                }
            },
            {
                "box": {
                    "id": "obj-32",
                    "maxclass": "ezdac~",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [ 142.68293023109436, 840.2439224720001, 45.0, 45.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-28",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 65.85366010665894, 807.3170924186707, 60.0, 22.0 ],
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
                    "patching_rect": [ 90.24390459060669, 775.6097745895386, 44.0, 22.0 ],
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
                    "patching_rect": [ 10.97561001777649, 847.5609958171844, 64.0, 22.0 ],
                    "text": "G#4"
                }
            },
            {
                "box": {
                    "id": "obj-84",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 71.95122122764587, 721.9512367248535, 51.0, 22.0 ],
                    "text": "zl.mth 0"
                }
            },
            {
                "box": {
                    "id": "obj-14",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 304.8780560493469, 678.0487966537476, 71.0, 22.0 ],
                    "text": "fromsymbol"
                }
            },
            {
                "box": {
                    "id": "obj-100",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "" ],
                    "patching_rect": [ 71.95122122764587, 748.780505657196, 37.0, 22.0 ],
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
                        "rect": [ 561.0, 137.0, 728.0, 730.0 ],
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
                                                    "order": 0,
                                                    "source": [ "obj-10", 0 ]
                                                }
                                            },
                                            {
                                                "patchline": {
                                                    "destination": [ "obj-7", 2 ],
                                                    "order": 1,
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
                    "patching_rect": [ 156.09756469726562, 792.682945728302, 84.0, 22.0 ],
                    "text": "p ZSampler01"
                }
            },
            {
                "box": {
                    "id": "obj-26",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "" ],
                    "patching_rect": [ 463.4146451950073, 268.2926893234253, 29.5, 22.0 ],
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
                    "patching_rect": [ 474.3902552127838, 301.21951937675476, 100.00000369548798, 22.0 ],
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
                    "patching_rect": [ 475.6097674369812, 328.0487883090973, 162.0, 22.0 ],
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
                    "patching_rect": [ 495.1219630241394, 182.92683362960815, 196.0, 22.0 ],
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
                    "patching_rect": [ 463.4146451950073, 541.4634275436401, 175.90362095832825, 22.0 ],
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
                    "patching_rect": [ 463.4146451950073, 443.9024496078491, 196.0, 22.0 ],
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
                    "patching_rect": [ 782.9268479347229, 610.9756243228912, 210.0, 22.0 ],
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
                    "patching_rect": [ 782.9268479347229, 691.4634311199188, 220.0, 22.0 ],
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
                                    "text": "28"
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
                                    "text": "123",
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
                                    "text": "keys 28 123 0 -11",
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
                    "patching_rect": [ 30.487805604934692, 163.41463804244995, 107.0, 22.0 ],
                    "text": "p KEY_HANDLER"
                }
            },
            {
                "box": {
                    "id": "obj-61",
                    "maxclass": "dict.view",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1125.6097829341888, 615.0, 94.0, 23.52437448501587 ],
                    "presentation": 1,
                    "presentation_rect": [ 1052.0, 881.0, 100.0, 100.0 ]
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
                    "patching_rect": [ 909.7561192512512, 659.7561132907867, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-60",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 5,
                    "outlettype": [ "dictionary", "", "", "", "" ],
                    "patching_rect": [ 941.4634370803833, 660.9756255149841, 61.0, 22.0 ],
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
                    "patching_rect": [ 981.7073404788971, 67.07317233085632, 187.0, 22.0 ],
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
                    "patching_rect": [ 463.4146451950073, 181.70732140541077, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-10",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 5,
                    "outlettype": [ "dictionary", "", "", "", "" ],
                    "patching_rect": [ 463.4146451950073, 215.85366368293762, 61.0, 22.0 ],
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
                    "patching_rect": [ 481.70732855796814, 471.95123076438904, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-29",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 5,
                    "outlettype": [ "dictionary", "", "", "", "" ],
                    "patching_rect": [ 463.4146451950073, 512.1951341629028, 61.0, 22.0 ],
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
                    "id": "obj-90",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "signal" ],
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
                        "rect": [ 243.0, 286.0, 632.0, 526.0 ],
                        "boxes": [
                            {
                                "box": {
                                    "id": "obj-10",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "" ],
                                    "patching_rect": [ 304.6154079437256, 115.79481315612793, 51.0, 22.0 ],
                                    "text": "zl.mth 2"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-8",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "" ],
                                    "patching_rect": [ 186.8653964996338, 115.79481315612793, 51.0, 22.0 ],
                                    "text": "zl.mth 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-1",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "bang", "float" ],
                                    "patching_rect": [ 226.0, 200.0, 29.5, 22.0 ],
                                    "text": "t b f"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-6",
                                    "maxclass": "button",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 432.6923143745116, 376.0, 24.0, 24.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-3",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 6,
                                    "outlettype": [ "signal", "bang", "int", "float", "", "" ],
                                    "patching_rect": [ 50.0, 64.0, 71.5, 22.0 ],
                                    "text": "typeroute~",
                                    "varname": "vz.patchroutr"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-21",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "bang", "bang" ],
                                    "patching_rect": [ 60.76923179626465, 115.79481315612793, 32.0, 22.0 ],
                                    "text": "t b b"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-23",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 397.6923408508301, 243.48713302612305, 44.0, 22.0 ],
                                    "text": "==~ -1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-26",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 397.6923408508301, 206.5640525817871, 42.0, 22.0 ],
                                    "text": "delta~"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-28",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 294.6154079437256, 237.3332862854004, 39.0, 22.0 ],
                                    "text": "click~"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-29",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 234.6154022216797, 237.3332862854004, 39.0, 22.0 ],
                                    "text": "click~"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-42",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 174.6153964996338, 237.3332862854004, 39.0, 22.0 ],
                                    "text": "click~"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-43",
                                    "maxclass": "live.scope~",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "patching_rect": [ 128.0, 400.0, 258.0, 63.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-62",
                                    "maxclass": "toggle",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "int" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 108.46154403686523, 153.0, 24.0, 24.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-63",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 108.46154403686523, 206.5640525817871, 32.0, 22.0 ],
                                    "text": "gate"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-67",
                                    "maxclass": "newobj",
                                    "numinlets": 4,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "bang" ],
                                    "patching_rect": [ 294.6154079437256, 289.64098358154297, 50.5, 22.0 ],
                                    "text": "ramp~"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-68",
                                    "maxclass": "newobj",
                                    "numinlets": 4,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "bang" ],
                                    "patching_rect": [ 234.6154022216797, 289.64098358154297, 50.5, 22.0 ],
                                    "text": "ramp~"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-69",
                                    "maxclass": "newobj",
                                    "numinlets": 4,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "bang" ],
                                    "patching_rect": [ 174.6153964996338, 289.64098358154297, 50.5, 22.0 ],
                                    "text": "ramp~"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-70",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 214.61540031433105, 341.94868087768555, 34.0, 22.0 ],
                                    "text": "*~ 1."
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-72",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 305.0, 147.79481315612793, 67.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "format": 6,
                                    "id": "obj-76",
                                    "maxclass": "flonum",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "bang" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 187.0, 147.79481315612793, 67.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-81",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 108.46154403686523, 237.3332862854004, 39.0, 22.0 ],
                                    "text": "click~"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-84",
                                    "maxclass": "newobj",
                                    "numinlets": 4,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "bang" ],
                                    "patching_rect": [ 108.46154403686523, 289.64098358154297, 50.5, 22.0 ],
                                    "text": "ramp~"
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-87",
                                    "index": 1,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "patching_rect": [ 50.0, 13.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-88",
                                    "index": 2,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 475.0, 436.99999198974615, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-89",
                                    "index": 1,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 432.6923143745116, 436.9999919897461, 30.0, 30.0 ]
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "obj-72", 0 ],
                                    "source": [ "obj-10", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-62", 0 ],
                                    "source": [ "obj-21", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-63", 1 ],
                                    "source": [ "obj-21", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-23", 0 ],
                                    "order": 1,
                                    "source": [ "obj-26", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-88", 0 ],
                                    "order": 0,
                                    "source": [ "obj-26", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-67", 0 ],
                                    "source": [ "obj-28", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-68", 0 ],
                                    "source": [ "obj-29", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-10", 0 ],
                                    "midpoints": [ 112.0, 97.0, 314.1154079437256, 97.0 ],
                                    "order": 0,
                                    "source": [ "obj-3", 5 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-21", 0 ],
                                    "source": [ "obj-3", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-8", 0 ],
                                    "midpoints": [ 112.0, 97.0, 196.3653964996338, 97.0 ],
                                    "order": 1,
                                    "source": [ "obj-3", 5 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-69", 0 ],
                                    "source": [ "obj-42", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-89", 0 ],
                                    "source": [ "obj-6", 0 ]
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
                                    "destination": [ "obj-81", 0 ],
                                    "source": [ "obj-63", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-6", 0 ],
                                    "order": 0,
                                    "source": [ "obj-67", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-63", 1 ],
                                    "midpoints": [ 335.6154079437256, 314.99999713897705, 355.6795344352722, 314.99999713897705, 355.6795344352722, 192.99999713897705, 130.96154403686523, 192.99999713897705 ],
                                    "order": 1,
                                    "source": [ "obj-67", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-70", 0 ],
                                    "source": [ "obj-67", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-28", 0 ],
                                    "order": 1,
                                    "source": [ "obj-68", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-6", 0 ],
                                    "order": 0,
                                    "source": [ "obj-68", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-70", 0 ],
                                    "source": [ "obj-68", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-29", 0 ],
                                    "order": 1,
                                    "source": [ "obj-69", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-6", 0 ],
                                    "order": 0,
                                    "source": [ "obj-69", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-70", 0 ],
                                    "source": [ "obj-69", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-26", 0 ],
                                    "midpoints": [ 224.11540031433105, 375.00000381469727, 382.92953991889954, 375.00000381469727, 382.92953991889954, 201.00000381469727, 407.1923408508301, 201.00000381469727 ],
                                    "order": 0,
                                    "source": [ "obj-70", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-43", 0 ],
                                    "midpoints": [ 224.11540031433105, 387.0, 137.5, 387.0 ],
                                    "order": 1,
                                    "source": [ "obj-70", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-67", 1 ],
                                    "order": 0,
                                    "source": [ "obj-72", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-68", 1 ],
                                    "order": 1,
                                    "source": [ "obj-72", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-1", 0 ],
                                    "order": 0,
                                    "source": [ "obj-76", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-69", 1 ],
                                    "order": 1,
                                    "source": [ "obj-76", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-84", 1 ],
                                    "order": 2,
                                    "source": [ "obj-76", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-76", 0 ],
                                    "source": [ "obj-8", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-84", 0 ],
                                    "source": [ "obj-81", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-42", 0 ],
                                    "order": 1,
                                    "source": [ "obj-84", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-6", 0 ],
                                    "order": 0,
                                    "source": [ "obj-84", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-70", 0 ],
                                    "source": [ "obj-84", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-3", 0 ],
                                    "source": [ "obj-87", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 348.7804961204529, 81.70731902122498, 77.0, 22.0 ],
                    "text": "p RampTime",
                    "varname": "RampTime @LT 118 @HT 99"
                }
            },
            {
                "box": {
                    "id": "obj-25",
                    "maxclass": "live.scope~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 500.00001192092896, 35.36585450172424, 163.0769386291504, 95.38462448120117 ]
                }
            },
            {
                "box": {
                    "id": "obj-79",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 348.7804961204529, 24.390244483947754, 44.578314900398254, 44.578314900398254 ]
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
                    "patching_rect": [ 46.34146451950073, 207.3170781135559, 142.0, 22.0 ],
                    "text": "command export_pattern"
                }
            },
            {
                "box": {
                    "id": "obj-4",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 769.5122134685516, 114.63414907455444, 29.5, 22.0 ],
                    "text": "0"
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
                    "patching_rect": [ 348.7804961204529, 113.41463685035706, 24.0, 24.0 ]
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
                        "rect": [ 0.0, 0.0, 1000.0, 729.6 ],
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
                    "patching_rect": [ 1209.7561264038086, 173.17073583602905, 94.0, 22.0 ],
                    "text": "p bufferSampler"
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
                                    "text": "56"
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
                    "patching_rect": [ 156.09756469726562, 762.1951401233673, 64.0, 22.0 ],
                    "text": "p NoteInfo"
                }
            },
            {
                "box": {
                    "id": "obj-74",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "" ],
                    "patching_rect": [ 1050.0000250339508, 173.17073583602905, 29.5, 22.0 ],
                    "text": "t b l"
                }
            },
            {
                "box": {
                    "id": "obj-73",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "" ],
                    "patching_rect": [ 829.2683124542236, 173.17073583602905, 48.0, 22.0 ],
                    "text": "t b l"
                }
            },
            {
                "box": {
                    "id": "obj-71",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "" ],
                    "patching_rect": [ 923.1707537174225, 173.17073583602905, 29.5, 22.0 ],
                    "text": "t b l"
                }
            },
            {
                "box": {
                    "id": "obj-66",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1050.0000250339508, 115.85366129875183, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-64",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1050.0000250339508, 146.34146690368652, 105.0, 22.0 ],
                    "text": "prepend loop_end"
                }
            },
            {
                "box": {
                    "id": "obj-65",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1050.0000250339508, 207.3170781135559, 105.0, 22.0 ],
                    "text": "loop_end 161"
                }
            },
            {
                "box": {
                    "id": "obj-56",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 923.1707537174225, 146.34146690368652, 109.0, 22.0 ],
                    "text": "prepend loop_start"
                }
            },
            {
                "box": {
                    "id": "obj-57",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 923.1707537174225, 207.3170781135559, 109.0, 22.0 ],
                    "text": "loop_start 230"
                }
            },
            {
                "box": {
                    "id": "obj-54",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 829.2683124542236, 115.85366129875183, 20.0, 20.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-50",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 829.2683124542236, 146.34146690368652, 79.0, 22.0 ],
                    "text": "prepend loop"
                }
            },
            {
                "box": {
                    "id": "obj-35",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 829.2683124542236, 207.3170781135559, 48.0, 22.0 ],
                    "text": "loop 1"
                }
            },
            {
                "box": {
                    "id": "obj-31",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 923.1707537174225, 114.63414907455444, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-24",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 678.0487966537476, 259.7561037540436, 50.0, 22.0 ],
                    "text": "25"
                }
            },
            {
                "box": {
                    "id": "obj-17",
                    "maxclass": "newobj",
                    "numinlets": 5,
                    "numoutlets": 4,
                    "outlettype": [ "int", "", "", "int" ],
                    "patching_rect": [ 729.2683100700378, 169.5121991634369, 72.0, 22.0 ],
                    "text": "counter 256"
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
                    "patching_rect": [ 739.024407863617, 259.7561037540436, 541.0, 345.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-9",
                    "maxclass": "newobj",
                    "numinlets": 5,
                    "numoutlets": 4,
                    "outlettype": [ "int", "", "", "int" ],
                    "patching_rect": [ 348.7804961204529, 169.5121991634369, 65.0, 22.0 ],
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
                    "patching_rect": [ -0.5121943950653076, 668.6829433441162, 50.0, 22.0 ],
                    "text": "19"
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
                    "patching_rect": [ 442.68293738365173, 393.9024484157562, 35.0, 22.0 ],
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
                    "patching_rect": [ 23.170732259750366, 251.21951818466187, 407.35293340682983, 412.4999921321869 ]
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-14", 0 ],
                    "midpoints": [ 226.84719896316528, 679.4013954401016, 314.3780560493469, 679.4013954401016 ],
                    "source": [ "obj-1", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-29", 0 ],
                    "midpoints": [ 421.0236656665802, 675.8351306915283, 451.5677328109741, 675.8351306915283, 451.5677328109741, 492.1483829021454, 472.9146451950073, 492.1483829021454 ],
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
                    "midpoints": [ 472.9146451950073, 246.83513069152832, 421.0236656665802, 246.83513069152832 ],
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
                    "destination": [ "obj-21", 0 ],
                    "source": [ "obj-100", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-55", 2 ],
                    "source": [ "obj-109", 0 ]
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
                    "destination": [ "obj-15", 0 ],
                    "source": [ "obj-12", 0 ]
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
                    "order": 0,
                    "source": [ "obj-14", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-12", 0 ],
                    "order": 1,
                    "source": [ "obj-14", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-8", 1 ],
                    "order": 2,
                    "source": [ "obj-14", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-84", 0 ],
                    "midpoints": [ 314.3780560493469, 718.8592236042023, 81.45122122764587, 718.8592236042023 ],
                    "order": 3,
                    "source": [ "obj-14", 0 ]
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
                    "destination": [ "obj-2", 0 ],
                    "order": 0,
                    "source": [ "obj-17", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-24", 1 ],
                    "order": 1,
                    "source": [ "obj-17", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-60", 0 ],
                    "midpoints": [ 1270.524407863617, 642.7387442588806, 950.9634370803833, 642.7387442588806 ],
                    "order": 1,
                    "source": [ "obj-2", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-61", 0 ],
                    "midpoints": [ 1270.524407863617, 643.1363327503204, 1135.1097829341888, 643.1363327503204 ],
                    "order": 0,
                    "source": [ "obj-2", 1 ]
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
                    "color": [ 0.058823529411764705, 0.6470588235294118, 0.984313725490196, 1.0 ],
                    "destination": [ "obj-1", 2 ],
                    "midpoints": [ 83.98780560493469, 199.280912399292, 291.5726878643036, 199.280912399292 ],
                    "source": [ "obj-22", 1 ]
                }
            },
            {
                "patchline": {
                    "color": [ 0.058823529411764705, 0.6470588235294118, 0.984313725490196, 1.0 ],
                    "destination": [ "obj-1", 0 ],
                    "midpoints": [ 39.98780560493469, 202.10018968582153, 32.670732259750366, 202.10018968582153 ],
                    "source": [ "obj-22", 0 ]
                }
            },
            {
                "patchline": {
                    "color": [ 0.058823529411764705, 0.6470588235294118, 0.984313725490196, 1.0 ],
                    "destination": [ "obj-79", 0 ],
                    "midpoints": [ 127.98780560493469, 193.38934898376465, 332.88090789318085, 193.38934898376465, 332.88090789318085, 18.509828329086304, 358.2804961204529, 18.509828329086304 ],
                    "source": [ "obj-22", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-32", 1 ],
                    "order": 0,
                    "source": [ "obj-23", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-32", 0 ],
                    "order": 1,
                    "source": [ "obj-23", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20", 1 ],
                    "midpoints": [ 483.4146451950073, 294.8110340833664, 564.8902589082718, 294.8110340833664 ],
                    "source": [ "obj-26", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-48", 0 ],
                    "midpoints": [ 472.9146451950073, 296.0158534049988, 452.18293738365173, 296.0158534049988 ],
                    "source": [ "obj-26", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-18", 1 ],
                    "midpoints": [ 116.35366010665894, 843.0, 65.47561001777649, 843.0 ],
                    "order": 1,
                    "source": [ "obj-28", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-38", 0 ],
                    "midpoints": [ 116.35366010665894, 829.4013954401016, 141.38701009750366, 829.4013954401016, 141.38701009750366, 727.4013954401016, 165.59756469726562, 727.4013954401016 ],
                    "order": 0,
                    "source": [ "obj-28", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-7", 1 ],
                    "source": [ "obj-29", 4 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "midpoints": [ 452.18293738365173, 418.4013954401016, 438.38701009750366, 418.4013954401016, 438.38701009750366, 241.40139544010162, 32.670732259750366, 241.40139544010162 ],
                    "source": [ "obj-3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-56", 0 ],
                    "source": [ "obj-31", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-42", 0 ],
                    "source": [ "obj-34", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-2", 0 ],
                    "midpoints": [ 838.7683124542236, 245.40139544010162, 748.524407863617, 245.40139544010162 ],
                    "source": [ "obj-35", 0 ]
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
                    "destination": [ "obj-29", 0 ],
                    "source": [ "obj-39", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-17", 3 ],
                    "order": 0,
                    "source": [ "obj-4", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9", 3 ],
                    "midpoints": [ 779.0122134685516, 155.40139544010162, 392.7804961204529, 155.40139544010162 ],
                    "order": 1,
                    "source": [ "obj-4", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-90", 0 ],
                    "midpoints": [ 202.18293142318726, 132.19657611846924, 301.4472497701645, 132.19657611846924, 301.4472497701645, 76.40139544010162, 358.2804961204529, 76.40139544010162 ],
                    "source": [ "obj-40", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-43", 0 ],
                    "order": 1,
                    "source": [ "obj-41", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-47", 0 ],
                    "order": 0,
                    "source": [ "obj-41", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-78", 1 ],
                    "source": [ "obj-42", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-78", 0 ],
                    "source": [ "obj-42", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-76", 0 ],
                    "source": [ "obj-43", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "midpoints": [ 358.2804961204529, 238.62845718860626, 32.670732259750366, 238.62845718860626 ],
                    "order": 2,
                    "source": [ "obj-46", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-17", 0 ],
                    "midpoints": [ 358.2804961204529, 164.40139544010162, 738.7683100700378, 164.40139544010162 ],
                    "order": 0,
                    "source": [ "obj-46", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9", 0 ],
                    "midpoints": [ 358.2804961204529, 149.40139544010162, 358.2804961204529, 149.40139544010162 ],
                    "order": 1,
                    "source": [ "obj-46", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-72", 0 ],
                    "source": [ "obj-47", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "midpoints": [ 452.18293738365173, 385.4013954401016, 440.79664874076843, 385.4013954401016, 440.79664874076843, 238.99175679683685, 32.670732259750366, 238.99175679683685 ],
                    "source": [ "obj-48", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-73", 0 ],
                    "source": [ "obj-50", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-60", 1 ],
                    "midpoints": [ 792.4268479347229, 651.2206727266312, 992.9634370803833, 651.2206727266312 ],
                    "source": [ "obj-52", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-50", 0 ],
                    "source": [ "obj-54", 0 ]
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
                    "destination": [ "obj-71", 0 ],
                    "source": [ "obj-56", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-2", 0 ],
                    "midpoints": [ 932.6707537174225, 245.40139544010162, 748.524407863617, 245.40139544010162 ],
                    "source": [ "obj-57", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-2", 0 ],
                    "midpoints": [ 991.2073404788971, 101.40139544010162, 812.3869366645813, 101.40139544010162, 812.3869366645813, 245.40139544010162, 748.524407863617, 245.40139544010162 ],
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
                    "source": [ "obj-6", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-51", 1 ],
                    "midpoints": [ 992.9634370803833, 681.7387442588806, 993.4268479347229, 681.7387442588806 ],
                    "source": [ "obj-60", 4 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-74", 0 ],
                    "source": [ "obj-64", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-2", 0 ],
                    "midpoints": [ 1059.5000250339508, 245.40139544010162, 748.524407863617, 245.40139544010162 ],
                    "source": [ "obj-65", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-64", 0 ],
                    "source": [ "obj-66", 0 ]
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
                    "destination": [ "obj-57", 1 ],
                    "source": [ "obj-71", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-57", 0 ],
                    "source": [ "obj-71", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-37", 1 ],
                    "midpoints": [ 127.7926857471466, 133.40139544010162, 183.38701009750366, 133.40139544010162, 183.38701009750366, 55.3772988319397, 224.18293142318726, 55.3772988319397 ],
                    "source": [ "obj-72", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-35", 1 ],
                    "source": [ "obj-73", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-35", 0 ],
                    "source": [ "obj-73", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-65", 1 ],
                    "source": [ "obj-74", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-65", 0 ],
                    "source": [ "obj-74", 0 ]
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
                    "destination": [ "obj-37", 0 ],
                    "midpoints": [ 61.93902564048767, 133.40139544010162, 183.38701009750366, 133.40139544010162, 183.38701009750366, 66.17247951030731, 202.18293142318726, 66.17247951030731 ],
                    "source": [ "obj-76", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-90", 0 ],
                    "source": [ "obj-79", 0 ]
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
                    "destination": [ "obj-34", 0 ],
                    "source": [ "obj-81", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-23", 2 ],
                    "source": [ "obj-83", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-100", 0 ],
                    "source": [ "obj-84", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 1 ],
                    "midpoints": [ 358.2804961204529, 229.23271918296814, 162.12171006202698, 229.23271918296814 ],
                    "source": [ "obj-9", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-25", 0 ],
                    "source": [ "obj-90", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-46", 0 ],
                    "midpoints": [ 358.2804961204529, 108.51263892650604, 358.2804961204529, 108.51263892650604 ],
                    "source": [ "obj-90", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "midpoints": [ 55.84146451950073, 234.0093675851822, 32.670732259750366, 234.0093675851822 ],
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
            "obj-23::obj-40": [ "slider", "slider", 0 ],
            "obj-34::obj-13": [ "View[3]", "View", 0 ],
            "obj-34::obj-154": [ "Abl.AutoFilter[1]", "Abl.AutoFilter", 0 ],
            "obj-34::obj-167": [ "ModOutB[4]", "ModOutB", -1 ],
            "obj-34::obj-45": [ "ModInALed[4]", "ModInALed", 0 ],
            "obj-34::obj-47": [ "ModInBLed[4]", "ModInBLed", 0 ],
            "obj-34::obj-49": [ "ModInA[4]", "ModInA", -1 ],
            "obj-34::obj-50": [ "ModInB[4]", "ModInB", -1 ],
            "obj-34::obj-52": [ "ModOutA[4]", "ModOutA", -1 ],
            "obj-34::obj-59": [ "ModOutALed[4]", "ModOutALed", 0 ],
            "obj-34::obj-60": [ "ModOutBLed[4]", "ModOutBLed", 0 ],
            "obj-34::obj-83::obj-116": [ "Type[1]", "Type", 0 ],
            "obj-34::obj-83::obj-124": [ "Gain[2]", "Gain", 0 ],
            "obj-34::obj-83::obj-190": [ "Drive[1]", "Drive", 0 ],
            "obj-34::obj-83::obj-195": [ "Softclip[1]", "Softclip", 0 ],
            "obj-34::obj-83::obj-196": [ "Mix[4]", "Mix", 0 ],
            "obj-34::obj-83::obj-204": [ "Oversample[1]", "Oversample", 0 ],
            "obj-34::obj-83::obj-210": [ "Env[1]", "Env", 0 ],
            "obj-34::obj-83::obj-214": [ "Att[1]", "Att", 0 ],
            "obj-34::obj-83::obj-216": [ "Rel[1]", "Rel", 0 ],
            "obj-34::obj-83::obj-218": [ "Hold[1]", "Hold", 0 ],
            "obj-34::obj-83::obj-34": [ "Freq[1]", "Freq", 0 ],
            "obj-34::obj-83::obj-54": [ "Circuit[1]", "Circuit", 0 ],
            "obj-34::obj-83::obj-65": [ "Pitch[1]", "Pitch", 0 ],
            "obj-34::obj-83::obj-78": [ "Morph[1]", "Morph", 0 ],
            "obj-34::obj-83::obj-81": [ "Slope[1]", "Slope", 0 ],
            "obj-34::obj-83::obj-82": [ "MorphSlope[1]", "Slope", 0 ],
            "obj-34::obj-83::obj-83": [ "Ctrl[1]", "Ctrl", 0 ],
            "obj-34::obj-83::obj-86": [ "Res[1]", "Res", 0 ],
            "obj-34::obj-83::obj-87": [ "Form[1]", "Form", 0 ],
            "obj-34::obj-90::obj-250": [ "LFOAmount[1]", "LFO", 0 ],
            "obj-34::obj-90::obj-254": [ "LFORate[1]", "Rate", 0 ],
            "obj-34::obj-90::obj-255": [ "LFOWave[1]", "Wave", 0 ],
            "obj-34::obj-90::obj-259": [ "LFOMorph[1]", "Morph", 0 ],
            "obj-34::obj-90::obj-263": [ "LFOPhase[2]", "Phase", 0 ],
            "obj-34::obj-90::obj-269": [ "LFOOffset[1]", "Offset", 0 ],
            "obj-34::obj-90::obj-273": [ "LFOSmooth[1]", "Smooth", 0 ],
            "obj-34::obj-90::obj-280": [ "LFOQuantize[1]", "Quantize", 0 ],
            "obj-34::obj-90::obj-292": [ "LFOSteps[1]", "Steps", 0 ],
            "obj-34::obj-90::obj-3": [ "LFOMode[1]", "Mode", 0 ],
            "obj-34::obj-90::obj-55": [ "LFOSpin[2]", "Spin", 0 ],
            "obj-34::obj-92::obj-309": [ "SCIntern[1]", "Intern", 0 ],
            "obj-34::obj-92::obj-310": [ "SCExternal[1]", "External", 0 ],
            "obj-34::obj-92::obj-311": [ "SCMono[1]", "Mono", 0 ],
            "obj-34::obj-92::obj-318": [ "SCSolo[1]", "Solo", 0 ],
            "obj-34::obj-92::obj-323": [ "SCExtern[1]", "Extern", 0 ],
            "obj-34::obj-92::obj-325": [ "SCFreq[1]", "Freq", 0 ],
            "obj-34::obj-92::obj-327": [ "SCEQ[1]", "EQ", 0 ],
            "obj-34::obj-92::obj-329": [ "SCRes[1]", "Res", 0 ],
            "obj-34::obj-92::obj-330": [ "SCType[1]", "Type", 0 ],
            "obj-34::obj-99": [ "Active[4]", "Active", 0 ],
            "obj-36::obj-13": [ "View", "View", 0 ],
            "obj-36::obj-154": [ "Abl.Flanger", "Abl.Flanger", 0 ],
            "obj-36::obj-167": [ "ModOutB", "ModOutB", -1 ],
            "obj-36::obj-45": [ "ModInALed", "ModInALed", 0 ],
            "obj-36::obj-47": [ "ModInBLed", "ModInBLed", 0 ],
            "obj-36::obj-49": [ "ModInA", "ModInA", -1 ],
            "obj-36::obj-50": [ "ModInB", "ModInB", -1 ],
            "obj-36::obj-52": [ "ModOutA", "ModOutA", -1 ],
            "obj-36::obj-59": [ "ModOutALed", "ModOutALed", 0 ],
            "obj-36::obj-60": [ "ModOutBLed", "ModOutBLed", 0 ],
            "obj-36::obj-83::obj-19": [ "Time", "Time", 0 ],
            "obj-36::obj-83::obj-6": [ "Warmth", "Warm", 0 ],
            "obj-36::obj-83::obj-8": [ "BassFreq", "BassF", 0 ],
            "obj-36::obj-83::obj-9": [ "Mix", "Mix", 0 ],
            "obj-36::obj-90::obj-112": [ "LFOInvert", "Invert", 0 ],
            "obj-36::obj-90::obj-116": [ "LFOWaveform", "Wave", 0 ],
            "obj-36::obj-90::obj-17": [ "LFODuty", "Duty", 0 ],
            "obj-36::obj-90::obj-3": [ "LFOPhaseMode", "Mode", 0 ],
            "obj-36::obj-90::obj-39": [ "LFOWaveDisplay", "Display", 0 ],
            "obj-36::obj-90::obj-51": [ "LFOPhase", "Phase", 0 ],
            "obj-36::obj-90::obj-53": [ "LFO2Freq", "Freq2", 0 ],
            "obj-36::obj-90::obj-54": [ "LFO2", "LFO2", 0 ],
            "obj-36::obj-90::obj-55": [ "LFOSpin", "Spin", 0 ],
            "obj-36::obj-90::obj-6": [ "LFOFreq", "Freq", 0 ],
            "obj-36::obj-90::obj-8": [ "LFOMod", "Mod", 0 ],
            "obj-36::obj-90::obj-9": [ "LFOFeedback", "Feed", 0 ],
            "obj-36::obj-92::obj-112": [ "EnvOnOff", "OnOff", 0 ],
            "obj-36::obj-92::obj-6": [ "EnvAmount", "Amount", 0 ],
            "obj-36::obj-92::obj-8": [ "EnvAttack", "Attack", 0 ],
            "obj-36::obj-92::obj-9": [ "EnvRelease", "Release", 0 ],
            "obj-36::obj-99": [ "Active", "Active", 0 ],
            "obj-55::obj-40": [ "slider[1]", "slider", 0 ],
            "obj-81::obj-112": [ "Invert", "Invert", 0 ],
            "obj-81::obj-154": [ "Abl.Chorus", "Abl.Chorus", 0 ],
            "obj-81::obj-167": [ "ModOutB[1]", "ModOutB", -1 ],
            "obj-81::obj-4": [ "Mix[1]", "Mix", 0 ],
            "obj-81::obj-45": [ "ModInALed[1]", "ModInALed", 0 ],
            "obj-81::obj-47": [ "ModInBLed[1]", "ModInBLed", 0 ],
            "obj-81::obj-49": [ "ModInA[1]", "ModInA", -1 ],
            "obj-81::obj-50": [ "ModInB[1]", "ModInB", -1 ],
            "obj-81::obj-52": [ "ModOutA[1]", "ModOutA", -1 ],
            "obj-81::obj-59": [ "ModOutALed[1]", "ModOutALed", 0 ],
            "obj-81::obj-6": [ "Rate", "Rate", 0 ],
            "obj-81::obj-60": [ "ModOutBLed[1]", "ModOutBLed", 0 ],
            "obj-81::obj-8": [ "Feed", "Feed", 0 ],
            "obj-81::obj-81": [ "Mod", "Mod", 0 ],
            "obj-81::obj-82": [ "Gain", "Gain", 0 ],
            "obj-81::obj-9": [ "Width", "Width", 0 ],
            "obj-81::obj-99": [ "Active[1]", "Active", 0 ],
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
                "obj-34::obj-154": {
                    "parameter_longname": "Abl.AutoFilter[1]"
                },
                "obj-34::obj-45": {
                    "parameter_longname": "ModInALed[4]"
                },
                "obj-34::obj-47": {
                    "parameter_longname": "ModInBLed[4]"
                },
                "obj-34::obj-59": {
                    "parameter_longname": "ModOutALed[4]"
                },
                "obj-34::obj-60": {
                    "parameter_longname": "ModOutBLed[4]"
                },
                "obj-34::obj-83::obj-116": {
                    "parameter_longname": "Type[1]"
                },
                "obj-34::obj-83::obj-124": {
                    "parameter_longname": "Gain[2]"
                },
                "obj-34::obj-83::obj-190": {
                    "parameter_longname": "Drive[1]"
                },
                "obj-34::obj-83::obj-195": {
                    "parameter_longname": "Softclip[1]"
                },
                "obj-34::obj-83::obj-196": {
                    "parameter_longname": "Mix[4]"
                },
                "obj-34::obj-83::obj-204": {
                    "parameter_longname": "Oversample[1]"
                },
                "obj-34::obj-83::obj-210": {
                    "parameter_longname": "Env[1]"
                },
                "obj-34::obj-83::obj-214": {
                    "parameter_longname": "Att[1]"
                },
                "obj-34::obj-83::obj-216": {
                    "parameter_longname": "Rel[1]"
                },
                "obj-34::obj-83::obj-218": {
                    "parameter_longname": "Hold[1]"
                },
                "obj-34::obj-83::obj-34": {
                    "parameter_longname": "Freq[1]"
                },
                "obj-34::obj-83::obj-54": {
                    "parameter_longname": "Circuit[1]"
                },
                "obj-34::obj-83::obj-65": {
                    "parameter_longname": "Pitch[1]"
                },
                "obj-34::obj-83::obj-78": {
                    "parameter_longname": "Morph[1]"
                },
                "obj-34::obj-83::obj-81": {
                    "parameter_longname": "Slope[1]"
                },
                "obj-34::obj-83::obj-82": {
                    "parameter_longname": "MorphSlope[1]"
                },
                "obj-34::obj-83::obj-83": {
                    "parameter_longname": "Ctrl[1]"
                },
                "obj-34::obj-83::obj-86": {
                    "parameter_longname": "Res[1]"
                },
                "obj-34::obj-83::obj-87": {
                    "parameter_longname": "Form[1]"
                },
                "obj-34::obj-90::obj-250": {
                    "parameter_longname": "LFOAmount[1]"
                },
                "obj-34::obj-90::obj-254": {
                    "parameter_longname": "LFORate[1]"
                },
                "obj-34::obj-90::obj-255": {
                    "parameter_longname": "LFOWave[1]"
                },
                "obj-34::obj-90::obj-259": {
                    "parameter_longname": "LFOMorph[1]"
                },
                "obj-34::obj-90::obj-263": {
                    "parameter_longname": "LFOPhase[2]"
                },
                "obj-34::obj-90::obj-269": {
                    "parameter_longname": "LFOOffset[1]"
                },
                "obj-34::obj-90::obj-273": {
                    "parameter_longname": "LFOSmooth[1]"
                },
                "obj-34::obj-90::obj-280": {
                    "parameter_longname": "LFOQuantize[1]"
                },
                "obj-34::obj-90::obj-292": {
                    "parameter_longname": "LFOSteps[1]"
                },
                "obj-34::obj-90::obj-3": {
                    "parameter_longname": "LFOMode[1]"
                },
                "obj-34::obj-90::obj-55": {
                    "parameter_longname": "LFOSpin[2]"
                },
                "obj-34::obj-92::obj-309": {
                    "parameter_longname": "SCIntern[1]"
                },
                "obj-34::obj-92::obj-310": {
                    "parameter_longname": "SCExternal[1]"
                },
                "obj-34::obj-92::obj-311": {
                    "parameter_longname": "SCMono[1]"
                },
                "obj-34::obj-92::obj-318": {
                    "parameter_longname": "SCSolo[1]"
                },
                "obj-34::obj-92::obj-323": {
                    "parameter_longname": "SCExtern[1]"
                },
                "obj-34::obj-92::obj-325": {
                    "parameter_longname": "SCFreq[1]"
                },
                "obj-34::obj-92::obj-327": {
                    "parameter_longname": "SCEQ[1]"
                },
                "obj-34::obj-92::obj-329": {
                    "parameter_longname": "SCRes[1]"
                },
                "obj-34::obj-92::obj-330": {
                    "parameter_longname": "SCType[1]"
                },
                "obj-34::obj-99": {
                    "parameter_longname": "Active[4]"
                },
                "obj-81::obj-4": {
                    "parameter_longname": "Mix[1]"
                },
                "obj-81::obj-45": {
                    "parameter_longname": "ModInALed[1]"
                },
                "obj-81::obj-47": {
                    "parameter_longname": "ModInBLed[1]"
                },
                "obj-81::obj-59": {
                    "parameter_longname": "ModOutALed[1]"
                },
                "obj-81::obj-60": {
                    "parameter_longname": "ModOutBLed[1]"
                },
                "obj-81::obj-99": {
                    "parameter_longname": "Active[1]"
                }
            },
            "inherited_shortname": 1
        },
        "autosave": 0
    }
}