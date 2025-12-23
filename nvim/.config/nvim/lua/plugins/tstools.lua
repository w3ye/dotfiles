return {
  "pmizio/typescript-tools.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  enabled = false,
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
