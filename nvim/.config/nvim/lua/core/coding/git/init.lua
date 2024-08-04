local gitsigns = require("core.coding.git.gitsigns")
local diffview = require("core.coding.git.diffview")
local lazygit = require("core.coding.git.lazygit")

local M = {
	{ "tpope/vim-fugitive", enabled = _G.enabled.fugitive },
	gitsigns,
	diffview,
	lazygit,
}

return M
