local telescope = require("telescope")
local builtin = require("telescope.builtin")

telescope.setup({
    defaults = {
        file_ignore_patterns = { "node_modules", ".git" },
        layout_config = {
            height = 0.8,
            width = 0.9,
            prompt_position = "top",
            bottom_pane = {
                height = 0.5,
                preview_width = 0.6,
                preview_cutoff = 120,
            },
            center = {
                height = 0.4,
                preview_cutoff = 40,
            },
            cursor = {
                preview_cutoff = 40,
                preview_width = 0.6,
            },
            horizontal = {
                preview_width = 0.6,
                preview_cutoff = 120,
            },
            vertical = {
                preview_cutoff = 40,
            },
        },
    },
})

-- Keymaps
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files", noremap = true })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep", noremap = true })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "List buffers", noremap = true })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags", noremap = true })
vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { desc = "Format current", noremap = true })

return telescope
