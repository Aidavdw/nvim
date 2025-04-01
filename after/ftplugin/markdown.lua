-- otherwise markview complains. https://github.com/epwalsh/obsidian.nvim/issues/286
vim.opt_local.conceallevel = 2

-- Start with equations being rendered fully
-- autogen = true ￫ Auto-regenerate ascii-art equations when exiting insert mode
-- HACK: using enable_virt leaves wrapping on off. Probably bleeding out. Manually set it to true again after calling these
-- TODO: If the line with the equation is way too large, there is rendered vertically in the middle of the equation. This is not ideal.
require('nabla').enable_virt()
vim.o.wrap = true

vim.keymap.set('n', '<leader>ve', function()
  require('nabla').toggle_virt()
  vim.o.wrap = true
end, { desc = 'toggle [V]iew: [E]quations' })
