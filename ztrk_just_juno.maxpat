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
        "rect": [ 1480.0, 219.0, 935.0, 704.0 ],
        "boxes": [
            {
                "box": {
                    "id": "obj-11",
                    "maxclass": "ezdac~",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [ 467.0, 471.0, 45.0, 45.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-10",
                    "lastchannelcount": 0,
                    "maxclass": "live.gain~",
                    "numinlets": 2,
                    "numoutlets": 5,
                    "outlettype": [ "signal", "signal", "", "float", "list" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 467.0, 316.0, 48.0, 136.0 ],
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
                    "maxclass": "live.scope~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 140.0, 531.0, 184.0, 68.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-8",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 104.0, 143.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-6",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 120.0, 263.0, 31.0, 22.0 ],
                    "text": "sig~"
                }
            },
            {
                "box": {
                    "id": "obj-4",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 173.0, 263.0, 31.0, 22.0 ],
                    "text": "sig~"
                }
            },
            {
                "box": {
                    "id": "obj-3",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 173.0, 329.0, 39.0, 22.0 ],
                    "text": "mtof~"
                }
            },
            {
                "box": {
                    "id": "obj-2",
                    "maxclass": "kslider",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "int", "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 173.0, 176.0, 336.0, 53.0 ]
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
                            "revision": 5,
                            "architecture": "x64",
                            "modernui": 1
                        },
                        "classnamespace": "box",
                        "rect": [ 793.0, 461.0, 1000.0, 780.0 ],
                        "boxes": [
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-7",
                                    "index": 2,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 239.0, 312.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-6",
                                    "index": 1,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 177.0, 312.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-5",
                                    "index": 2,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 239.0, 97.0, 30.0, 30.0 ]
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
                                    "patching_rect": [ 177.0, 97.0, 30.0, 30.0 ]
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
                                            "revision": 5,
                                            "architecture": "x64",
                                            "modernui": 1
                                        },
                                        "classnamespace": "dsp.gen",
                                        "rect": [ 724.0, 198.0, 1486.0, 1141.0 ],
                                        "boxes": [
                                            {
                                                "box": {
                                                    "id": "obj-6",
                                                    "maxclass": "newobj",
                                                    "numinlets": 1,
                                                    "numoutlets": 0,
                                                    "patching_rect": [ 868.0, 1107.0, 35.0, 22.0 ],
                                                    "text": "out 2"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "code": "\r\n// Juno-06-style monophonic synth — DCO/HPF/VCF/ENV/VCA/LFO\r\n// in1 = gate (>0.5 = note on, sustained while held)\r\n// in2 = pitch in Hz\r\n\r\n// --- DCO ---\r\nParam saw(0.7);            // (type=coeff, default=0.7, scale=[0,1])\r\nParam pulse(0.0);          // (type=coeff, default=0.0, scale=[0,1])\r\nParam sub(0.3);            // (type=coeff, default=0.3, scale=[0,1])\r\nParam noiseLvl(0.0);       // (type=coeff, default=0.0, scale=[0,1])\r\nParam pwm(0.5);            // (type=coeff, default=0.5, scale=[0,1])\r\nParam pwmLfoDepth(0.0);    // (type=coeff, default=0.0, scale=[0,1])\r\nParam range(0);            // (type=semitones, default=0, scale=[-24,24])\r\n\r\n// --- HPF ---\r\nParam hpfCutoff(40);       // (type=hz, default=40, scale=[20,2000], log)\r\n\r\n// --- VCF ---\r\nParam cutoff(1200);        // (type=hz, default=1200, scale=[40,10000], log)\r\nParam resonance(0.3);      // (type=coeff, default=0.3, scale=[0,1])\r\nParam envAmount(0.0);      // (type=bipolar, default=0.0, scale=[-1,1])\r\nParam lfoDepth(0.0);       // (type=coeff, default=0.0, scale=[0,1])\r\nParam keyTrack(0.3);       // (type=coeff, default=0.3, scale=[0,1])\r\n\r\n// --- ENV (shared ADSR: drives VCF always, VCA if envMode) ---\r\nParam attack(0.005);       // (type=s, default=0.005, scale=[0.001,4], log)\r\nParam decayT(0.3);         // (type=s, default=0.3, scale=[0.001,8], log)\r\nParam sustain(0.6);        // (type=coeff, default=0.6, scale=[0,1])\r\nParam release(0.3);        // (type=s, default=0.3, scale=[0.001,8], log)\r\n\r\n// --- VCA ---\r\nParam level(0.8);          // (type=coeff, default=0.8, scale=[0,1])\r\nParam envMode(1);          // (type=bool, default=1, scale=[0,1])\r\n\r\n// --- LFO ---\r\nParam lfoRate(5.0);        // (type=hz, default=5.0, scale=[0.05,20], log)\r\nParam lfoDelay(0.0);       // (type=s, default=0.0, scale=[0,4], log)\r\n\r\n// --- persistent state ---\r\nHistory gate_prev(0);\r\nHistory envStage(0), env(0);\r\nHistory dcoPhase(0), subPhase(0), lfoPhase(0), lfoDelayRamp(0);\r\nHistory hpfState(0);\r\nHistory vcf1(0), vcf2(0), vcf3(0), vcf4(0);\r\nHistory vcaSmooth(0);\r\n\r\n// =========================================================\r\n// --- trigger / gate ---\r\n// =========================================================\r\ntrigOn  = in1 > 0.5 && gate_prev <= 0.5;\r\ntrigOff = in1 <= 0.5 && gate_prev > 0.5;\r\ngate_prev = in1;\r\n\r\n// =========================================================\r\n// --- shared ADSR envelope ---\r\n// =========================================================\r\natkCoeff = exp(-1 / (attack * samplerate));\r\ndecCoeff = exp(-1 / (decayT * samplerate));\r\nrelCoeff = exp(-1 / (release * samplerate));\r\n\r\nif (trigOn) { envStage = 1; }\r\nif (trigOff) { envStage = 4; }\r\n\r\nif (envStage == 1) {\r\n    env = env + (1.0 - env) * (1 - atkCoeff);\r\n    if (env >= 0.999) { envStage = 2; env = 1.0; }\r\n} else if (envStage == 2) {\r\n    env = env + (sustain - env) * (1 - decCoeff);\r\n    if (env <= sustain + 0.001) { envStage = 3; env = sustain; }\r\n} else if (envStage == 3) {\r\n    env = sustain;\r\n} else if (envStage == 4) {\r\n    env = env + (0.0 - env) * (1 - relCoeff);\r\n    if (env <= 0.0005) { envStage = 0; env = 0.0; }\r\n} else {\r\n    env = 0.0;\r\n}\r\n\r\n// =========================================================\r\n// --- LFO (shared source, with delay-ramp fade-in per note) ---\r\n// =========================================================\r\nif (trigOn) { lfoDelayRamp = 0; }\r\n\r\nlfoPhase = lfoPhase + lfoRate / samplerate;\r\nif (lfoPhase > 1) lfoPhase = lfoPhase - 1;\r\nlfoSineRaw = sin(lfoPhase * twopi);\r\n\r\nlfoDelayInc = lfoDelay > 0.0005 ? (1.0 / (lfoDelay * samplerate)) : 1.0;\r\nlfoDelayRamp = lfoDelayRamp + lfoDelayInc;\r\nif (lfoDelayRamp > 1) lfoDelayRamp = 1;\r\n\r\nlfoSine = lfoSineRaw * lfoDelayRamp;\r\n\r\n// =========================================================\r\n// --- DCO ---\r\n// =========================================================\r\nfinalPitch = in2 * pow(2, range / 12);\r\n\r\ndcoPhase = dcoPhase + finalPitch / samplerate;\r\nif (dcoPhase > 1) dcoPhase = dcoPhase - 1;\r\nsawWave = dcoPhase * 2 - 1;\r\n\r\npwmMod = pwm + pwmLfoDepth * lfoSine * 0.5;\r\npwmMod = pwmMod < 0.05 ? 0.05 : (pwmMod > 0.95 ? 0.95 : pwmMod);\r\npulseWave = dcoPhase < pwmMod ? 1 : -1;\r\n\r\nsubPhase = subPhase + (finalPitch / 2) / samplerate;\r\nif (subPhase > 1) subPhase = subPhase - 1;\r\nsubWave = subPhase < 0.5 ? 1 : -1;\r\n\r\nnoiseWave = noise() * 2 - 1;\r\n\r\ndcoMix = saw * sawWave + pulse * pulseWave + sub * subWave + noiseLvl * noiseWave;\r\n\r\n// =========================================================\r\n// --- HPF (one-pole, same trick as the snare's lowcut) ---\r\n// =========================================================\r\nhpfCoeff = exp(-2 * pi * hpfCutoff / samplerate);\r\nhpfState = dcoMix + hpfCoeff * (hpfState - dcoMix);\r\nhpfOut = dcoMix - hpfState;\r\n\r\n// =========================================================\r\n// --- VCF (Moog-approximation: 4-stage one-pole cascade + feedback) ---\r\n// =========================================================\r\nrefPitch = 261.6256; // C4 — key-tracking reference\r\n\r\nkeyTrackOct = keyTrack * log2(finalPitch / refPitch);\r\nenvOct = envAmount * env * 4.0;      // up to +/-4 octaves at extremes\r\nlfoOct = lfoDepth * lfoSine * 2.0;   // up to +/-2 octaves at full depth\r\n\r\ncutoffFinal = cutoff * pow(2, keyTrackOct + envOct + lfoOct);\r\ncutoffFinal = cutoffFinal < 20 ? 20 : (cutoffFinal > samplerate * 0.45 ? samplerate * 0.45 : cutoffFinal);\r\n\r\ng = 1 - exp(-2 * pi * cutoffFinal / samplerate);\r\nfb = resonance * 4.0;\r\n\r\nstage0_in = hpfOut - fb * vcf4;\r\nvcf1 = vcf1 + g * (stage0_in - vcf1);\r\nvcf2 = vcf2 + g * (vcf1 - vcf2);\r\nvcf3 = vcf3 + g * (vcf2 - vcf3);\r\nvcf4 = vcf4 + g * (vcf3 - vcf4);\r\n\r\n// =========================================================\r\n// --- VCA ---\r\n// =========================================================\r\nvcaTarget = envMode > 0.5 ? env : (in1 > 0.5 ? 1.0 : 0.0);\r\nvcaSmoothCoeff = exp(-1 / (0.002 * samplerate)); // fixed 2ms anti-click smoothing\r\nvcaSmooth = vcaSmooth + (vcaTarget - vcaSmooth) * (1 - vcaSmoothCoeff);\r\n\r\nshaped = tanh(vcf4 * vcaSmooth * level * 1.2) * 0.9;\r\n\r\nout1 = shaped;\r\nout2 = shaped;",
                                                    "fontface": 0,
                                                    "fontname": "<Monospaced>",
                                                    "fontsize": 12.0,
                                                    "id": "obj-5",
                                                    "maxclass": "codebox",
                                                    "numinlets": 2,
                                                    "numoutlets": 2,
                                                    "outlettype": [ "", "" ],
                                                    "patching_rect": [ 50.0, 61.0, 837.0, 1009.0 ]
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
                                                    "patching_rect": [ 672.0, 14.0, 28.0, 22.0 ],
                                                    "text": "in 2"
                                                }
                                            },
                                            {
                                                "box": {
                                                    "id": "obj-4",
                                                    "maxclass": "newobj",
                                                    "numinlets": 1,
                                                    "numoutlets": 0,
                                                    "patching_rect": [ 50.0, 1107.0, 35.0, 22.0 ],
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
                                    "patching_rect": [ 177.0, 219.0, 81.0, 22.0 ],
                                    "text": "gen~ JunoXP"
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
                                    "destination": [ "obj-7", 0 ],
                                    "source": [ "obj-1", 1 ]
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
                                    "destination": [ "obj-1", 1 ],
                                    "source": [ "obj-5", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 120.0, 436.0, 72.0, 22.0 ],
                    "text": "p JunoSim6"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-10", 1 ],
                    "source": [ "obj-1", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-10", 0 ],
                    "order": 0,
                    "source": [ "obj-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9", 0 ],
                    "order": 1,
                    "source": [ "obj-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-11", 1 ],
                    "source": [ "obj-10", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-11", 0 ],
                    "source": [ "obj-10", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-4", 0 ],
                    "source": [ "obj-2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 1 ],
                    "source": [ "obj-3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-3", 0 ],
                    "source": [ "obj-4", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "source": [ "obj-6", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-6", 0 ],
                    "source": [ "obj-8", 0 ]
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