function setColor(color)
	color = color or "gruvbox"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
	{
		"ellisonleao/gruvbox.nvim",
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			setColor("tokyonight-moon")
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",

		config = function()
			setColor("catppuccin")
		end,
	},
	-- {
	-- 	"baliestri/aura-theme",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function(plugin)
	-- 		vim.opt.rtp:append(plugin.dir .. "/packages/neovim")
	-- 		vim.cmd([[colorscheme aura-dark]])
	-- 		-- setColor("aura-dark")
	-- 	end,
	-- },
}
