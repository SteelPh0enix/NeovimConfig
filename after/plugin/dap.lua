local dap = require('dap')

vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<F9>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F10>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F11>', function() require('dap').step_out() end)
vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
vim.keymap.set('n', '<Leader>lp',
    function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
vim.keymap.set({ 'n', 'v' }, '<Leader>dp', function()
    require('dap.ui.widgets').preview()
end)
vim.keymap.set('n', '<Leader>df', function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.frames)
end)
vim.keymap.set('n', '<Leader>ds', function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.scopes)
end)

-- i'm using vscode-cpptools for C and C++. I liked it in VSCode, i guess i should like it in here.
-- Download the latest release from https://github.com/microsoft/vscode-cpptools/releases
-- and unzip it to proper directory.

if vim.loop.os_uname().sysname == "Windows_NT" then
    dap.adapters.cppdbg = {
        id = 'cppdbg',
        type = 'executable',
        command = 'C:\\Users\\phoen\\cpptools\\extension\\debugAdapters\\bin\\OpenDebugAD7.exe',
        options = {
            detached = false,
        }
    }
else -- if not on windows, must be on linux
    dap.adapters.cppdbg = {
        id = 'cppdbg',
        type = 'executable',
        command = '/home/steelph0enix/cpptools/extension/debugAdapters/bin/OpenDebugAD7',
    }
end

-- more docs: https://github.com/mfussenegger/nvim-dap/wiki/C-C---Rust-(gdb-via--vscode-cpptools)
dap.configurations.cpp = {
    {
        name = 'Debug file',
        type = 'cppdbg',
        request = 'launch',
        program = function()
            return vim.fn.input('Path to exec: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopAtEntry = true,
    },
}

dap.configurations.c = dap.configurations.cpp

-- Python DAP config
local python_dap = require('dap-python')

python_dap.setup(vim.g.python3_host_prog)
python_dap.test_runner = 'pytest'

dap.configurations.python = {
    {
        name = 'Debug current file in project',
        type = 'python',
        request = 'launch',
        program = '${file}',
        env = {
            PYTHONPATH = '${workspaceFolder}',
        }
    },
}

vim.keymap.set('n', '<Leader>dm', python_dap.test_method)
vim.keymap.set('n', '<Leader>dc', python_dap.test_class)
