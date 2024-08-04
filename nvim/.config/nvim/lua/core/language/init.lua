local M = {
	{
		"ray-x/go.nvim",
		enabled = _G.enabled.go,
		dependencies = { -- optional packages
			"ray-x/guihua.lua",
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("go").setup()
			local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = "*.go",
				callback = function()
					require("go.format").goimport()
				end,
				group = format_sync_grp,
			})
		end,
		keys = {
			{ "<leader>tf", "<cmd>GoTestFile<cr>", desc = "Go Test File" },
			{ "<leader>tF", "<cmd>GoTestFunc<cr>", desc = "Go Test Func" },
		},
		event = { "CmdlineEnter" },
		ft = { "go", "gomod" },
		build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
	},
	-- {
	-- 	"nvim-neotest/neotest",
	-- 	enabled = _G.enabled.go,
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		"nvim-treesitter/nvim-treesitter",
	-- 		"antoinemadec/FixCursorHold.nvim",
	-- 		"thenbe/neotest-playwright",
	-- 	},
	-- 	keys = require("core.neotest").keys,
	-- 	config = function()
	-- 		require("core.neotest").neotest_setup()
	-- 	end,
	-- 	event = "BufEnter *.spec.ts",
	-- },
}

return M
