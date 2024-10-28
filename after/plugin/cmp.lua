local cmp = require("cmp")

cmp.setup({
	mapping = cmp.mapping.preset.insert({}),
	snippet = {
		expand = function(args)
			vim.snippet.expand(args.body)
		end,
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
	}, {
		{ name = "buffer" },
	}),
})
