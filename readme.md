![Image](https://github.com/user-attachments/assets/7426e531-ffa7-455e-bd63-35bd7af2dd2b)

basic basic for now.

I decided to get a max/msp license because of gen~ and jsui/v8ui/rnbo. The goal is to make a tracker interface that will turn max/msp into a playground where i can make and trigger synths exactly the way i want, and hook them up in a modular way to effects. Rather than moaning about the things that i perceive as limitations in other tools/trackers. My main issue is that i want to be able to control the creative part entirely via a keyboard, or via a scripting interface, if i want to. 

See https://github.com/zeffii/ztrk/issues/8 for the current active TODO list.
Current MaxPat to load: https://github.com/zeffii/ztrk/blob/master/Max_Experiments/sequencer_dev2.maxpat

Some milestones i will need to tackle, in no particular order

- [x] handleing keyboard qwerty input
- [x] loading existing patterns
- [x] track description display
- [x] editing pattern
- [x] displaying patterns
- [x] displaying current tick location
- [x] cursor + navigation
- [x] selection rectangle
- [x] note to midinote
- [x] input error handling
    this is per parameter type
    - [x] two hexvalues
    - [x] note
    - [x] trigger ( 1 or . )
    - [x] 4 hex
    - [x] FFXXYY (this will set you free)
- [x] util functions(hex to int, etc)
    these to be used for
    - [x] interpolation functions,
    - [x] addition/subtract/transpose
- [x] scrolling pattern data
- [x] general pattern editor functions
    - [x] interpolate (hex and notes)
    - [x] delete selection
    - [x] copy and paste selection
    - [x] shift content of selection up/down
- [x] trigger from tick
- [x] basic kb controller envelope editor
- [x] basic waveform viewer, selector
- [x] basic first synth mk2
- [x] link sequencer to pattern editor (back and forth)
- [x] sequencing patterns
- [x] implement machine types (preliminary version),
- [x] loading / saving songs
- [x] buffer visualizer

Step 3:

- [x] add pattern from list 
      - [ ] (using 2hex keys)
- [x] set pattern length (has sideeffects)
- [x] add user define-able machines (prelim!)
- [ ] add tracks (select machine to add)
- [ ] add basic set of sampler/effects/synth (call these machines)
     - [ ] drummachine
     - [ ] sampler simple
     - [ ] sampler advanced   (subset of utrk!)
     - [ ] bassline
     - [x] kickdrum
     - [x] hats
     - [x] leadsynth
     - [ ] padsynth
     - [ ] klang
     - [ ] fungus?
     - [ ] flange
     - [x] reverb
     - [ ] phase
     - [ ] distortion
     - [ ] limiter
     - [ ] filter
     - [ ] delay
     - [ ] chorus
- [ ] keyrepeats, need a tidier solution (has been through several iteration, not satisfying yet)


-----------------


What i'm attempting here is a cross between sunvox/buzz/st3/impulsetracker/tetramed. I want to have high control via keyboard like oldschool trackers, while also being able to use synths/samplers that i design and can edit at runtime. ..And why not also allow myself to also trigger visuals too?! max/msp and puredata have always been on my todo list of things to learn. I also wish to be able to implement a trigger grammar
