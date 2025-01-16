require("steelph0enix.utils")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local avante_build_cmd = ""
if USING_WINDOWS() then
	avante_build_cmd = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
else
	avante_build_cmd = "make BUILD_FROM_SOURCE=false"
end

local lua_json_install_cmd = ""
if USING_WINDOWS() then
	lua_json_install_cmd = "powershell ./install.ps1"
else
	lua_json_install_cmd = "./install.sh"
end

require("lazy").setup({
	-- async i/o
	{ "nvim-neotest/nvim-nio" },
	-- color scheme
	{ "rebelot/kanagawa.nvim" },
	-- plenary tools
	{ "nvim-lua/plenary.nvim" },
	-- fzf-lua for finding stuff
	{
		"ibhagwan/fzf-lua",
		-- optional for icon support
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	-- treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	{ "nvim-treesitter/nvim-treesitter-textobjects" },
	-- lsp tools
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "neovim/nvim-lspconfig" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/nvim-cmp" },
	{ "mhartington/formatter.nvim" },
	{ "mfussenegger/nvim-lint" },
	{ "saadparwaiz1/cmp_luasnip" },
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		-- build = 'make install_jsregexp'
	},
	-- icons
	{ "nvim-tree/nvim-web-devicons" },
	-- file manager
	{ "nvim-tree/nvim-tree.lua" },
	-- error/warning list
	{ "folke/trouble.nvim" },
	-- statusline
	{ "nvim-lualine/lualine.nvim" },
	-- debug adapter
	{ "mfussenegger/nvim-dap" },
	-- debug adapter UI
	{ "rcarriga/nvim-dap-ui" },
	-- debug adapter for python
	{ "mfussenegger/nvim-dap-python" },
	-- indent guides
	{ "lukas-reineke/indent-blankline.nvim" },
	-- rainbow delimiters
	{ "HiPhish/rainbow-delimiters.nvim" },
	-- bracket pairing
	{ "echasnovski/mini.nvim" },
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
		"MeanderingProgrammer/render-markdown.nvim",
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
			auto_suggestions_provider = "openai",
			openai = {
				endpoint = "http://steelph0enix.pc:51536/",
				api_key_name = "",
			},
		},
		build = avante_build_cmd,
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
		end,
	},
	{
		"willothy/wezterm.nvim",
		config = true,
	},
	-- color picker
	{ "uga-rosa/ccc.nvim" },
	-- json5 support
	{ "Joakker/lua-json5", run = lua_json_install_cmd },
	-- duck!
	{
		"tamton-aquib/duck.nvim",
		config = function()
			vim.keymap.set("n", "<leader>dd", function()
				require("duck").hatch()
			end, {})
			vim.keymap.set("n", "<leader>dk", function()
				require("duck").cook()
			end, {})
			vim.keymap.set("n", "<leader>da", function()
				require("duck").cook_all()
			end, {})
		end,
	},
})
