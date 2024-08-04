local M = {
	{
		"rcarriga/nvim-dap-ui",
		-- lazy = true,
		lazy = false,
		enabled = enabled,
		dependencies = { "mfussenegger/nvim-dap" },
		config = function()
			require("dapui").setup({
				controls = {
					element = "repl",
					enabled = true,
					icons = {
						disconnect = "",
						pause = "",
						play = "",
						run_last = "",
						step_back = "",
						step_into = "",
						step_out = "",
						step_over = "",
						terminate = "",
					},
				},
				element_mappings = {},
				expand_lines = true,
				floating = {
					border = "single",
					mappings = {
						close = { "q", "<Esc>" },
					},
				},
				force_buffers = true,
				icons = {
					collapsed = "",
					current_frame = "",
					expanded = "",
				},
				layouts = {
					{
						elements = {
							{
								id = "scopes",
								size = 0.25,
							},
							{
								id = "watches",
								size = 0.25,
							},
							{
								id = "breakpoints",
								size = 0.25,
							},
							{
								id = "stacks",
								size = 0.25,
							},
						},
						position = "left",
						size = 60,
					},
					{
						elements = {
							{
								id = "repl",
								size = 0.25,
							},
							{
								id = "console",
								size = 0.25,
							},
						},
						position = "bottom",
						size = 10,
					},
				},
				mappings = {
					edit = "e",
					expand = { "<CR>", "<2-LeftMouse>" },
					open = "o",
					remove = "d",
					repl = "r",
					toggle = "t",
				},
				render = {
					indent = 1,
					max_value_lines = 100,
				},
			})

			local dap, dapui = require("dap"), require("dapui")

			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open({})
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close({})
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close({})
			end
		end,
		keys = {
			{ "<leader>ui", "<cmd>lua require'dapui'.toggle()<cr>", desc = "Toggle DAP UI" },
			{
				"<Leader>bh",
				function()
					require("dap.ui.widgets").hover()
				end,
				desc = "widget hover",
				mode = { "n", "v" },
			},
			{

				"<Leader>bp",
				function()
					require("dap.ui.widgets").preview()
				end,
				desc = "widget preview",
				mode = { "n", "v" },
			},
			{
				"<Leader>bs",
				function()
					local widgets = require("dap.ui.widgets")
					widgets.sidebar(widgets.scopes).open()
				end,
			},
		},
	},
}

return M
