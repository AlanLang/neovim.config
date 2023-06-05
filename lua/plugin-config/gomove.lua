return {
  "booperlv/nvim-gomove",
  config = function()
    require("gomove").setup({
      map_defaults = false,
      reindent = true,
      undojoin = true,
      move_past_end_col = false,
    })
    local map = vim.api.nvim_set_keymap
    map("x", "<left>", "<Plug>GoVSMLeft", { noremap = true, silent = true })
    map("x", "<down>", "<Plug>GoVSMDown", { noremap = true, silent = true })
    map("x", "<up>", "<Plug>GoVSMUp", { noremap = true, silent = true })
    map("x", "<right>", "<Plug>GoVSMRight", { noremap = true, silent = true })
  end,
}
