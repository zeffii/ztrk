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
