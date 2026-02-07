subdiv(signal, amt){
    // amt must be between 0.5 and 1.0
    // signal is a phasor signal.
    phasor_path3 = 0;

    if (signal > amt){
        phasor_path3 = (signal - amt) / (1 - amt);
    }
    else {
        phasor_path3 = signal / amt;
    }
    return phasor_path3;

}
