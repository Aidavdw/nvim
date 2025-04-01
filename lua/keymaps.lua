-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Exit insert mode for colemak bros
vim.keymap.set('i', 'tn', '<Esc>')

-- Diagnostic keymaps
-- Populate the quickfix list with the diagnostics. Probably a little bit of overlap with the Trouble plugin, but that is fine.
vim.keymap.set('n', '<leader>wq', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
-- Goto the next diagnostic, and open its popup.
vim.keymap.set('n', 'gz', function()
  vim.diagnostic.goto_next { float = true }
end, { desc = 'Go to next diagnostic' })
-- Potato, but back.
vim.keymap.set('n', 'gZ', function()
  vim.diagnostic.goto_prev { float = true }
end, { desc = 'Go to previous diagnostic' })

-- Switch windows quickly
vim.api.nvim_set_keymap('n', '<leader>n', '<C-w>w', { noremap = true, silent = true, desc = 'Switch active split' })

-- Search through all todos, as marked with 'TODO_:', 'WARN_:' etc
vim.keymap.set('n', '<leader>wq', '<cmd>TodoTelescope keywords=TODO,FIX,PERF', { desc = '[F]ind open [T]odos' })

-- manually toggle the line wrap. Useful when stuff breaks because of line wrapping or lack thereof. Looking at you, markview.
local line_wrap = true
vim.keymap.set('n', '<leader>vw', function()
  if line_wrap then
    vim.o.wrap = false
    line_wrap = false
  else
    vim.o.wrap = true
    line_wrap = true
  end
end, { desc = 'toggle [V]iew: Word [W]rap' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- vim: ts=2 sts=2 sw=2 et
