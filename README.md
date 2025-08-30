#  i3tab.nvim

A minimalist tabline plugin for Neovim with automatic theme integration.

## ✨ Features

- 🎨 **Automatic theme integration** - Works with base46 (NvChad)
- ⚡ **Zero-config setup** - Works immediately with sensible defaults
- 🎯 **Minimal overhead** - Lazy initialization and efficient rendering
- 🔧 **Configurable** - Customize appearance and behavior
- 🗺️ **<Plug> mappings** - Define your own keybinds without conflicts
- 🏥 **Health checks** - Built-in troubleshooting with `:checkhealth i3tab`

## 📦 Installation

### Using [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  "audibleblink/i3tab.nvim",
  opts = {}
}
```

## ⚙️ Configuration

The plugin works out of the box without any configuration. All settings are optional:

```lua
require("i3tab").setup({
	show_numbers = true,
    -- spacing around numbers
	padding = "",
    -- spacing between tabs
	spacing = " ",
    -- round, ramp, arrow, dot, dot2, tab, none
	separator_style = "round",
    -- left, center, right
	position = "center",
    -- color overrides, if not using theme_integration
	colors = {
		active = { fg = nil, bg = nil },
		inactive = { fg = nil, bg = nil },
	},
    -- whether or not to enable a theme engine
	theme_integration = {
		base46 = false,
	},
})
```

## 🗺️ Keymaps

The plugin provides `<Plug>` mappings for you to bind to your preferred keys:

```lua
-- Toggle tabline visibility
vim.keymap.set("n", "<leader>tt", "<Plug>(i3tabToggle)")

```

## 🔧 API

```lua
local i3tab = require("i3tab")

-- Toggle tabline visibility
i3tab.toggle_tabline()

-- Refresh highlights (useful after theme changes)
i3tab.refresh()
```

## 🏥 Troubleshooting

Run health checks to diagnose issues:

```vim
:checkhealth i3tab
```

### Common Issues

**Tabline not showing**: Check if `showtabline` is set correctly:
```vim
:set showtabline=2
```

**Colors look wrong**: Try refreshing highlights:
```lua
require("i3tab").refresh()
```

