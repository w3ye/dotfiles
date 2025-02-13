local M = {}

local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local make_entry = require("telescope.make_entry")
local conf = require("telescope.config").values
local themes = require("telescope.themes")
local search_multi_grep = function(opts)
  opts = opts or themes.get_ivy()
  opts.cwd = opts.cwd or vim.uv.cwd()
  local finder = finders.new_async_job({
    command_generator = function(prompt)
      if not prompt or prompt == "" then
        return nil
      end
      local pieces = vim.split(prompt, "  ")
      local args = { "rg" }
      if pieces[1] then
        table.insert(args, "--hidden")
        table.insert(args, "-e")
        table.insert(args, pieces[1])
      end
      if pieces[2] then
        local extensions = vim.split(pieces[2], ",")
        for _, extension in ipairs(extensions) do
          table.insert(args, "-g")
          table.insert(args, extension)
        end
      end
      return vim.tbl_flatten({
        args,
        { "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case" },
      })
    end,
    entry_maker = make_entry.gen_from_vimgrep(opts),
    cwd = opts.cwd,
  })
  pickers
      .new(opts, {
        debounce = 100,
        prompt_title = "Multi Grep",
        finder = finder,
        previewer = conf.grep_previewer(opts),
        sorter = require("telescope.sorters").empty(),
      })
      :find()
end

M.setup = search_multi_grep

return M
