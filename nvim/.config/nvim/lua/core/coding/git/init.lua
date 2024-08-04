local gitsigns = require("core.coding.git.gitsigns")
local neogit = require("core.coding.git.neogit")
local diffview = require("core.coding.git.diffview")
local lazygit = require("core.coding.git.lazygit")

local M = {
	{ "tpope/vim-fugitive", enabled = _G.enabled.fugitive },
	gitsigns,
	neogit,
	diffview,
	lazygit,
}

return M
