return {
	"folke/zen-mode.nvim",
	config = function()
		require("zen-mode").setup({
			window = {
				width = 0.65,
				height = 1,
				options = {
					signcolumn = "no",
					number = false,
					relativenumber = true,
					cursorline = false,
					cursorcolumn = false,
					foldcolumn = "0",
					list = false,
				},
			},
		})
	end,
}
