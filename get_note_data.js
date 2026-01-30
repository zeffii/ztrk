inlets = 1;
outlets = 1;

//const fs = require('fs');
var live_api = new LiveAPI("live_set view detail_clip");
var note_obj = {};

function GetNotes(){
    var notes_raw = live_api.call("get_notes_extended", 0, 127, 0, 9999);
    note_obj = JSON.parse(notes_raw);

    const jsonString = JSON.stringify(note_obj, null, 2); // Pretty-printed JSON
    // fs.writeFile('./data.json', jsonString, 'utf8', function(err) {
    //   if (err) {
    //     post('Error writing file:', err);
    //   } else {
    //     post('File is written successfully!');
    //   }
    // });
    post(jsonString);

}

function remove_node_ids(notes_obj){
    for (var i = 0; i < notes_obj.notes.length; i++){
        notes_obj.notes[i].pitch += Math.floor((Math.random() * 8) - 4);
        delete notes_obj.notes[i].note_id;
    }
    return notes_obj
}


function Loadbang(){
    live_api = new LiveAPI("live_set view detail_clip");
}

function JitterPitch(){
    for (var i = 0; i < note_obj.notes.length; i++){
        note_obj.notes[i].pitch += Math.floor((Math.random() * 8) - 4);
        delete note_obj.notes[i].note_id;
    }
}

function SetNotes(){
    live_api = new LiveAPI("live_set view detail_clip");
    live_api.call("remove_notes_extended", 0, 127, 0, 9999);
    var notes_obj = remove_node_ids(note_obj)
    live_api.call("add_new_notes", notes_obj);
}
