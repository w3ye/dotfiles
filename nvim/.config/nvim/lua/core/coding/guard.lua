local M = {
	{
		"stevearc/conform.nvim",
		enabled = _G.enabled.conform_formatter,
		config = function(_, opts)
			require("conform").setup(opts)
		end,
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				go = { "gofmt" },
				rust = { "rustfmt" },
			},
			format_on_save = function(bufnr)
				vim.lsp.buf.format({ bufnr = bufnr })
				return { timeout_ms = 5000, lsp_fallback = false }
			end,
			format_after_save = true,
		},
	},
	-- {
	-- 	"nvimdev/guard.nvim",
	-- 	-- Builtin configuration, optional
	-- 	dependencies = {
	-- 		"nvimdev/guard-collection",
	-- 	},
	-- 	config = function()
	-- 		local ft = require("guard.filetype")
	-- 		ft("typescript,javascript,typescriptreact"):fmt("prettier")
	-- 		require("guard").setup({
	-- 			fmt_on_save = true,
	-- 			lsp_as_default_formatter = false,
	-- 		})
	-- 	end,
	-- },
}

return M
