-- NOTE: Plugins can specify dependencies.
--
-- The dependencies are proper plugin specifications as well - anything
-- you do for a plugin at the top level, you can do for a dependency.
--
-- Use the `dependencies` key to specify the dependencies of a particular plugin

return {
  { -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { -- If encountering errors, see telescope-fzf-native README for installation instructions
        'nvim-telescope/telescope-fzf-native.nvim',

        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = 'make',

        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },

      -- Useful for getting pretty icons, but requires a Nerd Font.
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function()
      -- Telescope is a fuzzy finder that comes with a lot of different things that
      -- it can fuzzy find! It's more than just a "file finder", it can search
      -- many different aspects of Neovim, your workspace, LSP, and more!
      --
      -- The easiest way to use Telescope, is to start by doing something like:
      --  :Telescope help_tags
      --
      -- After running this command, a window will open up and you're able to
      -- type in the prompt window. You'll see a list of `help_tags` options and
      -- a corresponding preview of the help.
      --
      -- Two important keymaps to use while in Telescope are:
      --  - Insert mode: <c-/>
      --  - Normal mode: ?
      --
      -- This opens a window that shows you all of the keymaps for the current
      -- Telescope picker. This is really useful to discover what Telescope can
      -- do as well as how to actually do it!

      -- [[ Configure Telescope ]]
      -- See `:help telescope` and `:help telescope.setup()`
      require('telescope').setup {
        -- You can put your default mappings / updates / etc. in here
        --  All the info you're looking for is in `:help telescope.setup()`
        --
        -- defaults = {
        --   mappings = {
        --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
        --   },
        -- },
        -- pickers = {}
        extensions = {
          ['ui-select'] = {
            -- Redirects native vim selection menus through Telescope. By default, uses the .get_dropdown(), but the boxes are usually way too small, so stuff gets cut off. Instead, use get_ivy(), a picker that attaches to the bottom of the screen.
            require('telescope.themes').get_ivy(),
          },
        },
        defaults = {
          mappings = {
            i = {
              ['tn'] = require('telescope.actions').close,
            },
          },
          -- Using `file_ignore_patterns` is very slow. Instead, defer this to ripgrep.
          -- Exclude all these files from any search actions!
          vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            -- Allow looking through hidden files.
            '--hidden',
            -- If --hidden is set, then git folders are also looked through. Filter them again.
            '-g',
            '!.github/',
            '-g',
            '!.git/',
            -- And more files to ignore
            '-g',
            '!Cargo.lock',
            '-g',
            '!license.*',
            '-g',
            '!LICENSE.*',
            '-g',
            '!LICENSE',
          },
        },
      }

      -- Enable Telescope extensions if they are installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')

      -- See `:help telescope.builtin`
      local builtin = require 'telescope.builtin'
      -- Find in (external), broadest
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[F]ind in [H]elp' })
      vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = '[F]ind in [K]eymaps' })
      vim.keymap.set('n', '<leader>fo', builtin.builtin, { desc = '[F]ind [O]ther...+' })
      vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[F]ind in [D]iagnostics' })
      -- Shortcut for searching your Neovim configuration files
      vim.keymap.set('n', '<leader>fc', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[F]ind in neovim [C]onfig' })

      -- Open stuff on a file basis: Finding a file, and opening it. Re-opening an active buffer.
      vim.keymap.set('n', '<leader>or', builtin.oldfiles, { desc = '[O]pen [R]ecent file ("." for repeat)' })
      -- Also find hidden files like `.bashrc`, but not files that are in the .gitignore
      vim.keymap.set('n', '<leader>of', function()
        builtin.find_files { hidden = true }
      end, { desc = '[O]pen [F]ile' })
      vim.keymap.set('n', '<leader>ob', builtin.buffers, { desc = '[O]pen [B]uffer' })

      -- Search Content of all files in workspace: Symbols in files, specific strings
      vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch for [W]ord under cursor' })
      vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = 'live [G]rep' })
      -- Repeated twice because we have the two places you might be coming from. Unfortuntaely there will be cross-contamination
      vim.keymap.set('n', '<leader>sa', builtin.resume, { desc = '[S]earch for previous [A]gain' })
      vim.keymap.set('n', '<leader>fa', builtin.resume, { desc = '[F]ind in previous [A]gain' })
      -- It's also possible to pass additional configuration options.
      --  See `:help telescope.builtin.live_grep()` for information about particular keys
      vim.keymap.set('n', '<leader>s/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'live grep in Open Files',
        }
      end, { desc = '[S]earch [/] in Open Files' })

      -- open an obsidian note (text)
      vim.keymap.set('n', '<leader>oo', function()
        builtin.find_files {
          cwd = '/alt/obsidian/notes/notes',
          prompt_title = 'Obsidian notes',
        }
      end, { desc = '[O]pen [O]bsidian note' })

      -- search inside obsidina notes (text)
      vim.keymap.set('n', '<leader>so', function()
        builtin.live_grep {
          cwd = '/alt/obsidian/notes/notes',
          prompt_title = 'in notes',
        }
      end, { desc = '[S]earch in obsidian [N]otes' })

      -- Search in current buffer
      -- Slightly advanced example of overriding default behavior and theme
      vim.keymap.set('n', '<leader>/', function()
        -- You can pass additional configuration to Telescope to change the theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_ivy {
          winblend = 10,
          previewer = false,
        })
      end, { desc = 'search this buffer' })
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
