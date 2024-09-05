return {
	"stevearc/oil.nvim",
	opts = {},
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
	config = function()
		require("oil").setup({
			default_file_explorer = true,
			delete_to_trash = true,
			win_options = {
				wrap = true,
			},
			view_options = {
				show_hidden = true,
				natural_order = true,
				is_always_hidden = function(name, _)
					return name == ".." or name == ".git"
				end,
			},
			keymaps = {
				["yp"] = {
					desc = "Copy filepath to system clipboard",
					callback = function()
						require("oil.actions").copy_entry_path.callback()
						vim.fn.setreg("+", vim.fn.getreg(vim.v.register))
					end,
				},
			},
		})

		vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
	end,
}
