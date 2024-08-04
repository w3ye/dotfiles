return {
	"folke/twilight.nvim",
	enabled = _G.enabled.twilight,
	opts = {
		context = 15,
	},
	keys = {
		{ "<leader>tt", "<CMD>Twilight<CR>", desc = "Toggle Twilight" },
	},
}
