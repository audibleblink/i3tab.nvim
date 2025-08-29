# 💊 pill-tabline.nvim

A minimalist pill-style tabline plugin for Neovim with automatic theme integration.

## ✨ Features

- 🎨 **Automatic theme integration** - Works with base46 (NvChad) and catppuccin out of the box
- ⚡ **Zero-config setup** - Works immediately with sensible defaults
- 🎯 **Minimal overhead** - Lazy initialization and efficient rendering
- 🔧 **Configurable** - Customize appearance and behavior
- 🗺️ **<Plug> mappings** - Define your own keybinds without conflicts
- 🏥 **Health checks** - Built-in troubleshooting with `:checkhealth pill-tabline`

## 📦 Installation

### Using [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  "your-username/pill-tabline.nvim",
  config = function()
    require("pill-tabline").setup({
      -- optional configuration
    })
  end
}
```

### Using [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {
  "your-username/pill-tabline.nvim",
  config = function()
    require("pill-tabline").setup()
  end
}
```

## ⚙️ Configuration

The plugin works out of the box without any configuration. All settings are optional:

```lua
require("pill-tabline").setup({
  -- Show tab numbers
  show_numbers = true,
  
  -- Separator style: "pill", "round", "square"
  separator_style = "pill",
  
  -- Hide tabline when only one tab
  auto_hide = false,
  
  -- Custom colors (nil = auto-detect from theme)
  colors = {
    active = { fg = nil, bg = nil },
    inactive = { fg = nil, bg = nil },
  },
  
  -- Theme integration
  theme_integration = {
    base46 = true,     -- NvChad base46
    catppuccin = true, -- Catppuccin
  },
})
```

## 🗺️ Keymaps

The plugin provides `<Plug>` mappings for you to bind to your preferred keys:

```lua
-- Toggle tabline visibility
vim.keymap.set("n", "<leader>tt", "<Plug>(PillTablineToggle)")

-- Tab navigation
vim.keymap.set("n", "]t", "<Plug>(PillTablineNext)")
vim.keymap.set("n", "[t", "<Plug>(PillTablinePrev)")
vim.keymap.set("n", "<leader>tn", "<Plug>(PillTablineNew)")
```

## 🔧 API

```lua
local pill_tabline = require("pill-tabline")

-- Toggle tabline visibility
pill_tabline.toggle_tabline()

-- Get current configuration
local config = pill_tabline.get_config()

-- Refresh highlights (useful after theme changes)
pill_tabline.refresh()
```

## 🏥 Troubleshooting

Run health checks to diagnose issues:

```vim
:checkhealth pill-tabline
```

### Common Issues

**Tabline not showing**: Check if `showtabline` is set correctly:
```vim
:set showtabline=2
```

**Colors look wrong**: Try refreshing highlights:
```lua
require("pill-tabline").refresh()
```

## 🎨 Screenshots

*Screenshots would go here showing the pill-style tabline with different themes*

## 📝 Minimal Config Template

For bug reports, use this minimal configuration:

```lua
-- init.lua
require("pill-tabline").setup()

-- Test with multiple tabs:
-- :tabnew | :tabnew | :tabnew
```

## 🤝 Contributing

Contributions are welcome! Please feel free to submit issues and pull requests.

## 📄 License

MIT License - see LICENSE file for details.