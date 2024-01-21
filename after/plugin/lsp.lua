local lsp_zero = require('lsp-zero')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps({ buffer = bufnr })
end)

require('mason').setup({})

require('mason-lspconfig').setup({
    ensure_installed = { 'clangd', 'lua_ls', 'rust_analyzer', 'pylsp', 'ruff_lsp', 'marksman' },
    handlers = {
        lsp_zero.default_setup,
    },
})

local lspconfig = require('lspconfig')

lspconfig.pylsp.setup {
    settings = {
        pylsp = {
            plugins = {
                -- we use ruff and mypy only
                black = { enabled = false },
                autopep8 = { enabled = false },
                yapf = { enabled = false },
                pylint = { enabled = false },
                pyflakes = { enabled = false },
                pycodestyle = { enabled = false },
                ruff = {
                    enabled = true,
                    select = { 'F', 'E', 'W', 'C90', 'I', 'N', 'UP', 'ANN', 'FBT', 'B', 'A', 'C4', 'DTZ', 'FA', 'ISC', 'PIE', 'RET', 'SLF', 'SIM', 'TCH', 'PTH', 'PL', 'PERF', 'FLY' },
                    format = { 'F', 'E', 'W', 'I' },
                    lineLength = 100,
                },
                pylsp_mypy = {
                    enabled = true,
                    live_mode = true,
                    strict = true,
                },
                -- also jedi for autocompletion i guess
                jedi_completion = {
                    enabled = true,
                    fuzzy = true,
                }
            },
        },
    },
    capabilities = capabilities,
}

lspconfig.clangd.setup {
    settings = {
        clangd = {
            cmd = {
                "clangd", "--background-index", "--clang-tidy", "--header-insertion=never"
            }
        }
    },
    capabilities = capabilities
}

-- add clangd switch header/source keybind in c/cpp files
vim.keymap.set('n', '<Leader>hs', '<cmd>ClangdSwitchSourceHeader<cr>')

lspconfig.marksman.setup {}
