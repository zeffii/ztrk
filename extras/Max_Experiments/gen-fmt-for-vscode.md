The path from "I want to use gen-fmt in VS Code" to "I have a working GenExpr linter" involves two distinct phases: first getting the formatter running on Windows, then building the linter you actually want. Let me walk through both, with the caveats and detours spelled out clearly.

### Phase 1: Getting gen-fmt Running on Windows

The gen-fmt project provides pre-built binaries, but the documentation only explicitly mentions macOS and Linux for the release page. On Windows, your most reliable path is building from source via Rust.

**Step 1: Install the Rust toolchain.**

Go to [rustup.rs](https://rustup.rs) and download `rustup-init.exe`. Run it and accept the defaults. This installs both Rust and Cargo (the package manager). After installation, open a **new** PowerShell or Command Prompt window and verify with:

```powershell
cargo --version
rustc --version
```

If you see version numbers, you're good.

**Step 2: Clone and build gen-fmt.**

```powershell
git clone https://github.com/isabelgk/gen-fmt.git
cd gen-fmt
cargo build --release
```

This may take several minutes on the first build as Cargo downloads and compiles dependencies. When it finishes, you'll find the binary at `target\release\gen-fmt.exe`.

**Step 3: Add gen-fmt to your PATH.**

You have two options:

- **Permanent**: Search "Environment Variables" in the Start menu, edit the `Path` variable under your user account, and add the full path to the `target\release` folder (e.g., `C:\Users\YourName\gen-fmt\target\release`).
- **Temporary** (for testing): In PowerShell, run `$env:Path += ";C:\Users\YourName\gen-fmt\target\release"` — this lasts only for the current session.

Verify with `gen-fmt --help`. You should see usage information.

### Phase 2: Wiring gen-fmt into VS Code

There is no dedicated gen-fmt extension. The two practical approaches are a VS Code task and the Run on Save extension.

**Option A: VS Code Task (manual trigger).**

Create or edit `.vscode/tasks.json` in your project root:

```json
{
    "version": "2.0.0",
    "tasks": [
        {
            "label": "Format GenExpr",
            "type": "shell",
            "command": "gen-fmt",
            "args": ["-i", "${file}"],
            "problemMatcher": [],
            "presentation": {
                "reveal": "silent",
                "panel": "shared"
            }
        }
    ]
}
```

Then bind it to a keyboard shortcut. Open the Command Palette (`Ctrl+Shift+P`), type "Open Keyboard Shortcuts (JSON)", and add an entry in `keybindings.json`:

```json
{
    "key": "ctrl+alt+f",
    "command": "workbench.action.tasks.runTask",
    "args": "Format GenExpr"
}
```

Now `Ctrl+Alt+F` formats the current `.genexpr` file.

**Option B: Run on Save extension (automatic).**

Install the "Run on Save" extension (by emeraldwalk) from the VS Code Marketplace. Then add this to your `settings.json` (`Ctrl+Shift+P` → "Open User Settings (JSON)"):

```json
"emeraldwalk.runonsave": {
    "commands": [
        {
            "match": "\\.genexpr$",
            "cmd": "gen-fmt -i ${file}"
        }
    ]
}
```

Every time you save a `.genexpr` file, it gets formatted. Note that the `cmd` runs through the system shell, so `gen-fmt` must be on your PATH or you must provide the full path to `gen-fmt.exe`.

### Phase 3: The Reality Check on "Linter"

Here is the crucial distinction. **gen-fmt is a formatter, not a linter.** It will rearrange whitespace and indentation according to predefined rules, but it will **not** tell you when your GenExpr code is semantically wrong — when you've used `history` with the wrong arguments, misspelled an operator, or created a divide-by-zero.

For that, you need a **language server** that uses the tree-sitter grammar to parse your code and report diagnostics.

### Phase 4: What Building a Real Linter Actually Requires

A VS Code extension that provides linting is fundamentally different from a formatter task. It requires a **Language Server** — a separate process that maintains a persistent connection with VS Code, parses your files on every change, and sends back diagnostic messages (the red squiggles).

**The architecture:**

- **Client** (VS Code extension): A thin TypeScript wrapper that registers the language server and forwards document changes.
- **Server** (Language Server): The actual logic. It receives text, parses it using tree-sitter-genexpr, runs checks, and returns diagnostics.

The tree-sitter-genexpr grammar gives you a parse tree — an `ERROR` node anywhere in that tree means a syntax problem. You can write queries or traversal logic to find these nodes and emit diagnostics with line/column positions.

**The practical obstacles:**

1. **No existing GenExpr language server.** The Zed extension and gen-fmt are built on the tree-sitter grammar, but neither exposes a general-purpose LSP server you can drop into VS Code.
2. **Building one from scratch is a project.** You'd need to:
   - Set up a Node.js/TypeScript monorepo with client and server packages.
   - Implement the LSP `onInitialize`, `onDidChangeContent`, and diagnostic publishing handlers.
   - Write tree-sitter queries or traversal code that identifies GenExpr-specific problems.
   - Package and test it as a `.vsix`.
3. **The tree-sitter grammar is only the foundation.** It tells you if the code parses, but not whether it's *correct*. Semantic checks — "this operator requires two arguments of type `signal`" — require additional logic layered on top.

### What I'd Actually Recommend

If you want formatting now, **do the Rust build + Run on Save setup** from Phase 1 and 2. That's a few hours of work and gives you immediate value.

If you want the linter, recognize that you're not "configuring a tool" — you're **building one**. The most realistic path is to start with the tree-sitter grammar, write a minimal Node.js language server that does *one* thing well (e.g., highlight `ERROR` nodes from tree-sitter), and expand from there. The Volar language server guide and the VS Code LSP sample are the best starting references. It's a significant undertaking, but the tree-sitter grammar means you're not starting from zero.