local smooth_cursor_config = require("plugin-config.smooth-cursor")
local nvim_tree = require("plugin-config.nvim-tree")
local lualine = require("plugin-config.lualine")
local mason = require("plugin-config.mason")
local telescope = require("plugin-config.telescope")
local command_center = require("plugin-config.command")
local treesitter = require("plugin-config.treesitter")
local mason_lspconfig = require("plugin-config.mason-lspconfig")
local nvim_lsp_config = require("lsp.lspconfig")
local cmp_config = require("plugin-config.cmp")
local lspkind = require("plugin-config.lspkind")
local null_ls = require("plugin-config.null")
local dashboard = require("plugin-config.dashboard")
local project = require("plugin-config.project")

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
  treesitter,
  -- 输入法自动切换
  "ybian/smartim",
  -- 弹出式窗口
  telescope,
  -- 文件树
  nvim_tree,
  -- 状态栏
  lualine,
  -- 命令中心
  command_center,
  -- 启动页面
  dashboard,
  -- 项目列表
  project,
  -- LSP 管理
  mason,
  mason_lspconfig,
  {
    "neovim/nvim-lspconfig",
    config = nvim_lsp_config,
  },
  -- 平滑滚动
  {
    "karb94/neoscroll.nvim",
    config = function()
      require("neoscroll").setup()
    end,
  },
  -- 光标平滑移动
  {
    "gen740/SmoothCursor.nvim",
    config = smooth_cursor_config,
  },
  -- 目标快速操作
  {
    "wellle/targets.vim",
  },
  -- 同缩进快速操作
  {
    "michaeljsmith/vim-indent-object",
  },
  -- git 信息
  {
    "f-person/git-blame.nvim",
  },
  -- {
  --   "github/copilot.vim",
  -- },
  -- 注释
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    config = function()
      require("Comment").setup()
    end,
  },
  -- 代码补全
  {
    "hrsh7th/nvim-cmp",
    config = cmp_config,
    dependencies = {
      "hrsh7th/vim-vsnip",
      "hrsh7th/cmp-vsnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "rafamadriz/friendly-snippets",
    },
  },
  {
    "easymotion/vim-easymotion",
  },
  {
    "mg979/vim-visual-multi",
  },
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  },
  lspkind,
  null_ls,
})
