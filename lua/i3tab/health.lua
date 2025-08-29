local M = {}
local health = vim.health

function M.check()
	health.start("i3tab.nvim")

	local config = require("i3tab.config")
	local opts = config.options

	health.info("Configuration:")
	health.info("  show_numbers: " .. tostring(opts.show_numbers))
	health.info("  separator_style: " .. opts.separator_style)

	local base46_ok, base46 = pcall(require, "base46")
	if opts.theme_integration.base46 then
		if base46_ok then
			health.ok("base46 integration: available")
		else
			health.warn("base46 integration: enabled but base46 not found")
		end
	else
		health.info("base46 integration: disabled")
	end

	if vim.o.tabline:find("i3tab") then
		health.ok("tabline is set to i3tab")
	else
		health.warn("tabline is not set to i3tab: " .. vim.o.tabline)
	end

	local highlight_groups = {
		"i3tabInactiveSym",
		"i3tabInactiveText",
		"i3tabActiveText",
		"i3tabActiveSym",
		"i3tabPad",
	}

	local missing_highlights = {}
	for _, hl in ipairs(highlight_groups) do
		local hl_def = vim.api.nvim_get_hl(0, { name = hl })
		if vim.tbl_isempty(hl_def) then
			table.insert(missing_highlights, hl)
		end
	end

	if #missing_highlights == 0 then
		health.ok("All highlight groups are defined")
	else
		health.error("Missing highlight groups: " .. table.concat(missing_highlights, ", "))
	end
end

return M
