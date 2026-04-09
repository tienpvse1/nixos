local map = vim.keymap.set
local unmap = vim.keymap.del
local builtin = require("telescope.builtin")

map("n", "<leader>grr", function()
	builtin.lsp_references({
		fname_width = 0,
		show_line = false,
		include_declaration = false,
	})
end, { desc = "Telescope find LSP references" })

map("n", "<leader>gd", function()
	builtin.lsp_definitions({
		fname_width = 0,
		show_line = false,
		include_declaration = false,
	})
end, { desc = "Telescope find LSP references" })

map("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
map("n", "<leader>fc", function()
	builtin.find_files({
		cwd = vim.fn.stdpath("config"),
	})
end, { desc = "Telescope find files" })

unmap("n", "<leader>fw")
map("n", "<leader>fw", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
