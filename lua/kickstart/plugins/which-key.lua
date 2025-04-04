-- NOTE: Plugins can also be configured to run Lua code when they are loaded.
--
-- This is often very useful to both group configuration, as well as handle
-- lazy loading plugins that don't need to be loaded immediately at startup.
--
-- For example, in the following configuration, we use:
--  event = 'VimEnter'
--
-- which loads which-key before all the UI elements are loaded. Events can be
-- normal autocommands events (`:help autocmd-events`).
--
-- Then, because we use the `opts` key (recommended), the configuration runs
-- after the plugin has been loaded as `require(MODULE).setup(opts)`.

return {
  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    opts = {
      -- delay between pressing a key and opening which-key (milliseconds)
      -- this setting is independent of vim.opt.timeoutlen
      delay = 0,
      icons = {
        -- set icon mappings to true if you have a Nerd Font
        mappings = vim.g.have_nerd_font,
        -- If you are using a Nerd Font: set icons.keys to an empty table which will use the
        -- default which-key.nvim defined Nerd Font icons, otherwise define a string table
        keys = vim.g.have_nerd_font and {} or {
          Up = '<Up> ',
          Down = '<Down> ',
          Left = '<Left> ',
          Right = '<Right> ',
          C = '<C-…> ',
          M = '<M-…> ',
          D = '<D-…> ',
          S = '<S-…> ',
          CR = '<CR> ',
          Esc = '<Esc> ',
          ScrollWheelDown = '<ScrollWheelDown> ',
          ScrollWheelUp = '<ScrollWheelUp> ',
          NL = '<NL> ',
          BS = '<BS> ',
          Space = '<Space> ',
          Tab = '<Tab> ',
          F1 = '<F1>',
          F2 = '<F2>',
          F3 = '<F3>',
          F4 = '<F4>',
          F5 = '<F5>',
          F6 = '<F6>',
          F7 = '<F7>',
          F8 = '<F8>',
          F9 = '<F9>',
          F10 = '<F10>',
          F11 = '<F11>',
          F12 = '<F12>',
        },
      },

      -- Document existing key chains
      spec = {
        { '<leader>d', group = '[D]ebugger' },
        { '<leader>r', group = '[R]ename' },
        { '<leader>a', group = '[A]uto' },
        { '<leader>g', group = '[G]it / [G]oto' },
        { '<leader>gr', group = '[G]it [R]eset' },
        { '<leader>gr', group = '[G]it [S]tash' },

        -- when using a search/find, I arbitrarily make the distinction between:
        -- stuff on a file basis: Finding a file, and opening it. Re-opening an active buffer.
        { '<leader>o', group = '[O]pen (file, buffer)' },
        -- Content of all files in workspace: Symbols in files, specific strings
        -- Deliberately on 's' in home row for colemak, because easier to reach. Most used.
        { '<leader>s', group = '[S]earch in workspace for (text, symbols)' },
        { '<leader>b', group = '[B]uffer' },
        { '<leader>ss', group = '[S]earch [S]ymbols' },
        -- Content of this current buffer (same as above but limited)
        { '<leader>b', group = 'search in this [B]uffer for (text, symbols)' },
        -- External things: Documentation, diagnostic, etc.
        { '<leader>f', group = '[F]ind in (docs, help, external resources)' },

        { '<leader>t', group = '[T]est' },
        { '<leader>c', group = '[C]itations' },
        { '<leader>p', group = '[P]opup show' },
        { '<leader>v', group = 'toggle [V]iew' },
        { '<leader>vg', group = 'toggle [V]iew [G]it' },
        { '<leader>w', group = 'show/hide [W]indow' },
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
