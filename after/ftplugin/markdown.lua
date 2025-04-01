-- otherwise markview complains. https://github.com/epwalsh/obsidian.nvim/issues/286
vim.opt_local.conceallevel = 2

-- Start with equations being rendered fully
-- autogen = true ￫ Auto-regenerate ascii-art equations when exiting insert mode
require('nabla').enable_virt { autogen = true }

local nabla_enabled = true
local function toggle_nabla()
  if nabla_enabled then
    require('nabla').disable_virt()
    nabla_enabled = false
  else
    require('nabla').enable_virt { autogen = true }
    nabla_enabled = true
  end
end

vim.keymap.set('n', '<leader>ve', function()
  toggle_nabla()
end, { desc = 'toggle [V]iew: [E]quations' })
