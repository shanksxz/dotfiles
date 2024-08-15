return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim" },

	config = function()
		require("telescope").setup({
			defaults = {
				file_ignore_patterns = { "node_modules", ".git" },
				layout_config = {
					prompt_position = "top",
				},
				sorting_strategy = "ascending",
			},
			-- extensions = {
			--     harpoon = {
			--         projects = {
			--             ["~/projects"] = {
			--                 term = {
			--                     cmds = {
			--                         "make",
			--                         "make test",
			--                     },
			--                     env = {
			--                         MY_ENV_VAR = "hello",
			--                     },
			--                 },
			--                 term_pos = "vert",
			--             },
			--         },
			--     },
			-- },
		})

		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files", noremap = true })
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep", noremap = true })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "List buffers", noremap = true })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags", noremap = true })
		vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { desc = "Format current", noremap = true })

		require("telescope").load_extension("harpoon")
	end,
}
