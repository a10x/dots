local function resize_split(dir, amt)
	local id = vim.api.nvim_get_current_win()
	local width = vim.api.nvim_win_get_width(id)
	local height = vim.api.nvim_win_get_height(id)
	if(dir == "v") then
		vim.api.nvim_win_set_width(id, width + amt)
	else
		vim.api.nvim_win_set_height(id, height + amt)
	end
end

vim.keymap.set("n", "<esc>", ":noh<CR>", {desc = "Clear search higlight"})
vim.keymap.set("n", "<leader>sv", "<C-w>v", {desc = "Split vertically"})
vim.keymap.set("n", "<leader>ss", "<C-w>s", {desc = "Split horizontally"})
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", {desc = "Close current split"})
vim.keymap.set("n", "<leader>ss+", function() resize_split("h", 5) end,{desc = "Increase height of current split" })
vim.keymap.set("n", "<leader>ss-", function() resize_split("h", -5) end,{desc = "Decrease height of current split"})
vim.keymap.set("n", "<leader>sv+", function() resize_split("v", 5) end,{desc = "Increase width of current split"})
vim.keymap.set("n", "<leader>sv-", function() resize_split("v", -5) end,{desc = "Decrease width of current split"})
vim.keymap.set("n", "<leader>sh", "<C-w>h", {desc = "Go to left split"})
vim.keymap.set("n", "<leader>sj", "<C-w>j", {desc = "Go to down split"})
vim.keymap.set("n", "<leader>sk", "<C-w>k", {desc = "Go to above split"})
vim.keymap.set("n", "<leader>sl", "<C-w>l", {desc = "Go to right split"})

-- vim tabs
vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", {desc = "Open new tab" })
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", {desc = "Close current tab" })
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", {desc = "Go to next tab" })
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", {desc = "Go to previous tab" })

-- vim maximizer
vim.keymap.set("n", "<leader>s=", "<cmd>MaximizerToggle<CR>", {desc = "Maximise current split"})
