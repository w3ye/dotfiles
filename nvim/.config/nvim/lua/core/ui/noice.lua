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
			event = "msg_show.echo",
			kind = "",
			find = "change",
		},
		opts = { skip = true },
	},
	{
		filter = {
			event = "msg_show",
			kind = "",
			find = "[supermaven-nvim]",
		},
		opts = { skip = true },
	},
	{
		filter = {
			event = "msg_show",
			kind = "",
			find = "lines",
		},
		opts = { skip = true },
	},
	{
		filter = {
			event = "msg_show",
			kind = "",
			find = "seconds ago",
		},
		opts = { skip = true },
	},
	filter = {
		event = "msg_show",
		min_height = 10,
		["not"] = { kind = { "search_count", "echo" } },
	},
}

local M = {
	"folke/noice.nvim",
	enabled = _G.enabled.noice,
	lazy = false,
	config = function(_, opts)
		require("noice").setup(opts)
	end,
	opts = {
		views = {
			cmdline_popup = {
				border = {
					style = "none",
					padding = { 2, 3 },
				},
				filter_options = {},
				win_options = {
					winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
				},
			},
		},
		lsp = {
			-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
		},
		-- you can enable a preset for easier configuration
		presets = {
			bottom_search = true, -- use a classic bottom cmdline for search
			command_palette = true, -- position the cmdline and popupmenu together
			long_message_to_split = true, -- long messages will be sent to a split
			inc_rename = false, -- enables an input dialog for inc-rename.nvim
			lsp_doc_border = false, -- add a border to hover docs and signature help
		},
		routes = routes,
		messages = {
			enabled = true, -- enables the Noice messages UI
			view = "messages", -- default view for messages
			view_error = "messages", -- view for errors
			view_warn = "messages", -- view for warnings
			view_history = "messages", -- view for :messages
			view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
		},
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
