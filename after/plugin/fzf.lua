local fzf = require("fzf-lua")

fzf.setup({})

vim.keymap.set("n", "<c-F>b", fzf.buffers)
vim.keymap.set("n", "<c-F>f", fzf.files)
vim.keymap.set("n", "<c-F>q", fzf.quickfix)
vim.keymap.set("n", "<c-F>g", fzf.live_grep)
vim.keymap.set({ "n", "v" }, "<c-F>w", fzf.grep_cword)
vim.keymap.set("v", "<c-F>gv", fzf.grep_visual)

vim.keymap.set("n", "<c-G>f", fzf.git_files)
vim.keymap.set("n", "<c-G>s", fzf.git_status)

vim.keymap.set("n", "<c-L>r", fzf.lsp_references)
vim.keymap.set("n", "<c-L>df", fzf.lsp_definitions)
vim.keymap.set("n", "<c-L>dc", fzf.lsp_declarations)
vim.keymap.set("n", "<c-L>i", fzf.lsp_implementations)
vim.keymap.set("n", "<c-L>l", fzf.lsp_finder)
vim.keymap.set("n", "<c-L>c", fzf.lsp_code_actions)
vim.keymap.set("n", "<c-L>dd", fzf.diagnostics_document)
vim.keymap.set("n", "<c-L>dw", fzf.diagnostics_workspace)

vim.keymap.set({ "n", "v", "i" }, "<c-F>cp", fzf.complete_path)
vim.keymap.set({ "n", "v", "i" }, "<c-F>cf", fzf.complete_file)
vim.keymap.set({ "n", "v", "i" }, "<c-F>cl", fzf.complete_line)
vim.keymap.set({ "n", "v", "i" }, "<c-F>cb", fzf.complete_bline)
