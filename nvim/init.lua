require("core.mappings")
local map = require("core.mappings")
require("core.options")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)


map("n", "<leader>sh", ":split<CR>", { desc = "Split horizontally" })
map("n", "<leader>sv", ":vsplit<CR>", { desc = "Split vertically" })
map("n", "<leader>cs", ":close<CR>", { desc = "Close split" })
-- map("n", "<leader>s", ":only<CR>", { desc = "Close all splits except current" })

require("lazy").setup({
	spec = "plugins",
})



