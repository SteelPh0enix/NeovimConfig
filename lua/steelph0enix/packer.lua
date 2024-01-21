vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- packer
    use 'wbthomason/packer.nvim'

    -- color schemes
    use 'rebelot/kanagawa.nvim'

    -- telescope, for finding/grepping
    use {
        'nvim-telescope/telescope.nvim', branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- treesitter, for syntax
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

    -- lsp-zero, for LSP
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            -- Mason for installing LSPs
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'L3MON4D3/LuaSnip' },
        }
    }

    -- Rust tools
    use 'simrat39/rust-tools.nvim'

    -- nvim-tree, for file tree
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons',
        },
    }

    -- trouble, for better errors/warning list
    use {
        'folke/trouble.nvim',
        requires = {
            'nvim-tree/nvim-web-devicons',
        },
    }

    -- statusline
    use {
        'nvim-lualine/lualine.nvim',
        requires = {
            'nvim-tree/nvim-web-devicons',
        },
    }

    -- debug adapter
    use 'mfussenegger/nvim-dap'

    -- debug adapter UI
    use { 'rcarriga/nvim-dap-ui', requires = { 'mfussenegger/nvim-dap' } }

    -- debug adapter for Python
    use { 'mfussenegger/nvim-dap-python', requires = { 'mfussenegger/nvim-dap' } }

    -- intent guides
    use 'lukas-reineke/indent-blankline.nvim'

    -- rainbow delimiters
    use 'HiPhish/rainbow-delimiters.nvim'

    -- bracket pairing
    use 'echasnovski/mini.nvim'

    -- markdown preview
    use({
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        setup = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    })
end)
