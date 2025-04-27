return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			ensure_installed = {
				"c",
				"lua",
				"vim",
				"vimdoc",
				"javascript",
				"html",
				"haskell",
				"zig",
				"java",
			},
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<Enter>",
					node_incremental = "<Enter>",
					scope_incremental = false,
					node_decremental = "<Backspace>",
				},
			},
		})

		---c3 parser
		vim.filetype.add({
			extension = {
				c3 = "c3",
				c3i = "c3",
				c3t = "c3",
			},
		})
		-- get the query file from: https://github.com/c3lang/tree-sitter-c3/blob/main/queries/highlights.scm
		local parsers_config = require("nvim-treesitter.parsers").get_parser_configs()
		parsers_config.c3 = {
			install_info = {
				url = "https://github.com/c3lang/tree-sitter-c3",
				files = { "src/parser.c", "src/scanner.c" },
				branch = "main",
			},
		}
	end,
}
