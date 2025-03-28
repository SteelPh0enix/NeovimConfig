# My NeoVim configuration files

This is a relatively simple NeoVim configuration for my daily needs. I mostly write C, C++, Python, so this is a setup designed for that.

I jank'd the setup "skeleton" from [here](https://www.youtube.com/watch?v=w7i4amO_zaE). I recommend watching it if you're looking for your own setup.

## Requirements

Make sure you've installed (and added to *PATH* where applicable)

- Latest NeoVim
- Python (preferably 3.8 upwards, i'm currently running 3.13 as of writing this)
- C/C++ toolchain (GCC preferably)
- Ripgrep/fd for Telescope
- NodeJS (for Markdown plugin)

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
Then, run `:MasonInstallMissing` to install missing Mason packages that weren't installed automatically.
