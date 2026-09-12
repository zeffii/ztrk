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
        "rect": [ 458.0, 85.0, 1703.0, 1052.0 ],
        "boxes": [
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
                    "patching_rect": [ 760.0, 597.0, 423.0546875, 16.0 ],
                    "textfile": {
                        "filename": "ztrk_parameter_at_cursor.js",
                        "flags": 0,
                        "embed": 0,
                        "autowatch": 1
                    }
                }
            },
            {
                "box": {
                    "id": "obj-24",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 779.0, 823.0, 64.0, 22.0 ],
                    "text": "toggle info"
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
                        "rect": [ 182.0, 493.0, 1617.0, 703.0 ],
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
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
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
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
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
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
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
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
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
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
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
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
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
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
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
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
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
                                    "patching_rect": [ 14.159293174743652, 415.0442811846733, 103.0, 22.0 ],
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
                    "patching_rect": [ 1128.0, 671.0, 63.0, 22.0 ],
                    "text": "p HihatXP",
                    "varname": "hihatXP"
                }
            },
            {
                "box": {
                    "id": "obj-58",
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
                        "rect": [ 84.0, 132.0, 1000.0, 915.0 ],
                        "boxes": [
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
                                    "outlettype": [ "" ],
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
                                    "patching_rect": [ 132.0, 77.0, 813.0, 641.0 ]
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
                            }
                        ]
                    },
                    "patching_rect": [ 1408.0, 831.0, 80.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1357.0, 924.0, 100.0, 22.0 ],
                    "text": "p TorqReverb"
                }
            },
            {
                "box": {
                    "id": "obj-63",
                    "lastchannelcount": 0,
                    "maxclass": "live.gain~",
                    "numinlets": 2,
                    "numoutlets": 5,
                    "outlettype": [ "signal", "signal", "", "float", "list" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 1135.3170733451843, 706.3658545017242, 48.0, 136.0 ],
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
                    "id": "obj-64",
                    "maxclass": "ezdac~",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [ 1140.1951222419739, 862.4634191989899, 36.0, 36.0 ]
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
                    "patching_rect": [ 1041.0, 707.0, 48.0, 136.0 ],
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
                    "patching_rect": [ 1047.0, 861.0, 36.0, 36.0 ]
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
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
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
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
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
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
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
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
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
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
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
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
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
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
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
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
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
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
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
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
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
                                    "text": "t3_buf"
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
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
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
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
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
                    "patching_rect": [ 1025.0, 671.0, 80.0, 22.0 ],
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
                        "rect": [ 139.0, 563.0, 2263.0, 761.0 ],
                        "boxes": [
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
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
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
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
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
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
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
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
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
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
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
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
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
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
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
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
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
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
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
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
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
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
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
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
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
                            }
                        ]
                    },
                    "patching_rect": [ 937.0, 671.0, 71.0, 22.0 ],
                    "text": "p KickXP__",
                    "varname": "kickxp"
                }
            },
            {
                "box": {
                    "id": "obj-126",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1300.0, 19.0, 77.0, 22.0 ],
                    "text": "loadmess 64"
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
                    "patching_rect": [ 1383.5, 19.0, 50.0, 22.0 ]
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
                    "patching_rect": [ 937.0, 709.0, 48.0, 136.0 ],
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
                    "patching_rect": [ 943.0, 861.0, 36.0, 36.0 ]
                }
            },
            {
                "box": {
                    "border": 0,
                    "filename": "ztrk_restore_loadmess.js",
                    "hint": "This will trigger all loadmesses nested or otherwise in this patch",
                    "id": "obj-21",
                    "maxclass": "v8ui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 549.0, 14.0, 120.0, 16.0 ],
                    "textfile": {
                        "filename": "ztrk_restore_loadmess.js",
                        "flags": 0,
                        "embed": 0,
                        "autowatch": 1
                    }
                }
            },
            {
                "box": {
                    "id": "obj-88",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 917.0, 19.0, 87.0, 22.0 ],
                    "text": "loadmess 3.97"
                }
            },
            {
                "box": {
                    "id": "obj-87",
                    "maxclass": "newobj",
                    "numinlets": 4,
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
                        "rect": [ 1831.0, 389.0, 569.0, 780.0 ],
                        "boxes": [
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-12",
                                    "index": 4,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 305.0, 6.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-11",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 257.0, 168.0, 50.0, 22.0 ],
                                    "text": "rate~ 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-10",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 120.0, 236.0, 43.0, 22.0 ],
                                    "text": ">=~ 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-9",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 310.0, 502.0, 44.0, 22.0 ],
                                    "text": "delay~"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-8",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 142.0, 523.0, 23.0, 22.0 ],
                                    "text": "sw"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-7",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "patching_rect": [ 120.0, 175.0, 22.0, 22.0 ],
                                    "text": "t b"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-5",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 120.0, 208.0, 39.0, 22.0 ],
                                    "text": "click~"
                                }
                            },
                            {
                                "box": {
                                    "comment": "trigger event",
                                    "id": "obj-1",
                                    "index": 2,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 90.0, 447.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-71",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 16.0, 400.0, 50.0, 22.0 ],
                                    "text": "%~ 384"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-70",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 16.0, 307.0, 43.0, 22.0 ],
                                    "text": "+=~ 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-66",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "int" ],
                                    "patching_rect": [ 16.0, 238.0, 41.0, 22.0 ],
                                    "text": "what~"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-61",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 16.0, 210.0, 47.0, 22.0 ],
                                    "text": ">~ -0.5"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-59",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 16.0, 175.0, 42.0, 22.0 ],
                                    "text": "delta~"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-50",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "signal", "signal", "int" ],
                                    "patching_rect": [ 16.0, 144.0, 60.0, 22.0 ],
                                    "text": "subdiv~ 2"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-34",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "signal", "signal", "int" ],
                                    "patching_rect": [ 16.0, 115.0, 66.0, 22.0 ],
                                    "text": "swing~ 0.6"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-21",
                                    "maxclass": "live.scope~",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "patching_rect": [ 112.0, 292.0, 393.0, 105.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-20",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 16.0, 66.0, 94.0, 22.0 ],
                                    "text": "phasor~"
                                }
                            },
                            {
                                "box": {
                                    "attr": "swing",
                                    "id": "obj-49",
                                    "maxclass": "attrui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 216.0, 66.0, 150.0, 22.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-83",
                                    "index": 1,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 16.0, 6.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-84",
                                    "index": 2,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 120.0, 6.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-85",
                                    "index": 3,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 216.0, 6.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "tick count",
                                    "id": "obj-86",
                                    "index": 1,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 16.0, 447.0, 30.0, 30.0 ]
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "obj-70", 1 ],
                                    "source": [ "obj-10", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-71", 1 ],
                                    "source": [ "obj-12", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-34", 0 ],
                                    "source": [ "obj-20", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-50", 0 ],
                                    "source": [ "obj-34", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-34", 0 ],
                                    "source": [ "obj-49", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-10", 0 ],
                                    "source": [ "obj-5", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-59", 0 ],
                                    "source": [ "obj-50", 0 ]
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
                                    "destination": [ "obj-66", 0 ],
                                    "source": [ "obj-61", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-1", 0 ],
                                    "order": 1,
                                    "source": [ "obj-66", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-21", 0 ],
                                    "order": 0,
                                    "source": [ "obj-66", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-70", 0 ],
                                    "order": 2,
                                    "source": [ "obj-66", 0 ]
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
                                    "destination": [ "obj-71", 0 ],
                                    "source": [ "obj-70", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-86", 0 ],
                                    "source": [ "obj-71", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-20", 0 ],
                                    "source": [ "obj-83", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-20", 1 ],
                                    "order": 1,
                                    "source": [ "obj-84", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-7", 0 ],
                                    "order": 0,
                                    "source": [ "obj-84", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-49", 0 ],
                                    "source": [ "obj-85", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 1069.3333333333333, 59.0, 45.0, 22.0 ],
                    "text": "p Time"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-82",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1226.0, 19.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-80",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ -112.0, 156.0, 82.0, 22.0 ],
                    "text": "r tick_position"
                }
            },
            {
                "box": {
                    "id": "obj-79",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 455.0, 766.0, 117.0, 22.0 ],
                    "text": "receive tick_position"
                }
            },
            {
                "box": {
                    "id": "obj-78",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 741.0, 50.0, 104.0, 22.0 ],
                    "text": "send tick_position"
                }
            },
            {
                "box": {
                    "id": "obj-77",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 804.0, 19.0, 29.5, 22.0 ],
                    "text": "int"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "id": "obj-73",
                    "maxclass": "number~",
                    "mode": 2,
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "float" ],
                    "patching_rect": [ 741.0, 19.0, 56.0, 22.0 ],
                    "sig": 0.0
                }
            },
            {
                "box": {
                    "id": "obj-67",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1128.0, 19.0, 93.0, 22.0 ],
                    "text": "loadmess 0.649"
                }
            },
            {
                "box": {
                    "id": "obj-57",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1078.0, 19.0, 29.5, 22.0 ],
                    "text": "0"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-25",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1002.0, 19.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-9",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 425.0, 11.0, 97.0, 22.0 ],
                    "text": "clear_sequencer"
                }
            },
            {
                "box": {
                    "id": "obj-41",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 355.0, 108.0, 90.0, 22.0 ],
                    "text": "command save"
                }
            },
            {
                "box": {
                    "id": "obj-37",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "patching_rect": [ 293.0, 35.0, 67.0, 22.0 ],
                    "text": "opendialog"
                }
            },
            {
                "box": {
                    "id": "obj-38",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 293.0, 8.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-39",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 293.0, 59.0, 81.0, 22.0 ],
                    "text": "load_song $1"
                }
            },
            {
                "box": {
                    "id": "obj-32",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 615.0, 823.0, 77.0, 22.0 ],
                    "text": "loadmess 64"
                }
            },
            {
                "box": {
                    "id": "obj-31",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 63.0, 807.0, 58.0, 22.0 ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "id": "obj-27",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 343.0, 807.0, 77.0, 22.0 ],
                    "text": "loadmess 13"
                }
            },
            {
                "box": {
                    "id": "obj-26",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 224.0, 758.0, 83.0, 22.0 ],
                    "text": "loadmess 450"
                }
            },
            {
                "box": {
                    "id": "obj-35",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ -119.0, 830.0, 22.0, 22.0 ],
                    "text": "t b"
                }
            },
            {
                "box": {
                    "id": "obj-28",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ -119.0, 792.0, 77.0, 22.0 ],
                    "text": "route refresh"
                }
            },
            {
                "box": {
                    "id": "obj-60",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 15.0, 758.0, 124.0, 22.0 ],
                    "text": "debug_empty_buffers"
                }
            },
            {
                "box": {
                    "id": "obj-56",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 455.0, 807.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-54",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 288.0, 807.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-51",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 288.0, 831.0, 118.0, 22.0 ],
                    "text": "chans_per_buffer $1"
                }
            },
            {
                "box": {
                    "id": "obj-48",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "int" ],
                    "patching_rect": [ 224.0, 782.0, 29.5, 22.0 ],
                    "text": "t b i"
                }
            },
            {
                "box": {
                    "id": "obj-47",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 224.0, 807.0, 29.5, 22.0 ],
                    "text": "join"
                }
            },
            {
                "box": {
                    "id": "obj-46",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 172.0, 782.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-44",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 172.0, 758.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-42",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 180.0, 831.0, 73.0, 22.0 ],
                    "text": "range $1 $2"
                }
            },
            {
                "box": {
                    "id": "obj-36",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 455.0, 831.0, 67.0, 22.0 ],
                    "text": "playpos $1"
                }
            },
            {
                "box": {
                    "id": "obj-33",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 63.0, 831.0, 96.0, 22.0 ],
                    "text": "buffer_range 0 5"
                }
            },
            {
                "box": {
                    "id": "obj-30",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ -83.0, 830.0, 75.0, 22.0 ],
                    "text": "r gfx_update"
                }
            },
            {
                "box": {
                    "id": "obj-29",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 770.0, 766.0, 77.0, 22.0 ],
                    "text": "s gfx_update"
                }
            },
            {
                "box": {
                    "id": "obj-23",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ -83.0, 869.0, 46.0, 22.0 ],
                    "text": "refresh"
                }
            },
            {
                "box": {
                    "filename": "ztrk_multi_buffer_viz.js",
                    "id": "obj-13",
                    "maxclass": "v8ui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 27.0, 866.0, 840.0, 159.0 ],
                    "textfile": {
                        "filename": "ztrk_multi_buffer_viz.js",
                        "flags": 0,
                        "embed": 0,
                        "autowatch": 1
                    },
                    "varname": "multibuffer_view"
                }
            },
            {
                "box": {
                    "id": "obj-19",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ -114.5, 1.0, 87.0, 22.0 ],
                    "text": "sequencer_init"
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
                            "revision": 5,
                            "architecture": "x64",
                            "modernui": 1
                        },
                        "classnamespace": "box",
                        "rect": [ 1364.0, 206.0, 858.0, 649.0 ],
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
                                    "text": "29",
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
                                    "text": "124",
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
                                    "text": "keys 29 124 2048 -12",
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
                            },
                            {
                                "box": {
                                    "comment": "Start Stop / Bang",
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
                        ],
                        "patchlinecolor": [ 0.2196078431372549, 0.2196078431372549, 0.2196078431372549, 1.0 ],
                        "bgcolor": [ 0.5725490196078431, 0.5725490196078431, 0.5725490196078431, 1.0 ],
                        "editing_bgcolor": [ 0.5725490196078431, 0.5725490196078431, 0.5725490196078431, 1.0 ]
                    },
                    "patching_rect": [ 585.0, 108.0, 107.0, 22.0 ],
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
                    "patching_rect": [ 580.0, 152.0, 241.125, 428.0 ],
                    "textfile": {
                        "filename": "hex_tracker.js",
                        "flags": 0,
                        "embed": 0,
                        "autowatch": 1
                    }
                }
            },
            {
                "box": {
                    "id": "obj-17",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 136.0, 36.0, 59.0, 22.0 ],
                    "text": "route text"
                }
            },
            {
                "box": {
                    "id": "obj-16",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "patching_rect": [ 6.0, 73.0, 101.0, 22.0 ],
                    "text": "opendialog folder"
                }
            },
            {
                "box": {
                    "id": "obj-15",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 6.0, 49.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-14",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 136.0, 8.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "bangmode": 1,
                    "id": "obj-11",
                    "lines": 1,
                    "maxclass": "textedit",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "", "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 165.0, 8.0, 100.0, 28.0 ],
                    "text": "sss444"
                }
            },
            {
                "box": {
                    "id": "obj-10",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 6.0, 97.0, 101.0, 22.0 ],
                    "text": "set_output_dir $1"
                }
            },
            {
                "box": {
                    "id": "obj-8",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 136.0, 60.0, 88.0, 22.0 ],
                    "text": "song_name $1"
                }
            },
            {
                "box": {
                    "id": "obj-6",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ -97.0, 123.0, 32.0, 22.0 ],
                    "text": "print"
                }
            },
            {
                "box": {
                    "id": "obj-5",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ -63.0, 123.0, 32.0, 22.0 ],
                    "text": "print"
                }
            },
            {
                "box": {
                    "id": "obj-12",
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
                        "rect": [ 84.0, 132.0, 1000.0, 780.0 ],
                        "boxes": [
                            {
                                "box": {
                                    "id": "obj-30",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 50.0, 459.0, 73.0, 22.0 ],
                                    "text": "speedlim 60"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-5",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 3,
                                    "outlettype": [ "bang", "bang", "" ],
                                    "patching_rect": [ 570.0, 155.0, 57.0, 22.0 ],
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
                                    "patching_rect": [ 749.0, 153.0, 57.0, 22.0 ],
                                    "text": "sel 95 43"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-2",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 471.0, 101.0, 150.0, 20.0 ],
                                    "text": "95, 43 are plus and minus"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-20",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "patching_rect": [ 485.0, 332.0, 56.0, 22.0 ],
                                    "text": "metro 85"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-23",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "patching_rect": [ 485.0, 297.0, 61.0, 22.0 ],
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
                                    "patching_rect": [ 485.0, 255.0, 37.0, 22.0 ],
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
                                    "patching_rect": [ 527.0, 255.0, 31.0, 22.0 ],
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
                                    "patching_rect": [ 330.0, 325.0, 56.0, 25.0 ],
                                    "text": "29",
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
                                    "patching_rect": [ 367.0, 226.0, 77.0, 22.0 ],
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
                                    "patching_rect": [ 664.0, 210.0, 22.0, 22.0 ],
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
                                    "patching_rect": [ 646.0, 153.0, 91.0, 22.0 ],
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
                                    "patching_rect": [ 485.0, 210.0, 32.0, 22.0 ],
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
                                    "patching_rect": [ 467.0, 155.0, 91.0, 22.0 ],
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
                                    "patching_rect": [ 675.0, 100.0, 50.5, 22.0 ],
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
                                    "patching_rect": [ 138.0, 187.0, 154.0, 22.0 ],
                                    "text": "124",
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
                                    "patching_rect": [ 199.0, 226.0, 77.0, 22.0 ],
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
                                    "patching_rect": [ 138.0, 255.0, 29.5, 22.0 ],
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
                                    "patching_rect": [ 138.0, 373.0, 154.0, 22.0 ],
                                    "text": "keys 29 124 2048 -12",
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
                                    "patching_rect": [ 96.0, 226.0, 81.0, 22.0 ],
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
                                    "patching_rect": [ 50.0, 373.0, 74.0, 22.0 ],
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
                                    "patching_rect": [ 50.0, 195.0, 29.5, 22.0 ],
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
                                    "patching_rect": [ 50.0, 169.0, 58.0, 22.0 ],
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
                                    "patching_rect": [ 50.0, 138.0, 50.5, 22.0 ],
                                    "text": "key"
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-10",
                                    "index": 1,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 50.0, 541.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-11",
                                    "index": 2,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 138.0, 541.0, 30.0, 30.0 ]
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
                                    "destination": [ "obj-19", 0 ],
                                    "source": [ "obj-14", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-30", 0 ],
                                    "source": [ "obj-16", 0 ]
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
                                    "midpoints": [ 494.5, 366.0, 59.5, 366.0 ],
                                    "source": [ "obj-20", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-11", 0 ],
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
                                    "midpoints": [ 494.5, 288.2564173936844, 494.5, 288.2564173936844 ],
                                    "source": [ "obj-24", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-20", 1 ],
                                    "midpoints": [ 536.5, 285.58975064754486, 565.6666598320007, 285.58975064754486, 565.6666598320007, 320.2564172744751, 531.5, 320.2564172744751 ],
                                    "order": 1,
                                    "source": [ "obj-26", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-23", 1 ],
                                    "midpoints": [ 536.5, 281.58975052833557, 536.5, 281.58975052833557 ],
                                    "order": 0,
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
                                    "destination": [ "obj-10", 0 ],
                                    "source": [ "obj-30", 0 ]
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
                        ]
                    },
                    "patching_rect": [ -115.0, 94.0, 88.0, 22.0 ],
                    "text": "p KeyHandler3"
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
                    "patching_rect": [ 3.0, 141.0, 532.0, 584.0 ],
                    "textfile": {
                        "filename": "zen_tracker_seq_ui_E.js",
                        "flags": 0,
                        "embed": 0,
                        "autowatch": 1
                    }
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.8156862745098039, 0.4627450980392157, 0.4627450980392157, 1.0 ],
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
                        "rect": [ 59.0, 107.0, 132.0, 332.0 ],
                        "boxes": [
                            {
                                "box": {
                                    "id": "obj-1",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "float", "bang" ],
                                    "patching_rect": [ 20.0, 20.0, 100.0, 0.0 ],
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
                                    "patching_rect": [ 20.0, 52.0, 100.0, 0.0 ],
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
                                    "patching_rect": [ 20.0, 84.0, 100.0, 0.0 ],
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
                                    "patching_rect": [ 20.0, 116.0, 100.0, 0.0 ],
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
                                    "patching_rect": [ 20.0, 148.0, 100.0, 0.0 ],
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
                                    "patching_rect": [ 20.0, 180.0, 100.0, 0.0 ],
                                    "text": "buffer~ t5_buf",
                                    "varname": "t5_buf"
                                }
                            }
                        ],
                        "lines": []
                    },
                    "patching_rect": [ 5.0, 25.0, 100.0, 22.0 ],
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
                    "midpoints": [ 525.5, 752.0, 568.0, 752.0, 568.0, 149.0, 589.5, 149.0 ],
                    "source": [ "obj-1", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-28", 0 ],
                    "source": [ "obj-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "source": [ "obj-10", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-17", 0 ],
                    "source": [ "obj-11", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 1 ],
                    "order": 0,
                    "source": [ "obj-12", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "order": 0,
                    "source": [ "obj-12", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 0 ],
                    "order": 1,
                    "source": [ "obj-12", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-6", 0 ],
                    "order": 1,
                    "source": [ "obj-12", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-87", 3 ],
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
                    "destination": [ "obj-11", 0 ],
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
                    "destination": [ "obj-10", 0 ],
                    "source": [ "obj-16", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-8", 0 ],
                    "source": [ "obj-17", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "source": [ "obj-19", 0 ]
                }
            },
            {
                "patchline": {
                    "color": [ 1.0, 0.0, 0.0, 1.0 ],
                    "destination": [ "obj-1", 0 ],
                    "midpoints": [ 700.5625, 758.0, 547.0, 758.0, 547.0, 138.0, 15.0, 138.0, 15.0, 150.0, 12.5, 150.0 ],
                    "order": 1,
                    "source": [ "obj-2", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-29", 0 ],
                    "order": 0,
                    "source": [ "obj-2", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-49", 0 ],
                    "source": [ "obj-2", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-2", 2 ],
                    "source": [ "obj-22", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-2", 0 ],
                    "source": [ "obj-22", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-13", 0 ],
                    "source": [ "obj-23", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-13", 0 ],
                    "source": [ "obj-24", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-87", 0 ],
                    "source": [ "obj-25", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-46", 0 ],
                    "source": [ "obj-26", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-54", 0 ],
                    "source": [ "obj-27", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-35", 0 ],
                    "source": [ "obj-28", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-23", 0 ],
                    "source": [ "obj-30", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-33", 0 ],
                    "source": [ "obj-31", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-56", 0 ],
                    "source": [ "obj-32", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-13", 0 ],
                    "source": [ "obj-33", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-50", 1 ],
                    "source": [ "obj-34", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-50", 0 ],
                    "source": [ "obj-34", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-23", 0 ],
                    "source": [ "obj-35", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-13", 0 ],
                    "source": [ "obj-36", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-39", 0 ],
                    "source": [ "obj-37", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-37", 0 ],
                    "source": [ "obj-38", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "source": [ "obj-39", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "source": [ "obj-41", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-13", 0 ],
                    "source": [ "obj-42", 0 ]
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
                    "destination": [ "obj-47", 0 ],
                    "source": [ "obj-44", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-48", 0 ],
                    "source": [ "obj-46", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-42", 0 ],
                    "source": [ "obj-47", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-47", 1 ],
                    "source": [ "obj-48", 1 ]
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
                    "destination": [ "obj-13", 0 ],
                    "source": [ "obj-51", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-51", 0 ],
                    "source": [ "obj-54", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-36", 0 ],
                    "source": [ "obj-56", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-87", 1 ],
                    "source": [ "obj-57", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "midpoints": [ 24.5, 792.0, 23.0, 792.0, 23.0, 795.0, 0.0, 795.0, 0.0, 795.0, -18.0, 795.0, -18.0, 784.0, -19.0, 784.0, -19.0, 135.0, 12.5, 135.0 ],
                    "source": [ "obj-60", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-64", 1 ],
                    "source": [ "obj-63", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-64", 0 ],
                    "source": [ "obj-63", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-63", 1 ],
                    "source": [ "obj-65", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-63", 0 ],
                    "source": [ "obj-65", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-82", 0 ],
                    "source": [ "obj-67", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-77", 0 ],
                    "source": [ "obj-73", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-78", 0 ],
                    "source": [ "obj-77", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-56", 0 ],
                    "source": [ "obj-79", 0 ]
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
                    "source": [ "obj-80", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-87", 2 ],
                    "source": [ "obj-82", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-130", 0 ],
                    "midpoints": [ 1078.8333333333333, 657.0, 946.5, 657.0 ],
                    "order": 2,
                    "source": [ "obj-87", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-34", 0 ],
                    "midpoints": [ 1078.8333333333333, 657.0, 1034.5, 657.0 ],
                    "order": 1,
                    "source": [ "obj-87", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-65", 0 ],
                    "midpoints": [ 1078.8333333333333, 657.0, 1137.5, 657.0 ],
                    "order": 0,
                    "source": [ "obj-87", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-73", 0 ],
                    "order": 3,
                    "source": [ "obj-87", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-25", 0 ],
                    "source": [ "obj-88", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "source": [ "obj-9", 0 ]
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
            "obj-50": [ "live.gain~[1]", "live.gain~", 0 ],
            "obj-63": [ "live.gain~[2]", "live.gain~", 0 ],
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