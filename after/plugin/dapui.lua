local dapui = require('dapui')

dapui.setup()

-- toggle dap ui
vim.keymap.set('n', '<C-d>', dapui.toggle)

-- evaluate expression under cursor in visual mode
vim.keymap.set('v', '<Leader>e', dapui.eval)
