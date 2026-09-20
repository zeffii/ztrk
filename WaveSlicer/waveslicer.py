#!/usr/bin/env python3

import argparse
from pathlib import Path

import librosa
import soundfile as sf
import numpy as np

import base64
import sys
import json

'''
    /*

    encoded_code = sys.argv[1]
    decoded_bytes = base64.b64decode(encoded_code)
    code_string = decoded_bytes.decode('utf-8')

    */
'''


def make_one_shots(specifications):
    # input_dir = Path(input_dir)
    # output_dir = Path(output_dir)
    # output_dir.mkdir(parents=True, exist_ok=True)

    decoded_bytes = base64.b64decode(specifications)
    json_string = decoded_bytes.decode('utf-8')
    spec_dict = json.loads(json_string)

    if not spec_dict: 
        print('No Specifications Dict Sent')
        return

    print('NodeJS->Python success: Python received json:', spec_dict)
    print("start:" , spec_dict['start'])
    print("duration:", spec_dict['duration'])
    print("output folder:", spec_dict['output_folder'])
    return

    for wav_path in input_dir.glob("*.wav"):
        print(f"Processing: {wav_path.name}")

        # this is in seconds, so must calculate from sample to seconds.
        # y, sr = librosa.load('audio.wav', offset=15.0, duration=5.0)
        # y, sr = librosa.load('audio.wav',
        #             offset=start_sample / known_sr,
        #             duration=(end_sample - start_sample) / known_sr)
        y, sr = librosa.load(wav_path, sr=None, mono=False)

        # Use mono signal for onset detection
        mono = np.mean(y, axis=0) if y.ndim > 1 else y

        # Percussive component tends to give cleaner drum/transient onsets
        percussive = librosa.effects.percussive(mono)

        # Detect transients using onset strength
        onset_env = librosa.onset.onset_strength(y=percussive, sr=sr, aggregate=np.median)
        onset_frames = librosa.onset.onset_detect(
            onset_envelope=onset_env,  sr=sr,         units="frames",
            backtrack=True,            pre_max=3,     post_max=3,
            pre_avg=3,                 post_avg=5,    delta=0.2,
            wait=3
        )

        starts = librosa.frames_to_samples(onset_frames)

        if len(starts) == 0:
            print("  No onsets found.")
            continue

        # Add end of file as final boundary
        boundaries = np.append(starts, y.shape[-1])

        for i in range(len(boundaries) - 1):
            start = boundaries[i]
            end = boundaries[i + 1]

            if end <= start:
                continue

            shot = y[..., start:end]

            # Remove very quiet material at beginning/end
            if shot.ndim > 1:
                trim_signal = np.max(np.abs(shot), axis=0)
            else:
                trim_signal = np.abs(shot)

            trimmed, trim_idx = librosa.effects.trim(trim_signal, top_db=35)

            trim_start, trim_end = trim_idx
            shot = shot[..., trim_start:trim_end]

            # Ignore extremely short slices
            if shot.shape[-1] < int(sr * 0.02):
                continue

            # 1 ms fade in/out to prevent clicks
            fade_len = min(int(sr * 0.001), shot.shape[-1] // 2)

            if fade_len > 0:
                fade_in = np.linspace(0, 1, fade_len)
                fade_out = np.linspace(1, 0, fade_len)

                if shot.ndim > 1:
                    shot[..., :fade_len] *= fade_in
                    shot[..., -fade_len:] *= fade_out
                else:
                    shot[:fade_len] *= fade_in
                    shot[-fade_len:] *= fade_out

            out_name = f"{wav_path.stem}_{i + 1:03d}.wav"
            sf.write(output_dir / out_name, shot.T if shot.ndim > 1 else shot, sr)

        print(f"  Found {len(starts)} onsets.")


if __name__ == "__main__":

    if len(sys.argv) != 2:
        print("Usage: make_one_shots(base64EncodedJson)")
        sys.exit(1)

    # sys.argv[1] should be: "eyJzdGFydCI6IDE0MDAsICJkdXJhdGlvbiI6IDIwMDAwfQ=="  # {"start": 1400, "duration": 20000}  / a base64EncodedJson
    make_one_shots(sys.argv[1])