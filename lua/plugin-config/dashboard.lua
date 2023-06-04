local header = {
	[[ ______   __                        ]],
	[[ /      \ /  |                      ]],
	[[ /$$$$$$  |$$ |  ______   _______   ]],
	[[ $$ |__$$ |$$ | /      \ /       \  ]],
	[[ $$    $$ |$$ | $$$$$$  |$$$$$$$  | ]],
	[[ $$$$$$$$ |$$ | /    $$ |$$ |  $$ | ]],
	[[ $$ |  $$ |$$ |/$$$$$$$ |$$ |  $$ | ]],
	[[ $$ |  $$ |$$ |$$    $$ |$$ |  $$ | ]],
	[[ $$/   $$/ $$/  $$$$$$$/ $$/   $$/  ]],
  [[]],
  [[]],
}

return {
	"glepnir/dashboard-nvim",
	event = "VimEnter",
	config = function()
		require("dashboard").setup({
			-- config
			config = {
				header = header,
				shortcut = {
					{ icon = " ", desc = "Projects", group = 'Number', action = "Telescope projects", key = "j" },
					{
						icon = " ",
            desc = "Keybindings",
						group = 'Number',
						action = "edit ~/.config/nvim/lua/keybindings.lua",
						key = "k",
					},
					{
            icon = " ",
						desc = "Edit Projects",
            group = 'Number',
						action = "edit ~/.local/share/nvim/project_nvim/project_history",
						key = "e",
					},
				},
			},
		})
	end,
	dependencies = { { "kyazdani42/nvim-web-devicons" } },
}
