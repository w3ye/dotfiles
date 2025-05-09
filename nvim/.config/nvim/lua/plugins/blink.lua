return {
  "saghen/blink.cmp",
  opts = function(_, opts)
    opts.keymap = {
      ["<c-k>"] = { "select_prev", "fallback" },
      ["<c-j>"] = { "select_next", "fallback" },
    }
    return opts
  end,
}
