return {
  "MagicDuck/grug-far.nvim",
  keys = {
    {
      "<leader>se",
      function()
        require("grug-far").toggle_instance({ instanceName = "far", staticTitle = "Find and Replace" })
      end,
      desc = "Toggle Find and Replace",
      mode = "n",
    },
  },
}
