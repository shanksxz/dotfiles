local vscode = require("vscode")

-- vim.keymap.set("n", "<leader>n", function()
-- 	-- vscode.action("workbench.view.explorer")
-- 	vscode.action("workbench.action.toggleSidebarVisibility")
-- end, {
-- 	noremap = true,
-- 	silent = true,
-- })
--
-- vim.keymap.set("n", "<C-h>", function()
-- 	vscode.action("workbench.action.focusLeftGroup")
-- end, {
-- 	noremap = true,
-- 	silent = true,
-- })
-- vim.keymap.set("n", "<C-l>", function()
-- 	vscode.action("workbench.action.focusRightGroup")
-- end)
-- vim.keymap.set("n", "<C-k>", function()
-- 	vscode.action("workbench.action.focusAboveGroup")
-- end)
-- vim.keymap.set("n", "<C-j>", function()
-- 	vscode.action("workbench.action.focusBelowGroup")
-- end)
--
-- vim.keymap.set("n", "<leader>ff", function()
-- 	vscode.action("workbench.action.quickOpen")
-- end, {
-- 	noremap = true,
-- 	silent = true,
-- })
--
-- set explorer to open on startup

return {
	"vscode-neovim/vscode-multi-cursor.nvim",
	event = "VeryLazy",
	cond = not not vim.g.vscode,
	opts = {},
	config = function()
		require("vscode-multi-cursor").setup({
			default_mappings = true,
			no_selection = false,
		})
	end,
}
