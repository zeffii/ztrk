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
var samplerate = null;
var [_start, _end] = [0, null];

maxApi.addHandler("filepath_to_parse", (file_path) => {
    filePath = file_path;
    postMessage("info", filePath);
})

maxApi.addHandler("sr", (sample_rate) => {
    samplerate = sample_rate;
    postMessage("info", samplerate);
})

maxApi.addHandler("range", (start, end) => {
    [_start, _end] = [start, end];
    // postMessage("info", `${_start} .. ${_end}`);
})

maxApi.addHandler("sendwave", () => {
    // Replace with the full path to your python.exe and the linter script
    const pythonExe = "C:\\Users\\zeffi\\GITWORX\\AbletonMaxLive\\ztrk\\gendsp-linter\\.venv\\Scripts\\python.exe";
    const scriptPath = "C:\\Users\\zeffi\\GITWORX\\AbletonMaxLive\\ztrk\\WaveSlicer\\waveslicer.py";

    var myjson = {
        "start": _start, 
        "duration": _end, 
        "sample_rate": samplerate,
        "filepath": filePath,
        "output_dir": null
    };

    maxApi.post("SAMPLE RATE:", samplerate)
    maxApi.post(myjson["sample_rate"]);
    
    const encoded = Buffer.from(JSON.stringify(myjson), 'utf8').toString('base64');
    maxApi.post('about to execute waveslicer');

    // Use exec to run the script. It buffers the output for you.
    exec(`"${pythonExe}" "${scriptPath}" "@${encoded}"`, (error, stdout, stderr) => {

        var ErrorDict = {};
        if (error) { 
            maxApi.post(`ERROR: ${error.message}`);
            message_to_dict(ErrorDict, error);
            maxApi.outlet(ErrorDict);
        }

        var StdErrDict = {};
        if (stderr) {
            maxApi.post(`STDERR: ${stderr}`); 
            message_to_dict(StdErrDict, stderr);
            maxApi.outlet(StdErrDict);
        }

        var StdOutDict = {};
        if (stdout) {
            maxApi.post(`STDOUT: ${stdout}`);
            message_to_dict(StdOutDict, stdout);
            maxApi.outlet(StdOutDict);
        }

        maxApi.post("End of WaveSlicer Handler.");
    });
    
});