local options = {
	formatters_by_ft = {
		lua = { "stylua" },

		-- ["javascript"] = { "biome-check" },
		-- ["javascriptreact"] = { "biome-check" },
		-- ["typescript"] = { "biome-check" },
		-- ["typescriptreact"] = { "biome-check" },
		-- ["json"] = { "biome-check" },
		-- ["css"] = { "biome-check" },
		-- ["svelte"] = { "biome-check" },

		["svelte"] = { "prettier" },
		["javascript"] = { "prettier" },
		["javascriptreact"] = { "prettier" },
		["typescript"] = { "prettier" },
		["typescriptreact"] = { "prettier" },
		["json"] = { "prettier" },
		["css"] = { "prettier" },
	},

	-- format_on_save = {
	--   -- These options will be passed to conform.format()
	--   timeout_ms = 500,
	--   lsp_fallback = true,
	-- },
}

return options
