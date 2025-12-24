![Image](https://github.com/user-attachments/assets/4d2c6438-ea2e-43d8-bc20-0f1901bc7b85)

basic basic for now.

I decided to get a max/msp license because of gen~ and jsui. The goal is to make a tracker interface that will turn max/msp into a playground where i can make and trigger synths exactly the way i want, and hook them up in a modular way to effects. Rather than moaning about the things that i perceive as limitations in other tools/trackers. My main issue is that i want to be able to control the creative part entirely via a keyboard, or via a scripting interface, if i want to. 

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
- [ ] util functions(hex to int, etc)
    these to be used for
    - [x] interpolation functions,
    - [ ] multiply,
    - [ ] addition
- [ ] sequencing patterns
- [ ] general pattern editor functions (reverse, spread, interpolate, transpose, shift, uzi, splay)
    - [ ] delete selection
- [ ] trigger from tick


-----------------


What i'm attempting here is a cross between sunvox/buzz/st3/impulsetracker/tetramed. I want to have high control via keyboard like oldschool trackers, while also being able to use synths/samplers that i design and can edit at runtime. ..And why not also allow myself to also trigger visuals too?! max/msp and puredata have always been on my todo list of things to learn. I also wish to be able to implement a trigger grammer
