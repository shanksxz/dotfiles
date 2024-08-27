local options = {
	relativenumber = true,
	tabstop = 4,
	softtabstop = 4,
	shiftwidth = 4,
	expandtab = true,
	termguicolors = true,
	clipboard = "unnamedplus",
}

vim.g.mapleader = " "

local function map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

-- window navigation
map("n", "<C-k>", ":wincmd k<CR>", { desc = "Move to upper window" })
map("n", "<C-j>", ":wincmd j<CR>", { desc = "Move to lower window" })
map("n", "<C-h>", ":wincmd h<CR>", { desc = "Move to left window" })
map("n", "<C-l>", ":wincmd l<CR>", { desc = "Move to right window" })
map("t", "jk", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
map("t", "<C-h>", [[<Cmd>wincmd h<CR>]], { desc = "Move to left window from terminal" })
map("t", "<C-j>", [[<Cmd>wincmd j<CR>]], { desc = "Move to lower window from terminal" })
map("t", "<C-k>", [[<Cmd>wincmd k<CR>]], { desc = "Move to upper window from terminal" })
map("t", "<C-l>", [[<Cmd>wincmd l<CR>]], { desc = "Move to right window from terminal" })
map("t", "<C-w>", [[<C-\><C-n><C-w>]], { desc = "Window command in terminal mode" })

-- move lines
map("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
map("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- splits
map("n", "<leader>sh", ":split<CR>", { desc = "Split horizontally" })
map("n", "<leader>sv", ":vsplit<CR>", { desc = "Split vertically" })
map("n", "<leader>sc", ":close<CR>", { desc = "Close split" })
map("n", "<leader>so", ":only<CR>", { desc = "Close all splits except current" })
map("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Resize vertically left" })
map("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Resize vertically right" })
map("n", "<C-Up>", ":resize -2<CR>", { desc = "Resize horizontally up" })
map("n", "<C-Down>", ":resize +2<CR>", { desc = "Resize horizontally down" })

-- terminal
map("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<CR>", { desc = "Toggle terminal horizontally" })
map("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<CR>", { desc = "Toggle terminal vertically" })
map("n", "<leader>tf", "<cmd>ToggleTerm direction=float<CR>", { desc = "Toggle terminal float" })
map("t", "<C-d>", "<C-\\><C-n>:bd!<CR>", { desc = "Exit and close terminal" })

-- buffers
map("n", "<leader>bn", "<:BufferLineCycleNext<CR>", { noremap = true, silent = true, desc = "Next buffer" })
map("n", "<leader>bp", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true, desc = "Previous buffer" })
map("n", "<leader>bd", ":bdelete<CR>", { noremap = true, silent = true, desc = "Delete buffer" })

-- yank
map("n", "<leader>y", '"+y', { noremap = true, desc = "Yank to system clipboard" })
map("v", "<leader>y", '"+y', { noremap = true, desc = "Yank selection to system clipboard" })

-- noice
map("n", "<leader>nd", "<cmd>NoiceDismiss<CR>", { desc = "Dismiss Noice Message" })

-- source curr file
map("n", "<leader><leader>", "<cmd>luafile %<CR>", { desc = "Source current file" })

-- exit insert mode without hitting Esc
map("i", "jj", "<Esc>", { desc = "Esc" })

-- select all
map("n", "==", "ggVG", { desc = "Select all" })

-- theme-switch
map("n", "<leader>tt", ":Themery<CR>", { noremap = true, silent = true, desc = "Change Themes" })

-- zen-mode
map("n", "<leader>z", ":ZenMode<CR>", { noremap = true, silent = true, desc = "ZenMode" })

for k, v in pairs(options) do
	vim.opt[k] = v
end

-- run file
local function switch_case(v)
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
	vim.cmd('TermExec cmd="' .. full_cmd .. '" direction=float go_back=0')
end, { noremap = true, silent = true, desc = "Run file" })
