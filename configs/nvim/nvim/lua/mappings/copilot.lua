local map = vim.keymap.set

vim.keymap.del("i", "<C-l>")

map("i", "<C-l>", 'copilot#Accept("\\<CR>")', {
	expr = true,
	replace_keycodes = false,
	silent = true,
})

vim.g.copilot_no_tab_map = true
