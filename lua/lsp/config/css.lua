local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

return {
  on_setup = function(server)
    server:setup({
      capabilities = capabilities,
      settings = {
        css = {
          validate = true,
        },
        less = {
          validate = true,
        },
        scss = {
          validate = true,
        },
      },
      flags = {
        debounce_text_changes = 150,
      }
    })
  end,
}
