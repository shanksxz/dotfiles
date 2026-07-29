-- All themes are lazy. LazyVim/Themery load the active one via :colorscheme.
return {
  {
    "ellisonleao/gruvbox.nvim",
    lazy = true,
  },
  {
    "folke/tokyonight.nvim",
    lazy = true,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,
  },
  {
    "datsfilipe/vesper.nvim",
    lazy = true,
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
  {
    "shanksxz/discord-theme.nvim",
    lazy = true,
    config = function()
      require("discord_theme").setup({
        variant = "dark",
        integrations = true,
        overrides = {},
      })
    end,
  },
  {
    "tiagovla/tokyodark.nvim",
    lazy = true,
    opts = {},
  },
  {
    "olivercederborg/poimandres.nvim",
    lazy = true,
    config = function()
      require("poimandres").setup({})
    end,
  },
}
