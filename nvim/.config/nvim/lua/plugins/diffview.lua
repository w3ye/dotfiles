return {
  "sindrets/diffview.nvim",
  lazy = true,
  event = "VeryLazy",
  keys = {
    {
      "<leader>gv",
      "<cmd>DiffviewOpen<cr>",
      desc = "Open diff",
    },
    {
      "<leader>gC",
      "<cmd>DiffviewClose<cr>",
      desc = "Close diff",
    },
    {
      "<leader>gh",
      "<cmd>DiffviewFileHistory %<cr>",
      desc = "diff history",
    },
  },
  opts = {},
}
