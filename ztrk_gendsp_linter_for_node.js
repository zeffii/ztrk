const maxApi = require("max-api");
const { exec } = require("child_process");

function postMessage(...args){ maxApi.post(args[1]); };

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

        if (error) { 
            maxApi.post(`ERROR: ${error.message}`); return;
        }
        if (stderr) {
            // success!
            maxApi.post(`STDERR: ${stderr}`); return;
        }

        // no index specified.
        var woop = {0: "Alice in wonder land", 1: "saucages all the way down", 2: "1", 3: 500};
        maxApi.outlet(woop);
        maxApi.post("here!");
    });
});