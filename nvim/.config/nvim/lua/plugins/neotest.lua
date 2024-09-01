return {
	{
		"nvim-neotest/neotest",
		lazy = true,
		event = "VeryLazy",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			"nvim-neotest/neotest-jest",
		},
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-jest")({
						jestCommand = "jest --watch",
						jestConfigFile = function(file)
							if string.find(file, "/packages/") then
								return string.match(file, "(.-/[^/]+/)src") .. "jest.config.ts"
							end

							return vim.fn.getcwd() .. "/jest.config.ts"
						end,
						env = { CI = true },
						cwd = function(path)
							return vim.fn.getcwd()
						end,
					}),
				},
			})
		end,
		keys = {
			{
				"<leader>ns",
				'<cmd>lua require("neotest").summary.toggle()<cr>',
				desc = "Toggle neotest summary",
			},
			{
				"<leader>nr",
				'<cmd>lua require("neotest").run.run()<cr>',
				desc = "Run closest test",
			},
			{
				"<leader>nt",
				'<cmd>lua require("neotest").run.attach()<cr>',
				desc = "Attach closest test",
			},
			{
				"<leader>nR",
				'<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<cr>',
				desc = "Run the whole file",
			},
		},
	},
	{
		"nvim-neotest/neotest-jest",
		lazy = true,
		event = "VeryLazy",
	},
}
