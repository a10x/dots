return {
	'stevearc/oil.nvim',
	opts = {},
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
	config = function()
		require("oil").setup({
			view_options = {
				show_hidden = true
			}
		})

		vim.keymap.set("n", "-", "<CMD>Oil<CR>", {desc = "Open parent directory"})
	end,
-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
}
