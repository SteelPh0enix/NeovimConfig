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

vim.lsp.enable({ "clangd", "luals", "ruff", "pyright", "jsonls", "groovyls" })

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
