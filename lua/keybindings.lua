-- 插件快捷键keyl
local pluginKeys = {}
local map = vim.api.nvim_set_keymap

-- 复用 opt 参数
local opt = {noremap = true, silent = true }
vim.g.mapleader = " "
vim.g.maplocalleader = " "

map("n", "<leader>a", "<C-o>", opt)
map("n", "<leader>z", "<C-i>", opt)
map("n", "<leader>s", ":w<CR>", opt)
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

map("n", "<leader>f", "<Plug>(easymotion-s)", opt)

-- Telescope
-- 查找文件
map("n", "<leader>g", ":Telescope find_files<CR>", opt)
-- 打开命令栏
map("n", "<leader>p", ":Telescope command_center<CR>", opt)
map("n", "<leader>o", ":Telescope lsp_document_symbols<CR>", opt)
-- 打开当前符号搜索
-- map("n", "<leader>d", ":Telescope lsp_document_symbols<CR>", opt)

-- nvim-tree
map("n", "<leader>e", ":NvimTreeToggle<CR>", opt)
-- 列表快捷键
pluginKeys.nvimTreeList = {
  -- 打开文件或文件
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

-- lsp 回调函数快捷键设置
pluginKeys.mapLSP = function(mapbuf)
  -- rename
  mapbuf("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
  -- code action
  mapbuf("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
  -- go xx
  mapbuf("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
  mapbuf("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
  mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
  mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
  -- diagnostic
  mapbuf("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
  mapbuf("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
  mapbuf("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)
  -- mapbuf("n", "gf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opt)
  -- 没用到
  -- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
  -- mapbuf("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opt)
  -- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
  -- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
  -- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
  -- mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
end

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		-- Buffer
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "gr", ":Telescope lsp_references <CR>", opts)
		vim.keymap.set("n", "gd", ":Telescope lsp_definitions <CR>", opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set("n", "<leader>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
		--vim.keymap.set("n", "<leader>f", function()
		--	vim.lsp.buf.format({ async = true })
		--end, opts)
	end,
})


-- nvim-cmp 自动补全
pluginKeys.cmp = function(cmp)
  return {
      -- 出现补全
      ["<A-.>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
      -- 取消
      ["<A-,>"] = cmp.mapping({
          i = cmp.mapping.abort(),
          c = cmp.mapping.close()
      }),
      -- 上一个
      ["<up>"] = cmp.mapping.select_prev_item(),
      -- 下一个
      ["<down>"] = cmp.mapping.select_next_item(),
      -- 确认
      ["<CR>"] = cmp.mapping.confirm({
          select = true,
          behavior = cmp.ConfirmBehavior.Replace
      }),
      -- 如果窗口内容太多，可以滚动
      ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}),
      ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), {"i", "c"}),
  }
end

return pluginKeys

