-- Always load first, contains global utility functions.
require("steelph0enix.utils")

if vim.loop.os_uname().sysname == "Windows_NT" then
    require("steelph0enix.powershell")
end

require("steelph0enix.python")
require("steelph0enix.options")
require("steelph0enix.remap")
require("steelph0enix.packer")
require("steelph0enix.colorscheme")
