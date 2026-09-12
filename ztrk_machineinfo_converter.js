autowatch = 1;
outlets = 2;
inlets = 2;

mgraphics.init();
mgraphics.relative_coords = 0;
mgraphics.autofill = 0;

function titleCase(varName) {
    const spaced = varName
        .replace(/([a-z0-9])([A-Z])/g, '$1 $2')
        .replace(/([A-Z]+)([A-Z][a-z])/g, '$1 $2');
    return spaced
        .split(/[\s_]+/)
        .filter(Boolean)
        .map(w => w.charAt(0).toUpperCase() + w.slice(1))
        .join(' ');
}

function hexCode(type) {return type === 'hz' ? 'hhhh' : 'hh'; }

function splitTopLevel(str) {
    // Splits on commas that are NOT inside [ ] brackets, so scale=[0,1]
    // stays intact as one segment instead of being cut in half.
    const parts = [];
    let depth = 0;
    let current = '';
    for (const ch of str) {
        if (ch === '[') depth++;
        if (ch === ']') depth--;
        if (ch === ',' && depth === 0) {
            parts.push(current);
            current = '';
        } else {
            current += ch;
        }
    }
    if (current.trim() !== '') parts.push(current);
    return parts;
}

function parseMetaComment(commentBody) {
    const meta = {};
    for (const part of splitTopLevel(commentBody)) {
        const idx = part.indexOf('=');
        if (idx === -1) continue;
        const key = part.slice(0, idx).trim();
        let value = part.slice(idx + 1).trim();
        if (key === 'scale' && value.startsWith('[')) {
            const nums = value.slice(1, -1).split(',').map(s => Number(s.trim())).filter(n => !Number.isNaN(n));
            meta.scaleMin = nums[0];
            meta.scaleMax = nums[1];
        } else {
            meta[key] = value;
        }
    }
    return meta;
}

function parseSource(src) {
    const lines = src.split('\n');
    const paramRe = /Param\s+(\w+)\s*\(([^)]*)\)\s*;\s*(?:\/\/\s*\(([^)]*)\))?/;
    const dividerRe = /^\s*\/\/\s*---/;
    
    const params = [];
    let group = 1;
    let sawParamInGroup = false;
    
    for (const line of lines) {
        if (dividerRe.test(line)) {
            if (sawParamInGroup) {
                group++;
                sawParamInGroup = false;
            }
            continue;
        }
        const m = line.match(paramRe);
        if (!m) continue;
        
        const varName = m[1];
        const fallbackDefault = m[2].trim();
        const commentBody = m[3];
        
        if (!commentBody) {
            params.push({ error: `No metadata comment found for Param ${varName}` });
            continue;
        }
        
        const meta = parseMetaComment(commentBody);
        if (meta.type == null || meta.default == null || meta.scaleMin == null || meta.scaleMax == null) {
            params.push({ error: `Incomplete metadata for Param ${varName}: ${commentBody}` });
            continue;
        }
        
        params.push({
            varName,
            displayName: titleCase(varName),
            type: meta.type,
            default: meta.default,
            min: meta.scaleMin,
            max: meta.scaleMax,
            group,
        });
        sawParamInGroup = true;
    }
    
    return params;
}

function bitsForType(type) {
    return type === 'hz' ? 16 : 8;
}

function rawToNormalized(rawValue, min, max, type) {
    if (type === 'hz') {
        // log scale — guard against non-positive values, which log() can't handle
        if (min <= 0 || rawValue <= 0) return 0;
        return Math.log(rawValue / min) / Math.log(max / min);
    }
    return (rawValue - min) / (max - min);
}

function rawToHex(rawValue, min, max, type) {
    const bits = bitsForType(type);
    const hexDigits = bits / 4;
    const maxInt = Math.pow(2, bits) - 1;
    let t = rawToNormalized(rawValue, min, max, type);
    t = Math.max(0, Math.min(1, t)); // clamp in case default sits outside scale
    const encoded = Math.round(t * maxInt);
    return encoded.toString(16).toUpperCase().padStart(hexDigits, '0');
}

function generate(src) {

    post(src);

    const machineName = 'MACHINE';
    const parsed = parseSource(src);
    const errors = parsed.filter(p => p.error);
    const ok = parsed.filter(p => !p.error);
    
    if (ok.length === 0) {
        post(errors.length ? errors.map(e => e.error).join('\n') : 'No Param lines found.');
        return;
    }
    
    const rows = ok.map(p => {
        const metaStr = `${p.displayName} |(t:${p.type}, d:${p.default}, s:[${p.min},${p.max}])`;
        const defaultHex = rawToHex(Number(p.default), Number(p.min), Number(p.max), p.type);
        return `[${JSON.stringify(hexCode(p.type))}, ${JSON.stringify(metaStr)}, ${p.group}], // default hex: ${defaultHex}`;
    });
    
    const body = [
        `        ['b', 'Trigger', 0], `,
        ...rows.map(r => '        ' + r)
    ].join('\n');
    
    const output = `    "${machineName}": [\n${body}\n    ]`;
    
    let [msg1, msg2] = [null, null];
    if (errors.length) {
        msg1 = `Generated ${ok.length} param(s). Skipped ${errors.length}: ` + errors.map(e => e.error).join(' | ');
        msg2 = 'status err';
    } else {
        msg1 = `Generated ${ok.length} param(s) across ${Math.max(...ok.map(p => p.group))} group(s).`;
        msg2 = 'status ok';
    }
    post(msg1, ':', msg2);
    return output;
}


function list(...l) {
    post("Received a list");
    var s = l.join(" ");
    var parts = s.split(/(?=Param|\/\/ --- section ---)/).filter(Boolean);

    var data = parts.join(' ') + "\n";
    var my_output = generate(data) || "failure to communicate";
    outlet(0, my_output);    
}