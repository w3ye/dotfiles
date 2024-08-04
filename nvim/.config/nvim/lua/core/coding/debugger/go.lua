local M = {}

M.setup = function(dap)
	require("dap-go").setup({
		dap_configurations = {
			{
				-- Must be "go" or it will be ignored by the plugin
				type = "go",
				name = "Attach remote",
				mode = "remote",
				request = "attach",
			},
		},
		-- delve configurations
		delve = {
			path = "dlv",
			initialize_timeout_sec = 20,
			port = "${port}",
			args = {},
			build_flags = "",
			detached = true,
			cwd = nil,
		},
	})
end

return M
