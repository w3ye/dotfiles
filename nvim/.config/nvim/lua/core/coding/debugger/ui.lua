local M = {
	"rcarriga/nvim-dap-ui",
	enabled = _G.enabled.dap,
	dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
	config = function()
		require("dapui").setup({})
		local dap, dapui = require("dap"), require("dapui")
		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end
	end,
	keys = {
		{ "<leader>ui", "<cmd>lua require'dapui'.toggle()<cr>", desc = "Toggle DAP UI" },
	},
}

return M
