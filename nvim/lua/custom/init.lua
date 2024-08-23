vim.opt.relativenumber = true
vim.g.mapleader = " "
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.termguicolors = true
vim.opt.clipboard = "unnamedplus"

-- better focus for vim panes
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", { noremap = true })
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", { noremap = true })
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", { noremap = true })
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", { noremap = true })
vim.keymap.set("t", "jk", [[<C-\><C-n>]])
vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]])
vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]])
vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]])
vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]])
vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]])

-- move entire line up/down in both normal and visual mode
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { noremap = true })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { noremap = true })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true })

-- splits
vim.api.nvim_set_keymap("n", "<leader>sh", ":split<CR>", { noremap = true, silent = true, desc = "Split horizontally" })
vim.api.nvim_set_keymap("n", "<leader>sv", ":vsplit<CR>", { noremap = true, silent = true, desc = "Split vertically" })

-- resize splits
vim.api.nvim_set_keymap(
	"n",
	"<C-Left>",
	":vertical resize -2<CR>",
	{ noremap = true, silent = true, desc = "Resize vertically left" }
)
vim.api.nvim_set_keymap(
	"n",
	"<C-Right>",
	":vertical resize +2<CR>",
	{ noremap = true, silent = true, desc = "Resize vertically right" }
)
vim.api.nvim_set_keymap(
	"n",
	"<C-Up>",
	":resize -2<CR>",
	{ noremap = true, silent = true, desc = "Resize horizontally up" }
)
vim.api.nvim_set_keymap(
	"n",
	"<C-Down>",
	":resize +2<CR>",
	{ noremap = true, silent = true, desc = "Resize horizontally down" }
)

vim.api.nvim_set_keymap("n", "<leader>sc", ":close<CR>", { noremap = true, silent = true, desc = "Close split" })
vim.api.nvim_set_keymap(
	"n",
	"<leader>so",
	":only<CR>",
	{ noremap = true, silent = true, desc = "Close all splits except current" }
)

-- terminal toggle
vim.keymap.set(
	"n",
	"<leader>th",
	"<cmd>ToggleTerm direction=horizontal<CR>",
	{ noremap = true, silent = true, desc = "Toggle terminal horizontally" }
)
vim.keymap.set(
	"n",
	"<leader>tv",
	"<cmd>ToggleTerm direction=vertical<CR>",
	{ noremap = true, silent = true, desc = "Toggle terminal vertically" }
)
vim.keymap.set("t", "<C-d>", "<C-\\><C-n>:bd!<CR>", { noremap = true, silent = true, desc = "Exit and close terminal" })
vim.keymap.set(
	"n",
	"<leader>tf",
	"<cmd>ToggleTerm direction=float<CR>",
	{ noremap = true, silent = true, desc = "Toggle terminal float" }
)

-- was messing around with this, but it's not really useful ig
function switch_case(v)
	local cases = {
		["javascript"] = "node",
		["typescript"] = "ts-node",
		["python"] = "python3",
		["sh"] = "bash",
	}
	return cases[v] or v
end

vim.keymap.set("n", "<leader>r", function()
	local filetype = vim.bo.filetype
	local cmd = switch_case(filetype)
	local filename = vim.fn.expand("%")
	local full_cmd = cmd .. " " .. filename

	vim.cmd('TermExec cmd="' .. full_cmd .. '" direction=vertical go_back=0')
end, { noremap = true, silent = true, desc = "Run file" })

-- vim.keymap.set("n", "<leader>r", function()
-- 	local filetype = vim.bo.filetype
-- 	local cmd = switch_case(filetype)
-- 	local filename = vim.fn.expand("%")
-- 	local full_cmd = cmd .. " " .. filename
--
-- 	local pickers = require("telescope.pickers")
-- 	local finders = require("telescope.finders")
-- 	local conf = require("telescope.config").values
--
-- 	local output = vim.fn.systemlist(full_cmd)
--
-- 	pickers
-- 		.new({}, {
-- 			prompt_title = "Command Output",
-- 			finder = finders.new_table({
-- 				results = output,
-- 				entry_maker = function(entry)
-- 					return {
-- 						value = entry,
-- 						display = entry,
-- 						ordinal = entry,
-- 					}
-- 				end,
-- 			}),
-- 			sorter = conf.generic_sorter({}),
-- 			previewer = false, -- Disable the previewer
-- 			layout_config = {
-- 				width = 0.8,
-- 				height = 0.8,
-- 			},
-- 		})
-- 		:find()
-- end, { noremap = true, silent = true, desc = "Run file" })
