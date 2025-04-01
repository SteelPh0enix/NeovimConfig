# My NeoVim configuration files

This is a relatively simple NeoVim configuration for my daily needs. I mostly write C, C++, Python, so this is a setup designed for that.

I jank'd the setup "skeleton" from [here](https://www.youtube.com/watch?v=w7i4amO_zaE). I recommend watching it if you're looking for your own setup.

This version of configuration is more focused on using native neovim functionalities, instead of plugins.
I had an idea to do that for a while, and recent neovim updates with LSP changes made me finally pull the trigger.
I've decided to start from scratch, list all the requirements i have and think of a way to implement them based on neovim documentation.
Some core plugins (like Mason, nvim-tree, fzf and treesitter) will remain, but i'll try to get rid of the most of the remaining ones.

## Requirements

Make sure you've installed (and added to *PATH* where applicable)

- Latest NeoVim
- Python (preferably 3.8 upwards, i'm currently running 3.13 as of writing this)
- C/C++ toolchain
- `fzf`, `git`, `ripgrep` and `fd` for `fzf-lua`

Run `:checkhealth` after installation to see for missing optional requirements.

## Installation

Put this config as-is in NeoVim's configuration directory.

For Linux it's `~/.config/nvim`

```sh
git clone git@github.com:SteelPh0enix/NeovimConfig.git ~/.config/nvim
```

For Windows it's `$env:LOCALAPPDATA/nvim` (or `%APPDATALOCAL%/nvim` if you're into that `cmd.exe` syntax)

```powershell
git clone git@github.com:SteelPh0enix/NeovimConfig.git $env:LOCALAPPDATA/nvim
```

Lazy should automatically setup everything. Wait until Lazy, Mason and treesitter finishes installing stuff after first run.
