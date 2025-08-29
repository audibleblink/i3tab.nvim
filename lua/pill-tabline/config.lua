local M = {}

M.defaults = {
	show_numbers = true,
	show_close_button = false,
	separator_style = "pill",
	auto_hide = false,
	close_on_middle_click = false,
	colors = {
		active = { fg = nil, bg = nil },
		inactive = { fg = nil, bg = nil },
	},
	theme_integration = {
		base46 = true,
	},
}

M.options = M.defaults

function M.setup(opts)
	M.options = vim.tbl_deep_extend("force", M.defaults, opts or {})
	vim.validate({
		show_numbers = { M.options.show_numbers, "boolean" },
		show_close_button = { M.options.show_close_button, "boolean" },
		separator_style = { M.options.separator_style, "string" },
		auto_hide = { M.options.auto_hide, "boolean" },
		close_on_middle_click = { M.options.close_on_middle_click, "boolean" },
	})
end

return M
