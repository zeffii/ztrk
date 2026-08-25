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
        "rect": [ 139.0, 183.0, 1589.0, 1049.0 ],
        "boxes": [
            {
                "box": {
                    "format": 6,
                    "id": "obj-19",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 918.0, 123.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-20",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 918.0, 152.0, 53.0, 22.0 ],
                    "text": "width $1"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-14",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 828.0, 123.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-15",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 828.0, 152.0, 71.0, 22.0 ],
                    "presentation_linecount": 2,
                    "text": "predelay $1"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-11",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 749.0, 123.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-12",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 749.0, 152.0, 57.0, 22.0 ],
                    "presentation_linecount": 2,
                    "text": "decay $1"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-5",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 683.0, 123.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-6",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 683.0, 152.0, 44.0, 22.0 ],
                    "presentation_linecount": 2,
                    "text": "wet $1"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-18",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 621.0, 123.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-16",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 621.0, 152.0, 42.0, 22.0 ],
                    "text": "dry $1"
                }
            },
            {
                "box": {
                    "filename": "ztrk_zenverb_ui.js",
                    "id": "obj-13",
                    "maxclass": "v8ui",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "parameter_enable": 0,
                    "patching_rect": [ 621.0, 230.0, 382.0, 110.0 ],
                    "textfile": {
                        "filename": "ztrk_zenverb_ui.js",
                        "flags": 0,
                        "embed": 0,
                        "autowatch": 1
                    }
                }
            },
            {
                "box": {
                    "id": "obj-8",
                    "maxclass": "ezdac~",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [ 411.0, 508.0, 45.0, 45.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-9",
                    "lastchannelcount": 0,
                    "maxclass": "live.gain~",
                    "numinlets": 2,
                    "numoutlets": 5,
                    "orientation": 1,
                    "outlettype": [ "signal", "signal", "", "float", "list" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 411.0, 443.0, 136.0, 47.0 ],
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
                    "id": "obj-7",
                    "maxclass": "newobj",
                    "numinlets": 2,
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
                        "rect": [ 105.0, 185.0, 1553.0, 1071.0 ],
                        "boxes": [
                            {
                                "box": {
                                    "id": "obj-6",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 119.5, 952.0, 35.0, 22.0 ],
                                    "text": "out 2"
                                }
                            },
                            {
                                "box": {
                                    "code": "// ============================================================\r\n// 1. FUNCTIONS\r\n// ============================================================\r\n\r\ncomb(fb, dampK, modSig, modAmt, pd, posC, in1, in2, bufL, bufR, idx, ds, extraOffs, modCoefL, modCoefR) {\r\n    History p;\r\n    History dampL;\r\n    History dampR;\r\n\r\n    p = peek(posC, idx);\r\n    poke(bufL, in1, p);\r\n    poke(bufR, in2, p);\r\n\r\n    rl = p - ds - pd + modSig * modAmt * modCoefL;\r\n    rr = p - ds - pd + extraOffs + modSig * modAmt * modCoefR;\r\n    rl = rl < 0 ? rl + 8192 : rl;\r\n    rr = rr < 0 ? rr + 8192 : rr;\r\n\r\n    cl = peek(bufL, rl);\r\n    cr = peek(bufR, rr);\r\n\r\n    dampL = cl * (1 - dampK) + dampL * dampK;\r\n    dampR = cr * (1 - dampK) + dampR * dampK;\r\n\r\n    poke(bufL, in1 + dampL * fb, p);\r\n    poke(bufR, in2 + dampR * fb, p);\r\n\r\n    p = p + 1;\r\n    if (p >= 8192) p = 0;\r\n    poke(posC, p, idx);\r\n\r\n    return cl, cr;\r\n}\r\n\r\n// ============================================================\r\n// 2. DECLARATIONS\r\n// ============================================================\r\n\r\n// -- Params --\r\nParam predelay(18);\r\nParam size(0.65);\r\nParam decay(0.78);\r\nParam damp(0.35);\r\nParam mod(0.22);         // very gentle modulation depth\r\nParam dry(1.0);\r\nParam wet(0.42);\r\nParam width(1.0);\r\n\r\n// -- Data (buffers) --\r\nData combL0(8192); Data combR0(8192);\r\nData combL1(8192); Data combR1(8192);\r\nData combL2(8192); Data combR2(8192);\r\nData combL3(8192); Data combR3(8192);\r\n\r\nData apL(6*2048);\r\nData apR(6*2048);\r\n\r\nData posC(4);\r\nData posA(6);\r\n\r\n// -- History --\r\nHistory dampL0(0); History dampR0(0);\r\nHistory dampL1(0); History dampR1(0);\r\nHistory dampL2(0); History dampR2(0);\r\nHistory dampL3(0); History dampR3(0);\r\n\r\nHistory lpL(0); History lpR(0);\r\nHistory modPhase(0);\r\n\r\n// ============================================================\r\n// 3. ASSIGNMENTS\r\n// ============================================================\r\n\r\nms = samplerate * 0.001;\r\n\r\n// Comb delay times\r\nd0 = 29.7 + size * 38;\r\nd1 = 37.1 + size * 41;\r\nd2 = 41.3 + size * 47;\r\nd3 = 43.7 + size * 53;\r\n\r\nd0s = clamp(d0 * ms, 50, 7000);\r\nd1s = clamp(d1 * ms, 50, 7000);\r\nd2s = clamp(d2 * ms, 50, 7000);\r\nd3s = clamp(d3 * ms, 50, 7000);\r\n\r\npd    = clamp(predelay * ms, 1, 4000);\r\nfb    = clamp(decay, 0.1, 0.93);\r\ndampK = clamp(damp, 0.05, 0.9);\r\ng     = clamp(0.5 + decay * 0.25, 0.4, 0.75);\r\n\r\n// Very slow, gentle modulation\r\nmodPhase = modPhase + (0.11 / samplerate);   // ~0.11 Hz\r\nif (modPhase > 1) modPhase = modPhase - 1;\r\nmodSig = sin(modPhase * 2 * pi);             // smooth sine\r\nmodAmt = mod * 7.5;                          // very small depth\r\n\r\n// ========== Call the 4 combs (4 separate lexical instances) ==========\r\ncl0, cr0 = comb(fb, dampK, modSig, modAmt, pd, posC, in1, in2, combL0, combR0, 0, d0s, -23,  1.0,   -0.6);\r\ncl1, cr1 = comb(fb, dampK, modSig, modAmt, pd, posC, in1, in2, combL1, combR1, 1, d1s, -29,  0.8,   -0.5);\r\ncl2, cr2 = comb(fb, dampK, modSig, modAmt, pd, posC, in1, in2, combL2, combR2, 2, d2s, -37, -0.7,    0.45);\r\ncl3, cr3 = comb(fb, dampK, modSig, modAmt, pd, posC, in1, in2, combL3, combR3, 3, d3s, -43,  1.05,  -0.55);\r\n\r\n// Sum combs\r\nsumL = (cl0 + cl1 + cl2 + cl3) * 0.25;\r\nsumR = (cr0 + cr1 + cr2 + cr3) * 0.25;\r\n\r\n// ========== Series Allpasses ==========\r\nl = sumL;\r\nr = sumR;\r\n\r\napd0 = 12.7 + size * 9;\r\napd1 = 9.3  + size * 8;\r\napd2 = 7.1  + size * 7;\r\napd3 = 5.9  + size * 6;\r\napd4 = 4.3  + size * 5;\r\napd5 = 3.1  + size * 4;\r\n\r\nfor (i = 0; i < 6; i += 1) {\r\n    dly = apd0;\r\n    if (i == 1) dly = apd1;\r\n    if (i == 2) dly = apd2;\r\n    if (i == 3) dly = apd3;\r\n    if (i == 4) dly = apd4;\r\n    if (i == 5) dly = apd5;\r\n\r\n    dlys = clamp(dly * ms, 20, 1800);\r\n\r\n    // tiny modulation on allpasses\r\n    dlys = dlys + modSig * mod * 2.8;\r\n\r\n    base = i * 2048;\r\n    pos  = peek(posA, i);\r\n\r\n    // Left\r\n    rpl = pos - dlys;\r\n    rpl = rpl < 0 ? rpl + 2048 : rpl;\r\n    bl  = peek(apL, base + rpl);\r\n    tl  = l + g * bl;\r\n    ol  = bl - g * tl;\r\n    poke(apL, tl, base + pos);\r\n\r\n    // Right\r\n    rpr = pos - (dlys + 13 + i * 3.5);\r\n    rpr = rpr < 0 ? rpr + 2048 : rpr;\r\n    br  = peek(apR, base + rpr);\r\n    tr  = r + g * br;\r\n    or_ = br - g * tr;\r\n    poke(apR, tr, base + pos);\r\n\r\n    l = ol;\r\n    r = or_;\r\n\r\n    pos = pos + 1;\r\n    if (pos >= 2048) pos = 0;\r\n    poke(posA, pos, i);\r\n}\r\n\r\n// Smoother final absorption\r\ncoeff = exp(-2 * pi * (4200 + (1 - dampK) * 6500) / samplerate);\r\nlpL = l + (lpL - l) * coeff;\r\nlpR = r + (lpR - r) * coeff;\r\n\r\n// Stereo width\r\nmid  = (lpL + lpR) * 0.5;\r\nside = (lpL - lpR) * 0.5 * width;\r\n\r\nout1 = in1 * dry + (mid + side) * wet;\r\nout2 = in2 * dry + (mid - side) * wet;",
                                    "fontface": 0,
                                    "fontname": "<Monospaced>",
                                    "fontsize": 12.0,
                                    "id": "obj-5",
                                    "maxclass": "codebox",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "" ],
                                    "patching_rect": [ 50.0, 46.0, 841.0, 898.0 ]
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
                                    "id": "obj-2",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 600.0, 14.0, 28.0, 22.0 ],
                                    "text": "in 2"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-4",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 46.5, 952.0, 35.0, 22.0 ],
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
                                    "destination": [ "obj-5", 1 ],
                                    "source": [ "obj-2", 0 ]
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
                    "patching_rect": [ 415.0, 365.0, 110.0, 22.0 ],
                    "text": "gen~ @t overcomb"
                }
            },
            {
                "box": {
                    "attr": "size",
                    "id": "obj-10",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 423.0, 260.0, 150.0, 22.0 ]
                }
            },
            {
                "box": {
                    "attr": "decay",
                    "id": "obj-26",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 423.0, 236.0, 150.0, 22.0 ]
                }
            },
            {
                "box": {
                    "attr": "dry",
                    "id": "obj-49",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 404.0, 203.0, 150.0, 22.0 ]
                }
            },
            {
                "box": {
                    "attr": "wet",
                    "id": "obj-50",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 404.0, 176.0, 150.0, 22.0 ]
                }
            },
            {
                "box": {
                    "attr": "modPhase",
                    "id": "obj-1",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 388.0, 145.0, 150.0, 22.0 ]
                }
            },
            {
                "box": {
                    "attr": "mod",
                    "id": "obj-2",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 388.0, 117.0, 150.0, 22.0 ]
                }
            },
            {
                "box": {
                    "attr": "predelay",
                    "id": "obj-3",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 441.0, 289.0, 150.0, 22.0 ]
                }
            },
            {
                "box": {
                    "attr": "width",
                    "id": "obj-4",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 441.0, 319.0, 150.0, 22.0 ]
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-7", 0 ],
                    "source": [ "obj-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-7", 0 ],
                    "source": [ "obj-10", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-12", 0 ],
                    "source": [ "obj-11", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-13", 0 ],
                    "source": [ "obj-12", 0 ]
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
                    "destination": [ "obj-13", 0 ],
                    "source": [ "obj-15", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-13", 0 ],
                    "source": [ "obj-16", 0 ]
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
                    "destination": [ "obj-20", 0 ],
                    "source": [ "obj-19", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-7", 0 ],
                    "source": [ "obj-2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-13", 0 ],
                    "source": [ "obj-20", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-7", 0 ],
                    "source": [ "obj-26", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-7", 0 ],
                    "source": [ "obj-3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-7", 0 ],
                    "source": [ "obj-4", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-7", 0 ],
                    "source": [ "obj-49", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-6", 0 ],
                    "source": [ "obj-5", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-7", 0 ],
                    "source": [ "obj-50", 0 ]
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
                    "destination": [ "obj-9", 1 ],
                    "source": [ "obj-7", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9", 0 ],
                    "source": [ "obj-7", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-8", 1 ],
                    "source": [ "obj-9", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-8", 0 ],
                    "source": [ "obj-9", 0 ]
                }
            }
        ],
        "parameters": {
            "obj-9": [ "live.gain~[1]", "live.gain~", 0 ],
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