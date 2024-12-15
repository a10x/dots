vim.g.mapleader = " "
require("config.keymaps.telescope")
require("config.keymaps.harpoon")
require("config.keymaps.windows")
require("config.keymaps.terminal")

--NvimTree
vim.keymap.set("n", "<leader>e", function() vim.cmd("NvimTreeToggle") end, {desc = "Toggle NvimTree"})


