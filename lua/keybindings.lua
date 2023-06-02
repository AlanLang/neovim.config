-- 插件快捷键
local pluginKeys = {}
local map = vim.api.nvim_set_keymap

-- 复用 opt 参数
local opt = {noremap = true, silent = true }
vim.g.mapleader = " "
vim.g.maplocalleader = " "


map("n", "<leader>a", "<C-o>", opt)
map("n", "<leader>z", "<C-i>", opt)
-- windows 分屏快捷键
map("n", "<leader>d", ":vsp<CR>", opt)
map("n", "<leader>x", ":sp<CR>", opt)
-- 关闭当前
map("n", "<leader>w", "<C-w>c", opt)
map("n", "<leader>q", "<C-w>o", opt)
-- Alt + hjkl  窗口之间跳转
map("n", "<leader>h", "<C-w>h", opt)
map("n", "<leader>j", "<C-w>j", opt)
map("n", "<leader>k", "<C-w>k", opt)
map("n", "<leader>l", "<C-w>l", opt)

-- nvim-tree
map("n", "<leader>e", ":NvimTreeToggle<CR>", opt)
-- 列表快捷键
pluginKeys.nvimTreeList = {
  -- 打开文件或文件夹
  { key = {"<CR>", "o", "<2-LeftMouse>"}, action = "edit" },
  -- 分屏打开文件
  { key = "v", action = "vsplit" },
  { key = "h", action = "split" },
  -- 显示隐藏文件
  { key = "i", action = "toggle_custom" }, -- 对应 filters 中的 custom (node_modules)
  { key = ".", action = "toggle_dotfiles" }, -- Hide (dotfiles)
  -- 文件操作
  { key = "<F5>", action = "refresh" },
  { key = "a", action = "create" },
  { key = "d", action = "remove" },
  { key = "r", action = "rename" },
  { key = "x", action = "cut" },
  { key = "c", action = "copy" },
  { key = "p", action = "paste" },
  { key = "s", action = "system_open" },
}

-- Telescope
-- 查找文件
map("n", "<leader>g", ":Telescope find_files<CR>", opt)
-- 打开命令栏
map("n", "<leader>p", ":Telescope command_center<CR>", opt)
-- 打开当前符号搜索
map("n", "<leader>s", ":Telescope lsp_document_symbols<CR>", opt)
-- 最近打开的文件
map("n", "<leader>q", ":Telescope oldfiles<CR>", opt)

return pluginKeys

