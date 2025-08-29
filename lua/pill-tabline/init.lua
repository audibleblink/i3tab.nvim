local M = {}
local config = require("pill-tabline.config")
local tabline = require("pill-tabline.tabline")

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

