local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    -- async i/o
    { 'nvim-neotest/nvim-nio' },
    -- color scheme
    { 'rebelot/kanagawa.nvim' },
    -- plenary tools
    { 'nvim-lua/plenary.nvim' },
    -- telescope, find/grep tool
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.6',
    },
    -- treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
    },
    -- lsp tools from lsp-zero
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'VonHeikemen/lsp-zero.nvim',        branch = 'v3.x' },
    { 'neovim/nvim-lspconfig' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/nvim-cmp' },
    {
        'L3MON4D3/LuaSnip',
        version = 'v2.*',
        -- build = 'make install_jsregexp'
    },
    -- icons
    { 'nvim-tree/nvim-web-devicons' },
    -- file manager
    { 'nvim-tree/nvim-tree.lua', },
    -- error/warning list
    { 'folke/trouble.nvim', },
    -- statusline
    { 'nvim-lualine/lualine.nvim', },
    -- debug adapter
    { 'mfussenegger/nvim-dap' },
    -- debug adapter UI
    { 'rcarriga/nvim-dap-ui' },
    -- debug adapter for python
    { 'mfussenegger/nvim-dap-python' },
    -- indent guides
    { 'lukas-reineke/indent-blankline.nvim' },
    -- rainbow delimiters
    { 'HiPhish/rainbow-delimiters.nvim' },
    -- bracket pairinig
    { 'echasnovski/mini.nvim' },
    -- markdown preview
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && yarn install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    },
    -- markdown renderer
    {
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
            file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    },
    -- avante for LLM support
    {
        "yetone/avante.nvim",
        event = "VeryLazy",
        opts = {
            provider = "openai",
            openai = {
                endpoint = "http://192.168.1.125:51536/",
                ["local"] = true,
            }
        },
        dependencies = {
            "stevearc/dressing.nvim",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
        },
    }
})
