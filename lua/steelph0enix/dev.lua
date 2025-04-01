-- All LSP/diagnostics/development-related configuration.

vim.diagnostic.config({
    virtual_lines = true,
    severity_sort = true,
})

vim.lsp.config("*", {
    capabilities = {
        textDocument = {
            semanticTokens = {
                multilineTokenSupport = true
            }
        }
    }
})

vim.lsp.enable({ "clangd", "luals", "ruff", "pyright" })

vim.keymap.set("n", "<F3>", vim.lsp.buf.format)

local dev_group = vim.api.nvim_create_augroup("dev", { clear = true })

vim.api.nvim_create_autocmd("LspAttach", {
    group = dev_group,
    callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

        -- autocomplete
        if client:supports_method("textDocument/completion") then
            vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
        end

        -- format on save
        if not client:supports_method("textDocument/willSaveWaitUntil")
            and client:supports_method("textDocument/formatting") then
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = dev_group,
                buffer = args.buf,
                callback = function()
                    vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
                end,
            })
        end

        -- inlay hints
        if client:supports_method("textDocument/inlayHint") then
            vim.lsp.inlay_hint.enable(true)
        end

        -- use pyright for hover instead of ruff
        if client.name == "ruff" then
            client.server_capabilities.hoverProvider = false
        end
    end
})
