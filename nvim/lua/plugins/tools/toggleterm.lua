local toggleterm = require("toggleterm")
local map = require("core.mappings")
local Terminal = require('toggleterm.terminal').Terminal

toggleterm.setup({
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  open_mapping = [[<c-\>]],
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 2,
  start_in_insert = true,
  insert_mappings = true,
  persist_size = true,
  direction = "float",
  close_on_exit = true,
  shell = vim.o.shell,
  float_opts = {
    border = "curved",
    winblend = 0,
    highlights = {
      border = "Normal",
      background = "Normal",
    },
  },
})

local horizontal_term = Terminal:new({ direction = "horizontal", size = 15 })
local vertical_term = Terminal:new({ direction = "vertical", size = 60 })
local float_term = Terminal:new({ direction = "float" })

map("n", "<leader>th", function()
  horizontal_term:toggle()
end, { desc = "Toggle horizontal terminal" })

map("n", "<leader>tv", function()
  vertical_term:toggle()
end, { desc = "Toggle vertical terminal" })

map("n", "<leader>tf", function()
  float_term:toggle()
end, { desc = "Toggle floating terminal" })
