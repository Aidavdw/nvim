return {
  {
    'mfussenegger/nvim-dap',
    config = function()
      local dap = require 'dap'
      vim.fn.sign_define('DapBreakpoint', { text = '', texthl = '', linehl = '', numhl = '' })
      vim.fn.sign_define('DapStopped', { text = '▶️', texthl = '', linehl = '', numhl = '' })

      -- Conditionally set keybinds, only during DAP session.
      -- Inspired by https://github.com/mfussenegger/dotfiles/blob/e7abb9a13f8fb3075704ed703dd973ecf3502cc3/vim/.config/nvim/lua/me/dap.lua#L64-L75
      dap.listeners.after.event_initialized['custom.dap.keys'] = function()
        vim.keymap.set('n', '<Enter>', dap.continue, { desc = 'Debug ▶️' })
        vim.keymap.set('n', '<right>', dap.step_over, { desc = 'Debug ' })
        vim.keymap.set('n', '<down>', dap.step_into, { desc = 'Debug ' })
        vim.keymap.set('n', '<up>', dap.step_out, { desc = 'Debug ' })
      end
      local reset_keys = function()
        pcall(vim.keymap.del, 'n', '<down>')
        pcall(vim.keymap.del, 'n', '<up>')
        pcall(vim.keymap.del, 'n', '<right>')
        pcall(vim.keymap.del, 'n', '<Enter>')
      end
      dap.listeners.after.event_terminated['me.dap.keys'] = reset_keys
      dap.listeners.after.disconnected['me.dap.keys'] = reset_keys

      vim.keymap.set('n', '<F5>', dap.continue, { desc = 'Debug ▶️' })
      vim.keymap.set('n', '<F10>', dap.step_over, { desc = 'Debug ' })
      vim.keymap.set('n', '<F11>', dap.step_into, { desc = 'Debug ' })
      vim.keymap.set('n', '<F12>', dap.step_out, { desc = 'Debug ' })
      vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = 'Toggle [B]reakpoint' })
    end,
  },
}
