-- TODO: maybe move harpoon to use the telescope ui
local harpoon = require("harpoon")
vim.keymap.set("n", "<leader>aa", function() harpoon:list():add() end, {desc = "Add current buffer to the harpoon list"})
vim.keymap.set("n", "<leader>at", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, {desc = "Toggle the harpoon list"})

--vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
--vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
--vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
--vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)
--vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
--vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
