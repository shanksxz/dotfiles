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
	end,
}
