require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    },
    pip = {
        upgrade_pip = true
    }
})

local registry = require("mason-registry")
local packages_to_install = {"lua-language-server", "clangd"}

for _, package_name in ipairs(packages_to_install) do
    if not registry.is_installed(package_name) then
        local package = registry.get_package(package_name)
        package:install()
    end
end
