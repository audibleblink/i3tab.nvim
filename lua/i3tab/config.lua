local M = {}

M.defaults = {
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

M.options = M.defaults

function M.setup(opts)
	M.options = vim.tbl_deep_extend("force", M.defaults, opts or {})
	vim.validate({
		show_numbers = { M.options.show_numbers, "boolean" },
		separator_style = { M.options.separator_style, "string" },
		position = { M.options.separator_style, "string" },
	})
end

return M
