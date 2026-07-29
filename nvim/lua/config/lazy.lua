local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

--- Apply Themery's persisted theme so LazyVim and Themery stay in sync.
--- Falls back to vesper when no state exists or the saved scheme fails to load.
local function load_colorscheme()
  local state_path = vim.fn.stdpath("data") .. "/themery/state.json"
  local f = io.open(state_path, "r")
  if f then
    local raw = f:read("*a")
    f:close()
    local ok, data = pcall(vim.json.decode, raw)
    if ok and data and data.colorscheme then
      local function exec(code)
        if type(code) == "string" and code ~= "" then
          local fn = load(code)
          if fn then
            pcall(fn)
          end
        end
      end
      exec(data.globalBeforeCode)
      exec(data.beforeCode)
      if pcall(vim.cmd.colorscheme, data.colorscheme) then
        exec(data.afterCode)
        exec(data.globalAfterCode)
        return
      end
    end
  end
  vim.cmd.colorscheme("vesper")
end

require("lazy").setup({
  spec = {
    {
      "LazyVim/LazyVim",
      import = "lazyvim.plugins",
      opts = {
        -- Themery owns persistence; this reads its state on startup.
        colorscheme = load_colorscheme,
      },
    },
    { import = "plugins" },
  },
  defaults = {
    -- Prefer on-demand load; plugins that must start early set lazy = false.
    lazy = true,
    version = false,
  },
  install = { colorscheme = { "vesper", "habamax" } },

  checker = {
    enabled = true,
    notify = false,
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
