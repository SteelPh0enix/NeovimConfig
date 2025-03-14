local dap = require("dap")
local dapvsc = require("dap.ext.vscode")
local widgets = require("dap.ui.widgets")

vim.keymap.set("n", "<F5>", function()
    dap.continue()
end)
vim.keymap.set("n", "<F9>", function()
    dap.step_over()
end)
vim.keymap.set("n", "<F10>", function()
    dap.step_into()
end)
vim.keymap.set("n", "<F11>", function()
    dap.step_out()
end)
vim.keymap.set("n", "<Leader>b", function()
    dap.toggle_breakpoint()
end)
vim.keymap.set("n", "<Leader>B", function()
    dap.set_breakpoint()
end)
vim.keymap.set("n", "<Leader>lp", function()
    dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end)
vim.keymap.set("n", "<Leader>dr", function()
    dap.repl.open()
end)
vim.keymap.set("n", "<Leader>dl", function()
    dap.run_last()
end)
vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
    widgets.hover()
end)
vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
    widgets.preview()
end)

dap.adapters.gdb = {
    id = "gdb",
    type = "executable",
    command = "gdb",
    args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
}

local mason_cpptools_dir = vim.fn.stdpath("data") .. "/mason/packages/cpptools"

if USING_WINDOWS() then
    dap.adapters.cppdbg = {
        id = "cppdbg",
        type = "executable",
        command = mason_cpptools_dir .. "/extension/debugAdapters/bin/OpenDebugAD7.exe",
        options = {
            detached = false,
        },
    }
else
    dap.adapters.cppdbg = {
        id = "cppdbg",
        type = "executable",
        command = mason_cpptools_dir .. "/extension/debugAdapters/bin/OpenDebugAD7",
    }
end

dap.configurations.c = {
    {
        name = "Launch C/C++ app",
        type = "cppdbg",
        request = "launch",
        program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopAtEntry = true,
        setupCommands = {
            {
                text = "-enable-pretty-printing",
                description = "enable pretty printing",
                ignoreFailures = false,
            },
        },
    },
    {
        name = "Launch C/C++ app with arguments",
        type = "cppdbg",
        request = "launch",
        program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        args = function()
            local args_str = vim.fn.input({
                prompt = "Arguments: ",
            })
            return vim.split(args_str, " +")
        end,
        cwd = "${workspaceFolder}",
        stopAtEntry = true,
        setupCommands = {
            {
                text = "-enable-pretty-printing",
                description = "enable pretty printing",
                ignoreFailures = false,
            },
        },
    },
}

dap.configurations.cpp = dap.configurations.c
