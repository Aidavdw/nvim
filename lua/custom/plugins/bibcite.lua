return {
  dir = '/alt/code/bibcite.nvim/', -- path to your local plugin
  name = 'bibcite', -- optional name if it's not in a Git repo
  -- Running these commands triggers lazy load. They are still auto-completed.
  cmd = { 'CiteDebug', 'CiteOpen', 'CiteInsert', 'CitePeek', 'CiteNote' },
  -- TODO: Figure out a way to trigger lazy load with keybinds. https://lazy.folke.io/spec/lazy_loading#%EF%B8%8F-lazy-key-mappings
  config = function()
    require('bibcite').setup {
      bibtex_path = vim.fn.expand '/alt/code/bibliography/thesis.bib',
      pdf_dir = vim.fn.expand '/alt/code/bibliography/files',
      notes_dir = vim.fn.expand '~/Desktop/fake_bib_notes',
    }
  end,
}
