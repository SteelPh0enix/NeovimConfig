vim.diagnostic.config({
    virtual_lines = true,
    severity_sort = true,
})

vim.lsp.config('*', {
    capabilities = {
        textDocument = {
            semanticTokens = {
                multilineTokenSupport = true
            }
        }
    }
})

vim.lsp.enable({"clangd"})
