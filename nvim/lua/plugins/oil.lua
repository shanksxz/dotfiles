return {
  "stevearc/oil.nvim",
  -- Oil docs recommend not lazy-loading when used as default file explorer.
  lazy = false,
  dependencies = { { "nvim-mini/mini.icons", opts = {} } },
  keys = {
    { "-", "<CMD>Oil<CR>", desc = "Open parent directory" },
  },
  config = function()
    require("oil").setup({
      default_file_explorer = true,
      delete_to_trash = true,
      win_options = {
        wrap = true,
      },
      view_options = {
        show_hidden = true,
        natural_order = true,
        is_always_hidden = function(name, _)
          return name == ".." or name == ".git"
        end,
      },
      keymaps = {
        ["yp"] = {
          desc = "Copy filepath to system clipboard",
          callback = function()
            require("oil.actions").copy_entry_path.callback()
            vim.fn.setreg("+", vim.fn.getreg(vim.v.register))
          end,
        },
      },
    })
  end,
}
