-- auto-indent enabled and smart
vim.opt.autoindent = true
vim.opt.smartindent = true


-- use system clipboard
vim.opt.clipboard = "unnamedplus"

-- enable smart case
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- enable case infering
vim.opt.infercase = true

-- enable (relative) line numbering
vim.opt.number = true
vim.opt.relativenumber = true

-- expand tabs to spaces
vim.opt.expandtab = true

-- let's try 4-space tabs
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true

-- show full tabs on completion
vim.opt.showfulltag = true

-- show matching brackets
vim.opt.showmatch = true

-- Enable 24-bit RGB colors
vim.opt.termguicolors = true

-- Enable setting the window title by nvim
vim.opt.title = true

-- Enable undo
vim.opt.undofile = true

-- Set better popup experience
vim.opt.completeopt = { "menuone", "preview", "noselect" }

-- Set color column at 100 characters by default
vim.opt.colorcolumn = "80,100,120"

-- Reserve a space in the gutter
-- This will avoid an annoying layout shift in the screen
vim.opt.signcolumn = "yes"

-- Default spell check file
-- (we pick the 1st one and hope for the best)
local spellfile_dir = vim.api.nvim_list_runtime_paths()[1]
vim.opt.spellfile = {
	spellfile_dir .. PATH_SEPARATOR() .. "spell" .. PATH_SEPARATOR() .. "en.utf-8.add",
	spellfile_dir .. PATH_SEPARATOR() .. "spell" .. PATH_SEPARATOR() .. "pl.utf-8.add",
}
