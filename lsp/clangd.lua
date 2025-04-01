return {
    cmd = { "clangd", "--background-index", "--clang-tidy", "--completion-style=detailed", "--function-arg-placeholders",
        "--header-insertion=never", "--offset-encoding=utf-8" },
    root_markers = { ".clangd", ".clang-format", "compile_commands.json" },
    filetypes = { "c", "cpp" }
}
