return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        marksman = {
          handlers = {
            ["textDocument/publishDiagnostics"] = function(err, result, ctx, config)
              if result and result.diagnostics then
                for _, diag in ipairs(result.diagnostics) do
                  diag.severity = vim.diagnostic.severity.HINT
                end
              end
              return vim.lsp.handlers["textDocument/publishDiagnostics"](err, result, ctx, config)
            end,
          },
        },
      },
    },
  },
}
