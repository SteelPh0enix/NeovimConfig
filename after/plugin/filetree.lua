-- disable built-in file manager
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

-- nvim-tree requires 24-bit color palette, so termguicolors should be set to true
require("nvim-tree").setup({
	reload_on_bufenter = true,
	view = {
		width = 50,
		-- adaptive_size = true,
	},
	update_focused_file = {
		enable = true,
	},
})

local tree_api = require("nvim-tree.api")
vim.keymap.set("n", "<Leader>fs", tree_api.tree.toggle)
vim.keymap.set("n", "<Leader>ft", tree_api.tree.find_file)
