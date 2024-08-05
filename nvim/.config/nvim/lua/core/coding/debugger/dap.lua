local js = require("core.coding.debugger.js")
local enabled = _G.enabled.dap

local function conditional_breakpoint()
	local condition = vim.fn.input("Condition: ")
	require("dap").set_breakpoint(condition, nil, nil)
end

local M = {
	"mfussenegger/nvim-dap",
	lazy = true,
	enabled = enabled,
	config = function()
		local dap = require("dap")
		js.adapter_setup(dap)
	end,
	keys = {
		{
			"<leader>b",
			"<cmd>lua require'dap'.toggle_breakpoint()<cr>",
			desc = "Toggle breakpoint",
		},
		{
			"<leader>bc",
			conditional_breakpoint,
			desc = "Conditional breakpoint",
		},
		{
			"<F5>",
			"<cmd>lua require'dap'.continue()<cr>",
			desc = "Debug continue",
		},
		{
			"<leader>bi",
			"<cmd>lua require'dap'.step_into()<cr>",
			desc = "Debug step into",
		},
		{
			"<leader>bo",
			"<cmd>lua require'dap'.step_over()<cr>",
			desc = "Debug step over",
		},
	},
}

return M
