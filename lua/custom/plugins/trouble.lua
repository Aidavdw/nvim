-- 'Trouble' shows diagnostic information in a separate window for the entire project, not just the current file.
return {
  {
    'folke/trouble.nvim',
    opts = {
      -- Default open windows on the right
      win = { type = 'split', position = 'right', size = 52 },
    },
    cmd = 'Trouble',
    keys = {
      {
        -- Window showing just the errors: Not to get distracted with warnings, first just errors! Also auto-focus on it, since if we are interested in errors we probably want to fix it.
        '<leader>we',
        '<cmd>Trouble diagnostics toggle filter.severity=vim.diagnostic.severity.ERROR focus=true<cr>',
        desc = '[W]indow: [E]rrors',
      },
      {
        -- Basically same as error window, but now also hints and warnings.
        '<leader>wd',
        -- filter.buf=0 → Link to active buffer
        -- win.relative=win win.position=right → Open on the right
        '<cmd>Trouble diagnostics toggle <cr>',
        desc = '[W]indow: [D]iagnostics',
      },
      {
        '<leader>ws',
        '<cmd>Trouble symbols toggle focus=false<cr>',
        desc = '[W]indow: [S]ymbols',
      },
    },
  },
}
