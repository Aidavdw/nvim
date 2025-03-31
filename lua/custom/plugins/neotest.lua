return {
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      local neotest = require 'neotest'
      neotest.setup {
        adapters = { require 'rustaceanvim.neotest' },
      }

      vim.keymap.set('n', '<leader>tt', neotest.run.run, { desc = 'run [T]est: [T]his' })

      vim.keymap.set('n', '<leader>tf', function()
        neotest.run.run(vim.fn.expand '%')
      end, { desc = 'run all [T]ests in [F]ile' })

      vim.keymap.set('n', '<leader>dt', function()
        neotest.run.run { strategy = 'dap' }
      end, { desc = '[D]ebug this [T]est' })

      vim.keymap.set('n', '<leader>da', function()
        neotest.run.run_last { strategy = 'dap' }
      end, { desc = '[D]ebug: previous [A]gain' })

      vim.keymap.set('n', '<leader>ta', function()
        neotest.run.run_last {}
      end, { desc = '[T]est: previous [A]gain' })
    end,
  },
}
