local M = {}
local config = require("i3tab.config")
local highlights = require("i3tab.highlights")

local separator_chars = {
	arrow = { left = "", right = "" },
	round = { left = "", right = "" },
	tab = { left = "", right = "" },
	dot = { left = "", right = "" },
	dot2 = { left = "", right = "" },
	ramp = { left = "", right = "" },
	none = { left = "", right = "" },
}

function M.render()
	local opts = config.options
	local tabs = vim.api.nvim_list_tabpages()
	local current = vim.api.nvim_get_current_tabpage()

	local separator = separator_chars[opts.separator_style] or separator_chars.pill

	local s = "%#i3tabPad#"
	if opts.position ~= "left" then
		s = s .. "%="
	end

	for i, tab in ipairs(tabs) do
		local is_active = (tab == current)
		local hl_sym = is_active and "%#i3tabActiveSym#" or "%#i3tabInactiveSym#"
		local hl_text = is_active and "%#i3tabActiveText#" or "%#i3tabInactiveText#"
		local spacing = "%#i3tabPad#" .. opts.spacing

		s = s .. hl_sym .. separator.left

		if opts.show_numbers then
			s = s .. hl_text .. opts.padding .. i .. opts.padding
		end

		s = s .. hl_sym .. separator.right .. spacing
		s = s .. "%#i3tabPad#"
	end

	if opts.position ~= "right" then
		s = s .. "%="
	end
	return s
end

function M.setup_tabline()
	highlights.setup_highlights()
	vim.o.tabline = "%!v:lua.require('i3tab.tabline').render()"
end

function M.toggle_tabline()
	if vim.o.showtabline == 2 then
		vim.o.showtabline = 0
	else
		vim.o.showtabline = 2
	end
end

function M.refresh()
	highlights.setup_highlights()
	vim.cmd("redrawtabline")
end

return M
