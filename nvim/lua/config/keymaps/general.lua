vim.g.mapleader = " "
require("config.keymaps.telescope")
require("config.keymaps.harpoon")
require("config.keymaps.windows")
require("config.keymaps.terminal")

--NvimTree
vim.keymap.set("n", "<leader>e", function()
	vim.cmd("NvimTreeToggle")
end, { desc = "Toggle NvimTree" })
vim.keymap.set("n", "<leader>gl", function()
	vim.diagnostic.open_float()
end, { desc = "Open dianostics in floating window" })

--Oil
vim.keymap.set("n", "-", function()
	vim.cmd("Oil")
end, { desc = "Open parent directory" })
