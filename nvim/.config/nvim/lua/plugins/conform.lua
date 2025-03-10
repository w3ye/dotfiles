return {
  "stevearc/conform.nvim",
  lazy = true,
  event = "VeryLazy",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      javascript = { "prettierd", "prettier", stop_after_first = true },
      typescript = { "prettierd", "prettier", stop_after_first = true },
      typescriptreact = { "prettierd", "prettier", stop_after_first = true },
      json = { "prettierd", "prettier" },
      go = { "gofmt" },
      rust = { "rustfmt" },
    },
    -- format_on_save = function(bufnr)
    -- 	vim.lsp.buf.format({ bufnr = bufnr, quiet = true, async = true })
    -- 	return { timeout_ms = 5000, lsp_fallback = true }
    -- end,
    format_on_save = {
      lsp_format = "never",
      timeout_ms = 500,
      quiet = true,
    },
    format_after_save = {
      lsp_format = true,
    },
  },
}
