return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile"},
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true }
	},

	config = function()
		local lspconfig = require("lspconfig")
		local mason = require("mason-lspconfig")
		local cmp = require("cmp_nvim_lsp")
		local caps = cmp.default_capabilities()
		-- local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		--- for type, icon in pairs(signs) do
		--	local hl = "DiagnosticSign" .. type
		---	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		---end
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(e)
				local opts = { buffer = e.buf, silent = true }
				opts.desc = "Go to declaration"
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

				opts.desc = "Show references"
				vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

				opts.desc = "Go to definition"
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)

				opts.desc = "Restart LSP"
				vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
				opts.desc = "Smart rename"
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
			end
		})

		mason.setup_handlers({
			function(server)
				lspconfig[server].setup({capabilities = caps})
			end,
			["lua_ls"] = function()
				lspconfig["lua_ls"].setup({
					capabilities = caps,
					settings = {
						Lua = {
							diagnostics = {
								globals = { "vim" },
							},
						},
					},
				})
			end
		})
	end
}
