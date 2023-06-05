local cmp_config = function()
  local cmp = require("cmp")
  local format = {
    format = require("lspkind").cmp_format({
      mode = 'symbol',
      --mode = 'symbol', -- show only symbol annotations

      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      -- The function below will be called before any actual modifications from lspkind
      -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
      before = function(entry, vim_item)
        -- Source 显示提示来源
        vim_item.menu = "[" .. string.upper(entry.source.name) .. "]"
        return vim_item
      end
    })
  }

  cmp.setup({
    -- 指定 snippet 引擎
    snippet = {
      expand = function(args)
        -- For `vsnip` users.
        vim.fn["vsnip#anonymous"](args.body)

        -- For `luasnip` users.
        -- require('luasnip').lsp_expand(args.body)

        -- For `ultisnips` users.
        -- vim.fn["UltiSnips#Anon"](args.body)

        -- For `snippy` users.
        -- require'snippy'.expand_snippet(args.body)
      end,
    },
    -- 补全源
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        -- For vsnip users.
        { name = "vsnip" },
      },
      { { name = "buffer" }, { name = "path" } }),

    -- 快捷键设置
    mapping = require("keybindings").cmp(cmp),
    -- 使用lspkind-nvim显示类型图标
    formatting = format
  })

  -- / 查找模式使用 buffer 源
  cmp.setup.cmdline("/", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = "buffer" },
    },
  })

  -- : 命令行模式中使用 path 和 cmdline 源.
  cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = "path" },
    }, {
      { name = "cmdline" },
    }),
  })
end

return {
  "hrsh7th/nvim-cmp",
  lazy = true,
  event = { "InsertEnter" },
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
}
