# Braids-style Wavetable Pack for Max/MSP

A minimal, hackable pack for building and displaying Braids-style
wavetable oscillators in Max, using JS for table generation and
visualization, and gen~ for audio-rate playback.

## Files

- `js/braids_table.js`  — builds a merged wavetable Data from curves
- `js/braids_ui.js`     — UI state, throttled rebuild, buffer~ push
- `js/braids_view.js`   — builds jit.gl.mesh vertex + color matrices
- `gen/braids_osc.gendsp` — gen~ codebox source for audio playback

## Suggested patch layout

    [multislider]  ──┐
                     ├──► [js braids_ui.js] ──► [buffer~ braids_wt]
    [live.slider]  ──┘                            │
                                                  ▼
                                          [gen~ braids_osc]
                                                  │
                                                  ▼
                                              [ezdac~]

    [js braids_view.js] ──► [jit.gl.mesh] ──► [jit.gl.render]
             ▲
             └── timbre / color values from UI

## Data layout

The merged wavetable is a flat array:

    [ W0[s0..s255], W1[s0..s255], ... W255[s0..s255] ]

- TABLE_SIZE = 256 samples per wave
- NUM_WAVES  = 256 waves
- Total      = 65536 floats

WLIN addressing (linear scan):
    offset = waveIndex * TABLE_SIZE

WMAP addressing (16x16 grid, row-major):
    offset = (row * 16 + col) * TABLE_SIZE

## Notes

- The `wave` operator in gen~ is used for playback, not `peek`.
- Visualization uses `jit.gl.mesh` with a color_matrix for
  per-vertex colors, giving per-wave coloring for free.
- Line widths > 1 in Jitter can be unstable; use `jit.gl.path`
  with `@pathstyle ribbon` if you need thick lines.