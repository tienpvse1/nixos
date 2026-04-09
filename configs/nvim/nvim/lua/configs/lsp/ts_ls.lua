-- local navbuddy = require("nvim-navbuddy")

local function attach_code_actions(client)
	vim.api.nvim_buf_create_user_command(0, "LspTypescriptSourceAction", function()
		local source_actions = vim.tbl_filter(function(action)
			return vim.startswith(action, "source.")
		end, client.server_capabilities.codeActionProvider.codeActionKinds)

		vim.lsp.buf.code_action({
			context = {
				diagnostics = {},
				only = source_actions,
			},
		})
	end, {})
end

vim.lsp.config("ts_ls", {
	on_attach = function(client, bufnr)
		attach_code_actions(client)
		-- navbuddy.attach(client, bufnr)
	end,

	settings = {
		completions = {
			completeFunctionCalls = true,
		},
		preferences = {
			importModuleSpecifier = "relative",
			importModuleSpecifierPreference = "relative",
		},
	},
	init_options = {},
})
vim.lsp.enable("ts_ls")
