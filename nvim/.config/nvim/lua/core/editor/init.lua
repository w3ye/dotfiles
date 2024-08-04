local enabled = _G.enabled
local bookmarks = require("core.editor.bookmarks")
local oil = require("core.editor.oil")
local undotree = require("core.editor.undotree")
local flash = require("core.editor.flash")
local whichkey = require("core.editor.whichkey")
local lastplace = require("core.editor.lastplace")

local minor_setup = {
	"gpanders/editorconfig.nvim",
	whichkey,
	lastplace,
	{
		"ThePrimeagen/harpoon",
		enabled = enabled.harpoon,
		keys = {
			{ "<leader>hm", '<cmd>lua require("harpoon.mark").add_file()<cr>', desc = "harpoon mark" },
			{ "<leader>ht", '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>', desc = "harpoon toggle" },
		},
	},
	{
		"kevinhwang91/nvim-bqf",
		enabled = enabled.bqf,
	},
	{
		"junegunn/fzf",
		build = function()
			vim.fn["fzf#install"]()
		end,
	},
	{ "duane9/nvim-rg" },
}
local M = {
	minor_setup,
	bookmarks,
	oil,
	undotree,
	flash,
}

return M
