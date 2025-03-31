return {
  'epwalsh/obsidian.nvim',
  version = '*', -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = 'markdown',
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
  --   -- refer to `:h file-pattern` for more examples
  --   "BufReadPre path/to/my-vault/*.md",
  --   "BufNewFile path/to/my-vault/*.md",
  -- },
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  attachments = {
    -- Where to place new images, also via `:ObsidianPasteImg`.
    img_folder = 'media',
  },
  config = function()
    local obsidian = require 'obsidian'
    obsidian.setup {
      workspaces = {
        {
          name = 'notes',
          path = '/alt/obsidian/notes',
        },
        {
          name = 'japanese',
          path = '/alt/obsidian/japanese/',
        },
      },
    }

    -- Unfortunately, obsidian.nvim is not very performant.
    -- Hence, forego the use of the following functionality for their alternatives:
    -- ObsidianQuickSwitch ￫ telescope open file
    -- ObsidianSearch ￫ telescope livegrep
    --
    --
    -- Open the note under the cursor in a split
    vim.keymap.set('n', '<leader>ol', ':ObsidianFollowLink vsplit<CR>', { silent = true, noremap = true, desc = '[O]pen [L]inked in split ' })
    vim.keymap.set('n', '<leader>ft', ':ObsidianBacklinks<CR>', { silent = true, noremap = true, desc = '[F]ind links [T]o others ' })
    vim.keymap.set('n', '<leader>ff', ':ObsidianLinks<CR>', { silent = true, noremap = true, desc = '[F]ind links [F]rom others ' })
    vim.keymap.set('n', '<leader>fT', ':ObsidianTags<CR>', { silent = true, noremap = true, desc = '[F]ind notes with [T]ag ' })
    -- :ObsidianRename is still a little too unstable, add later. For now, just do that through obsidian.
  end,
}
