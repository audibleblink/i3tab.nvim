if vim.g.loaded_pill_tabline then
	return
end
vim.g.loaded_pill_tabline = true

local tabline = require("pill-tabline.tabline")

vim.keymap.set({ "n", "v" }, "<Plug>(PillTablineToggle)", function()
	require("pill-tabline").toggle_tabline()
end, { noremap = true, desc = "Toggle pill tabline" })

vim.keymap.set({ "n", "v" }, "<Plug>(PillTablineNext)", ":tabnext<CR>", {
	noremap = true,
	silent = true,
	desc = "Next tab",
})

vim.keymap.set({ "n", "v" }, "<Plug>(PillTablinePrev)", ":tabprevious<CR>", {
	noremap = true,
	silent = true,
	desc = "Previous tab",
})

vim.keymap.set({ "n", "v" }, "<Plug>(PillTablineNew)", ":tabnew<CR>", {
	noremap = true,
	silent = true,
	desc = "New tab",
})

tabline.setup_tabline()

vim.api.nvim_create_autocmd({ "ColorScheme", "VimEnter" }, {
	group = vim.api.nvim_create_augroup("PillTabline", { clear = true }),
	callback = function()
		tabline.refresh()
	end,
})