return {
  "zaldih/themery.nvim",
  lazy = false,
  priority = 1000,
  cmd = "Themery",
  keys = {
    { "<leader>uT", "<cmd>Themery<cr>", desc = "Theme picker (Themery)" },
  },
  config = function()
    require("themery").setup({
      themes = {
        "vesper",
        "tokyonight",
        "tokyonight-night",
        "tokyodark",
        "gruvbox",
        "catppuccin",
        "discord",
        "discord-onyx",
        "poimandres",
        "catppuccin-latte",
        "catppuccin-frappe",
        "catppuccin-macchiato",
        "catppuccin-mocha",
      },
      livePreview = true,
    })
  end,
}
