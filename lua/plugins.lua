local smooth_cursor = require("plugin-config.smooth-cursor")
local nvim_tree = require("plugin-config.nvim-tree")
local lualine = require("plugin-config.lualine")
local mason = require("plugin-config.mason")
local telescope = require("plugin-config.telescope")
local command_center = require("plugin-config.command")
local treesitter = require("plugin-config.treesitter")
local mason_lspconfig = require("plugin-config.mason-lspconfig")
local lspconfig = require("plugin-config.lspconfig")
local cmp = require("plugin-config.cmp")
local lspkind = require("plugin-config.lspkind")
local null_ls = require("plugin-config.null")
local dashboard = require("plugin-config.dashboard")
local project = require("plugin-config.project")
local neoscroll = require("plugin-config.neoscroll")
local comment = require("plugin-config.comment")
local autopairs = require("plugin-config.autopairs")

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
  lspconfig,
  -- 平滑滚动
  neoscroll,
  -- 光标平滑移动
  smooth_cursor,
  -- 目标快速操作
  "wellle/targets.vim",
  -- 同缩进快速操作
  "michaeljsmith/vim-indent-object",
  -- git 信息
  "f-person/git-blame.nvim",
  -- {
  --   "github/copilot.vim",
  -- },
  -- 注释
  comment,
  -- 代码补全
  cmp,
  -- 快速选择
  "easymotion/vim-easymotion",
  -- 多光标选择
  "mg979/vim-visual-multi",
  autopairs,
  lspkind,
  null_ls,
  "wakatime/vim-wakatime"
})
