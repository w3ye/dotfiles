local M = {
	"glepnir/dashboard-nvim",
	lazy = false,
	event = "VimEnter",
	enabled = _G.enabled.dashboard,
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
	config = function()
		require("dashboard").setup({
			theme = "doom",
			config = {
				header = true,
				week_header = {
					enable = true,
				},
				center = {
					{
						icon = " ",
						icon_hl = "Title",
						desc = "Find File",
						desc_hl = "String",
						key = "f",
						key_hl = "Number",
						action = "Telescope find_files",
					},
					{
						icon = " ",
						desc = "Recent files",
						key = "o",
						action = "Telescope oldfiles",
					},
					{
						icon = " ",
						desc = "Telescope",
						key = "t",
						action = "Telescope",
					},
					{
						icon = " ",
						desc = "Projects",
						key = "p",
						action = "Telescope projects",
					},
				},
				footer = {}, --your footer
			},
		})
	end,
}
return M
