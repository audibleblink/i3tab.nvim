local M = {}

M.defaults = {
	separators = {
		arrow = { left = "", right = "" },
		round = { left = "", right = "" },
		tab = { left = "", right = "" },
		dot = { left = "", right = "" },
		dot2 = { left = "", right = "" },
		ramp = { left = "", right = "" },
		none = { left = "", right = "" },
	},
	padding = "",
	spacing = " ",
	show_numbers = true,
	separator_style = "round",
	position = "center",
	colors = {
		active = { fg = nil, bg = nil },
		inactive = { fg = nil, bg = nil },
	},
	theme_integration = {
		base46 = false,
	},
}

M.options = vim.deepcopy(M.defaults)

function M.setup(opts)
	M.options = vim.tbl_deep_extend("force", M.options, opts or {})
	if M.options.separator_style == "dot" then
		M.options.show_numbers = false
	end
	vim.validate({
		show_numbers = { M.options.show_numbers, "boolean" },
		separator_style = { M.options.separator_style, "string" },
		position = { M.options.separator_style, "string" },
	})

	require("i3tab.highlights").setup_highlights()
end

return M
