local M = {}

function M.set(mode, keymap, action, opts)
	vim.keymap.set(mode, keymap, action, opts or {})
end

return M
