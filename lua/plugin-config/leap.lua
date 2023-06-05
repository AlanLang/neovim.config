return {
  "ggandor/leap.nvim",
  lazy = true,
  keys = { "E", "R", "W", "dE", "dR", "yE", "yR", "cE", "cR" },
  config = function()
    require('leap').add_default_mappings()
  end
}
