import numpy as np
import pyroomacoustics as pra
from scipy.signal import fftconvolve
import soundfile as sf
import matplotlib.pyplot as plt

# 1. Room + materials
fs = 48000
room_dim = [8.0, 6.0, 3.2]          # metres [x, y, z]

# Different materials (you can make these much more detailed)
materials = pra.make_materials(
    ceiling=0.25,
    floor=0.40,          # e.g. carpet / grass-like
    east=0.15,
    west=0.15,
    north=0.12,
    south=0.12,
)

room = pra.ShoeBox(
    room_dim,
    fs=fs,
    materials=materials,
    max_order=4,             # image-source order
    ray_tracing=True,        # better late reverberation
    air_absorption=True,
)

# 2. Source (impulse location)
source_pos = np.array([2.5, 4.0, 1.6])   # x, y, height
room.add_source(source_pos)

# 3. Listener pose → stereo ear positions
listener_pos   = np.array([5.5, 2.5, 1.7])   # centre of head
ear_distance   = 0.18                        # metres (typical ~17–18 cm)
# Direction the listener is facing (will be normalized)
forward = np.array([0.0, 1.0, 0.0])          # looking along +Y

forward = forward / np.linalg.norm(forward)
up = np.array([0.0, 0.0, 1.0])
right = np.cross(forward, up)
right /= np.linalg.norm(right)

left_ear  = listener_pos - 0.5 * ear_distance * right
right_ear = listener_pos + 0.5 * ear_distance * right

# Add the two ears as microphones
room.add_microphone_array(
    pra.MicrophoneArray(np.c_[left_ear, right_ear], fs)
)

# 4. Simulate
room.set_ray_tracing(n_rays=20000, receiver_radius=0.5)  # tune as needed
room.compute_rir()

# room.rir[mic_index][source_index]
left_ir  = room.rir[0][0]
right_ir = room.rir[1][0]

print(f"IR length: {len(left_ir)/fs:.2f} s")


# 5. (Optional but recommended) Apply HRTF
# For a first version the two geometric IRs already give you
# good interaural time/level differences.
# For proper pinna + elevation cues you apply HRTFs.

def apply_simple_hrtf(left_ir, right_ir, fs):
    """
    Placeholder for real HRTF processing.
    Replace this with SOFA-based filtering for production use.
    """
    # Example: mild high-shelf difference to simulate rough pinna effect
    # (this is only illustrative – use real HRTFs later)
    return left_ir, right_ir


left_bir, right_bir = apply_simple_hrtf(left_ir, right_ir, fs)

# 6. Save / listen
# Stack to stereo
stereo_ir = np.stack([left_bir, right_bir], axis=1)
stereo_ir /= np.max(np.abs(stereo_ir)) * 1.01   # prevent clipping

sf.write("binaural_ir.wav", stereo_ir, fs)
print("Saved → binaural_ir.wav")

# Quick plot
t = np.arange(len(left_ir)) / fs
plt.figure(figsize=(12, 4))
plt.plot(t, left_ir, label="Left ear", alpha=0.8)
plt.plot(t, right_ir, label="Right ear", alpha=0.8)
plt.xlabel("Time [s]")
plt.title("Geometric stereo room impulse responses")
plt.legend()
plt.tight_layout()
plt.show()