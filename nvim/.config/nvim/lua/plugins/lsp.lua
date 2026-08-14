-- LSP: mason (installer) + mason-lspconfig (bridge) + nvim-lspconfig (server data).
-- Uses Neovim 0.11+ native vim.lsp.config/enable; mason-lspconfig auto-enables servers.
return {
  {
    "mason-org/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonUpdate", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
    build = ":MasonUpdate",
    opts = {},
  },

  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
      "saghen/blink.cmp",
    },
    config = function()
      -- Per-server settings. Empty table = defaults from nvim-lspconfig.
      local servers = {
        ts_ls = {}, -- TypeScript / JavaScript
        gopls = {}, -- Go
        jdtls = {}, -- Java (basic; see note below)
        pyright = {}, -- Python
      }

      -- Merge blink.cmp completion capabilities into every server.
      local capabilities = require("blink.cmp").get_lsp_capabilities()
      vim.lsp.config("*", { capabilities = capabilities })

      -- Apply per-server overrides on top of nvim-lspconfig defaults.
      for name, cfg in pairs(servers) do
        if next(cfg) ~= nil then
          vim.lsp.config(name, cfg)
        end
      end

      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = vim.tbl_keys(servers),
        -- Only auto-enable our servers. The Mason data dir is shared and may hold
        -- leftover servers; a bare `true` would auto-start all of them.
        automatic_enable = vim.tbl_keys(servers),
      })

      -- Buffer-local keymaps once a server attaches.
      -- Note: Neovim 0.11 already maps grn (rename), gra (code action),
      -- grr (references), gri (implementation), gO (symbols), K (hover).
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(ev)
          local function map(keys, fn, desc)
            vim.keymap.set("n", keys, fn, { buffer = ev.buf, desc = "LSP: " .. desc })
          end
          map("gd", vim.lsp.buf.definition, "Definition")
          map("gD", vim.lsp.buf.declaration, "Declaration")
          map("gt", vim.lsp.buf.type_definition, "Type definition")
          map("<leader>rn", vim.lsp.buf.rename, "Rename")
          map("<leader>ca", vim.lsp.buf.code_action, "Code action")
          map("<leader>f", function()
            vim.lsp.buf.format({ async = true })
          end, "Format buffer")

          -- Enable inlay hints if the server supports them.
          local client = vim.lsp.get_client_by_id(ev.data.client_id)
          if client and client:supports_method("textDocument/inlayHint") then
            vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })
          end
        end,
      })
    end,
  },
}
