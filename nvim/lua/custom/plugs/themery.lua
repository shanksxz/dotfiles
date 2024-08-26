return {
	"zaldih/themery.nvim",
	config = function()
		local themery = require("themery")
		themery.setup({
			themes = {
				"gruvbox",
				"tokyonight",
				"catppuccin",
			},
			livepreview = true,
		})
		vim.keymap.set("n", "<leader>th", ":Themery<CR>", { noremap = true, silent = true, desc = "Change Themes" })
	end,
}
