local map = vim.keymap.set

local neogit = require("neogit")

map("n", "<leader>gg", function()
	neogit.open({ kind = "floating" })
end, { desc = "Git Open panel" })

map(
	"n",
	"<leader>gl",
	neogit.action("log", "log_all_references", { "--graph", "--color", "--decorate", "-D" }),
	{ desc = "Git Open panel" }
)

map("n", "<leader>gb", function()
	require("gitsigns").toggle_current_line_blame()
end, { desc = "Git Toggle blame line" })

map("n", "<leader>gf", function()
	vim.cmd({ cmd = "DiffviewFileHistory", args = { "%" } })
end, { desc = "Git File history floating" })

map("n", "<leader>gh", function()
	require("gitsigns").preview_hunk_inline()
end, { desc = "Git show hunk" })

map("n", "<leader>gb", function()
	require("gitsigns").toggle_current_line_blame()
end, { desc = "Git toggle blame inline" })

map("n", "<leader>gB", function()
	require("gitsigns").blame()
end, { desc = "Git blame whole file" })

map("n", "<leader>gd", function()
	require("diffview").open()
end, { desc = "Git Open Diffview" })
