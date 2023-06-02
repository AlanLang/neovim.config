local status, command_center = pcall(require, "command_center")
if not status then
    vim.notify("没有找到 command_center")
  return
end

local noremap = {noremap = true}
local silent_noremap = {noremap = true, silent = true}


command_center.add({
    {
      desc = "find files",
      cmd = ":Telescope find_files<CR>",
      keys = { "n", "<C-p>", noremap },
    },
}) 
