local bookmarks = require("core.editor.bookmarks")
local oil = require("core.editor.oil")
local undotree = require("core.editor.undotree")
local flash = require("core.editor.flash")
local whichkey = require("core.editor.whichkey")
local lastplace = require("core.editor.lastplace")
local harpoon = require("core.editor.harpoon")
local bqf = require("core.editor.bqf")
local fzf = require("core.editor.fzf")

local M = {
	bookmarks,
	oil,
	undotree,
	flash,
	"gpanders/editorconfig.nvim",
	whichkey,
	lastplace,
	harpoon,
	bqf,
	fzf,
	{ "duane9/nvim-rg" },
}

return M
