local trouble = require("trouble")

vim.keymap.set("n", "<Leader>tt", function()
    trouble.toggle("diagnostics")
end)
vim.keymap.set("n", "<Leader>tl", function()
    trouble.toggle("lsp")
end)
vim.keymap.set("n", "<Leader>tr", function()
    trouble.toggle("lsp_references")
end)
vim.keymap.set("n", "<Leader>ti", function()
    trouble.toggle("lsp_incoming_calls")
end)
vim.keymap.set("n", "<Leader>to", function()
    trouble.toggle("lsp_outgoing_calls")
end)
vim.keymap.set("n", "<Leader>tq", function()
    trouble.toggle("quickfix")
end)
