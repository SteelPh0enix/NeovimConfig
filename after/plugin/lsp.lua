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

local lspconfig = require('lspconfig')

lspconfig.pylsp.setup {
    settings = {
        pylsp = {
            plugins = {
                autopep8 = { enabled = false },
                flake8 = { enabled = false },
                jedi_completion = { enabled = true, fuzzy = true },
                pycodestyle = {
                    maxLineLength = 100,
                },
                ruff = {
                    enabled = true,
                    select = { 'F', 'E', 'W', 'C90', 'I', 'N', 'UP', 'ANN', 'FBT', 'B', 'A', 'C4', 'DTZ', 'FA', 'ISC', 'PIE', 'RET', 'SLF', 'SIM', 'TCH', 'PTH', 'PL', 'PERF', 'FLY'},
                    format = { 'F', 'E', 'W', 'I' },
                    lineLength = 100,
                }
            },
        },
    },
}
