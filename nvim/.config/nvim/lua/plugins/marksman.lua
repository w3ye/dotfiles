return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        marksman = {
          handlers = {
            -- Marksman's diagnostics (broken links, duplicate headings, etc.)
            -- are noisy and non-actionable; drop them entirely.
            ["textDocument/publishDiagnostics"] = function(err, result, ctx, config)
              if result then
                result.diagnostics = {}
              end
              return vim.lsp.handlers["textDocument/publishDiagnostics"](err, result, ctx, config)
            end,
          },
        },
      },
    },
  },
}
