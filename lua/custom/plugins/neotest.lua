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

      vim.keymap.set('n', '<leader>ut', neotest.run.run, { desc = 'run [U]nit test: [T]his' })

      vim.keymap.set('n', '<leader>uf', function()
        neotest.run.run(vim.fn.expand '%')
      end, { desc = 'run all [U]nit tests in [F]ile' })

      vim.keymap.set('n', '<leader>du', function()
        neotest.run.run { strategy = 'dap' }
      end, { desc = '[D]ebug this [U]nit test' })

      vim.keymap.set('n', '<leader>da', function()
        neotest.run.run_last { strategy = 'dap' }
      end, { desc = '[D]ebug previous [A]gain' })

      vim.keymap.set('n', '<leader>ua', function()
        neotest.run.run_last {}
      end, { desc = '[U]nittest previous [A]gain' })
    end,
  },
}
