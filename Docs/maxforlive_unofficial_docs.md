## Max4Live

> Unofficial documentation. max 9 abl 12.4x.

This will be a cookbook with web snippets to see and hear what the various concepts do.

### multichannel audio from max to live.

```
    [mc.noise~ @chans 8          ]
      | 
    [mc.separate~ 2 2            ]
      |            |            |  
    [mc.unpack~] [mc.unpack~] [mc.unpack~]

    # each of these will output two signals, left and right
    # to send them to live, use 

    [plugout~ @chans 8]  or [mc.plugout~]

```
Live by default will output only channel 1 and 2, to get 3/4 and 5/6 add 2 audio channels and set their `Audio From`, 
to the track with the maxdevice on it, and then set it to 3/4 and 5/6 

## Analysing and Debugging Tools


### Monitoring a signal.

> the `number~` object will not automatically show you signals that are in spikes, f.ex a (click * number) would produce a click of the value of the number.
> This is too brief to be able to perceive on that ui element, you can sample and hold the signal, and trigger the hold with the same click.

### waveform display

> use message `bufftime 20` to update the buffer display every 20ms

### Gotchas

* Make sure there is an output source in audio engine, else you might be talking to the wall.
* If you have a diagram, and you plug in numbers exactly like the example shows but the patch behaves differently, usually you will find a `integer` somewhere that should be a `float`. (or vice versa)

### Stream Line patching

> Holding shift on an inlet, and then moving the mouse to the destination/origin inlet you want to connect to. Keep holding shift, and click the inlet and any other inlets you want to connect with the same destination/orgin.

### Messages

> The following will inject the value of the float into the message, and send a bang after the message ( this can save you from having to wire up extra triggers)

```
[float]
|
(offset 0. $1, bang)    <--- message
|
[some object]           <- some object might only update if a bang is received

```

### Gen~ 

```c
for (i = 0; i < 512; i+=1){
    s = peek(procedural, i);   // not required to specify number of samples, if it is 1.
    poke(readback, s, i);
}
```

### Debugging Gen~ codebox..

> **Check the patch cord before debugging the code.**
> If a Gen `inlet` appears to be ignoring a signal, temporarily replace the Gen logic with `out1 = in1;`. If the signal isn't visible at the output, disconnect and recreate the patch cord. Max can occasionally leave a connection in a state where the patch visually appears connected but the signal isn't actually reaching the object.

And perhaps a shorter checklist:

* Is the input actually reaching `gen~`?
* Temporarily use `out1 = in1;`
* Check the signal with a scope/meter if appropriate.
* Disconnect/reconnect suspicious patch cords.
* Only **then** start debugging `History`, `if`, counters, etc.

That's a particularly useful debugging principle: **prove the signal path before debugging the signal processing.**

### gen~ gotchas.

According to toneparticle (not sure exactly how to word this)
`delta` and `latch` are stateful operators and cant be used in a for loop, because memory cant be preallocated to them in such a loop?
max will never dynamically allocate memory in the audioprocess. (risk audio dropout and crashes)
https://cycling74.com/forums/call-phasor-in-loop#reply-60633f1a5737e10b7812f26c

## js (Patcher scripting)

