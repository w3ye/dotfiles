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
	{
		filter = {
			event = "msg_warn",
			kind = "",
			find = "timeout",
		},
		opts = { skip = true },
	},
	{
		filter = {
			event = "notify.info",
			kind = "",
			find = "No information available",
		},
		opts = { skip = true },
	},
	{
		filter = {
			event = "notify.info",
			kind = "",
			find = "No signature help available",
		},
		opts = { skip = true },
	},
	{
		filter = {
			event = "msg_show",
			kind = "",
			find = "no parser for",
		},
		opts = { skip = true },
	},
}

return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		views = {
			split = {
				enter = false,
			},
		},
		redirect = {
			view = "messages",
			filter = { event = "msg_show" },
		},
		routes = routes,
		messages = {
			-- NOTE: If you enable messages, then the cmdline is enabled automatically.
			-- This is a current Neovim limitation.
			enabled = true, -- enables the Noice messages UI
			view = "mini", -- default view for messages
			view_error = "mini", -- view for errors
			view_warn = "mini", -- view for warnings
			view_history = "mini", -- view for :messages
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
			desc = "Last notification (noice)",
		},
		{
			"<leader>nh",
			function()
				require("noice").cmd("history")
			end,
			desc = "History notification (noice)",
		},
		{
			"<leader>na",
			function()
				require("noice").cmd("all")
			end,
			desc = "All notification (noice)",
		},
	},
}
