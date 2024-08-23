return {
	"laytan/cloak.nvim",
	config = function()
		require("cloak").setup({
			enabled = true,
			cloak_character = "*",
			-- The applied highlight group (colors) on the cloaking, see `:h highlight`.
			highlight_group = "Comment",
			-- Applies the length of the replacement characters for all matched
			-- patterns, defaults to the length of the matched pattern.
			cloak_length = nil, -- Provide a number if you want to hide the true length of the value.
			-- Whether it should try every pattern to find the best fit or stop after the first.
			try_all_patterns = true,
			-- Set to true to cloak Telescope preview buffers. (Required feature not in 0.1.x)
			cloak_telescope = true,
			-- Re-enable cloak when a matched buffer leaves the window.
			cloak_on_leave = false,
			patterns = {
				{
					file_pattern = { ".env*", "wrangler.toml", ".dev.vars" },
					cloak_pattern = "=.+",
				},
			},
		})
		vim.api.nvim_set_keymap(
			"n",
			"<leader>ct",
			":CloakToggle<CR>",
			{ noremap = true, silent = true, desc = "Toggle cloak" }
		)
		vim.api.nvim_set_keymap(
			"n",
			"<leader>ce",
			":CloakEnable<CR>",
			{ noremap = true, silent = true, desc = "Enable cloak" }
		)
		vim.api.nvim_set_keymap(
			"n",
			"<leader>cd",
			":CloakDisable<CR>",
			{ noremap = true, silent = true, desc = "Disable cloak" }
		)
	end,
}
