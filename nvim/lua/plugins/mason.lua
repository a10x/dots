return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim"
	},

	config = function()

		local mason = require("mason")
		local lspconfig = require("mason-lspconfig")

		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		lspconfig.setup({
			ensure_installed = {
				"lua_ls",
			},
		})
	end
}
