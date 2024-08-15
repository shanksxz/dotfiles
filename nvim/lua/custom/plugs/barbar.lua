return {
	"romgrk/barbar.nvim",
	init = function()
		vim.g.barbar_auto_setup = false
	end,
	config = function()
		require("barbar").setup({})
		local key = vim.keymap.set
		key({ "n" }, "<leader>t1", "<cmd>BufferGoto 1<cr>", { noremap = true, silent = true })
		key({ "n" }, "<leader>tn", "<cmd>BufferNext<cr>", { noremap = true, silent = true })
		key({ "n" }, "<leader>tp", "<cmd>BufferPrevious<cr>", { noremap = true, silent = true })
		key({ "n" }, "<leader>td", "<cmd>BufferClose<cr>", { noremap = true, silent = true })
		key({ "n" }, "<leader>tc", "<cmd>BufferCloseAllButCurrent<cr>", { noremap = true, silent = true })
		-- set dynamic stoke for buffer numbers
		for i = 1, 9 do
			key({ "n" }, "<leader>t" .. i, "<cmd>BufferGoto " .. i .. "<cr>", { noremap = true, silent = true })
		end
	end,
}
