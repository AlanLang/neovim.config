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
  "AlanLang/oceanic-next",
  "xiyaowong/nvim-transparent",
  {
    "nvim-telescope/telescope.nvim",
    config = telescope_config,
    cmd = "Telescope",
    dependencies = {"nvim-lua/plenary.nvim"}
  },
  {
   "kyazdani42/nvim-tree.lua",
    dependencies = {"kyazdani42/nvim-web-devicons"},
    cmd = "NvimTreeToggle",
    config = nvim_tree_config 
  },
  {
   "nvim-lualine/lualine.nvim",
    dependencies = {"kyazdani42/nvim-web-devicons"},
    config = lualine_config 
  },
  {
    "FeiyouG/command_center.nvim",
    dependencies = {"nvim-telescope/telescope.nvim"},
    config = command_center_config,
    cmd = "Telescope",
  },
  {
    "williamboman/mason.nvim",
    event = "VeryLazy",
    build = ":MasonUpdate",
    config = mason_config
  },
  {
    "karb94/neoscroll.nvim",
    event = "VeryLazy",
    config = function()
      require("neoscroll").setup()
    end
  },
  {
    "gen740/SmoothCursor.nvim",
    event = "VeryLazy",
    config = smooth_cursor_config 
  },
  {
    "wellle/targets.vim",
    event = "VeryLazy"
  },
  {
    "michaeljsmith/vim-indent-object",
    event = "VeryLazy"
  },
  {
    "f-person/git-blame.nvim",
    event = "VeryLazy"
  },
  {
    "github/copilot.vim",
    event = "VeryLazy",
  },
  {
    'numToStr/Comment.nvim',
    event = "VeryLazy",
    config = function()
        require('Comment').setup()
    end
  }
})
