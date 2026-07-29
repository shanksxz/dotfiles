return {
  "jake-stewart/multicursor.nvim",
  branch = "1.0",
  keys = {
    -- Line add / skip
    {
      "<up>",
      function()
        require("multicursor-nvim").lineAddCursor(-1)
      end,
      mode = { "n", "x" },
      desc = "Multicursor: line add above",
    },
    {
      "<down>",
      function()
        require("multicursor-nvim").lineAddCursor(1)
      end,
      mode = { "n", "x" },
      desc = "Multicursor: line add below",
    },
    {
      "<leader><up>",
      function()
        require("multicursor-nvim").lineSkipCursor(-1)
      end,
      mode = { "n", "x" },
      desc = "Multicursor: line skip above",
    },
    {
      "<leader><down>",
      function()
        require("multicursor-nvim").lineSkipCursor(1)
      end,
      mode = { "n", "x" },
      desc = "Multicursor: line skip below",
    },
    -- Match add/skip under <leader>m so LazyVim <leader>s / <leader>n stay free
    {
      "<leader>mn",
      function()
        require("multicursor-nvim").matchAddCursor(1)
      end,
      mode = { "n", "x" },
      desc = "Multicursor: match add",
    },
    {
      "<leader>ms",
      function()
        require("multicursor-nvim").matchSkipCursor(1)
      end,
      mode = { "n", "x" },
      desc = "Multicursor: match skip",
    },
    {
      "<leader>mN",
      function()
        require("multicursor-nvim").matchAddCursor(-1)
      end,
      mode = { "n", "x" },
      desc = "Multicursor: match add prev",
    },
    {
      "<leader>mS",
      function()
        require("multicursor-nvim").matchSkipCursor(-1)
      end,
      mode = { "n", "x" },
      desc = "Multicursor: match skip prev",
    },
    -- Mouse
    {
      "<c-leftmouse>",
      function()
        require("multicursor-nvim").handleMouse()
      end,
      desc = "Multicursor: mouse",
    },
    {
      "<c-leftdrag>",
      function()
        require("multicursor-nvim").handleMouseDrag()
      end,
      desc = "Multicursor: mouse drag",
    },
    {
      "<c-leftrelease>",
      function()
        require("multicursor-nvim").handleMouseRelease()
      end,
      desc = "Multicursor: mouse release",
    },
    {
      "<c-q>",
      function()
        require("multicursor-nvim").toggleCursor()
      end,
      mode = { "n", "x" },
      desc = "Multicursor: toggle",
    },
  },
  config = function()
    local mc = require("multicursor-nvim")
    mc.setup()

    -- Layer maps only apply when multiple cursors are active.
    mc.addKeymapLayer(function(layerSet)
      layerSet({ "n", "x" }, "<left>", mc.prevCursor)
      layerSet({ "n", "x" }, "<right>", mc.nextCursor)
      layerSet({ "n", "x" }, "<leader>x", mc.deleteCursor)
      layerSet("n", "<esc>", function()
        if not mc.cursorsEnabled() then
          mc.enableCursors()
        else
          mc.clearCursors()
        end
      end)
    end)

    local hl = vim.api.nvim_set_hl
    hl(0, "MultiCursorCursor", { reverse = true })
    hl(0, "MultiCursorVisual", { link = "Visual" })
    hl(0, "MultiCursorSign", { link = "SignColumn" })
    hl(0, "MultiCursorMatchPreview", { link = "Search" })
    hl(0, "MultiCursorDisabledCursor", { reverse = true })
    hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
    hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })
  end,
}
