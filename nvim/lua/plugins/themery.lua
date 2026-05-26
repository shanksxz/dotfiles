return {
  "zaldih/themery.nvim",
  config = function()
    require("themery").setup({
      themes = {
        "vesper",
        "tokyonight",
        "gruvbox",
        "catppuccin",
        "discord",
        "discord-onyx",
      },
      livePreview = true,
    })
  end,
}
