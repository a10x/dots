return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		local term = require("toggleterm")
		term.setup({
			hide_numbers = true,
			on_open = function()
				print("hjelloe")
			end
		})
	end
}
