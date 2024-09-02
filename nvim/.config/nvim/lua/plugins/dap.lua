js = function(dap)
	dap.adapters["pwa-node"] = {
		type = "server",
		host = "localhost",
		port = "${port}",
		executable = {
			command = "js-debug-adapter",
			args = { "${port}" },
		},
	}
	for _, language in ipairs({ "typescript", "javascript" }) do
		require("dap").configurations[language] = {
			{
				name = "Custom Debug Platform Model",
				type = "pwa-node",
				request = "attach",
				remoteRoot = "/usr/src/app",
				localRoot = "${workspaceFolder}",
				-- protocol = "inspector",
				port = 9229,
				restart = true,
				address = "0.0.0.0",
				skipFiles = { "<node_internals>/**" },
				sourceMaps = true,
			},
			{
				type = "pwa-node",
				request = "attach",
				name = "Attach to node",
				processId = require("dap.utils").pick_process,
				cwd = "${workspaceFolder}",
			},
			{
				type = "pwa-node",
				request = "launch",
				name = "Launch file",
				program = "${file}",
				cwd = "${workspaceFolder}",
			},
			---@diagnostic disable-next-line: missing-fields
			{
				name = "-- launch.json --",
			},
		}
	end
end

return {
	"mfussenegger/nvim-dap",
	event = "LspAttach",
	dependencies = {
		{
			"theHamsta/nvim-dap-virtual-text",
			opts = {},
		},
	},
	config = function()
		local dap = require("dap")
		-- setup dap config by VsCode launch.json file
		local vscode = require("dap.ext.vscode")
		local json = require("plenary.json")
		vscode.json_decode = function(str)
			return vim.json.decode(json.json_strip_comments(str))
		end

		-- Extends dap.configurations with entries read from .vscode/launch.json
		if vim.fn.filereadable(".vscode/launch.json") then
			vscode.load_launchjs()
		end
		require("mason-nvim-dap").setup({})
		js(dap)
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
			"<leader>bs",
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
