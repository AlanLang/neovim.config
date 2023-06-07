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
local lazygit = require("plugin-config.lazygit")
local copilot = require("plugin-config.copilot")
local trouble = require("plugin-config.trouble")
local toggleterm = require("plugin-config.toggleterm")
local leap = require("plugin-config.leap")
local flit = require("plugin-config.flit")
local treesitter_context = require("plugin-config.treesitter-context")
local better_escape = require("plugin-config.better-escape")
local marks = require("plugin-config.marks")
local surround = require("plugin-config.surround")
local gomove = require("plugin-config.gomove")
local search_replace = require("plugin-config.search-replace")
local textobjects = require("plugin-config.textobjects")
local jester = require("plugin-config.jester")
local spectre = require("plugin-config.spectre")
local hop = require("plugin-config.hop")
local persistence = require("plugin-config.persistence")

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
  "alanlang/oceanic-next",
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
  -- lsp 管理
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
  {
    "f-person/git-blame.nvim",
    event = "VeryLazy",
    lazy = true,
  },
  -- 注释
  comment,
  -- 代码补全
  cmp,
  -- 多光标选择
  "mg979/vim-visual-multi",
  -- 自动补全
  autopairs,
  -- 代码提示
  lspkind,
  -- 代码格式化
  null_ls,
  -- 代码时间统计
  "wakatime/vim-wakatime",
  -- git 管理
  lazygit,
  -- 代码片段
  copilot,
  -- 代码错误提示
  trouble,
  -- 弹出式终端
  toggleterm,
  -- 快速在可视页面跳转
  leap,
  -- 快速在当前行进行查找
  flit,
  -- 代码上下文
  treesitter_context,
  -- 退出模式
  better_escape,
  -- 可视化标签
  marks,
  -- 快速操作包围符号
  surround,
  -- 移动选中的文本
  gomove,
  -- 方便填写查找替换的表达式
  search_replace,
  -- 快速操作对象
  textobjects,
  -- 方便运行测试
  jester,
  -- 全局查找替换
  spectre,
  -- 快速跳转
  hop,
  -- 会话管理
  persistence,
})
