-- 如果找不到 telescope 组件，就不继续执行
local status, lualine = pcall(require, "telescope")
if not status then
    vim.notify("没有找到 telescope")
  return
end

-- 列表操作快捷键
local list_keys = require('keybindings').mapTelescope

-- https://github.com/nvim-telescope/telescope.nvim#getting-started
lualine.setup{
    defaults = {
      -- Default configuration for telescope goes here:
      -- config_key = value,
      mappings = {
        i = list_keys
      }
    },
    pickers = {
      -- Default configuration for builtin pickers goes here:
      -- picker_name = {
      --   picker_config_key = value,
      --   ...
      -- }
      -- Now the picker_config_key will be applied every time you call this
      -- builtin picker
    },
    extensions = {
      -- Your extension configuration goes here:
      -- extension_name = {
      --   extension_config_key = value,
      -- }
      -- please take a look at the readme of the extension you want to configure
    }
  }


-- lualine.load_extension("command_center")
