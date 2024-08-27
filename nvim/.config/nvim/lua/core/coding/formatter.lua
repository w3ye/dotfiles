local M = {
	{
		"stevearc/conform.nvim",
		enabled = _G.enabled.formatter,
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
				return { timeout_ms = 10000, lsp_fallback = false }
			end,
			format_after_save = true,
		},
	},
}

return M
