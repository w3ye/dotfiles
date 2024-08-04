local themes = require("core.ui.themes")
local blankline = require("core.ui.blankline")
local mini = require("core.ui.mini")
local lualine = require("core.ui.lualine")
local focus = require("core.ui.focus")
local dashboard = require("core.ui.dashboard")
local noice = require("core.ui.noice")
local notify = require("core.ui.notify")
local barbar = require("core.ui.barbar")
local neotree = require("core.ui.neotree")
local window_picker = require("core.ui.window-picker")
local twilight = require("core.ui.twilight")
local zen = require("core.ui.zen")

local M = {
	themes,
	blankline,
	mini,
	lualine,
	"MunifTanjim/nui.nvim",
	"nvim-tree/nvim-web-devicons",
	window_picker,
	focus,
	dashboard,
	noice,
	notify,
	barbar,
	neotree,
	twilight,
	zen,
}

return M
