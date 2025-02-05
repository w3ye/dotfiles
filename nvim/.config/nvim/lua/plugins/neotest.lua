local jestConfigFile = function(file)
	-- if string.find(file, "/packages/") then
	-- 	local tsFile = string.match(file, "(.-/[^/]+/)src") .. "jest.config.ts"
	-- 	if tsFile then
	-- 		return tsFile
	-- 	end
	-- 	local jsFile = string.match(file, "(.-/[^/]+/)src") .. "jest.config.js"
	-- 	return jsFile
	-- end

	local tsFile = vim.fn.getcwd() .. "/jest.config.ts"
	if tsFile then
		return tsFile
	end
	local jsFile = vim.fn.getcwd() .. "/jest.config.js"
	return jsFile
end

local cwd = function(file)
	-- if string.find(file, "/packages/") then
	-- 	return string.match(file, "(.-/[^/]+/)src")
	-- end
	return vim.fn.getcwd()
end

return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-neotest/neotest-jest",
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-jest")({
					jestCommand = "npx jest",
					jestConfigFile = jestConfigFile,
					env = { CI = true },
					cwd = cwd(),
				}),
			},
		})
	end,
	keys = {
		{
			"<leader>tr",
			function()
				require("neotest").run.run()
			end,
			desc = "Run test",
		},
		{
			"<leader>tf",
			function()
				require("neotest").run.run(vim.fn.expand("%"))
			end,
			desc = "Run file tests",
		},
		{
			"<leader>to",
			function()
				require("neotest").output.open({ enter = true })
			end,
			desc = "Test output",
		},
		{
			"<leader>tg",
			function()
				require("neotest").output_panel.toggle()
			end,
			desc = "Test output pannel",
		},
		{
			"<leader>ts",
			function()
				require("neotest").summary.toggle()
			end,
			desc = "Test summary toggle",
		},
	},
}
