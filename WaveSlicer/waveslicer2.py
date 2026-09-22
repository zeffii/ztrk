#!/usr/bin/env python3

import os
import argparse
import sys
import base64
import json
import soundfile as sf
from typing import Tuple, Optional

from pathlib import Path
import librosa
import numpy as np
from scipy.signal import butter, sosfiltfilt

def output_to_max(msg):
    # max is reading the print output.. i'm wrapping this so i remember that these 
    # print statements are not debug statements, but a way for the script to communicate back to max.
    print(msg)

def multi_band_onset_samples(
    y,
    sr,
    hop_length=256,
    delta=0.055,          # a bit more sensitive
    wait=8,
    backtrack=True,
    pad_ms=50,            # ← key for the first hits
):
    # 1. Pad a little silence so the detector has context
    pad_samples = int(pad_ms * sr / 1000)
    y_padded = np.pad(y, (pad_samples, 0))

    # 2. Multi-band onset strength
    S = np.abs(librosa.stft(y_padded, n_fft=2048, hop_length=hop_length))
    freqs = librosa.fft_frequencies(sr=sr, n_fft=2048)

    low  = S[(freqs >= 20)  & (freqs < 250)].mean(0, keepdims=True)
    mid  = S[(freqs >= 250) & (freqs < 4000)].mean(0, keepdims=True)
    high = S[(freqs >= 4000)].mean(0, keepdims=True)

    env_low  = librosa.onset.onset_strength(S=low,  hop_length=hop_length)
    env_mid  = librosa.onset.onset_strength(S=mid,  hop_length=hop_length)
    env_high = librosa.onset.onset_strength(S=high, hop_length=hop_length)

    onset_env = np.maximum.reduce([env_low, env_mid, env_high])

    # 3. Detect
    frames = librosa.onset.onset_detect(
        onset_envelope=onset_env,
        sr=sr,
        hop_length=hop_length,
        delta=delta,
        wait=wait,
        backtrack=backtrack,
        pre_max=2,      # smaller → reacts faster at the start
        post_max=2,
        pre_avg=2,
        post_avg=3,
        units="frames",
    )

    samples = librosa.frames_to_samples(frames, hop_length=hop_length)

    # 4. Remove the padding offset
    samples = samples - pad_samples
    samples = samples[samples >= 0]          # drop any that fell into the pad

    # Optional: force a hit at the very beginning if the signal starts loud
    if len(y) > 0 and np.max(np.abs(y[:int(0.05*sr)])) > 0.15:
        if len(samples) == 0 or samples[0] > int(0.03 * sr):
            samples = np.insert(samples, 0, 0)

    return samples

