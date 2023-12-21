local trouble = require('trouble')

vim.keymap.set('n', '<Leader>tt', function() trouble.toggle() end)
vim.keymap.set('n', '<Leader>tw', function() trouble.toggle('workspace_diagnostics') end)
vim.keymap.set('n', '<Leader>td', function() trouble.toggle('document_diagnostics') end)
vim.keymap.set('n', '<Leader>tq', function() trouble.toggle('quickfix') end)
vim.keymap.set('n', '<Leader>tl', function() trouble.toggle('loclist') end)
vim.keymap.set('n', '<Leader>gR', function() trouble.toggle('lsp_references') end)
