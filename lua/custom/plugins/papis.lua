return {
  'jghauser/papis.nvim',
  dependencies = {
    'kkharji/sqlite.lua',
    'MunifTanjim/nui.nvim',
    'pysan3/pathlib.nvim',
    'nvim-neotest/nvim-nio',
  },
  -- Unfortunately need a setup function because it does not expose its keymapping.
  config = function()
    require('papis').setup {
      -- Filetypes that upon opening trigger papis.nvim to load
      init_filetypes = { 'markdown', 'latex', 'yaml', 'dot', 'rust' },

      -- true = watch the filesystem and update the database in realtime enable the file system event watcher. false = only update database on startup
      enable_fs_watcher = true,

      -- Configuration of the search module.
      ['search'] = {
        -- Also allow searching by key ('ref').
        search_keys = { 'ref', 'author', 'editor', 'year', 'title', 'tags', 'groups' },
      },
      -- TODO: Show the 'key' in the results window too.
      -- It shows up in the search preview as
      --     { "ref", "%s", "PapisPreviewValue", "show_key", { "  ", "%s: " }, "PapisPreviewKey" },
      -- but PapisPreviewKey is not avaiable in the results
    }

    -- Time to set up some keybinds!
    vim.keymap.set('n', '<leader>ci', ':Papis search<CR>', { silent = true, noremap = true, desc = '[C]itation: [I]nsert reference ' })
    vim.keymap.set('n', '<leader>cd', ':Papis at-cursor open-file<CR>', { silent = true, noremap = true, desc = '[C]itation: open this [D]ocument (PDF) ' })
    vim.keymap.set('n', '<leader>cn', ':Papis at-cursor open-note<CR>', { silent = true, noremap = true, desc = '[C]itation: open this [N]ote ' })
    vim.keymap.set('n', '<leader>ce', ':Papis at-cursor edit<CR>', { silent = true, noremap = true, desc = '[C]itation: [E]dit this papis entry ' })
    vim.keymap.set('n', '<leader>pc', ':Papis at-cursor show-popup<CR>', { silent = true, noremap = true, desc = '[P]opup: this [C]itation ' })
  end,
}
