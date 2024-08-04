local enabled = _G.enabled.cmp
local M = {
	{ "rafamadriz/friendly-snippets", enabled = enabled },
	{ "saadparwaiz1/cmp_luasnip", enabled = enabled },
	{
		"L3MON4D3/LuaSnip",
		enabled = enabled,
		-- follow latest release.
		build = "make install_jsregexp",
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
}

return M
