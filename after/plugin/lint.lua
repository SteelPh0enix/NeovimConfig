local lint = require("lint")

lint.linters_by_ft = {
	bash = { "bash", "codespell" },
	zsh = { "zsh", "codespell" },
	c = { "cpplint", "codespell" },
	cpp = { "cpplint", "codespell" },
	python = { "ruff", "mypy", "pydocstyle", "codespell" },
	dockerfile = { "hadolint", "codespell" },
    markdown = {"markdownlint" },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		-- try_lint without arguments runs the linters defined in `linters_by_ft`
		-- for the current filetype
		lint.try_lint()
	end,
})
