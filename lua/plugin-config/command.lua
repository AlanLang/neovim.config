local noremap = { noremap = true }
local silent_noremap = { noremap = true, silent = true }

local command_center_config = function()
  local command_center = require("command_center")
  command_center.add({
    {
      desc = "find files",
      cmd = ":Telescope find_files<CR>",
      keys = { "n", "<C-p>", noremap },
    },
    {
      desc = "format filed",
      cmd = "<cmd>lua vim.lsp.buf.format({ async = true })<CR>"
    },
    {
      desc = "commands",
      cmd = ":Telescope commands<CR>"
    },
    {
      desc = "jump list",
      cmd = ":Telescope jumplist<CR>"
    },
    {
      desc = "keymaps",
      cmd = ":Telescope keymaps<CR>"
    },
    {
      desc = "search string",
      cmd = ":Telescope live_grep<CR>"
    },
    {
      desc = "command history",
      cmd = ":Telescope command_history<CR>"
    },
    {
      desc = "trouble toggle",
      cmd = ":TroubleToggle<CR>"
    }
  })
end

return {
  "FeiyouG/command_center.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  config = command_center_config,
  cmd = "Telescope command_center",
}
