require("nvchad.autocmds")
local group = vim.api.nvim_create_augroup("YankingGroup", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight after yank",
	group = group,
	callback = function()
		vim.hl.on_yank({
			higroup = "CursorIM",
			timeout = 300,
		})
	end,
})
