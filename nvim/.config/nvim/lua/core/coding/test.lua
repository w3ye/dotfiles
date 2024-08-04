local M = {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"nvim-neotest/neotest-jest",
		},
		config = function()
			require("neotest").setup({
				discovery = {
					enabled = false,
				},
				adapters = {
					require("neotest-jest")({
						jestCommand = "yarn test --",
						jestConfigFile = function(file)
							if string.find(file, "/packages/") then
								local m = string.match(file, "(.-/[^/]+/)src") .. "jest.config.ts"
								print(m)
								return m
							end

							local m = vim.fn.getcwd() .. "/jest.config.ts"
							print(m)
							return m
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
				"<leader>nts",
				'<cmd>lua require("neotest").summary.toggle()<cr>',
				desc = "Toggle neotest summary",
			},
			{ "<leader>nr", '<cmd>lua require("neotest").run.run()', desc = "Run closest test" },
			{
				"<leader>nra",
				'<cmd>lua require("neotest").run.attach()<cr>',
				desc = "Attach closest test",
			},
			{
				"<leader>nrr",
				'<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<cr>',
				desc = "Run the whole file",
			},
			{
				"<leader>nct",
				'<cmd>lua require("neotest").run.run()<cr>',
				desc = "Run the nearest test",
			},
			{
				"<leader>ndt",
				'<cmd>require("neotest").run.run({strategy = "dap"})<cr>',
				desc = "Run the nearest test with dap",
			},
		},
	},
}

return M
