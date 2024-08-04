local M = {}

M.adapter_setup = function(dap)
	dap.adapters["pwa-node"] = {
		type = "server",
		host = "localhost",
		port = "${port}",
		executable = {
			command = "js-debug-adapter", -- As I'm using mason, this will be in the path
			args = { "${port}" },
		},
	}

	for _, language in ipairs({ "typescript", "javascript" }) do
		require("dap").configurations[language] = {
			{
				name = "Debug Platform Model",
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
		}
	end
end

return M
