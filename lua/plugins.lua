local smooth_cursor_config = require('plugin-config.smooth-cursor')
local nvim_tree_config = require('plugin-config.nvim-tree')
local lualine_config = require('plugin-config.lualine')
local mason_config = require('plugin-config.mason')
local telescope_config = require('plugin-config.telescope')
local command_center_config = require('plugin-config.command')

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- 主题
  "AlanLang/oceanic-next",
  -- 设置透明
  "xiyaowong/nvim-transparent",
  -- 输入法自动切换
  "ybian/smartim",
  -- 弹出式窗口
  {
    "nvim-telescope/telescope.nvim",
    config = telescope_config,
    cmd = "Telescope",
    dependencies = {"nvim-lua/plenary.nvim"}
  },
  -- 文件树
  {
   "kyazdani42/nvim-tree.lua",
    dependencies = {"kyazdani42/nvim-web-devicons"},
    cmd = "NvimTreeToggle",
    config = nvim_tree_config 
  },
  -- 状态栏
  {
   "nvim-lualine/lualine.nvim",
    dependencies = {"kyazdani42/nvim-web-devicons"},
    config = lualine_config 
  },
  -- 命令中心
  {
    "FeiyouG/command_center.nvim",
    dependencies = {"nvim-telescope/telescope.nvim"},
    config = command_center_config,
    cmd = "Telescope command_center",
  },
  -- LSP 管理
  {
    "williamboman/mason.nvim",
    event = "VeryLazy",
    build = ":MasonUpdate",
    config = mason_config
  },
  -- 平滑滚动
  {
    "karb94/neoscroll.nvim",
    event = "VeryLazy",
    config = function()
      require("neoscroll").setup()
    end
  },
  -- 光标平滑移动
  {
    "gen740/SmoothCursor.nvim",
    event = "VeryLazy",
    config = smooth_cursor_config 
  },
  -- 目标快速操作
  {
    "wellle/targets.vim",
    event = "VeryLazy"
  },
  -- 同缩进快速操作
  {
    "michaeljsmith/vim-indent-object",
    event = "VeryLazy"
  },
  -- git 信息
  {
    "f-person/git-blame.nvim",
    event = "VeryLazy"
  },
  {
    "github/copilot.vim",
    event = "VeryLazy",
  },
  -- 注释
  {
    'numToStr/Comment.nvim',
    event = "VeryLazy",
    config = function()
        require('Comment').setup()
    end
  }
})
