return {
  "folke/snacks.nvim",
  opts = function(_, opts)
    opts.picker.win.input.keys = {
      ["<a-.>"] = { "toggle_hidden", mode = { "i", "n" } },
    }
    return opts
  end,
}
