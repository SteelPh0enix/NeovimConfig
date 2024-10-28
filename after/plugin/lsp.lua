local lspconfig = require("lspconfig")

lspconfig.util.default_config.capabilities = vim.tbl_deep_extend(
	"force",
	lspconfig.util.default_config.capabilities,
	require("cmp_nvim_lsp").default_capabilities()
)

vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function(event)
		local opts = { buffer = event.buf }

		vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
		vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
		vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
		vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
		vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
		vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
		vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
		vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
		-- vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
		vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
		vim.keymap.set("n", "<Leader>hs", "<cmd>ClangdSwitchSourceHeader<cr>")
	end,
})

require("mason").setup({})

-- install missing mason packages listed below with this command
vim.keymap.set(
	"ca",
	"MasonInstallMissing",
	"MasonInstall codespell cpplint mypy markdownlint beautysh shellcheck shellharden stylua hadolint cmakelang cmakelint"
)

-- commented out entries should be installed manually
require("mason-lspconfig").setup({
	ensure_installed = {
		-- c/c++
		"clangd",
		-- 'cpplint',

		-- python
		"ruff",
		"pyright",
		-- 'mypy',

		-- markdown
		"marksman",
		-- 'markdownlint',

		-- shell
		"bashls",
		-- 'beautysh',
		-- 'shellcheck',
		-- 'shellharden',

		-- lua
		"lua_ls",
		-- 'stylua',

		-- docker
		"dockerls",
		-- 'hadolint',

		-- cmake
		"cmake",
		-- 'cmakelang',
		-- 'cmakelint',
	},
})

lspconfig.clangd.setup({
	cmd = {
		"clangd",
		"--background-index",
		"--clang-tidy",
		"--header-insertion=never",
		"--completion-style=detailed",
		"--function-arg-placeholders",
	},
})

lspconfig.marksman.setup({})

lspconfig.lua_ls.setup({
	on_init = function(client)
		local path = client.workspace_folders[1].name
		if vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc") then
			return
		end

		client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
			runtime = {
				-- Tell the language server which version of Lua you're using
				-- (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
			},
			-- Make the server aware of Neovim runtime files
			workspace = {
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME,
					-- Depending on the usage, you might want to add additional paths here.
					-- "${3rd}/luv/library"
					-- "${3rd}/busted/library",
				},
				-- or pull in all of 'runtimepath'. NOTE: this is a lot slower
				-- library = vim.api.nvim_get_runtime_file("", true)
			},
		})
	end,
	settings = {
		Lua = {},
	},
})

lspconfig.ruff.setup({
	init_options = {
		settings = {
			preview = true,
			select = {
				"E",
				"F",
				"W",
				"C",
				"I",
				"N",
				"UP",
				"YTT",
				"ANN",
				"ASYNC",
				"S",
				"BLE",
				"FBT",
				"B",
				"A",
				"COM",
				"C4",
				"DTZ",
				"EXE",
				"A",
				"ISC",
				"ICN",
				"PIE",
				"RSE",
				"RET",
				"SLF",
				"SLOT",
				"SIM",
				"TID",
				"TCH",
				"ARG",
				"PTH",
				"PL",
				"FLY",
				"PERF",
				"FURB",
				"RUF",
			},
			format = {
				preview = true,
			},
		},
	},
})

lspconfig.pyright.setup({
	settings = {
		pyright = {
			disableOrganizeImports = true,
			disableTaggedHints = true,
		},
		python = {
			analysis = {
				diagnosticSeverityOverrides = {
					-- https://github.com/microsoft/pyright/blob/main/docs/configuration.md#type-check-diagnostics-settings
					reportUndefinedVariable = "none",
				},
			},
		},
	},
})
