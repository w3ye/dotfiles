local enabled = _G.enabled
local bookmarks = require("core.editor.bookmarks")
local oil = require("core.editor.oil")
local undotree = require("core.editor.undotree")
local flash = require("core.editor.flash")
local whichkey = require("core.editor.whichkey")
local lastplace = require("core.editor.lastplace")
local harpoon = require("core.editor.harpoon")
local bqf = require("core.editor.bqf")

local minor_setup = {
	"gpanders/editorconfig.nvim",
	whichkey,
	lastplace,
	harpoon,
	bqf,
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
