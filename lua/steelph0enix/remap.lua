-- This file contains only mappings for core/"vanilla" stuff.
-- For LSP-related mappings, see `dev.lua`

-- leader key
vim.g.mapleader = " "

-- Exit terminal mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- Turn text highlighting off after a search
vim.keymap.set("n", "<F12>", vim.cmd.nohlsearch)

-- Turn on spellchecking (fill up the language manually)
vim.keymap.set("n", "<Leader>sc", ":setlocal spell spelllang=")

-- Enable/disable diff mode
vim.keymap.set("n", "<Leader>dt", ":diffthis")
vim.keymap.set("n", "<Leader>dd", ":diffoff!")
vim.keymap.set("n", "<Leader>do", ":diffoff!")

-- "normal" saving
vim.keymap.set("n", "<C-s>", "<cmd>w<cr>")
vim.keymap.set("n", "<C-S-s>", "<cmd>wa<cr>")

-- trigger omni-completion on ctrl-space
vim.keymap.set({ "n", "i" }, "<C-Space>", "<C-x><C-o>")
