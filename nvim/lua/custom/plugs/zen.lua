return {
    'folke/zen-mode.nvim',
    cmd = 'ZenMode',
    keys = {
        { "<leader>z", mode = "n", desc = "Zen Mode" },
    },

    config = function()
        require("zen-mode").setup {
            window = {
                width = 0.65,
                height = 1,
                options = {
                    signcolumn = "no",
                    number = false,
                    relativenumber = true,
                    cursorline = false,
                    cursorcolumn = false,
                    foldcolumn = "0",
                    list = false,
                },
            },
        }

        vim.api.nvim_set_keymap('n', '<leader>z', '<cmd>ZenMode<CR>', { noremap = true, silent = true })
    end,
}
