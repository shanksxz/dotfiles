local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

map("i", "jj", "<Esc>", { desc = "Exit insert mode with 'jj'" })

map("n", "<C-h>", ":wincmd h<CR>", { desc = "Move to left window" })
map("n", "<C-j>", ":wincmd j<CR>", { desc = "Move to lower window" })
map("n", "<C-k>", ":wincmd k<CR>", { desc = "Move to upper window" })
map("n", "<C-l>", ":wincmd l<CR>", { desc = "Move to right window" })

map("n", "<leader>sh", ":split<CR>", { desc = "Split horizontally" })
map("n", "<leader>sv", ":vsplit<CR>", { desc = "Split vertically" })
map("n", "<leader>sc", ":close<CR>", { desc = "Close split" })
map("n", "<leader>scc", ":only<CR>", { desc = "Close all splits except current" })

map("n", "<C-Left>", ":vertical resize -5<CR>", { desc = "Decrease window width" })
map("n", "<C-Right>", ":vertical resize +5<CR>", { desc = "Increase window width" })
map("n", "<C-Up>", ":resize -5<CR>", { desc = "Decrease window height" })
map("n", "<C-Down>", ":resize +5<CR>", { desc = "Increase window height" })

map("n", "<Tab>", ":BufferLineCycleNext<CR>", { desc = "Next buffer" })
map("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { desc = "Previous buffer" })
map("n", "<leader>bl", ":ls<CR>", { desc = "List buffers" })
map("n", "<leader>bd", ":bdelete<CR>", { desc = "Delete current buffer" })
map("n", "<leader>ba", ":%bd|e#|bd#<CR>", { desc = "Close all buffers except current" })

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
map("n", "J", "5j", { desc = "Jump down 5 lines" })
map("n", "KK", "5k", { desc = "Jump up 5 lines" })
map("n", "H", "^", { desc = "Jump to line start" })
map("n", "L", "$", { desc = "Jump to line end" })
map("n", "==", "ggVG", { desc = "Select all" })

map("n", "<leader>y", '"+y', { desc = "Yank to system clipboard" })
map("v", "<leader>y", '"+y', { desc = "Yank selection to system clipboard" })
map("n", "<leader>Y", '"+Y', { desc = "Yank line to system clipboard" })
map("n", "<leader>d", '"+d', { desc = "Cut to system clipboard" })

map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { desc = "Go to definition" })
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { desc = "Go to references" })
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { desc = "Show documentation" })
map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { desc = "Rename symbol" })
map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "Code actions" })

map("n", "<leader>sp", ":set spell!<CR>", { desc = "Toggle spell checking" })
map("n", "<leader>r", ":%s/<C-r><C-w>//g<Left><Left>", { desc = "Replace word under cursor" })
map("v", "<leader>r", '"hy:%s/<C-r>h//g<Left><Left>', { desc = "Replace selected text" })

map("n", "<leader>qf", ":copen<CR>", { desc = "Open quickfix list" })
map("n", "<leader>qc", ":cclose<CR>", { desc = "Close quickfix list" })
map("n", "]q", ":cnext<CR>", { desc = "Next quickfix item" })
map("n", "[q", ":cprev<CR>", { desc = "Previous quickfix item" })

map("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Toggle file explorer" })
map("n", "<leader>o", ":Neotree focus<CR>", { desc = "Focus file explorer" })

map("n", "<leader><leader>", function()
  vim.cmd("so")
end, { desc = "Source current file" })

return map
