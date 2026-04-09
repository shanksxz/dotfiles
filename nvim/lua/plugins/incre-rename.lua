return {
  "smjonas/inc-rename.nvim",
  keys = {
    {
      "<leader>rn",
      function()
        return ":IncRename " .. vim.fn.expand("<cword>")
      end,
      expr = true,
      desc = "Incremental Rename",
    },
  },
  config = function()
    require("inc_rename").setup({
      input_buffer_type = "snacks",
    })
  end,
}