[#js-patcher-scripting](#js-patcher-scripting)

> Scripting patchers/subpatchers from `js`/`v8` — creating boxes, buffers, and sub-patchers programmatically. This is its own object model, separate from writing DSP-side `v8ui`/`gen~` code.

### Object model: Maxobj vs Patcher vs Wind

[#object-model-maxobj-vs-patcher-vs-wind](#object-model-maxobj-vs-patcher-vs-wind)

There are three different objects in play, and it's easy to confuse them:

- **`Maxobj`** — what `patcher.newobject(...)` / `patcher.newdefault(...)` returns. This is a *box* in a patcher (e.g. a `buffer~`, a `p` box). It does **not** have a `.wind` property.
- **`Patcher`** — a full patcher/subpatcher. If you have a `Maxobj` that is a `p`/`patcher` box (i.e. it *contains* a subpatcher), get the actual `Patcher` via `box.subpatcher()`.
- **`Wind`** — a patcher's window, accessed as `somePatcher.wind`. Only exists on `Patcher` objects, never on `Maxobj`.

```
var box = patcher.newdefault(100, 100, "p", "buffer_storage"); // Maxobj
var subpatch = box.subpatcher();                                // Patcher
subpatch.wind.visible = 0;                                      // Wind
```

Calling `.wind` directly on the `Maxobj` (skipping `.subpatcher()`) will throw, since that property simply doesn't exist there.

### Wind object: useful properties

[#wind-object-useful-properties](#wind-object-useful-properties)

`Wind` has no `.close()` method — that's a natural but wrong guess. What it does have:

- `visible` (Boolean, get/set) — show/hide the window
- `size` (Array `[w, h]`, get/set)
- `location` (Array `[left, top, right, bottom]`, get/set)

```
subpatch.wind.visible = 0;        // suppress/hide
subpatch.wind.size = [200, 400];  // resize
```

To actually destroy a scripted patcher (not just hide it), use `patcher.remove()` on the `Patcher` object — but note this also frees anything living inside it (buffers, gen~ state, etc.), so only do this if you don't need what's inside to persist.

### Gotcha: `p`/`patcher` boxes can flash open on creation

[#gotcha-p-patcher-boxes-can-flash-open-on-creation](#gotcha-p-patcher-boxes-can-flash-open-on-creation)

Creating a `p` box (`patcher.newdefault(x, y, "p", "name")`) can pop its subpatcher window open the instant the box is instantiated — before your very next line of JS runs. This appears to happen at the C level alongside box creation, rather than being something JS creates and then shows.

Setting `visible = 0` immediately afterward (same function call, synchronous) is usually enough to suppress it, since nothing else in your script yields control in between:

```
var subpatch = patcher.newdefault(100, 100, "p", "buffer_storage").subpatcher();
subpatch.wind.visible = 0;
```

### Idempotent box creation with `getnamed`/`varname`

[#idempotent-box-creation-with-getnamedvarname](#idempotent-box-creation-with-getnamedvarname)

To avoid duplicating boxes every time an init function runs, name each box with `varname` on creation, then check for it with `getnamed()` before creating a new one. This works at any nesting level — a wrapping `p` box, or the boxes inside it:

```
var subpatch = patcher.getnamed("buffer_storage");

if (!subpatch) {
    subpatch = patcher.newdefault(100, 100, "p", "buffer_storage");
    subpatch.varname = "buffer_storage";
}
```

This makes the init function safe to call repeatedly — it becomes a "create what's missing, fix up what exists" pass rather than something that has to be called exactly once.

### Cookbook: per-track buffer~ initializer

[#cookbook-per-track-buffer-initializer](#cookbook-per-track-buffer-initializer)

Puts all of the above together: a hidden subpatcher holding one `buffer~` per track, created only if missing, with sr/size/chans re-asserted every call so the function doubles as a "fix drift" pass.

```
function bang(){
    var patcher = this.patcher;
    var num_tracks = 4;
    init_track_buffers(patcher, num_tracks);
}

function init_track_buffers(patcher, num_tracks) {
    /*
    Initializer for the buffer-holding subpatcher: ensures one buffer~
    per track exists with the correct sr/size/chans, creating only
    what's missing, and returns Buffer() handles keyed by track index.
    */
    opts = {};
    var sr      = opts.sr      || 1000;   // nominal declared sample rate (not audio driver sr)
    var nsamps  = opts.nsamps  || 2048;   // buffer length in samples (ticks)
    var chans   = opts.chans   || 48;     // channels per buffer
    var x       = opts.x       || 20;
    var y       = opts.y       || 20;
    var y_step  = opts.y_step  || 32;
    var name_fn = opts.name_fn || function (i) { return "t" + i + "_buf"; };

    var buffers = {};

    // check if the subpatcher box already exists before creating a new one
    var subpatch = patcher.getnamed("buffer_storage");

    if (!subpatch) {
        subpatch = patcher.newdefault(100, 100, "p", "buffer_storage");
        subpatch.varname = "buffer_storage";
    }

    var internalPatcher = subpatch.subpatcher();
    internalPatcher.wind.size = [200, 400];
    internalPatcher.wind.visible = 0;

    for (var i = 0; i < num_tracks; i++) {
        var buf_name = name_fn(i);
        var box = internalPatcher.getnamed(buf_name); // matches on varname, see note below

        if (!box) {
            box = internalPatcher.newdefault(x, y + (i * y_step), "buffer~", buf_name);
            box.varname = buf_name; // required so future getnamed(buf_name) calls find it
        }

        // Re-assert spec every time, whether the box was just created or
        // already existed — keeps this function idempotent and makes it
        // double as a "fix up any buffer that's drifted from spec" pass.
        box.message("sr", sr);
        box.message("size", nsamps);
        box.message("chans", chans);

        buffers[i] = new Buffer(buf_name);
    }

    return buffers;
}
```

## v8ui

This applies to the v8 and js objects in general, you define the number of inlets and outlets manually at the top
```js

inlets = 3
outlets = 2

```
and you send information to them like 

```js
// outlet indices are zero based.
outlet(1, "dictionary", outputDict.name);

```