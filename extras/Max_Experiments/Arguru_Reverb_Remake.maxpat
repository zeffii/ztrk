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
        "rect": [ 557.0, 300.0, 1390.0, 1050.0 ],
        "boxes": [
            {
                "box": {
                    "format": 6,
                    "id": "obj-17",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 179.0, 26.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-15",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 73.0, 18.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-13",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 112.0, 84.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-11",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 100.0, 49.0, 63.0, 22.0 ],
                    "text": "metro 350"
                }
            },
            {
                "box": {
                    "id": "obj-9",
                    "maxclass": "ezdac~",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [ 101.0, 821.0, 45.0, 45.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-8",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "signal" ],
                    "patching_rect": [ 94.0, 761.0, 44.0, 22.0 ],
                    "text": "limi~ 2"
                }
            },
            {
                "box": {
                    "id": "obj-7",
                    "lastchannelcount": 0,
                    "maxclass": "live.gain~",
                    "numinlets": 2,
                    "numoutlets": 5,
                    "outlettype": [ "signal", "signal", "", "float", "list" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 73.0, 574.0, 48.0, 136.0 ],
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
                    "id": "obj-6",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 179.0, 94.0, 29.5, 22.0 ],
                    "text": "1"
                }
            },
            {
                "box": {
                    "data": {
                        "clips": [
                            {
                                "absolutepath": "drumLoop.aif",
                                "filename": "drumLoop.aif",
                                "filekind": "audiofile",
                                "id": "u844000414",
                                "selection": [ 0.0, 1.0 ],
                                "loop": 0,
                                "content_state": {                                }
                            }
                        ]
                    },
                    "id": "obj-3",
                    "maxclass": "playlist~",
                    "mode": "basic",
                    "numinlets": 1,
                    "numoutlets": 5,
                    "outlettype": [ "signal", "signal", "signal", "", "dictionary" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 107.0, 142.0, 150.0, 30.0 ],
                    "quality": "basic",
                    "saved_attribute_attributes": {
                        "candicane2": {
                            "expression": ""
                        },
                        "candicane3": {
                            "expression": ""
                        },
                        "candicane4": {
                            "expression": ""
                        },
                        "candicane5": {
                            "expression": ""
                        },
                        "candicane6": {
                            "expression": ""
                        },
                        "candicane7": {
                            "expression": ""
                        },
                        "candicane8": {
                            "expression": ""
                        }
                    }
                }
            },
            {
                "box": {
                    "code": "// Smoother Arguru-inspired Reverb – FIXED (compiles)\r\n\r\nParam predelay(18);\r\nParam size(0.65);\r\nParam decay(0.78);\r\nParam damp(0.35);\r\nParam dry(1.0);\r\nParam wet(0.42);\r\nParam width(1.0);\r\n\r\n// Buffers\r\nData combL0(8192); Data combR0(8192);\r\nData combL1(8192); Data combR1(8192);\r\nData combL2(8192); Data combR2(8192);\r\nData combL3(8192); Data combR3(8192);\r\n\r\nData apL(6*2048);\r\nData apR(6*2048);\r\n\r\nData posC(4);\r\nData posA(6);\r\n\r\nHistory dampL0(0); History dampR0(0);\r\nHistory dampL1(0); History dampR1(0);\r\nHistory dampL2(0); History dampR2(0);\r\nHistory dampL3(0); History dampR3(0);\r\n\r\nHistory lpL(0); History lpR(0);\r\n\r\n// -------------------------------------------------\r\nms = samplerate * 0.001;\r\n\r\nd0 = 29.7 + size * 38;\r\nd1 = 37.1 + size * 41;\r\nd2 = 41.3 + size * 47;\r\nd3 = 43.7 + size * 53;\r\n\r\nd0s = clamp(d0 * ms, 50, 7000);\r\nd1s = clamp(d1 * ms, 50, 7000);\r\nd2s = clamp(d2 * ms, 50, 7000);\r\nd3s = clamp(d3 * ms, 50, 7000);\r\n\r\npd = clamp(predelay * ms, 1, 4000);\r\n\r\nfb    = clamp(decay, 0.1, 0.93);\r\ndampK = clamp(damp, 0.05, 0.9);\r\n\r\ng = clamp(0.5 + decay * 0.25, 0.4, 0.75);\r\n\r\n// ========== Comb 0 ==========\r\np0 = peek(posC, 0);\r\npoke(combL0, in1, p0);\r\npoke(combR0, in2, p0);\r\n\r\nrl0 = p0 - d0s - pd;\r\nrr0 = p0 - d0s - pd - 23;\r\nrl0 = rl0 < 0 ? rl0 + 8192 : rl0;\r\nrr0 = rr0 < 0 ? rr0 + 8192 : rr0;\r\n\r\ncl0 = peek(combL0, rl0);\r\ncr0 = peek(combR0, rr0);\r\n\r\ndampL0 = cl0 * (1 - dampK) + dampL0 * dampK;\r\ndampR0 = cr0 * (1 - dampK) + dampR0 * dampK;\r\n\r\npoke(combL0, in1 + dampL0 * fb, p0);\r\npoke(combR0, in2 + dampR0 * fb, p0);\r\n\r\np0 = p0 + 1; if (p0 >= 8192) p0 = 0;\r\npoke(posC, p0, 0);\r\n\r\n// ========== Comb 1 ==========\r\np1 = peek(posC, 1);\r\npoke(combL1, in1, p1);\r\npoke(combR1, in2, p1);\r\n\r\nrl1 = p1 - d1s - pd;\r\nrr1 = p1 - d1s - pd - 29;\r\nrl1 = rl1 < 0 ? rl1 + 8192 : rl1;\r\nrr1 = rr1 < 0 ? rr1 + 8192 : rr1;\r\n\r\ncl1 = peek(combL1, rl1);\r\ncr1 = peek(combR1, rr1);\r\n\r\ndampL1 = cl1 * (1 - dampK) + dampL1 * dampK;\r\ndampR1 = cr1 * (1 - dampK) + dampR1 * dampK;\r\n\r\npoke(combL1, in1 + dampL1 * fb, p1);\r\npoke(combR1, in2 + dampR1 * fb, p1);\r\n\r\np1 = p1 + 1; if (p1 >= 8192) p1 = 0;\r\npoke(posC, p1, 1);\r\n\r\n// ========== Comb 2 ==========\r\np2 = peek(posC, 2);\r\npoke(combL2, in1, p2);\r\npoke(combR2, in2, p2);\r\n\r\nrl2 = p2 - d2s - pd;\r\nrr2 = p2 - d2s - pd - 37;\r\nrl2 = rl2 < 0 ? rl2 + 8192 : rl2;\r\nrr2 = rr2 < 0 ? rr2 + 8192 : rr2;\r\n\r\ncl2 = peek(combL2, rl2);\r\ncr2 = peek(combR2, rr2);\r\n\r\ndampL2 = cl2 * (1 - dampK) + dampL2 * dampK;\r\ndampR2 = cr2 * (1 - dampK) + dampR2 * dampK;\r\n\r\npoke(combL2, in1 + dampL2 * fb, p2);\r\npoke(combR2, in2 + dampR2 * fb, p2);\r\n\r\np2 = p2 + 1; if (p2 >= 8192) p2 = 0;\r\npoke(posC, p2, 2);\r\n\r\n// ========== Comb 3 ==========\r\np3 = peek(posC, 3);\r\npoke(combL3, in1, p3);\r\npoke(combR3, in2, p3);\r\n\r\nrl3 = p3 - d3s - pd;\r\nrr3 = p3 - d3s - pd - 43;\r\nrl3 = rl3 < 0 ? rl3 + 8192 : rl3;\r\nrr3 = rr3 < 0 ? rr3 + 8192 : rr3;\r\n\r\ncl3 = peek(combL3, rl3);\r\ncr3 = peek(combR3, rr3);\r\n\r\ndampL3 = cl3 * (1 - dampK) + dampL3 * dampK;\r\ndampR3 = cr3 * (1 - dampK) + dampR3 * dampK;\r\n\r\npoke(combL3, in1 + dampL3 * fb, p3);\r\npoke(combR3, in2 + dampR3 * fb, p3);\r\n\r\np3 = p3 + 1; if (p3 >= 8192) p3 = 0;\r\npoke(posC, p3, 3);\r\n\r\n// Sum the combs\r\nsumL = (cl0 + cl1 + cl2 + cl3) * 0.25;\r\nsumR = (cr0 + cr1 + cr2 + cr3) * 0.25;\r\n\r\n// ========== Series Allpasses ==========\r\nl = sumL;\r\nr = sumR;\r\n\r\n// Progressive allpass delays (always defined)\r\napd0 = 12.7 + size * 9;\r\napd1 = 9.3  + size * 8;\r\napd2 = 7.1  + size * 7;\r\napd3 = 5.9  + size * 6;\r\napd4 = 4.3  + size * 5;\r\napd5 = 3.1  + size * 4;\r\n\r\nfor (i = 0; i < 6; i += 1) {\r\n    // Safe way to select delay – always assigns dly\r\n    dly = apd0;\r\n    if (i == 1) dly = apd1;\r\n    if (i == 2) dly = apd2;\r\n    if (i == 3) dly = apd3;\r\n    if (i == 4) dly = apd4;\r\n    if (i == 5) dly = apd5;\r\n\r\n    dlys = clamp(dly * ms, 20, 1800);\r\n\r\n    base = i * 2048;\r\n    pos  = peek(posA, i);\r\n\r\n    // Left\r\n    rpl = pos - dlys;\r\n    rpl = rpl < 0 ? rpl + 2048 : rpl;\r\n    bl  = peek(apL, base + rpl);\r\n    tl  = l + g * bl;\r\n    ol  = bl - g * tl;\r\n    poke(apL, tl, base + pos);\r\n\r\n    // Right\r\n    rpr = pos - (dlys + 11 + i * 3);\r\n    rpr = rpr < 0 ? rpr + 2048 : rpr;\r\n    br  = peek(apR, base + rpr);\r\n    tr  = r + g * br;\r\n    or_ = br - g * tr;\r\n    poke(apR, tr, base + pos);\r\n\r\n    l = ol;\r\n    r = or_;\r\n\r\n    pos = pos + 1;\r\n    if (pos >= 2048) pos = 0;\r\n    poke(posA, pos, i);\r\n}\r\n\r\n// Final absorption + width\r\ncoeff = exp(-2 * pi * (4500 + (1 - dampK) * 6000) / samplerate);\r\nlpL = l + (lpL - l) * coeff;\r\nlpR = r + (lpR - r) * coeff;\r\n\r\nmid  = (lpL + lpR) * 0.5;\r\nside = (lpL - lpR) * 0.5 * width;\r\n\r\nout1 = in1 * dry + (mid + side) * wet;\r\nout2 = in2 * dry + (mid - side) * wet;",
                    "fontface": 0,
                    "fontname": "<Monospaced>",
                    "fontsize": 12.0,
                    "id": "obj-1",
                    "maxclass": "gen.codebox~",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "signal" ],
                    "patching_rect": [ 341.0, 127.0, 733.0, 794.0 ]
                }
            },
            {
                "box": {
                    "attr": "wet",
                    "id": "obj-10",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 341.0, 44.0, 150.0, 22.0 ]
                }
            },
            {
                "box": {
                    "attr": "decay",
                    "id": "obj-18",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 520.0, 49.0, 150.0, 22.0 ]
                }
            },
            {
                "box": {
                    "attr": "size",
                    "id": "obj-19",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 701.0, 49.0, 150.0, 22.0 ]
                }
            },
            {
                "box": {
                    "attr": "width",
                    "id": "obj-20",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 919.0, 49.0, 150.0, 22.0 ]
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-7", 1 ],
                    "source": [ "obj-1", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-7", 0 ],
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
                    "destination": [ "obj-13", 0 ],
                    "source": [ "obj-11", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-6", 0 ],
                    "source": [ "obj-13", 0 ]
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
                    "destination": [ "obj-11", 1 ],
                    "source": [ "obj-17", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "source": [ "obj-18", 0 ]
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
                    "destination": [ "obj-1", 0 ],
                    "source": [ "obj-20", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 1 ],
                    "source": [ "obj-3", 1 ]
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
                    "destination": [ "obj-3", 0 ],
                    "source": [ "obj-6", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-8", 1 ],
                    "source": [ "obj-7", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-8", 0 ],
                    "source": [ "obj-7", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9", 1 ],
                    "source": [ "obj-8", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9", 0 ],
                    "source": [ "obj-8", 0 ]
                }
            }
        ],
        "parameters": {
            "obj-7": [ "live.gain~", "live.gain~", 0 ],
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
        "autosave": 0
    }
}