-- leader key
vim.g.mapleader = " "

-- Exit terminal mode
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- Turn text highlighting off after a search
vim.keymap.set('n', '<F12>', vim.cmd.nohlsearch)
