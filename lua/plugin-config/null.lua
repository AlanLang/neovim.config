return {
  "jose-elias-alvarez/null-ls.nvim",
  dependencies = {"nvim-lua/plenary.nvim"},
  config = function ()
    local null_ls = require("null-ls")
    local formatting = null_ls.builtins.formatting
    null_ls.setup({
      debug = false,
      sources = {
        -- Formatting ---------------------
        --  brew install shfmt
        formatting.shfmt,
        -- StyLua
        formatting.stylua,
        -- frontend
        formatting.prettier.with({ -- 只比默认配置少了 markdown
          filetypes = {
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            "css",
            "less",
            "html",
            "json",
            "yaml",
            "lua",
          },
          prefer_local = "node_modules/.bin",
        }),
        -- formatting.fixjson,
        -- formatting.black.with({ extra_args = { "--fast" } }),
      },
      -- 保存自动格式化
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
              -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
              vim.lsp.buf.format({ async = false })
            end,
          })
        end
      end,
    })
  end
}
