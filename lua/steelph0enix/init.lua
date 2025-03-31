-- *real* entry point
-- Always load utils first.
require("steelph0enix.utils")

if USING_WINDOWS() then
    require("steelph0enix.powershell")
end

require("steelph0enix.python")
require("steelph0enix.options")
require("steelph0enix.remap")
require("steelph0enix.lsp")

-- lazy should be loaded as late as possible
require("steelph0enix.lazy")
require("steelph0enix.colorscheme")
