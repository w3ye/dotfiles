return {
	"stevearc/conform.nvim",
	event = "VeryLazy",
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
			return { timeout_ms = 5000, lsp_fallback = true }
		end,
		format_after_save = {
			lsp_format = true,
		},
	},
}
