return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "marilari88/neotest-vitest",
      { "nvim-treesitter/nvim-treesitter", branch = "main" },
      { "fredrikaverpil/neotest-golang", version = "*" },
    },
    opts = {
      adapters = {
        ["neotest-vitest"] = {
          args = { "--coverage" },
        },
        ["neotest-golang"] = {
          go_test_args = {
            "-v",
            "-count=1",
            "-coverprofile=" .. vim.fn.stdpath("cache") .. "/coverage.out",
          },
        },
      },
    },
  },
  {
    "andythigpen/nvim-coverage",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      auto_reload = true,
      lang = {
        go = {
          coverage_file = vim.fn.stdpath("cache") .. "/coverage.out",
        },
        javascript = {
          coverage_file = "coverage/lcov.info",
        },
        typescript = {
          coverage_file = "coverage/lcov.info",
        },
      },
    },
  },
}
