local autopairs = require("core.coding.autopairs")
local comment = require("core.coding.comment")
local tabout = require("core.coding.tabout")
local todo_comment = require("core.coding.todo_comments")
local trouble = require("core.coding.trouble")
local enabled = _G.enabled
local lspsaga = require("core.coding.lspsaga")
local git = require("core.coding.git")
-- local dap = require("core.coding.debugger.init")
local guard = require("core.coding.guard")
local treesitter = require("core.coding.treesitter")
local telescope = require("core.coding.telescope")
local dropbar = require("core.coding.breadcrumbs")
local test = require("core.coding.test")
local project = require("core.coding.project")

local M = {
	autopairs,
	comment,
	{ "tpope/vim-surround", enabled = enabled.vim_surround },
	tabout,
	todo_comment,
	{ "JoosepAlviste/nvim-ts-context-commentstring", enabled = enabled.comment_string },
	{ "mg979/vim-visual-multi", enabled = enabled.visual_multi },
	{
		"AckslD/nvim-trevJ.lua",
		enabled = enabled.trevJ,
		keys = {
			{
				"<leader>J",
				"<cmd>lua require('trevj').format_at_cursor()<cr>",
			},
		},
	},
	trouble,
	lspsaga,
	git,
	{
		"windwp/nvim-spectre",
		dependencies = "nvim-lua/plenary.nvim",
		keys = {
			{
				"<leader>sr",
				function()
					require("spectre").open()
				end,
				desc = "Spectre open",
			},
		},
	},
	-- dap,
	guard,
	treesitter,
	telescope,
	dropbar,
	test,
	project,
}

return M