def make_one_shots(specifications):
    """
    Slice a drum loop and return the onset sample indices.
    Returns: 
        onset_samples : np.ndarray
            Absolute sample indices of every detected onset (after backtracking).

    Situation                               What to adjust
    ===============================================================================
    Missing quiet ghost notes               Lower delta (0.04–0.08)   or if missing hits onsets (0.05–0.06)
    Double-triggering on long cymbals       Increase wait or post_avg
    Cuts start a bit late                   Keep backtrack=True (default)
    Cuts start too early / noisy            Increase pre_roll_ms or lower delta
    Very tight 16th-note loops              Smaller hop_length (128–256)
    Dense overlapping hits                  Multi-band onset
    first few hits have weak detection      pre_max / pre_avg


    """

    decoded_bytes = base64.b64decode(specifications)
    json_string = decoded_bytes.decode('utf-8')
    spec_dict = json.loads(json_string)

    if not spec_dict: 
        print('No Specifications Dict Sent')
        return

    print("NodeJS->Python success: Python received json:")
    for key, value in spec_dict.items():
        print(key, value)

    _start = int(spec_dict['start'])
    _duration = int(spec_dict['duration'])
    _known_sr = int(spec_dict['sample_rate'])
    _wav_path = Path(spec_dict['filepath'])
    directory_path = _wav_path.parent

    def make_slices_folder_alongside(directory_path):
        # Create the 'Slices' folder in that directory
        proposed_slices_path = (directory_path / 'Slices')
        proposed_slices_path.mkdir(parents=True, exist_ok=True)
        return proposed_slices_path

    # _output_dir = spec_dict.get("output_dir", make_slices_folder_alongside(directory_path))
    output_dir = make_slices_folder_alongside(directory_path)
        
    defaults = {
        "hop_length": 256,        # int
        "pre_max": 3,             # int
        "post_max": 3,            # int
        "pre_avg": 3,             # int
        "post_avg": 5,            # int
        "delta": 0.07,            # float
        "wait": 10,               # int
        "backtrack": True,        # bool
        "min_hit_duration": 0.04, # float
        "pre_roll_ms": 5,         # float
        "fade_ms": 3,             # float
        "use_hpss": True,         # bool
        "save_wavs": True,        # bool
        "multiband_onset": False  # bool
    }

    merged = {**defaults, **spec_dict}

    # aliases
    hop_length = merged["hop_length"]
    use_hpss = merged["use_hpss"]

    # gets sample rate automagically.    
    y, sr = librosa.load(_wav_path, sr=None, mono=True)
    # y, sr = librosa.load(_wav_path, sr=_known_sr, offset=_start / _known_sr, duration=_duration / _known_sr, mono=True)

    y_analysis = librosa.effects.percussive(y) if use_hpss else y

    if merged['multiband_onset']:

        S = np.abs(librosa.stft(y_analysis, hop_length=hop_length))
        freqs = librosa.fft_frequencies(sr=sr)

        low  = S[(freqs >= 20)  & (freqs < 250)].mean(axis=0)
        mid  = S[(freqs >= 250) & (freqs < 4000)].mean(axis=0)
        high = S[(freqs >= 4000)].mean(axis=0)

        onset_env = np.maximum.reduce([
            librosa.onset.onset_strength(S=low[np.newaxis, :],  hop_length=hop_length),
            librosa.onset.onset_strength(S=mid[np.newaxis, :],  hop_length=hop_length),
            librosa.onset.onset_strength(S=high[np.newaxis, :], hop_length=hop_length),
        ])

    else:
        onset_env = librosa.onset.onset_strength(
            y=y_analysis, sr=sr, hop_length=hop_length, aggregate=np.median
        )


    onset_frames = librosa.onset.onset_detect(
        onset_envelope=onset_env,
        sr=sr,
        hop_length=merged["hop_length"],
        backtrack=merged["backtrack"],
        delta=merged["delta"],
        wait=merged["wait"],
        pre_max=merged["pre_max"],
        post_max=merged["post_max"],
        pre_avg=merged["pre_avg"],
        post_avg=merged["post_avg"],
        units="frames",
    )

    onset_samples = librosa.frames_to_samples(onset_frames, hop_length=merged["hop_length"])

    # Optional: save the individual hits
    # if save_wavs and output_dir is not None:
    #     Path(output_dir).mkdir(parents=True, exist_ok=True)
    #     boundaries = np.concatenate([onset_samples, [len(y)]])
    #     pre_roll = int(pre_roll_ms * sr / 1000)
    #     fade_samples = int(fade_ms * sr / 1000)

    #     saved = 0
    #     for i in range(len(boundaries) - 1):
    #         start = max(0, boundaries[i] - pre_roll)
    #         end = boundaries[i + 1]

    #         if (end - start) / sr < min_hit_duration:
    #             continue

    #         hit = y[start:end].copy()

    #         if fade_samples > 0 and len(hit) > 2 * fade_samples:
    #             hit[:fade_samples] *= np.linspace(0, 1, fade_samples)
    #             hit[-fade_samples:] *= np.linspace(1, 0, fade_samples)

    #         peak = np.max(np.abs(hit))
    #         if peak > 0:
    #             hit *= 0.95 / peak

    #         sf.write(os.path.join(output_dir, f"hit_{saved:03d}.wav"), hit, sr)
    #         saved += 1

    #         ### out_name = f"{_wav_path.stem}_{i + 1:03d}.wav"
    #         ### sf.write(_output_dir / out_name, shot.T if shot.ndim > 1 else shot, sr)
    #     print(f"Saved {saved} hits → {output_dir}/")

    payload = {"onsets": onset_samples.tolist()}
    json_string = json.dumps(payload)
    encoded = base64.b64encode(json_string.encode("utf-8"))
    print(payload)
    
    # this can be read by js.
    output_to_max("JSON: " + encoded.decode("ascii"))

    # return onset_samples

if __name__ == "__main__":

    if len(sys.argv) != 2:
        print("Usage: make_one_shots(base64EncodedJson)")
        sys.exit(1)

    # sys.argv[1] should be a token like: "eyJzdGFydCI6IDE0MDAsICJkdXJhdGlvbiI6IDIwMDAwfQ=="  
    # a base64EncodedJson of something like {"start": 1400, "duration": 20000, ....etc}
    make_one_shots(sys.argv[1])