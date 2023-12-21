vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

require('nvim-tree').setup {
    view = {
        width = 40,
    },
}

local tree_api = require('nvim-tree.api')
vim.keymap.set('n', '<Leader>fs', tree_api.tree.toggle)
