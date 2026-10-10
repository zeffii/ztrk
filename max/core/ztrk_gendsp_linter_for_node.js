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

maxApi.addHandler("lint", () => {
    // Replace with the full path to your python.exe and the linter script

    if (filePath.length === 0){
        postMessage('warning', "filepath not passed correctly yet"); return;
    }

    const pythonExe = "C:\\Users\\zeffi\\GITWORX\\AbletonMaxLive\\ztrk\\gendsp-linter\\.venv\\Scripts\\python.exe";
    const scriptPath = "C:\\Users\\zeffi\\GITWORX\\AbletonMaxLive\\ztrk\\gendsp-linter\\genexpr_linter.py";

    // Use exec to run the script. It buffers the output for you.
    exec(`"${pythonExe}" "${scriptPath}" "${filePath}"`, (error, stdout, stderr) => {

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
        // maxApi.post("End of Lint Handler.");
    });
});