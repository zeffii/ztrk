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
        "rect": [ 59.0, 107.0, 1000.0, 730.0 ],
        "boxes": [
            {
                "box": {
                    "comment": "255 .. 0.0  sine amp",
                    "id": "obj-17",
                    "index": 2,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 166.13855826854706, 48.19277286529541, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-19",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 166.13855826854706, 92.77108776569366, 121.0, 22.0 ],
                    "text": "scale 255 0. 85. -105"
                }
            },
            {
                "box": {
                    "comment": "255 .. 0.0  noise amp",
                    "id": "obj-16",
                    "index": 3,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 312.6024225950241, 48.19277286529541, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-14",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 312.6024225950241, 92.77108776569366, 121.0, 22.0 ],
                    "text": "scale 255 0. 85. -105"
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
                    "patching_rect": [ 53.01205015182495, 51.19277286529541, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-38",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 586.0241187810898, 500.50604170560837, 70.0, 20.0 ],
                    "text": "noise curve"
                }
            },
            {
                "box": {
                    "id": "obj-26",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 795.9759033918381, 320.837346971035, 150.0, 20.0 ],
                    "text": "amplitude curve"
                }
            },
            {
                "box": {
                    "id": "obj-37",
                    "lastchannelcount": 0,
                    "maxclass": "live.gain~",
                    "numinlets": 2,
                    "numoutlets": 5,
                    "outlettype": [ "signal", "signal", "", "float", "list" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 184.64458334445953, 543.3735140562057, 48.0, 136.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "live.gain~[1]",
                            "parameter_mmax": 6.0,
                            "parameter_mmin": -70.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "live.gain~[1]",
                            "parameter_type": 0,
                            "parameter_unitstyle": 4
                        }
                    },
                    "varname": "live.gain~[1]"
                }
            },
            {
                "box": {
                    "addpoints_with_curve": [ 0.0, 0.3490566037735849, 0, 0.0, 0.0, 0.8018867924528302, 0, 0.0, 8.426966292134832, 0.5157894736842106, 0, 0.0, 13.677811550151976, 0.44339622641509435, 0, 0.0, 22.471910112359552, 0.5263157894736842, 0, 0.0, 98.78419452887537, 0.6509433962264151, 0, -0.7000000000000001, 137.53799392097264, 0.5943396226415094, 0, 0.0, 201.3677811550152, 0.20754716981132076, 0, 0.25000000000000017, 414.8936170212766, 0.0, 0, -0.845 ],
                    "classic_curve": 1,
                    "domain": 500.0,
                    "fontface": 0,
                    "fontsize": 12.0,
                    "grid": 3,
                    "id": "obj-22",
                    "maxclass": "function",
                    "mode": 1,
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "float", "", "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 275.8463882803917, 296.3855531215668, 670.2590302228928, 132.07833153009415 ],
                    "style": "chiba"
                }
            },
            {
                "box": {
                    "id": "obj-36",
                    "maxclass": "live.scope~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 692.1686984300613, 501.71086102724075, 254.59636425971985, 121.08434182405472 ]
                }
            },
            {
                "box": {
                    "id": "obj-35",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 112.6265081167221, 668.5783370733261, 36.0, 22.0 ],
                    "text": "+~ 1."
                }
            },
            {
                "box": {
                    "id": "obj-33",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "bang" ],
                    "patching_rect": [ 350.6024225950241, 574.6988164186478, 45.0, 22.0 ],
                    "text": "curve~"
                }
            },
            {
                "box": {
                    "addpoints_with_curve": [ 0.0, 0.869544067079112, 0, 0.0, 0.0, 1.0, 0, 0.0, 14.90854969072874, 0.35890577396743367, 0, 0.0, 44.70438133084529, 0.06711246361790317, 0, 0.0, 78.73245435801742, 0.0, 0, 0.0, 91.49298174320697, 0.0, 0, 0.0 ],
                    "classic_curve": 1,
                    "domain": 100.0,
                    "fontface": 0,
                    "fontsize": 12.0,
                    "grid": 3,
                    "id": "obj-34",
                    "maxclass": "function",
                    "mode": 1,
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "float", "", "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 530.7229093313217, 500.50604170560837, 125.30120944976807, 124.09639012813568 ],
                    "style": "chiba"
                }
            },
            {
                "box": {
                    "id": "obj-32",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 287.9518178701401, 619.277131319046, 34.0, 22.0 ],
                    "text": "*~ 1."
                }
            },
            {
                "box": {
                    "id": "obj-27",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 287.9518178701401, 574.6988164186478, 44.0, 22.0 ],
                    "text": "noise~"
                }
            },
            {
                "box": {
                    "id": "obj-25",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 795.9759033918381, 136.0, 150.0, 20.0 ],
                    "text": "frequency curve"
                }
            },
            {
                "box": {
                    "id": "obj-20",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 124.47590339183807, 208.33735620975494, 29.5, 22.0 ],
                    "text": "3"
                }
            },
            {
                "box": {
                    "id": "obj-18",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 205.4216924905777, 311.9518178701401, 34.0, 22.0 ],
                    "text": "*~ 1."
                }
            },
            {
                "box": {
                    "id": "obj-15",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 124.47590339183807, 254.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-7",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 183.14458334445953, 208.33735620975494, 51.0, 22.0 ],
                    "text": "phase 0"
                }
            },
            {
                "box": {
                    "id": "obj-24",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 112.6265081167221, 521.5903798341751, 34.0, 22.0 ],
                    "text": "*~ 1."
                }
            },
            {
                "box": {
                    "id": "obj-23",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "bang" ],
                    "patching_rect": [ 444.57832968235016, 439.7590523958206, 45.0, 22.0 ],
                    "text": "curve~"
                }
            },
            {
                "box": {
                    "id": "obj-12",
                    "lastchannelcount": 0,
                    "maxclass": "live.gain~",
                    "numinlets": 2,
                    "numoutlets": 5,
                    "outlettype": [ "signal", "signal", "", "float", "list" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 50.0, 699.9036394357681, 48.0, 93.0 ],
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
                    "id": "obj-9",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "bang" ],
                    "patching_rect": [ 95.97590339183807, 100.0, 32.0, 22.0 ],
                    "text": "t b b"
                }
            },
            {
                "box": {
                    "id": "obj-5",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "bang" ],
                    "patching_rect": [ 493.3735103607178, 254.0, 45.0, 22.0 ],
                    "text": "curve~"
                }
            },
            {
                "box": {
                    "addpoints_with_curve": [ 0.45592705167173253, 209.52380952380952, 0, 0.0, 6.382978723404255, 75.95238095238095, 0, -0.5, 57.90273556231003, 18.333333333333332, 0, -0.6949999999999998, 236.62613981762917, 13.095238095238095, 0, 0.0 ],
                    "classic_curve": 1,
                    "domain": 300.0,
                    "fontface": 0,
                    "fontsize": 12.0,
                    "grid": 3,
                    "gridstep_y": 50.0,
                    "id": "obj-4",
                    "maxclass": "function",
                    "mode": 1,
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "float", "", "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 275.9759033918381, 136.0, 670.0, 109.0 ],
                    "range": [ 0.0, 220.0 ],
                    "style": "chiba"
                }
            },
            {
                "box": {
                    "id": "obj-3",
                    "maxclass": "live.scope~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 276.7650626897812, 699.9036394357681, 670.0, 133.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-2",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 159.63855826854706, 375.8765127360821, 43.0, 22.0 ],
                    "text": "cycle~"
                }
            },
            {
                "box": {
                    "comment": "",
                    "id": "obj-39",
                    "index": 1,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 93.97590708732605, 47.578314900398254, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "comment": "",
                    "id": "obj-40",
                    "index": 1,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 49.999999391838074, 892.903625, 30.0, 30.0 ]
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-40", 0 ],
                    "source": [ "obj-12", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-37", 0 ],
                    "source": [ "obj-14", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-18", 1 ],
                    "midpoints": [ 133.97590339183807, 291.95180678367615, 229.9216924905777, 291.95180678367615 ],
                    "order": 0,
                    "source": [ "obj-15", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-2", 0 ],
                    "midpoints": [ 133.97590339183807, 309.3975884914398, 169.13855826854706, 309.3975884914398 ],
                    "order": 1,
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
                    "destination": [ "obj-19", 0 ],
                    "source": [ "obj-17", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-2", 0 ],
                    "source": [ "obj-18", 0 ]
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
                    "destination": [ "obj-24", 0 ],
                    "midpoints": [ 169.13855826854706, 493.74698746204376, 122.1265081167221, 493.74698746204376 ],
                    "source": [ "obj-2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-15", 0 ],
                    "source": [ "obj-20", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-23", 0 ],
                    "midpoints": [ 502.4327316880226, 436.6987942457199, 454.07832968235016, 436.6987942457199 ],
                    "source": [ "obj-22", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-24", 1 ],
                    "midpoints": [ 454.07832968235016, 475.674697637558, 137.1265081167221, 475.674697637558 ],
                    "source": [ "obj-23", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-35", 0 ],
                    "source": [ "obj-24", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-32", 0 ],
                    "source": [ "obj-27", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-37", 0 ],
                    "midpoints": [ 297.4518178701401, 606.0, 244.97590339183807, 606.0, 244.97590339183807, 528.3734918832779, 194.14458334445953, 528.3734918832779 ],
                    "source": [ "obj-32", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-32", 1 ],
                    "source": [ "obj-33", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-33", 0 ],
                    "midpoints": [ 575.6566458145777, 648.0481932163239, 406.9759033918381, 648.0481932163239, 406.9759033918381, 561.7590376138687, 360.1024225950241, 561.7590376138687 ],
                    "source": [ "obj-34", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-12", 1 ],
                    "order": 1,
                    "source": [ "obj-35", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-12", 0 ],
                    "order": 2,
                    "source": [ "obj-35", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-3", 0 ],
                    "midpoints": [ 122.1265081167221, 702.0, 262.9759033918381, 702.0, 262.9759033918381, 696.0, 286.2650626897812, 696.0 ],
                    "order": 0,
                    "source": [ "obj-35", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-35", 1 ],
                    "midpoints": [ 194.14458334445953, 639.4457817077637, 139.9036135673523, 639.4457817077637, 139.9036135673523, 663.0, 139.1265081167221, 663.0 ],
                    "order": 1,
                    "source": [ "obj-37", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-36", 0 ],
                    "midpoints": [ 194.14458334445953, 687.0, 262.9759033918381, 687.0, 262.9759033918381, 660.0963864326477, 676.9759033918381, 660.0963864326477, 676.9759033918381, 498.0, 701.6686984300613, 498.0 ],
                    "order": 0,
                    "source": [ "obj-37", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9", 0 ],
                    "source": [ "obj-39", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 0 ],
                    "midpoints": [ 502.4759033918381, 252.59036135673523, 502.8735103607178, 252.59036135673523 ],
                    "source": [ "obj-4", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-18", 0 ],
                    "midpoints": [ 502.8735103607178, 284.95180678367615, 214.9216924905777, 284.95180678367615 ],
                    "source": [ "obj-5", 0 ]
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
                    "destination": [ "obj-2", 1 ],
                    "midpoints": [ 192.64458334445953, 231.0, 193.13855826854706, 231.0 ],
                    "source": [ "obj-7", 0 ]
                }
            },
            {
                "patchline": {
                    "color": [ 0.0, 0.6352941176470588, 1.0, 1.0 ],
                    "destination": [ "obj-20", 0 ],
                    "order": 3,
                    "source": [ "obj-9", 1 ]
                }
            },
            {
                "patchline": {
                    "color": [ 0.0, 0.6352941176470588, 1.0, 1.0 ],
                    "destination": [ "obj-22", 0 ],
                    "midpoints": [ 118.47590339183807, 195.0, 262.9759033918381, 195.0, 262.9759033918381, 293.95180678367615, 285.3463882803917, 293.95180678367615 ],
                    "order": 1,
                    "source": [ "obj-9", 1 ]
                }
            },
            {
                "patchline": {
                    "color": [ 0.0, 0.6352941176470588, 1.0, 1.0 ],
                    "destination": [ "obj-34", 0 ],
                    "midpoints": [ 118.47590339183807, 183.5662647485733, 262.9759033918381, 183.5662647485733, 262.9759033918381, 485.95180678367615, 514.9759033918381, 485.95180678367615, 514.9759033918381, 486.0, 540.2229093313217, 486.0 ],
                    "order": 0,
                    "source": [ "obj-9", 1 ]
                }
            },
            {
                "patchline": {
                    "color": [ 0.0, 0.6352941176470588, 1.0, 1.0 ],
                    "destination": [ "obj-4", 0 ],
                    "midpoints": [ 105.47590339183807, 132.0, 285.4759033918381, 132.0 ],
                    "source": [ "obj-9", 0 ]
                }
            },
            {
                "patchline": {
                    "color": [ 0.0, 0.6352941176470588, 1.0, 1.0 ],
                    "destination": [ "obj-7", 0 ],
                    "order": 2,
                    "source": [ "obj-9", 1 ]
                }
            }
        ]
    }
}