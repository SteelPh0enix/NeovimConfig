-- leader key
vim.g.mapleader = " "

-- Exit terminal mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- Turn text highlighting off after a search
vim.keymap.set("n", "<F12>", vim.cmd.nohlsearch)

-- Turn on spellchecking (fill up the language manually) kurw
vim.keymap.set("n", "<Leader>sc", ":setlocal spell spelllang=")

-- Enable/disable diff mode
vim.keymap.set("n", "<Leader>dt", ":diffthis")
vim.keymap.set("n", "<Leader>dd", ":diffoff!")
vim.keymap.set("n", "<Leader>do", ":diffoff!")

-- normal save
vim.keymap.set("n", "<C-s>", "<cmd>w<cr>")
vim.keymap.set("n", "<C-S-s>", "<cmd>wa<cr>")
