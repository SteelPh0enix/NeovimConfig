# My NeoVim configuration files

This is a relatively simple and minimal NeoVim configuration for my daily needs. I mostly write C, C++, Python and Rust, so this is a setup designed for that.

I janked the setup "skeleton" from [here](https://www.youtube.com/watch?v=w7i4amO_zaE). I recommend watching it if you're looking for your own setup.

## Prerequisites

Make sure you've installed (and added to *PATH* where applicable)

* Latest NeoVim
* Python (preferably 3.8 upwards, i'm currently running 3.12 as of writing this)
* C/C++ toolchain (GCC preferably)
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
