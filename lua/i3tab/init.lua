local config = require("i3tab.config")
local tabline = require("i3tab.tabline")

local M = {}

function M.setup(opts)
	config.setup(opts)
end

function M.toggle_tabline()
	tabline.toggle_tabline()
end

function M.refresh()
	tabline.refresh()
end

return M
