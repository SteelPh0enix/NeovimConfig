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
    -- fzf-lua for finding stuff
    {
      'ibhagwan/fzf-lua',
      -- optional for icon support
      dependencies = { 'nvim-tree/nvim-web-devicons' },
      config = function()
        -- calling `setup` is optional for customization
        require('fzf-lua').setup({})
      end
    },
    -- treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
    },
    { 'nvim-treesitter/nvim-treesitter-textobjects' },
    -- lsp tools from lsp-zero
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'VonHeikemen/lsp-zero.nvim',                  branch = 'v3.x' },
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
    -- bracket pairing
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
    },
    -- avante for LLM support
    {
        "yetone/avante.nvim",
        event = "VeryLazy",
        lazy = false,
        version = false,
        opts = {
            provider = "openai",
            openai = {
                endpoint = "http://steelph0enix.pc:51536/",
                ["local"] = true,
            }
        },
        -- build = "make",
        build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false",
        dependencies = {
            "stevearc/dressing.nvim",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            {
                -- support for image pasting
                "HakonHarnes/img-clip.nvim",
                event = "VeryLazy",
                opts = {
                    -- recommended settings
                    default = {
                        embed_image_as_base64 = false,
                        prompt_for_file_name = false,
                        drag_and_drop = {
                            insert_mode = true,
                        },
                        -- required for Windows users
                        use_absolute_path = true,
                    },
                },
            },
        },
    },
    {
        "kylechui/nvim-surround",
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    }
})
