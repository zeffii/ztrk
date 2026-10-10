{
    "patcher": {
        "fileversion": 1,
        "appversion": {
            "major": 9,
            "minor": 2,
            "revision": 0,
            "architecture": "x64",
            "modernui": 1
        },
        "classnamespace": "box",
        "rect": [ 765.0, 85.0, 1081.0, 1265.0 ],
        "boxes": [
            {
                "box": {
                    "id": "obj-34",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 466.0, 67.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-29",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 381.0, 92.0, 63.0, 22.0 ],
                    "text": "metro 400"
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
                    "patching_rect": [ 381.0, 126.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-21",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 381.0, 163.0, 39.0, 22.0 ],
                    "text": "click~"
                }
            },
            {
                "box": {
                    "id": "obj-31",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 381.0, 62.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-32",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 408.0, 62.0, 31.0, 22.0 ],
                    "text": "stop"
                }
            },
            {
                "box": {
                    "code": "autowatch = 1;\r\noutlets = 1;\r\ninlets = 1;\r\n\r\nfunction find_codebox_in_patcher_json(patcher, machine_name){\r\n    if (!patcher || !patcher.boxes) return null;\r\n\r\n    for (var i = 0; i < patcher.boxes.length; i++){\r\n        var b = patcher.boxes[i].box;\r\n        if (!b) continue;\r\n\r\n        // direct codebox\r\n        if (typeof b.code === \"string\" && b.code.indexOf(\"// #!\") === 0){\r\n            var first_line = b.code.split(/\\r?\\n/)[0].trim();\r\n            if (first_line === `// #!${machine_name}`){\r\n                return b.code;\r\n            }\r\n        }\r\n\r\n        // nested patcher (gen~, poly~, subpatch, etc.)\r\n        if (b.patcher){\r\n            var inner = find_codebox_in_patcher_json(b.patcher, machine_name);\r\n            if (inner) return inner;\r\n        }\r\n    }\r\n    return null;\r\n}\r\n\r\nfunction extract_codebox_from_maxpat(text, machine_name){\r\n    var data;\r\n    try { data = JSON.parse(text); }\r\n    catch(e){ post(\"bad json:\", e, \"\\n\"); return null; }\r\n\r\n    return find_codebox_in_patcher_json(data.patcher, machine_name);\r\n}\r\n\r\nfunction bang(){\r\n    var path = this.patcher.filepath;\r\n    post(\"path:\", path, \"\\n\");\r\n\r\n    var f = new File(path, \"read\");\r\n    post(\"isopen:\", f.isopen, \"err:\", f.error, \"\\n\");\r\n    if (!f.isopen) return;\r\n\r\n    var text = \"\";\r\n    var remaining = f.eof;\r\n    while (remaining > 0){\r\n        var to_read = Math.min(16000, remaining);\r\n        text += f.readstring(to_read);\r\n        remaining -= to_read;\r\n    }\r\n    f.close();\r\n\r\n    post(\"first 40 chars:\", JSON.stringify(text.substring(0, 40)), \"\\n\");\r\n    const machine_name = \"Kick3\";\r\n    extract_codebox_from_maxpat(text, machine_name);\r\n}",
                    "filename": "none",
                    "fontface": 0,
                    "fontname": "<Monospaced>",
                    "fontsize": 12.0,
                    "id": "obj-28",
                    "maxclass": "v8.codebox",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 720.0, 358.0, 840.0, 838.0 ],
                    "saved_object_attributes": {
                        "parameter_enable": 0
                    }
                }
            },
            {
                "box": {
                    "code": "include(\"ztrk_general_utils\");\r\n\r\nautowatch = 1;\r\noutlets = 2;\r\ninlets = 2;\r\n\r\nfunction bang(){\r\n    var MachineName = \"Kick3\";\r\n    var machine_subpatcher = this.patcher;\r\n    attach_attrui_to_gen(machine_subpatcher, MachineName);\r\n}",
                    "filename": "none",
                    "fontface": 0,
                    "fontname": "<Monospaced>",
                    "fontsize": 12.0,
                    "id": "obj-128",
                    "maxclass": "v8.codebox",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 720.0, 97.0, 756.0, 194.0 ],
                    "saved_object_attributes": {
                        "parameter_enable": 0
                    }
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-127",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 7.0, 597.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "embed": 0,
                    "filename": "Kick3_UI.js",
                    "id": "obj-125",
                    "maxclass": "v8ui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 37.0, 681.0, 465.43209876543204, 439.5061728395061 ],
                    "textfile": {
                        "filename": "Kick3_UI.js",
                        "flags": 0,
                        "embed": 0,
                        "autowatch": 1
                    }
                }
            },
            {
                "box": {
                    "id": "obj-27",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 527.0, 71.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-14",
                    "maxclass": "live.scope~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 46.0, 65.0, 170.0, 205.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-10",
                    "lastchannelcount": 0,
                    "maxclass": "live.gain~",
                    "numinlets": 2,
                    "numoutlets": 5,
                    "orientation": 1,
                    "outlettype": [ "signal", "signal", "", "float", "list" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 262.0, 370.0, 162.0, 47.0 ],
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
                    "maxclass": "ezdac~",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [ 258.0, 463.0, 45.0, 45.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-5",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 265.0, 223.0, 39.0, 22.0 ],
                    "text": "click~"
                }
            },
            {
                "box": {
                    "id": "obj-4",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 269.0, 167.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-1",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patcher": {
                        "fileversion": 1,
                        "appversion": {
                            "major": 9,
                            "minor": 2,
                            "revision": 0,
                            "architecture": "x64",
                            "modernui": 1
                        },
                        "classnamespace": "dsp.gen",
                        "rect": [ 977.0, 138.0, 896.0, 1196.0 ],
                        "boxes": [
                            {
                                "box": {
                                    "code": "// #!Kick3\r\n// === Improved Kick Skeleton ===\r\n// Bezier pitch curve + Click/Noise layer\r\n// Inlet 1 = trigger\r\n\r\n// --- PITCH ENV ---\r\nParam start_freq(130);       // (type=hz, default=130, scale=[20,400])\r\nParam end_freq(38);          // (type=hz, default=38, scale=[20,200])\r\nParam pitch_time(0.22);      // (type=s, default=0.22, scale=[0.01,2], log)\r\nParam curve(0.65);           // (type=coeff, default=0.65, scale=[0,1])\r\n\r\n// --- AMP ENV ---\r\nParam amp_decay(0.42);       // (type=s, default=0.42, scale=[0.01,4], log)\r\n\r\n// --- OSCILLATOR ---\r\nParam wave_mix(0.35);        // (type=coeff, default=0.35, scale=[0,1])\r\n\r\n// --- CLICK / NOISE LAYER ---\r\nParam click_amount(0.45);    // (type=coeff, default=0.45, scale=[0,1])\r\nParam click_decay(0.018);    // (type=s, default=0.018, scale=[0.001,0.2], log)\r\nParam noise_color(0.6);      // (type=coeff, default=0.6, scale=[0,1])\r\n\r\n// --- OUTPUT ---\r\nParam gain(0.85);            // (type=coeff, default=0.85, scale=[0,1.5])\r\n\r\nHistory phase(0);\r\nHistory pitch_env(0);\r\nHistory amp_env(0);\r\nHistory click_env(0);\r\nHistory trig(0);\r\nHistory noise_state(0.12345);   // simple noise seed\r\n\r\n// --- Trigger ---\r\nt = in1 > 0.5 && trig <= 0.5;\r\ntrig = in1 > 0.5;\r\n\r\nif (t) {\r\n    phase = 0;\r\n    pitch_env = 1;\r\n    amp_env = 1;\r\n    click_env = 1;\r\n}\r\n\r\n// 1. BEZIER-STYLE PITCH ENVELOPE\r\n// quadratic Bezier-like curve controlled by 'curve'\r\n// curve: 0=linear, 1=strong ease-out (fast start, slow end)\r\np = 1 - pitch_env;                             // progress 0 → 1\r\n\r\ncp = mix(0.5, 0.15, curve); // move control pt, (higher = more pronounced fast start) \r\n\r\nshaped = (1-p)*(1-p)*0 + 2*(1-p)*p*cp + p*p*1; // quad wave approx\r\nfreq = mix(start_freq, end_freq, shaped);      // modify freq by shape\r\npitch_env *= exp(-1.0 / (pitch_time * samplerate)); // Advance pitch envelope\r\n\r\n// 2. AMP ENV\r\namp_env *= exp(-1.0 / (amp_decay * samplerate));\r\n\r\n// 3. OSCILLATOR (Sine ↔ Overtones)\r\nphase += freq / samplerate;\r\nphase -= floor(phase);\r\nsine = sin(phase * twopi);\r\n\r\n// overtones (faint triangle + saturation)\r\ntri = abs(phase * 4 - 2) - 1;\r\novertones = tanh(tri * 1.7) * 0.65 + sine * 0.35;\r\nosc = mix(sine, overtones, wave_mix);\r\n\r\n// 4. CLICK + NOISE LAYER\r\nclick_env *= exp(-1.0 / (click_decay * samplerate));\r\nnoise_state = (noise_state * 1103515245 + 12345) % 4294967296;  // Simple noise\r\nnoise = (noise_state / 2147483648.0) - 1;                       // -1 to 1\r\nnoise = noise * mix(0.4, 1.0, noise_color);                     // noise brightness\r\n\r\n// Short pulse + noise\r\nclick = (click_env * click_env) * 0.7 + noise * click_env * 0.5;\r\nclick *= click_amount;\r\n\r\nout1 = (osc * amp_env + click) * gain;",
                                    "fontface": 0,
                                    "fontname": "<Monospaced>",
                                    "fontsize": 12.0,
                                    "id": "obj-5",
                                    "maxclass": "codebox",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 50.0, 56.0, 741.0, 969.0 ]
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
                                    "patching_rect": [ 50.0, 1053.0, 35.0, 22.0 ],
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
                    "patching_rect": [ 266.0, 307.0, 102.0, 22.0 ],
                    "text": "gen~ @title Kick3",
                    "varname": "Kick3_gen"
                }
            },
            {
                "box": {
                    "attr": "start_freq",
                    "id": "obj-3",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "paramonly": 1,
                    "patching_rect": [ 46.0, 307.0, 200.0, 22.0 ]
                }
            },
            {
                "box": {
                    "attr": "end_freq",
                    "id": "obj-7",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "paramonly": 1,
                    "patching_rect": [ 46.0, 335.0, 200.0, 22.0 ]
                }
            },
            {
                "box": {
                    "attr": "pitch_time",
                    "id": "obj-11",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "paramonly": 1,
                    "patching_rect": [ 46.0, 363.0, 200.0, 22.0 ]
                }
            },
            {
                "box": {
                    "attr": "curve",
                    "id": "obj-13",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "paramonly": 1,
                    "patching_rect": [ 46.0, 391.0, 200.0, 22.0 ]
                }
            },
            {
                "box": {
                    "attr": "amp_decay",
                    "id": "obj-16",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "paramonly": 1,
                    "patching_rect": [ 46.0, 419.0, 200.0, 22.0 ]
                }
            },
            {
                "box": {
                    "attr": "wave_mix",
                    "id": "obj-18",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "paramonly": 1,
                    "patching_rect": [ 46.0, 447.0, 200.0, 22.0 ]
                }
            },
            {
                "box": {
                    "attr": "click_amount",
                    "id": "obj-20",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "paramonly": 1,
                    "patching_rect": [ 46.0, 475.0, 200.0, 22.0 ]
                }
            },
            {
                "box": {
                    "attr": "click_decay",
                    "id": "obj-22",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "paramonly": 1,
                    "patching_rect": [ 46.0, 503.0, 200.0, 22.0 ]
                }
            },
            {
                "box": {
                    "attr": "noise_color",
                    "id": "obj-24",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "paramonly": 1,
                    "patching_rect": [ 46.0, 531.0, 200.0, 22.0 ]
                }
            },
            {
                "box": {
                    "attr": "gain",
                    "id": "obj-26",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "paramonly": 1,
                    "patching_rect": [ 46.0, 559.0, 200.0, 22.0 ]
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-10", 1 ],
                    "order": 0,
                    "source": [ "obj-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-10", 0 ],
                    "order": 1,
                    "source": [ "obj-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-14", 0 ],
                    "midpoints": [ 275.5, 330.0, 261.0, 330.0, 261.0, 255.0, 260.0, 255.0, 260.0, 51.0, 55.5, 51.0 ],
                    "order": 2,
                    "source": [ "obj-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9", 1 ],
                    "source": [ "obj-10", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9", 0 ],
                    "source": [ "obj-10", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "source": [ "obj-11", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-125", 0 ],
                    "source": [ "obj-127", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "source": [ "obj-13", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "source": [ "obj-16", 0 ]
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
                    "source": [ "obj-20", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "source": [ "obj-21", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "source": [ "obj-22", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "source": [ "obj-24", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "source": [ "obj-26", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-28", 0 ],
                    "source": [ "obj-27", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-30", 0 ],
                    "source": [ "obj-29", 0 ]
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
                    "destination": [ "obj-21", 0 ],
                    "source": [ "obj-30", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-29", 0 ],
                    "source": [ "obj-31", 0 ]
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
                    "destination": [ "obj-29", 1 ],
                    "source": [ "obj-34", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 0 ],
                    "source": [ "obj-4", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "source": [ "obj-5", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "source": [ "obj-7", 0 ]
                }
            }
        ],
        "parameters": {
            "obj-10": [ "live.gain~", "live.gain~", 0 ],
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