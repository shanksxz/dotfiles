return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			size = 50,
			open_mapping = [[<c-\>]],
		})
	end,
}
