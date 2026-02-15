// rudimentary

Buffer my_snare();

Param speed(1, min=-0.25, max=2);
History sample_position;
History playing;

trig = in1;
out3 = 0.0;
sample_outL = 0.0;
sample_outR = 0.0;

buf_len = dim(my_snare);
nclick = delta(trig);

if (nclick == 1){ 
    playing = 1; 
    sample_position = 0;
    out3 = 1.0;
};

if (sample_position == buf_len) { 
    playing = 0; 
    sample_position = 0;
};


if (playing > 0.0){
    sample_outL, sample_outR = peek(my_snare, sample_position, 0, interp="linear", boundmode="clamp", channels=2);
    sample_position = sample_position + 1;
} else {
    sample_outL, sample_outR = 0.0, 0.0;
}

// Output the sample (and optional playing gate if you want to use it downstream)
out1 = sample_outL;
out2 = sample_outR;
