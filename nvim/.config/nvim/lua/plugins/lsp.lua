-- LSP: mason (installer) + mason-lspconfig (bridge) + nvim-lspconfig (server data).
-- On-demand: opening a file installs its language server (if missing) then enables it.
-- Uses Neovim 0.11+ native vim.lsp.config/enable.
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
      -- Preferred server per language. Value = per-server settings (empty = defaults).
      -- Add a language by adding one entry here; its filetypes are read from
      -- nvim-lspconfig automatically, and the server installs on first open.
      local servers = {
        ts_ls = {}, -- TypeScript / JavaScript
        gopls = {}, -- Go
        jdtls = {}, -- Java (basic; nvim-jdtls recommended for full features)
        pyright = {}, -- Python
      }

      -- Merge blink.cmp completion capabilities into every server.
      vim.lsp.config("*", { capabilities = require("blink.cmp").get_lsp_capabilities() })

      -- Apply per-server overrides on top of nvim-lspconfig defaults.
      for name, cfg in pairs(servers) do
        if next(cfg) ~= nil then
          vim.lsp.config(name, cfg)
        end
      end

      require("mason").setup()
      -- We manage installation/enabling ourselves (below), so disable
      -- mason-lspconfig's own auto-enable (the Mason data dir is shared and may
      -- hold leftover servers we don't want auto-started).
      require("mason-lspconfig").setup({ automatic_enable = false })

      local mappings = require("mason-lspconfig").get_mappings().lspconfig_to_package

      -- Build filetype -> server from each server's nvim-lspconfig filetypes list.
      local ft_to_server = {}
      for name in pairs(servers) do
        local cfg = vim.lsp.config[name] or {}
        for _, ft in ipairs(cfg.filetypes or {}) do
          ft_to_server[ft] = name
        end
      end

      -- Enable a server and attach it to any buffers already open. vim.lsp.enable
      -- only auto-starts on *new* buffer matches, so we re-fire FileType for
      -- currently-loaded buffers of this server's filetypes.
      local function enable_and_start(server)
        vim.lsp.enable(server)
        for _, buf in ipairs(vim.api.nvim_list_bufs()) do
          if vim.api.nvim_buf_is_loaded(buf) and ft_to_server[vim.bo[buf].filetype] == server then
            vim.api.nvim_exec_autocmds("FileType", { buffer = buf, modeline = false })
          end
        end
      end

      -- Install (if missing) then enable a server. Runs at most once per server.
      local handled = {}
      local function ensure_and_enable(server)
        if handled[server] then
          return
        end
        handled[server] = true

        local pkg_name = mappings[server]
        if not pkg_name then
          enable_and_start(server) -- not a Mason-managed server; enable directly
          return
        end

        -- refresh() guarantees the registry index is loaded before lookup.
        require("mason-registry").refresh(function()
          local ok, pkg = pcall(require("mason-registry").get_package, pkg_name)
          if not ok then
            return
          end
          if pkg:is_installed() then
            vim.schedule(function()
              enable_and_start(server)
            end)
            return
          end
          vim.schedule(function()
            vim.notify(("[LSP] installing %s…"):format(pkg_name), vim.log.levels.INFO)
          end)
          pkg:once("install:success", function()
            vim.schedule(function()
              vim.notify(("[LSP] installed %s"):format(pkg_name), vim.log.levels.INFO)
              enable_and_start(server) -- attaches to the already-open buffer too
            end)
          end)
          pkg:once("install:failed", function()
            handled[server] = nil -- allow a retry on next open
            vim.schedule(function()
              vim.notify(("[LSP] failed to install %s"):format(pkg_name), vim.log.levels.ERROR)
            end)
          end)
          pkg:install()
        end)
      end

      vim.api.nvim_create_autocmd("FileType", {
        callback = function(ev)
          local server = ft_to_server[ev.match]
          if server then
            ensure_and_enable(server)
          end
        end,
      })

      -- The buffer that triggered loading may have fired FileType already.
      local cur = vim.bo.filetype
      if ft_to_server[cur] then
        ensure_and_enable(ft_to_server[cur])
      end

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

          local client = vim.lsp.get_client_by_id(ev.data.client_id)
          if client and client:supports_method("textDocument/inlayHint") then
            vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })
          end
        end,
      })
    end,
  },
}
