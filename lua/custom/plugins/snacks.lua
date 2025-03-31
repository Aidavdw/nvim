return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {

    -- Replacement for indentblankline
    -- indent = { enabled = true },
    -- Other input from user (e.g. when renaming things) pop-up in nice floating window. Note that this is *NOT* the ':' window.
    input = { enabled = true, expand = true },
    -- Prettier vim.notify- now stuff shows up on the right top. This is stuff like 'changes found, reloading config', not stuff like 'rustanalyzer is running (which normally shows up bottom right)'.
    notifier = { enabled = true },
    -- Scope detection. I already use indent-blankline, so no need
    -- scope = { enabled = true },
    -- Nicer whichkey display
    -- toggle = { enabled = true, which_key = true },
  },
}
