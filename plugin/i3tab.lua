if vim.g.loaded_i3tab then
	return
end
vim.g.loaded_i3tab = true

local tabline = require("i3tab.tabline")

vim.keymap.set({ "n", "v" }, "<Plug>(i3tabToggle)", function()
	require("i3tab").toggle_tabline()
end, { noremap = true, desc = "Toggle pill tabline" })

vim.keymap.set({ "n", "v" }, "<Plug>(i3tabNext)", ":tabnext<CR>", {
	noremap = true,
	silent = true,
	desc = "Next tab",
})

vim.keymap.set({ "n", "v" }, "<Plug>(i3tabPrev)", ":tabprevious<CR>", {
	noremap = true,
	silent = true,
	desc = "Previous tab",
})

vim.keymap.set({ "n", "v" }, "<Plug>(i3tabNew)", ":tabnew<CR>", {
	noremap = true,
	silent = true,
	desc = "New tab",
})

tabline.setup_tabline()

vim.api.nvim_create_autocmd({ "ColorScheme", "VimEnter" }, {
	group = vim.api.nvim_create_augroup("i3tab", { clear = true }),
	callback = function()
		tabline.refresh()
	end,
})
