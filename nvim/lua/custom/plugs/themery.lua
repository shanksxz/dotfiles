return {
	"zaldih/themery.nvim",
	config = function()
		local themery = require("themery")
		themery.setup({
			themes = {
				"gruvbox",
				"tokyonight",
				"catppuccin",
        "gruvbox-light",
      },
			livepreview = true,
		})
	end,
}
