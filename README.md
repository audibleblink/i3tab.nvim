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
--defaults
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
    -- custom separator characters (optional)
	separators = {
		arrow = { left = "", right = "" },
		round = { left = "", right = "" },
		tab = { left = "", right = "" },
		dot = { left = "", right = "" },
		dot2 = { left = "", right = "" },
		ramp = { left = "", right = "" },
		none = { left = "", right = "" },
	},
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

### Separators

**dot**
![](https://github.com/user-attachments/assets/413f20c6-4528-45f8-b97c-08cac57c4bdd)

**dot2**
![](https://github.com/user-attachments/assets/677526d7-b093-4232-b5d8-e31883f2d18a)

**arrow**
![](https://github.com/user-attachments/assets/812f767f-2f4e-48c4-a141-d0f923684e32)

**round**
![](https://github.com/user-attachments/assets/4b9d1f0a-a440-4e62-86d6-3ea447893ca2)

**tab**
![](https://github.com/user-attachments/assets/3b926ddf-aa6a-479f-8ea9-588d54901b61)

**ramp**
![](https://github.com/user-attachments/assets/fd8b5b95-efb0-4641-8fad-e8c843c3270f)


### Custom separators

You can set a single `left` separator and leave `right` blank if you just want a tab marker and
don't care about numbers

```lua
		opts = {
			separator_style = "blah",
			show_numbers = false,
			separators = { blah = { left = "🦞", right = "" } },
		},
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

