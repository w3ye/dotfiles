return {
  "pmizio/typescript-tools.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  enabled = false, -- superseded by vtsls (see typescript.lua); running both spawns a tsserver per app in monorepos
  opts = {
    settings = {
      tsserver_file_preferences = {
        -- Disable inlay hints to prevent "Invalid 'col': out of range" errors
        -- You can change this to "literals" or "all" if you want hints, but may experience errors
        includeInlayParameterNameHints = "none",
        includeCompletionsForModuleExports = true,
        quotePreference = "auto",
      },
    },
  },
}
