
autowatch = 1;
outlets = 2;
inlets = 2;

mgraphics.init();
mgraphics.relative_coords = 0;
mgraphics.autofill = 0;

function onfocus(){
    post("received focus!");
}

function bang(){
    post("received bang!");
}