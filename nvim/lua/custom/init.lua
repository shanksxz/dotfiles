local options = {
  relativenumber = true,
  tabstop = 2,
  softtabstop = 2,
  shiftwidth = 2,
  expandtab = true,
  termguicolors = true,
  clipboard = "unnamedplus",
}



vim.g.mapleader = " "
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

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

map("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
map("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

map("n", "<leader>sh", ":split<CR>", { desc = "Split horizontally" })
map("n", "<leader>sv", ":vsplit<CR>", { desc = "Split vertically" })
map("n", "<leader>sc", ":close<CR>", { desc = "Close split" })
map("n", "<leader>so", ":only<CR>", { desc = "Close all splits except current" })

map("n", "<C-Left>", ":vertical resize -5<CR>", { desc = "Resize vertically left" })
map("n", "<C-Right>", ":vertical resize +5<CR>", { desc = "Resize vertically right" })
map("n", "<C-Up>", ":resize -5<CR>", { desc = "Resize horizontally up" })
map("n", "<C-Down>", ":resize +5<CR>", { desc = "Resize horizontally down" })

map("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<CR>", { desc = "Toggle terminal horizontally" })
map("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<CR>", { desc = "Toggle terminal vertically" })
map("n", "<leader>tf", "<cmd>ToggleTerm direction=float<CR>", { desc = "Toggle floating terminal" })

map("n", "<leader>bn", ":BufferLineCycleNext<CR>", { desc = "Next buffer" })
map("n", "<leader>bp", ":BufferLineCyclePrev<CR>", { desc = "Previous buffer" })
map("n", "<leader>bl", ":ls<CR>", { desc = "List buffers" })
map("n", "<leader>bd", ":bdelete<CR>", { desc = "Delete current buffer" })
map("n", "<leader>ba", ":%bd|e#|bd#<CR>", { desc = "Close all buffers except current" })
map("n", "<leader>y", '"+y', { desc = "Yank to system clipboard" })
map("v", "<leader>y", '"+y', { desc = "Yank selection to system clipboard" })
map("n", "<leader>Y", '"+Y', { desc = "Yank line to system clipboard" })
map("n", "<leader>d", '"+d', { desc = "Cut to system clipboard" })

map("n", "<leader><leader>", function()
  vim.cmd("so")
end, { desc = "Source current file" })

map("n", "<leader>w", ":w<CR>", { desc = "Save file" })
map("n", "<leader>wa", ":wa<CR>", { desc = "Save all" })
map("n", "<leader>q", ":q<CR>", { desc = "Quit" })
map("n", "<leader>wq", ":wq<CR>", { desc = "Save and quit" })
map("n", "<leader>qa", ":qa!<CR>", { desc = "Quit all" })
map("n", "<leader>z", ":ZenMode<CR>", { desc = "Zen Mode" })
map("n", "==", "ggVG", { desc = "Select all" })
map("n", "<leader>sp", ":set spell!<CR>", { desc = "Toggle spell checking" })
map("n", "<leader>tt", ":Themery<CR>", { desc = "Change Themes" })
map("n", "<leader>nd", "<cmd>NoiceDismiss<CR>", { desc = "Dismiss Noice Message" })
map("n", "J", "5j", { desc = "Jump down 5 lines" })
map("n", "KK", "5k", { desc = "Jump up 5 lines" })
map("i", "jj", "<Esc>", { desc = "Exit insert mode with 'jj'" })
map("n", "H", "^", { desc = "Jump to beginning of line" })
map("n", "L", "$", { desc = "Jump to end of line" })
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { desc = "Go to definition" })
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { desc = "Go to references" })
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { desc = "Show documentation" })
map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { desc = "Rename symbol" })
map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "Code actions" })

local function switch_case(v)
  local cases = {
    ["javascript"] = "node",
    ["typescript"] = "ts-node",
    ["python"] = "python3",
    ["sh"] = "bash",
    ["go"] = "go run",
    ["lua"] = "lua",
    ["java"] = "java",
  }
  return cases[v] or nil
end

map("n", "<leader>r", function()
  local filetype = vim.bo.filetype
  local cmd = switch_case(filetype)

  if cmd then
    local filename = vim.fn.shellescape(vim.fn.expand("%"))
    local full_cmd = cmd .. " " .. filename
    vim.cmd('TermExec cmd="' .. full_cmd .. '" direction=float go_back=0')
  else
    vim.notify("No runner available for filetype: " .. filetype, vim.log.levels.ERROR)
  end
end, { desc = "Run current file based on filetype" })


for k, v in pairs(options) do
  vim.opt[k] = v
end
