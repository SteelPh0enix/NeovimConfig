require("nvim-treesitter.configs").setup({
	-- List of languages to support
	ensure_installed = {
		"asm",
		"bash",
		"c",
		"cmake",
		"comment",
		"cpp",
		"diff",
		"disassembly",
		"dockerfile",
		"doxygen",
		"git_config",
		"git_rebase",
		"gitattributes",
		"gitcommit",
		"gitignore",
		"json",
		"json5",
		"linkerscript",
		"lua",
		"make",
		"markdown",
		"meson",
		"ninja",
		"objdump",
		"powershell",
		"python",
		"regex",
		"rust",
		"toml",
		"vim",
		"vimdoc",
	},
	-- Install parsers synchronously
	sync_install = false,
	-- Auto-install missing parsers when entering buffer
	auto_install = true,
	-- Enable treesitter?
	enable = true,

	highlight = {
		-- Enable highlights?
		enable = true,
		-- TL;DR double-highlighting, potentially slow
		additional_vim_regex_highlighting = false,
	},
})
