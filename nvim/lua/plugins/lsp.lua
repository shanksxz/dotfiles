return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gopls = {
          should_attach = function(bufnr)
            local name = vim.api.nvim_buf_get_name(bufnr)
            return name:match("^file://") or not name:match("://")
          end,
        },
      },
    },
  },
}
