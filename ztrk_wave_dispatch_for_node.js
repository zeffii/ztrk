const maxApi = require("max-api");
const { exec } = require("child_process");

function postMessage(...args){ maxApi.post(args[1]); };

function message_to_dict(Dict, msg){
    maxApi.post('num newlines;', (msg.match(/\n/g) || []).length); 
    var items = msg.split('\n');
    for (const [idx, line] of items.entries()){
        Dict[idx] = line;
    }
    return Dict; 
}

var filePath = "";

maxApi.addHandler("filepath_to_parse", (file_path) => {
    filePath = file_path;
    postMessage("info", filePath);
})

maxApi.addHandler("sendwave", () => {
    // Replace with the full path to your python.exe and the linter script

    // if (filePath.length === 0){
    //     postMessage('warning', "filepath not passed correctly yet"); return;
    // }

    const pythonExe = "C:\\Users\\zeffi\\GITWORX\\AbletonMaxLive\\ztrk\\gendsp-linter\\.venv\\Scripts\\python.exe";
    const scriptPath = "C:\\Users\\zeffi\\GITWORX\\AbletonMaxLive\\ztrk\\WaveSlicer\\waveslicer.py";

    var myjson = {
        "start": 1400, 
        "duration": 30000, 
        //"quant": "hey!"
        "output_folder": "C:\\Users\\zeffi\\GITWORX\\AbletonMaxLive\\ztrk\\Samples"
    };
    
    const encoded = Buffer.from(JSON.stringify(myjson), 'utf8').toString('base64');
    // maxApi.post(encoded);

    //var json_OUT = {};
    //message_to_dict(json_OUT, encoded);
    //maxApi.outlet(json_OUT);
    maxApi.post('about to execute waveslicer');

    // Use exec to run the script. It buffers the output for you.
    
    exec(`"${pythonExe}" "${scriptPath}" "@${encoded}"`, (error, stdout, stderr) => {

        var ErrorDict = {};
        if (error) { 
            maxApi.post(`ERROR: ${error.message}`);
            message_to_dict(ErrorDict, error);
            maxApi.outlet(ErrorDict);
            // return;
        }

        var StdErrDict = {};
        if (stderr) {
            maxApi.post(`STDERR: ${stderr}`); 
            message_to_dict(StdErrDict, stderr);
            maxApi.outlet(StdErrDict);
            // return;
        }

        var StdOutDict = {};
        if (stdout) {
            maxApi.post(`STDOUT: ${stdout}`);
            message_to_dict(StdOutDict, stdout);
            maxApi.outlet(StdOutDict);
            // return;
        }

        // maxApi.outlet({0: "Linter Ran, but something happened?"});  // no index specified.
        maxApi.post("End of Lint Handler.");
    });
    
});