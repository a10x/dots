return {
	"rebelot/terminal.nvim",
	config = function()
		local term = require("terminal")
		term.setup({
			layout = {open_cmd = "botright new"},
			cmd = {vim.o.shell},
			autoclose = true
		})

		local term_map = require("terminal.mappings")
		vim.keymap.set("n", "<leader>tt", term_map.toggle)
		vim.keymap.set("n", "<leader>tk", term_map.kill)
		vim.keymap.set("n", "<leader>tf", term_map.move({open_cmd = "float"}))
		vim.keymap.set("n", "<leader>tF", term_map.move({open_cmd = "botright new"}))

	end
}
