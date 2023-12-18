local dap = require('dap')

-- i'm using vscode-cpptools for C, C++ and Rust. I liked it in VSCode, i guess i should like it in here.
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
dap.configurations.rust = dap.configurations.cpp
