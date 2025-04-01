return {
    cmd = { "basedpyright-langserver", "--stdio" },
    filetypes = { "python" },
    root_markers = { "SConstruct", "pyproject.toml" },
    settings = {
        basedpyright = {
            disableOrganizeImports = true,
            analysis = {
                ignore = { "*" },
                autoImportCompletions = false,
                useLibraryCodeForTypes = true,
                autoSearchPaths = true,
                diagnosticMode = "openFilesOnly",
                inlayHints = {
                    variableTypes = true,
                    callArgumentNames = true,
                    functionReturnTypes = true,
                    genericTypes = true,
                },
                typeCheckingMode = "standard"
            }
        },
    }
}
