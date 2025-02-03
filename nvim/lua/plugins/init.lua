local function load_config(package)
  return function()
    require("plugins." .. package)
  end
end

return {
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      "saghen/blink.cmp",
      "williamboman/mason-lspconfig.nvim",
    },
    config = load_config("tools.nvim-lsp"),
    event = { "BufReadPre", "BufNewFile" },
  },
  {
    "saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets" },
    version = "*",
    config = load_config("tools.blink"),
    opts_extend = { "sources.default" },
    event = { "InsertEnter" },
  },
  {
    'nvimdev/lspsaga.nvim',
    config = function()
      require('lspsaga').setup({})
    end,
    event = 'LspAttach',
  },
  {
    "williamboman/mason.nvim",
    config = load_config("tools.mason"),
    cmd = "Mason",
  },
  {
    "zbirenbaum/copilot.lua",
    dependencies = { "giuxtaposition/blink-cmp-copilot" },
    config = load_config("tools.copilot"),
    event = "InsertEnter",
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = { "zbirenbaum/copilot.lua" },
    branch = "main",
    build = "make tiktoken", -- only on Linux
    cmd = {
      "CopilotChat",
      "CopilotChatToggle",
      "CopilotChatDocs",
      "CopilotChatExplain",
      "CopilotChatFix",
      "CopilotChatFixDiagnostic",
      "CopilotChatCommit",
      "CopilotChatCommitStaged",
      "CopilotChatLoad",
      "CopilotChatOptimize",
      "CopilotChatReview",
      "CopilotChatSave",
      "CopilotChatTests",
    },
    config = load_config("tools.copilot-chat"),
  },
  {
    "folke/flash.nvim",
    config = load_config("tools.flash"),
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "S",
        mode = { "n", "x", "o" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
    },
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = load_config("tools.telescope"),
  },
  {
    "laytan/cloak.nvim",
    config = load_config("tools.cloak"),
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "datsfilipe/vesper.nvim",
    config = function()
      require("vesper").setup({
        transparent = false, -- Boolean: Sets the background to transparent
        -- italics = {
        --   comments = true, -- Boolean: Italicizes comments
        --   keywords = true, -- Boolean: Italicizes keywords
        --   functions = true, -- Boolean: Italicizes functions
        --   strings = true, -- Boolean: Italicizes strings
        --   variables = true, -- Boolean: Italicizes variables
        -- },
        overrides = {}, -- A dictionary of group names, can be a function returning a dictionary or a table.
        palette_overrides = {},
      })
      vim.cmd.colorscheme("vesper")
    end,
  },
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("bufferline").setup({})
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = load_config("ui.lualine"),
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = load_config("tools.toggleterm"),
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = load_config("tools.nvim-treesitter"),
  },
  {
    "stevearc/oil.nvim",
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    config = load_config("tools.oil"),
  },
  {
    {
      "numToStr/Comment.nvim",
      keys = {
        { "gcc", mode = "n",          desc = "Comment toggle current line" },
        { "gc",  mode = { "n", "o" }, desc = "Comment toggle linewise" },
        { "gc",  mode = "x",          desc = "Comment toggle linewise (visual)" },
        { "gbc", mode = "n",          desc = "Comment toggle current block" },
        { "gb",  mode = { "n", "o" }, desc = "Comment toggle blockwise" },
        { "gb",  mode = "x",          desc = "Comment toggle blockwise (visual)" },
        {
          "<leader>/",
          function()
            require("Comment.api").toggle.linewise.current()
          end,
          desc = "Toggle comment",
        },
        {
          "<leader>/",
          "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
          mode = "v",
          desc = "Toggle comment",
        },
      },
      config = function(_, opts)
        require("Comment").setup(opts)
      end,
    },
  },
  {
    "stevearc/conform.nvim",
    config = load_config("tools.conform"),
  },
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    config = load_config("tools.snacks"),
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
      "3rd/image.nvim",
      {
        "s1n7ax/nvim-window-picker",
        version = "2.*",
        config = function()
          require("window-picker").setup({
            filter_rules = {
              include_current_win = false,
              autoselect_one = true,
              bo = {
                filetype = { "neo-tree", "neo-tree-popup", "notify" },
                buftype = { "terminal", "quickfix" },
              },
            },
          })
        end,
      },
    },
    config = load_config("tools.neo-tree"),
  },
  {
    "echasnovski/mini.pairs",
    version = "*",
    config = load_config("tools.pairs"),
    event = { "InsertEnter" },
  },
  {
    "echasnovski/mini.surround",
    version = "*",
    config = load_config("tools.surround"),
    event = { "BufReadPost", "BufNewFile" },
  },
  -- lazy.nvim
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
    },
    config = load_config("ui.noice"),
  },
}
