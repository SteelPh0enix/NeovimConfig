# My NeoVim configuration files

This is a relatively simple and minimal NeoVim configuration for my daily needs. I mostly write C, C++, Python and Rust, so this is a setup designed for that.

I janked the setup "skeleton" from [here](https://www.youtube.com/watch?v=w7i4amO_zaE). I recommend watching it if you're looking for your own setup.

## Prerequisites

Make sure you've installed (and added to *PATH* where applicable)

* Latest NeoVim
* Python (preferably 3.8 upwards, i'm currently running 3.12 as of writing this)
* DebugPy installed in proper virtualenv (see `after/plugin/dap.lua` for details)
* C/C++ toolchain (GCC preferably)
* [cpptools](https://github.com/microsoft/vscode-cpptools/releases) - unzip to `cpptools` in user directory (see `after/plugin/dap.lua` for details)
* Ripgrep/fd for Telescope
* [Packer](https://github.com/wbthomason/packer.nvim)

## Installation

Put this config as-is in NeoVim's configuration directory.

For Windows it's `$env:LOCALAPPDATA/nvim` (or `%APPDATALOCAL%/nvim` if you're into that `cmd.exe` syntax)
```powershell
git clone git@github.com:SteelPh0enix/NeovimConfig.git $env:LOCALAPPDATA/nvim
```

For Linux it's `~/.config/nvim`
```sh
git clone git@github.com:SteelPh0enix/NeovimConfig.git ~/.config/nvim
```

After that, run `:PackerSync`, wait until it finishes, and restart NeoVim.

## Plugin list

- Packer - for plugin management, requires manual installation (see [prerequisites][#prerequisites])
- Telescope - search utility
- Treesitter - syntax support
- lsp-zero - bundle of LSP plugins, including
    - Mason and Mason-LSPConfig for installing LSPs
    - nvim-lspconfig for LSP support in neovim
    - nvim-cmp and cmp-nvim-lsp for autocompletion
    - LuaSnip for snippets
- rust-tools
- nvim-tree - filesystem browser
- trouble - error/warnings list
- lualine - better statusline
- nvim-dap/nvim-dap-ui/nvim-dap-python - debug adapter and UI
- Kangawa - color scheme
- indent-blankline - indent guides
- rainbow-delimiters - rainbow brackets and such
- mini - bracket pairing and other utilities

## Shortcuts

If a shortcut is not described here, it's either left default or not bound.

### General

Leader is bound to `<Space>`.
- Exit terminal mode - `<Esc>`
- Turn off highlight after search - `<F12>`

### Completion

- Jump to next/previous snippet placeholder - `<C-f>` and `<C-b>`
- Scroll up/down in completion docs - `<C-u>` and `<C-d>`

### Debug

- Toggle DAP UI - `<Ctrl-d>`
- Evaluate expression under cursor (visual mode) - `<Leader>e`
- Continue debug session - `<F5>`
- Step over - `<F9>`
- Step into - `<F10>`
- Step out - `<F11>`
- Toggle breakpoint - `<Leader>b`
- Set breakpoint - `<Leader>B`
- Set log point - `<Leader>lp`
- Open repl - `<Leader>dr`
- Run last - `<Leader>dl`
- Preview - `<Leader>dp`
- Show frames - `<Leader>df`
- Show scoped - `<Leader>ds`
- Run Python's test method - `<Leader>dm`
- Run Python's test class - `<Leader>dc`

### Filetree

- Toggle file tree - `<Leader>fs`

### LSP

- Open diagnostics window - `gl`
- Go to next/previous diagnostics - `[d` and `]d`
- Open hover - `K`
- Go to definition - `gd`
- Go to declaration - `gD`
- Go to implementation - `gi`
- Go to type definition - `go`
- Go to references - `gr`
- Go to signature help  - `gs`
- Rename - `<F2>`
- Format - `<F3>`
- Code action - `<F4>`
- Switch header/source (clangd) - `<Leader>hs`

### Rust tools

- Hover actions - `<Leader>h`
- Code action group - `<Leader>a`

### Telescope

- Find files - `<Ctrl-f>f`
- Find git (project) files - `<Ctrl-f>p`
- Grep string in files - `<Ctrl-f>w`
- Live grep - `<Ctrl-f>g`
- Find in open buffers - `<Ctrl-f>o`

### Trouble

- Toggle issues - `<Leader>tt`
- Workspace diagnostics - `<Leader>tw`
- Document diagnostics - `<Leader>td`
- Quickfix list - `<Leader>tq`
- LOC list - `<Leader>tl`
- LSP references - `<Leader>gR`
