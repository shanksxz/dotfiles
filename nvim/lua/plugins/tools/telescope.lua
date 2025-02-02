local telescope = require("telescope")
local builtin = require("telescope.builtin")

telescope.setup({
    defaults = {
        file_ignore_patterns = { "node_modules", ".git" },
    },
})

vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files", noremap = true })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep", noremap = true })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "List buffers", noremap = true })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags", noremap = true })
vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { desc = "Format current", noremap = true })

return telescope
