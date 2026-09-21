#!/usr/bin/env python3

import argparse
from pathlib import Path
import librosa
import soundfile as sf
import numpy as np
import base64
import sys
import json
from scipy.signal import butter, sosfiltfilt

def highpass(signal, sr, cutoff=140, order=4):
    sos = butter(order, cutoff, btype='highpass', fs=sr, output='sos')
    return sosfiltfilt(sos, signal)

def hfc_onset_strength(y, sr, n_fft=1024, hop_length=256):
    S = np.abs(librosa.stft(y, n_fft=n_fft, hop_length=hop_length))
    freqs = np.arange(1, S.shape[0] + 1)  # linear weighting by bin index
    hfc = np.sum((freqs[:, None] ** 1) * (S ** 2), axis=0)
    hfc = hfc / (hfc.max() + 1e-9)
    return hfc

'''
from madmom.features.onsets import CNNOnsetProcessor, OnsetPeakPickingProcessor

proc = CNNOnsetProcessor()
activations = proc(str(_wav_path))
peak_picker = OnsetPeakPickingProcessor(threshold=0.3, fps=100)
onset_times = peak_picker(activations
'''

def make_one_shots(specifications):

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
    _output_dir = make_slices_folder_alongside(directory_path)
        
    # must calculate from sample to seconds.
    y, sr = librosa.load(
        _wav_path, 
        offset=_start / _known_sr, 
        duration=_duration / _known_sr)

    mono = np.mean(y, axis=0) if y.ndim > 1 else y   # onset detection detection in mono form.
    filtered = highpass(mono, sr, cutoff=140)
    percussive = librosa.effects.percussive(filtered)    # specific qualites of percussive

    # mono = np.mean(y, axis=0) if y.ndim > 1 else y   # onset detection detection in mono form.
    # percussive = librosa.effects.percussive(mono)    # specific qualites of percussive
    percussive = librosa.effects.percussive(mono, margin=3.0)  # stronger HPSS separation

    # Detect transients using onset strength
    # onset_env = librosa.onset.onset_strength(y=percussive, sr=sr, aggregate=np.median)
    # onset_env = onset_env / (onset_env.max() + 1e-9)  # normalize so delta is level-independent
    onset_env = hfc_onset_strength(percussive, sr)
    onset_frames = librosa.onset.onset_detect(
        onset_envelope=onset_env,  sr=sr,         units="frames",
        backtrack=True,            pre_max=3,     post_max=3,
        pre_avg=3,                 post_avg=5,    delta=0.2,
        wait=3
    )

    starts = librosa.frames_to_samples(onset_frames)

    if len(starts) == 0:
        print("  No onsets found.")
        return

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

        out_name = f"{_wav_path.stem}_{i + 1:03d}.wav"
        sf.write(_output_dir / out_name, shot.T if shot.ndim > 1 else shot, sr)

    print(f"  Found {len(starts)} onsets.")


if __name__ == "__main__":

    if len(sys.argv) != 2:
        print("Usage: make_one_shots(base64EncodedJson)")
        sys.exit(1)

    # sys.argv[1] should be: "eyJzdGFydCI6IDE0MDAsICJkdXJhdGlvbiI6IDIwMDAwfQ=="  # {"start": 1400, "duration": 20000}  / a base64EncodedJson
    make_one_shots(sys.argv[1])