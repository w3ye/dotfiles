local coding = require("core.coding.init")
local ui = require("core.ui")
local editor = require("core.editor")
local lang = require("core.language")
local lsp = require("core.lsp")

require("lazy").setup({
	lsp,
	coding,
	ui,
	editor,
	lang,
}, {})
