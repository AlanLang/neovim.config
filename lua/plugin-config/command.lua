local noremap = {noremap = true}
local silent_noremap = {noremap = true, silent = true}

return function()
  local command_center = require("command_center")
  command_center.add({
    {
      desc = "find files",
      cmd = ":Telescope find_files<CR>",
      keys = { "n", "<C-p>", noremap },
    },
}) 
end
