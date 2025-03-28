require("steelph0enix.utils")

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({"git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath})
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({{"Failed to clone lazy.nvim:\n", "ErrorMsg"}, {out, "WarningMsg"},
                           {"\nPress any key to exit..."}}, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({ -- color scheme
{ "nuvic/flexoki-nvim", name = "flexoki" },
-- fzf-lua for finding stuff
{
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = {"nvim-tree/nvim-web-devicons"},
    opts = {}
}, -- treesitter
{
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate"
}, {"nvim-treesitter/nvim-treesitter-textobjects"}, -- mason for LSPs and tools
{"williamboman/mason.nvim"}, -- file manager
{
    "nvim-tree/nvim-tree.lua",
    dependencies = {"nvim-tree/nvim-web-devicons"}
}, -- duck!
{
    "tamton-aquib/duck.nvim",
    config = function()
        vim.keymap.set("n", "<leader>duk", function()
            require("duck").hatch()
        end, {})
        vim.keymap.set("n", "<leader>dkil", function()
            require("duck").cook()
        end, {})
        vim.keymap.set("n", "<leader>dupa", function()
            require("duck").cook_all()
        end, {})
    end
}})
