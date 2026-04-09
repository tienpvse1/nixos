require("nvchad.configs.lspconfig").defaults()
require("configs.lsp.ts_ls")

local servers = {
	"biome",
	-- "eslint",
	"jsonls",
	"html",
	"cssls",
	"svelte",
	"tailwindcss",

	"lua_ls",
}
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
