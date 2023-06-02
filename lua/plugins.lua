local smooth_cursor_config = require('plugin-config.smooth-cursor')

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
    dependencies = {"nvim-lua/plenary.nvim"}
  },
  {
    "kyazdani42/nvim-tree.lua",
    dependencies = {"kyazdani42/nvim-web-devicons"}
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {"kyazdani42/nvim-web-devicons"}
  },
  {
    "FeiyouG/command_center.nvim",
    dependencies = {"nvim-telescope/telescope.nvim"}
  },
  {
    "williamboman/mason.nvim",
    event = "VeryLazy",
    build = ":MasonUpdate",
    config = function()
       require("mason").setup()
    end
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
    config = function()
      require('smoothcursor').setup(smooth_cursor_config)
    end

  }
})
