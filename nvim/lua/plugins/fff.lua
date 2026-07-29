return {
  {
    "dmtrKovalenko/fff.nvim",
    build = function()
      require("fff.download").download_or_build_binary()
    end,
    lazy = false, -- pre-warms the index
    opts = {
      grep = {
        modes = { "plain", "regex", "fuzzy" },
      },
    },
    keys = {
      -- Files (override LazyVim snacks picker for these)
      {
        "<leader>ff",
        function()
          require("fff").find_files()
        end,
        desc = "Find Files (fff)",
      },
      {
        "<leader>fF",
        function()
          require("fff").find_files_in_dir(vim.fn.getcwd())
        end,
        desc = "Find Files cwd (fff)",
      },
      -- Grep
      {
        "<leader>sg",
        function()
          require("fff").live_grep()
        end,
        desc = "Grep (fff)",
      },
      {
        "<leader>sG",
        function()
          require("fff").live_grep({ cwd = vim.fn.getcwd() })
        end,
        desc = "Grep cwd (fff)",
      },
      {
        "<leader>sw",
        function()
          require("fff").live_grep_under_cursor()
        end,
        desc = "Grep Word (fff)",
        mode = { "n", "x" },
      },
    },
  },
}
