local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps({ buffer = bufnr })
    vim.keymap.set({ 'n', 'v' }, '<Leader>ca', vim.lsp.buf.code_action)
    vim.keymap.set({ 'n', 'v' }, '<Leader>fc', function() vim.lsp.buf.format { async = true } end)
end)

require('mason').setup({})

require('mason-lspconfig').setup({
    ensure_installed = { 'clangd', 'lua_ls', 'ruff', 'pyright', 'marksman' },
    handlers = {
        lsp_zero.default_setup,
    },
})

local lspconfig = require('lspconfig')

lspconfig.clangd.setup {
    cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--header-insertion=never",
        "--completion-style=detailed",
        "--function-arg-placeholders",
    }
}

-- add clangd switch header/source keybind in c/cpp files
vim.keymap.set('n', '<Leader>hs', '<cmd>ClangdSwitchSourceHeader<cr>')

lspconfig.marksman.setup {}

lspconfig.lua_ls.setup {
    on_init = function(client)
        local path = client.workspace_folders[1].name
        if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
            return
        end

        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
            runtime = {
                -- Tell the language server which version of Lua you're using
                -- (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT'
            },
            -- Make the server aware of Neovim runtime files
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME
                    -- Depending on the usage, you might want to add additional paths here.
                    -- "${3rd}/luv/library"
                    -- "${3rd}/busted/library",
                }
                -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
                -- library = vim.api.nvim_get_runtime_file("", true)
            }
        })
    end,
    settings = {
        Lua = {}
    }
}

lspconfig.ruff.setup({
    init_options = {
        settings = {
            preview = true,
            select = { "E", "F", "W", "C", "I", "N", "UP", "YTT", "ANN", "ASYNC", "S", "BLE", "FBT", "B", "A", "COM", "C4", "DTZ", "EXE", "A", "ISC", "ICN", "PIE", "RSE", "RET", "SLF", "SLOT", "SIM", "TID", "TCH", "ARG", "PTH", "PL", "FLY", "PERF", "FURB", "RUF" },
            format = {
                preview = true,
            }
        }
    }
})

lspconfig.pyright.setup({
    settings = {
        pyright = {
            disableOrganizeImports = true,
            disableTaggedHints = true,
        },
        python = {
            analysis = {
                diagnosticSeverityOverrides = {
                    -- https://github.com/microsoft/pyright/blob/main/docs/configuration.md#type-check-diagnostics-settings
                    reportUndefinedVariable = "none",
                },
            },
        },
    },
})
