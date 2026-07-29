-- HOW IT WORKS
-- ------------
-- neocursor runs a tiny Python sidecar (via `uv`) that reads your local Cursor
-- desktop-app session and calls the same StreamCpp backend Cursor itself uses.
-- No API key, no extra subscription — it piggybacks on your existing Cursor login.
--
--
-- <TAB> CHAIN (insert mode)
-- -------------------------
-- blink.cmp owns <Tab> in this config. We integrate neocursor as the *first*
-- priority inside blink's keymap action chain so every tool gets a fair turn:
--
--   <Tab>
--     │
--     ├─ 1. neocursor.accept()      ghost text visible?  → accept it, done.
--     │                             (Cursor's next-edit prediction)
--     │
--     ├─ 2. snippet_forward         inside a blink snippet?  → jump to next
--     │                             placeholder, done.
--     │
--     ├─ 3. ai_nes / ai_accept      sidekick NES (Copilot next-edit) or other
--     │                             AI accept registered with LazyVim, done.
--     │
--     └─ 4. fallback                nothing matched → literal <Tab> / indent.
--
-- WHY WE OWN THE FULL CHAIN
-- -------------------------
-- LazyVim's blink extra (extras/coding/blink.lua) sets <Tab> only when
-- opts.keymap["<Tab>"] is nil:
--
--   if not opts.keymap["<Tab>"] then
--     opts.keymap["<Tab>"] = { snippet_forward, ai_nes, ai_accept, fallback }
--   end
--
-- lazy.nvim does not guarantee which plugin's opts() runs first. If our spec
-- ran first and only prepended neocursor to an empty list, LazyVim would see
-- <Tab> already set and silently drop snippet_forward / ai_nes / ai_accept.
--
-- Solution: always write the *complete* chain here. This is correct in both
-- orderings:
--   • We run first  → full chain set; LazyVim skips (sees key exists). ✓
--   • We run second → we overwrite with the same complete chain. ✓
--
-- Downside: if LazyVim changes its default <Tab> chain in a future update,
-- this file won't auto-inherit that change — update manually if needed.
-- =============================================================================

return {
  -- ── blink.cmp: register the full <Tab> chain ───────────────────────────────
  {
    "saghen/blink.cmp",
    optional = true,
    opts = function(_, opts)
      opts.keymap = opts.keymap or {}

      opts.keymap["<Tab>"] = {
        -- 1. neocursor — accept ghost-text prediction if one is displayed
        function(_cmp)
          local ok, nc = pcall(require, "neocursor")
          if ok and nc.accept and nc.accept() then
            return true -- returning true stops the chain
          end
        end,

        -- 2. snippet_forward — advance cursor to the next snippet placeholder
        "snippet_forward",

        -- 3. sidekick ai_nes + any other LazyVim AI accept actions
        --    (LazyVim.cmp.map is a global set up early at startup)
        LazyVim.cmp.map({ "ai_nes", "ai_accept" }),

        -- 4. fallback — nothing matched; emit a literal <Tab> / indent
        "fallback",
      }
    end,
  },
  {
    "teocns/neocursor.nvim",
    event = "InsertEnter", -- lazy-load: sidecar starts only on first insert
    -- Pre-warm the sidecar's httpx dependency at install / update time so the
    -- very first suggestion doesn't incur a pip-install delay.
    build = 'uv run --with "httpx[http2]" python -c "import httpx"',
    opts = {
      -- blink.cmp owns <Tab>; neocursor is wired into its chain above.
      -- Setting map_tab = false prevents neocursor from registering its own
      -- <Tab> mapping, which would conflict with blink's chain.
      map_tab = false,

      -- Milliseconds of typing inactivity before a prediction is requested.
      -- Cursor's CppConfig may override this at startup with its own value.
      debounce = 250,
    },
  },
}
