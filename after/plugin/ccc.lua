local ccc = require('ccc')
local mapping = ccc.mapping

ccc.setup({
    highlighter = {
        auto_enable = true,
        lsp = true,
    },
    lsp = true,
    recognize = {
        input = true,
        output = true,
    },
    -- mappings = {
    -- },
})

vim.keymap.set("n", "<C-c>", "<cmd>CccPick<cr>")
