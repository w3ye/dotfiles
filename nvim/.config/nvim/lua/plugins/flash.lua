return {
  -- flash.nvim reaches into Neovim's internal search globals via FFI (lua/flash/hacks.lua).
  -- Neovim PR #39485 moved those globals (search_match_lines/endcol) into a `SearchState`
  -- struct on 0.13+, which broke `s`/jump with:
  --   dlsym(RTLD_DEFAULT, search_match_lines): symbol not found
  -- The upstream fix (folke/flash.nvim PR #496 / #492) is NOT merged yet, so we hand-apply
  -- it to the installed hacks.lua and `pin` here so `:Lazy update` won't revert the patch.
  --
  -- TODO: once the fix lands on flash.nvim `main`, delete this file and run
  --   :Lazy update flash.nvim   (restores the official, upstream-maintained code).
  "folke/flash.nvim",
  pin = true,
}
