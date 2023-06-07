return {
  "numToStr/Comment.nvim",
  lazy = true,
  keys = { "gcc", "gbc", "gc", "gb" },
  config = function()
    require("Comment").setup()
  end,
}
