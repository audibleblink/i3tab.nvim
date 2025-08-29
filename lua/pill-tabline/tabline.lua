local M = {}
local config = require("pill-tabline.config")
local highlights = require("pill-tabline.highlights")

local separator_chars = {
	pill = "oo",
	round = "O",
	square = "|",
}

function M.render()
	local opts = config.options
	local tabs = vim.api.nvim_list_tabpages()
	local current = vim.api.nvim_get_current_tabpage()

	if opts.auto_hide and #tabs <= 1 then
		return ""
	end

	local separator = separator_chars[opts.separator_style] or separator_chars.pill
	local s = "%#Normal#%="

	for i, tab in ipairs(tabs) do
		local is_active = (tab == current)

		local hl_left = is_active and "%#TabLinePillActiveLeft#" or "%#TabLinePillInactiveLeft#"
		local hl_text = is_active and "%#TabLinePillActiveText#" or "%#TabLinePillInactiveText#"
		local hl_right = is_active and "%#TabLinePillActiveRight#" or "%#TabLinePillInactiveRight#"

		s = s .. hl_left .. separator
		if opts.show_numbers then
			s = s .. hl_text .. "  " .. i .. "  "
		else
			s = s .. hl_text .. "   "
		end
		s = s .. hl_right .. separator
		s = s .. "%#Normal#"
	end

	return s
end

function M.setup_tabline()
	highlights.setup_highlights()
	vim.o.tabline = "%!v:lua.require('pill-tabline.tabline').render()"
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

