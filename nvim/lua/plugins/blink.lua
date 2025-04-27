return {
	"saghen/blink.cmp",
	version = "1.*",
	dependencies = {
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",
			config = function()
				local snip_dir = vim.fn.stdpath("config") .. "/snippets/"
				require("luasnip.loaders.from_lua").load({paths = {snip_dir}})
			end,
			opts = {
				history = true,
				delete_check_events = "TextChanged"}
		}
	},
	opts = {
		keymap = {
			preset = "default",
			["<C-j>"] = {"select_next"},
			["<C-k>"] = {"select_prev"}
		},
		signature = {enabled = true},
		snippets = {preset = "luasnip"},
		sources = {
			default = {"lsp", "path", "snippets", "buffer"}
		},
		fuzzy = { implementation = "rust"},
		completion = {
			list = {
				selection = {
					preselect = false
				}
			}
		}
	},
	opts_extend = {"sources.default"}
}
