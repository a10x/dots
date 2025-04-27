---spaces and tabs
vim.opt.list = true
vim.opt.listchars = {
	space = "·",
	tab = "-->",
	trail = "␣",
	eol = "↴"
}
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
---
--- finding and editing
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.inccommand = "split"
vim.opt.undofile = true
---

vim.opt.timeout = true
vim.opt.timeoutlen = 800
vim.opt.cursorline = true
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.cmd.colorscheme "catppuccin"
