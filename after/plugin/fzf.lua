local fzf = require("fzf-lua")

fzf.setup({})

vim.keymap.set({ "n", "v" }, "<c-F>o", fzf.buffers)
vim.keymap.set({ "n", "v" }, "<c-F>f", fzf.files)
vim.keymap.set({ "n", "v" }, "<c-F>q", fzf.quickfix)
vim.keymap.set({ "n", "v" }, "<c-F>g", fzf.live_grep)
vim.keymap.set({ "n", "v" }, "<c-F>w", fzf.grep_cword)
vim.keymap.set("v", "<c-F>v", fzf.grep_visual)
vim.keymap.set({ "n", "v" }, "<c-F>s", fzf.spell_suggest)

vim.keymap.set({ "n", "v" }, "<c-G>f", fzf.git_files)
vim.keymap.set({ "n", "v" }, "<c-G>s", fzf.git_status)

vim.keymap.set({ "n", "v" }, "<c-F>r", fzf.lsp_references)
vim.keymap.set({ "n", "v" }, "<c-F>df", fzf.lsp_definitions)
vim.keymap.set({ "n", "v" }, "<c-F>dc", fzf.lsp_declarations)
vim.keymap.set({ "n", "v" }, "<c-F>i", fzf.lsp_implementations)
vim.keymap.set({ "n", "v" }, "<c-F>l", fzf.lsp_finder)
vim.keymap.set({ "n", "v" }, "<c-F>c", fzf.lsp_code_actions)
vim.keymap.set({ "n", "v" }, "<c-F>dd", fzf.diagnostics_document)
vim.keymap.set({ "n", "v" }, "<c-F>dw", fzf.diagnostics_workspace)

vim.keymap.set({ "n", "v", "i" }, "<c-F>cp", fzf.complete_path)
vim.keymap.set({ "n", "v", "i" }, "<c-F>cf", fzf.complete_file)
vim.keymap.set({ "n", "v", "i" }, "<c-F>cl", fzf.complete_line)
vim.keymap.set({ "n", "v", "i" }, "<c-F>cb", fzf.complete_bline)
