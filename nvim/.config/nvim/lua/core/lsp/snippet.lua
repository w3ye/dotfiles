local enabled = _G.enabled.cmp
local M = {
	{ "rafamadriz/friendly-snippets", enabled = enabled },
	"saadparwaiz1/cmp_luasnip",
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = "make install_jsregexp",
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
}

return M
