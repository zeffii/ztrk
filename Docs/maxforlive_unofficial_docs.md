### Max4Live

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

#



### Monitoring a signal.

the `float~` dial will not automatically show you signals that are in spikes, f.ex a (click * number) would produce a click of the value of the number.
This is too brief to be able to perceive on that ui element, you can sample and hold the signal, and trigger the hold with the same click.

### waveform display

use message `bufftime 20` to update the buffer display every 20ms

