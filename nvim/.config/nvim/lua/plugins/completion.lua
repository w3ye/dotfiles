-- blink.cmp: completion engine. Provides LSP capabilities consumed in lsp.lua.
-- Docs: https://cmp.saghen.dev  |  :help blink.cmp
return {
  "saghen/blink.cmp",
  -- Use a release tag so lazy downloads the prebuilt fuzzy-matching binary.
  version = "*",
  event = "InsertEnter",
  dependencies = { "rafamadriz/friendly-snippets" },
  ---@module "blink.cmp"
  ---@type blink.cmp.Config
  opts = {
    -- 'default': C-y accept, C-n/C-p navigate, C-space toggle menu/docs.
    keymap = { preset = "default" },
    appearance = { nerd_font_variant = "mono" },
    completion = {
      documentation = { auto_show = true, auto_show_delay_ms = 200 },
    },
    signature = { enabled = true },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
    -- Rust matcher is fastest; warn (don't error) if the binary is unavailable.
    fuzzy = { implementation = "prefer_rust_with_warning" },
  },
  opts_extend = { "sources.default" },
}
