local M = {}
local config = require("i3tab.config")

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

	local bg = opts.colors.active.fg or colors.black
	local fg = opts.colors.active.bg or colors.blue
	local inactive = opts.colors.inactive.bg or colors.grey

	vim.api.nvim_set_hl(0, "i3tabActiveSym", { fg = fg, bg = bg })
	vim.api.nvim_set_hl(0, "i3tabActiveText", { fg = bg, bg = fg })
	vim.api.nvim_set_hl(0, "i3tabInactiveSym", { fg = inactive, bg = bg })
	vim.api.nvim_set_hl(0, "i3tabInactiveText", { fg = bg, bg = inactive })
	vim.api.nvim_set_hl(0, "i3tabPad", { bg = bg })
end

return M
