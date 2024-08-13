local routes = {
	{
		filter = {
			event = "msg_show",
			kind = "",
			find = "written",
		},
		opts = { skip = true },
	},
	{
		filter = {
			event = "msg_show",
			kind = "",
			find = "supermaven",
		},
		opts = { skip = true },
	},
}

local M = {
	"folke/noice.nvim",
	event = "VeryLazy",
	enabled = _G.enabled.noice,
	opts = {
		redirect = {
			view = "messages",
			filter = { event = "msg_show" },
		},
		routes = routes,
		messages = {
			-- NOTE: If you enable messages, then the cmdline is enabled automatically.
			-- This is a current Neovim limitation.
			enabled = true, -- enables the Noice messages UI
			view = "notify", -- default view for messages
			view_error = "messages", -- view for errors
			view_warn = "messages", -- view for warnings
			view_history = "messages", -- view for :messages
			view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
		},
	},
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	keys = {
		{
			"<leader>nl",
			function()
				require("noice").cmd("last")
			end,
		},
		{
			"<leader>nh",
			function()
				require("noice").cmd("history")
			end,
		},
		{
			"<leader>na",
			function()
				require("noice").cmd("all")
			end,
		},
	},
}

return M
