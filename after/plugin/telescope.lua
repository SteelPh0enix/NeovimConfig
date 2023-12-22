local telescope = require('telescope.builtin')
vim.keymap.set('n', '<C-f>f', telescope.find_files)
vim.keymap.set('n', '<C-f>p', telescope.git_files)
vim.keymap.set('n', '<C-f>w', telescope.grep_string)
vim.keymap.set('n', '<C-f>g', telescope.live_grep)
vim.keymap.set('n', '<C-f>o', telescope.buffers)
