local mason = require("core.lsp.mason")
local lsp = require("core.lsp.lsp")
local cmp = require("core.lsp.cmp")
local snippet = require("core.lsp.snippet")
local tstools = require("core.lsp.tstools")
local supermaven = require("core.lsp.supermaven")

local M = {
	mason,
	lsp,
	tstools,
	"onsails/lspkind.nvim",
	cmp,
	snippet,
	supermaven,
}

return M
