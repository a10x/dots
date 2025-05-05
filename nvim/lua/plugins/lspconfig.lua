local function on_attach(_, buffer)
	local telescope = require("telescope.builtin")
	local opts = { buffer = buffer, silent = true }
	opts.desc = "Go to declaration"
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

	opts.desc = "Show references"
	vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

	opts.desc = "Go to definition"
	vim.keymap.set("n", "gd", telescope.lsp_definitions, opts)

	opts.desc = "Restart LSP"
	vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)

	opts.desc = "Smart rename"
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

	opts.desc = "Show line diagnostics"
	vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

	opts.desc = "Show buffer diagnostics"
	vim.keymap.set("n", "<leader>D", function()
		vim.diagnostic.setqflist({ bufnr = 0 })
		vim.cmd("copen")
	end, opts)
end

local load_lsp = function(name, config)
	local lspconfig = require("lspconfig")
	if lspconfig[name].manager then
		return
	end

	local blink = require("blink.cmp")
	local installer = require("utils.mason_installer")
	local lsp_group = vim.api.nvim_create_augroup("LazyLoadLsp", { clear = true })

	vim.api.nvim_create_autocmd("FileType", {
		group = lsp_group,
		pattern = config.file_types,
		callback = function()
			installer.install_pkg(config.mason_mapping, function()
				config.capabilities = blink.get_lsp_capabilities(config.capabilities or {})
				config.on_attach = config.on_attach or on_attach
				lspconfig[name].setup(config)
				vim.cmd("LspStart " .. name)
			end)
		end,
	})
end

local load_formatter = function(config)
	local installer = require("utils.mason_installer")
	installer.install_pkg(config.mason_mapping)
end

return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"saghen/blink.cmp",
		"williamboman/mason.nvim",
	},
	config = function()
		local installs = {
			lua_ls = {
				type = "lsp",
				file_types = { "lua" },
				mason_mapping = "lua-language-server",
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			},
			stylua = {
				type = "formatter",
				mason_mapping = "stylua",
			},
			eslint = {
				type = "formatter",
				mason_mapping = "eslint_d",
			},
			prettier = {
				type = "formatter",
				mason_mapping = "prettierd",
			},
		}

		require("mason-registry").refresh(function()
			for name, config in pairs(installs) do
				if config.type == "lsp" then
					load_lsp(name, config)
				elseif config.type == "formatter" then
					load_formatter(config)
				end
			end
		end)

		vim.diagnostic.config({
			severity_sort = true,
			float = { border = "rounded", source = "if_many" },
			underline = { severity = vim.diagnostic.severity.ERROR },
		})
	end,
}
