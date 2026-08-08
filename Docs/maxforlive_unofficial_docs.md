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



