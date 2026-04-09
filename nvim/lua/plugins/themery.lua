return {
  "zaldih/themery.nvim",
  config = function()
    require("themery").setup({
      themes = {
        "vesper",
        "tokyonight",
        "gruvbox",
        "catppuccin",
      },
      livePreview = true,
    })
  end,
}
