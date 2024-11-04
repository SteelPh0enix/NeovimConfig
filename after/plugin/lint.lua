local lint = require("lint")

lint.linters_by_ft = {
	bash = { "bash", "cspell" },
	zsh = { "zsh", "cspell" },
	c = { "cpplint", "cspell" },
	cpp = { "cpplint", "cspell" },
	python = { "ruff", "mypy", "pydocstyle", "cspell" },
	dockerfile = { "hadolint", "cspell" },
	markdown = { "markdownlint", "cspell" },
    cmake = { "cmakelint", "cspell" },
    jenkinsfile = {"npm-groovy-lint", "cspell" }
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		-- try_lint without arguments runs the linters defined in `linters_by_ft`
		-- for the current filetype
		lint.try_lint()
	end,
})
