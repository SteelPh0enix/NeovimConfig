local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {'clangd', 'lua_ls', 'rust_analyzer', 'pylsp', 'ruff_lsp'},
    handlers = {
        lsp_zero.default_setup,
    },
})
