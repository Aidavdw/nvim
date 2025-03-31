return {
  {
    'mfussenegger/nvim-dap',
    config = function()
      local dap = require 'dap'
      vim.fn.sign_define('DapBreakpoint', { text = '', texthl = '', linehl = '', numhl = '' })
      vim.fn.sign_define('DapStopped', { text = '▶️', texthl = '', linehl = '', numhl = '' })

      -- Automatically break if C exception or rust panic.
      -- https://www.reddit.com/r/neovim/comments/13o3xzv/rustcodelldbnvimdaprusttools_add_automatically_a/
      -- Maybe can extend this to automatically break if an Error variant is returned?
      dap.defaults.fallback.exception_breakpoints = { 'rust_panic' }

      -- Conditionally set keybinds, only during DAP session.
      -- Inspired by https://github.com/mfussenegger/dotfiles/blob/e7abb9a13f8fb3075704ed703dd973ecf3502cc3/vim/.config/nvim/lua/me/dap.lua#L64-L75
      dap.listeners.after.event_initialized['custom.dap.keys'] = function()
        vim.keymap.set('n', '<Tab>', dap.continue, { desc = 'Debug ▶️' })
        vim.keymap.set('n', '<Enter>', dap.step_over, { desc = 'Debug ' })
        vim.keymap.set('n', ';', dap.step_into, { desc = 'Debug ' })
        vim.keymap.set('n', '<BS>', dap.step_out, { desc = 'Debug ' })
      end
      local reset_keys = function()
        pcall(vim.keymap.del, 'n', '<Tab>')
        pcall(vim.keymap.del, 'n', '<Enter>')
        pcall(vim.keymap.del, 'n', ';')
        pcall(vim.keymap.del, 'n', '<BS>')
      end
      dap.listeners.after.event_terminated['me.dap.keys'] = reset_keys
      dap.listeners.after.disconnected['me.dap.keys'] = reset_keys

      vim.keymap.set('n', '<F5>', dap.continue, { desc = 'Debug ▶️' })
      vim.keymap.set('n', '<F10>', dap.step_over, { desc = 'Debug ' })
      vim.keymap.set('n', '<F11>', dap.step_into, { desc = 'Debug ' })
      vim.keymap.set('n', '<F12>', dap.step_out, { desc = 'Debug ' })

      vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = 'toggle [B]reakpoint' })
      -- TODO: Put these in the conditional keymaps with a more appropriate key, like _ and -
      vim.keymap.set('n', '<leader>df', dap.up, { desc = '[F]rame up' })
      vim.keymap.set('n', '<leader>dF', dap.down, { desc = '[F]rame down' })
    end,
  },
}
