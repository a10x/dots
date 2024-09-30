-- telescope keymaps
local telescope = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", telescope.find_files, {desc = "Telescope find files"})
vim.keymap.set('n', '<leader>fg', telescope.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', telescope.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', telescope.help_tags, { desc = 'Telescope help tags' })

-- harpoon keymaps
-- TODO: maybe move harpoon to use the telescope ui
local harpoon = require("harpoon")
vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, {desc = "Add current buffer to the harpoon list"})
vim.keymap.set("n", "<leader>t", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, {desc = "Toggle the harpoon list"})

--vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
--vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
--vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
--vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)
--vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
--vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)

--NvimTree
vim.keymap.set("n", "<leader>e", function() vim.cmd("NvimTreeToggle") end, {desc = "Toggle NvimTree"})
