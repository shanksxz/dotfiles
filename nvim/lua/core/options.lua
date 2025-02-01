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

for k, v in pairs(options) do
    vim.opt[k] = v
end

