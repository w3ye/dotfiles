local js = require("core.coding.debugger.js")
local ui = require("core.coding.debugger.ui")
local go = require("core.coding.debugger.go")
local enabled = _G.enabled.dap

local function conditional_breakpoint()
	local condition = vim.fn.input("Condition: ")
	require("dap").set_breakpoint(condition, nil, nil)
end

local M = {
	{
		"microsoft/vscode-js-debug",
		build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
        	enabled = enabled.dap,
	},
	{ "leoluz/nvim-dap-go" },
	{
		"mfussenegger/nvim-dap",
		lazy = true,
        enabled = enabled.dap,
		config = function()
			local dap = require("dap")
			js.adapter_setup(dap)
			go.setup(dap)
		end,
		enabled = enabled.dap,
		keys = {
			{ "<leader>b", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", desc = "Toggle breakpoint" },
			{ "<leader>bc", conditional_breakpoint, desc = "Conditional breakpoint" },
			{ "<F5>", "<cmd>lua require'dap'.continue()<cr>", desc = "Debug continue" },
			{ "<F7>", "<cmd>lua require'dap'.step_into()<cr>", desc = "Debug step into" },
			{ "<F8>", "<cmd>lua require'dap'.step_over()<cr>", desc = "Debug step over" },
		},
	},
	ui,
}

return M
