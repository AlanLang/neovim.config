return {
  "ggandor/leap.nvim",
  lazy = true,
  keys = { "s", "S", "W", "ds", "dS", "ys", "yS", "cs", "cS" },
  config = function()
    require("leap").opts.highlight_unlabeled_phase_one_targets = true
    require("leap").opts.safe_labels = { 'a', 's', 'f', 'g', 'h', 'j', 'k', 'l', 'q', 'w', 'e', 'r', 't', 'y', 'u',
      'i', 'o', 'p' }
    -- leap.add_default_mappings()
    -- vim.keymap.set({ "x", "o", "n" }, "s", "<Plug>(leap-forward-to)")
    -- vim.keymap.set({ "x", "o", "n" }, "S", "<Plug>(leap-backward-to)")
    -- vim.keymap.set({ "x", "o", "n" }, "W", "<Plug>(leap-from-window)")
    vim.keymap.set({ "x", "o", "n" }, "s", function()
      local current_window = vim.fn.win_getid()
      require('leap').leap { target_windows = { current_window } }
    end)
  end
}
