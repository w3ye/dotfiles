-- TODO here
return {
	"mbbill/undotree",
	lazy = true,
	event = "VeryLazy",
	keys = {
		{ "<leader>u", mode = { "n" }, "<cmd>UndotreeToggle<cr>", desc = "toggle undo tree" },
		{ "<leader>uf", mode = { "n" }, "<cmd>UndotreeFocus<cr>", desc = "toggle undo tree" },
	},
}
