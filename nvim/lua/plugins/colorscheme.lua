return {
  {
    "ellisonleao/gruvbox.nvim",
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
  },
  {
    "datsfilipe/vesper.nvim",
    config = function()
      require("vesper").setup({
        transparent = false,
        italics = {
          comments = false,
          keywords = false,
          functions = false,
          strings = false,
          variables = false,
        },
        overrides = {},
        palette_overrides = {},
      })
    end,
  },
}
