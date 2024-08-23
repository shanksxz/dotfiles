return {
	"nvim-neo-tree/neo-tree.nvim",
	brinch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		vim.keymap.set("n", "<C-n>", ":Neotree filesystem toggle right<CR>", {})
		vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})

		require("neo-tree").setup({
			close_if_last_window = true,
			filesystem = {
				filtered_items = {
					visible = false,
					hide_dotfiles = false,
					never_show = {
						".git",
						"node_modules",
						".DS_Store",
					},
					always_show = {
						".env",
					},
				},
			},
			window = {
				position = "right",
				width = 40,
			},
		})
	end,
}
