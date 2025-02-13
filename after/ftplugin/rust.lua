-- This file contains settings that are only applied to rust files.

-- vim.g.rustaceanvim = {
--   tools = {
--   },
-- }
-- Right now, only things provided by rustaceanvim.
-- Keybinds must be set with `buffer = true`, if you don't want the bindings to be permanent for all buffers once it's been loaded.
vim.keymap.set('n', '<leader>us', function()
  vim.cmd.RustLsp { 'testables' }
end, { desc = '[S]how testables ', buffer = true })

-- For this one, we want to be able to run the previous test again, even from a different buffer. So, remove buffer=true. Side effect is you can re-run them if you closed all rust files.
vim.keymap.set('n', '<leader>ua', function()
  vim.cmd.RustLsp { 'testables', bang = true }
end, { desc = '[U]nittest previous [A]gain ' })

-- Same as above. So, remove buffer=true. Side effect is you can re-run them if you closed all rust files.
vim.keymap.set('n', '<leader>da', function()
  vim.cmd.RustLsp { 'debuggables', bang = true }
end, { desc = '[D]ebug previous [A]gain ' })

vim.keymap.set('n', '<leader>pe', function()
  vim.cmd.RustLsp { 'explainError', 'current' }
end, { desc = '[E]xplain this error ', buffer = true })

vim.keymap.set('n', '<leader>pD', function()
  vim.cmd.RustLsp { 'renderDiagnostic', 'current' }
end, { desc = '[P]opup [D]iagnostic (rustc) ', buffer = true })

vim.keymap.set('n', 'gR', function()
  vim.cmd.RustLsp { 'relatedDiagnostics' }
end, { desc = '[G]oto [R]elated diagnostic ', buffer = true })
