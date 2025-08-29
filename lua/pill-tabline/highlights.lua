local M = {}
local config = require("pill-tabline.config")

local function get_base46_colors()
	local ok, base46 = pcall(require, "base46")
	if ok then
		return base46.get_theme_tb("base_30")
	end
	return nil
end

local function get_fallback_colors()
	return {
		blue = "#7aa2f7",
		grey = "#565f89",
		black = "#1a1b26",
	}
end

function M.setup_highlights()
	local colors
	local opts = config.options

	if opts.theme_integration.base46 then
		colors = get_base46_colors()
	end

	if not colors then
		colors = get_fallback_colors()
	end

	local active_fg = opts.colors.active.fg or colors.black
	local active_bg = opts.colors.active.bg or colors.blue
	local inactive_fg = opts.colors.inactive.fg or colors.black
	local inactive_bg = opts.colors.inactive.bg or colors.grey

	vim.api.nvim_set_hl(0, "TabLinePillActiveLeft", { fg = active_bg })
	vim.api.nvim_set_hl(0, "TabLinePillActiveText", { fg = active_fg, bg = active_bg, bold = false })
	vim.api.nvim_set_hl(0, "TabLinePillActiveRight", { fg = active_bg })
	vim.api.nvim_set_hl(0, "TabLinePillInactiveLeft", { fg = inactive_bg })
	vim.api.nvim_set_hl(0, "TabLinePillInactiveText", { fg = inactive_fg, bg = inactive_bg })
	vim.api.nvim_set_hl(0, "TabLinePillInactiveRight", { fg = inactive_bg })
end

return M

