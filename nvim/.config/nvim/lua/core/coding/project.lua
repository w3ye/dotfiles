return {
	"ahmedkhalf/project.nvim",
	config = function(_, opts)
		require("project_nvim").setup(opts)
	end,
	opts = {
		manual_mode = true,
		show_hidden = true,
		silent_chdir = false,
	},
}
