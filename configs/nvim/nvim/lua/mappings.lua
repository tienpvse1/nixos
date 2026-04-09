require("nvchad.mappings")
require("mappings.quickfix")
require("mappings.telescope")
require("mappings.dap")
require("mappings.neogit")
require("mappings.copilot")

-- add yours here

local map = vim.keymap.set

-- map("n", ";", ":", { desc = "CMD enter command mode" })

map("n", "<S-i>", function()
	vim.diagnostic.open_float({ scope = "line" })
end, { desc = "LSP show diagnostics" })

map("n", "<leader>ca", function()
	vim.lsp.buf.code_action()
end, { desc = "LSP show code actions" })

map("i", "jj", "<ESC>")

map("i", "<C-e>", function()
	require("cmp").close()
end)

map({ "n", "o", "x" }, "<C-p>", "<C-o>", { silent = true })
map({ "n", "o", "x" }, "<C-n>", "<C-i>", { silent = true })
map("n", "<leader><leader>x", "<cmd>%bd|e#<CR>", { silent = true })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

map("n", "=", [[<cmd>vertical resize +5<cr>]], { silent = true, noremap = true }) -- make the window biger vertically
map("n", "-", [[<cmd>vertical resize -5<cr>]], { silent = true, noremap = true }) -- make the window smaller vertically
map("n", "+", [[<cmd>horizontal resize +2<cr>]], { silent = true, noremap = true }) -- make the window bigger horizontally by pressing shift and =
map("n", "_", [[<cmd>horizontal resize -2<cr>]], { silent = true, noremap = true }) -- make the window smaller horizontally by pressing shift and -

if vim.g.neovide then
	local opts = { noremap = true, silent = true }

	-- system clipboard
	map("n", "<C-S-c>", '"+y', opts) -- normal: start a yank using the + register (operator-pending)
	map("v", "<C-S-c>", '"+y', opts) -- visual: yank selection to system clipboard
	map("n", "<C-S-v>", '"+p', opts) -- normal: paste from system clipboard
	map("t", "<C-S-v>", '<C-\\><C-n>"+Pi', { noremap = true })

	-- insert / command-line: paste from system clipboard using Ctrl-V
	map("i", "<C-S-v>", "<C-r>+", opts) -- insert mode: insert contents of + register
	map("c", "<C-S-v>", "<C-r>+", opts) -- command-line mode: insert contents of + register

	-- use <C-r> in insert mode to send literal <C-v> (matches your original mapping)
	map("i", "<C-S-r>", "<C-v>", opts)

	map("n", "<F11>", ":let g:neovide_fullscreen = !g:neovide_fullscreen<CR>", {})
end
