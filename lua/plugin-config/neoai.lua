return {
  "Bryley/neoai.nvim",
  lazy = true,
  cmd = "NeoAI",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  cmd = {
    "NeoAI",
    "NeoAIOpen",
    "NeoAIClose",
    "NeoAIToggle",
    "NeoAIContext",
    "NeoAIContextOpen",
    "NeoAIContextClose",
    "NeoAIInject",
    "NeoAIInjectCode",
    "NeoAIInjectContext",
    "NeoAIInjectContextCode",
  },
  keys = {
  },
  config = function()
    require("neoai").setup({
      open_api_key_env = "OPENAI_API_KEY",
      -- Options go here
    })
  end,
}
