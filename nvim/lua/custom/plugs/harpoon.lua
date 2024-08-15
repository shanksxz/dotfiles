return {
	"ThePrimeagen/harpoon",
	config = function()
		require("harpoon").setup({
			global_settings = {
				save_on_toggle = false,
				save_on_change = true,
			},
		})

		vim.keymap.set(
			"n",
			"<leader>ho",
			require("harpoon.ui").toggle_quick_menu,
			{ noremap = true, silent = true, desc = "Toggle Harpoon Quick Menu" }
		)
		vim.keymap.set(
			"n",
			"<leader>ha",
			require("harpoon.mark").add_file,
			{ noremap = true, silent = true, desc = "Add file to Harpoon" }
		)
		vim.keymap.set(
			"n",
			"<leader>hn",
			require("harpoon.ui").nav_next,
			{ noremap = true, silent = true, desc = "Navigate to next Harpoon file" }
		)
		vim.keymap.set(
			"n",
			"<leader>hp",
			require("harpoon.ui").nav_prev,
			{ noremap = true, silent = true, desc = "Navigate to previous Harpoon file" }
		)

		vim.keymap.set("n", "<leader>ht", function()
			require("telescope").extensions.harpoon.marks()
		end, { noremap = true, silent = true, desc = "Open Harpoon marks in Telescope" })

		for i = 1, 9 do
			vim.keymap.set("n", "<leader>h" .. i, function()
				require("harpoon.ui").nav_file(i)
			end, { noremap = true, silent = true, desc = "Navigate to Harpoon file " .. i })
		end
	end,
}
