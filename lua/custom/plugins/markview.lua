return {
  'OXY2DEV/markview.nvim',
  lazy = false,

  -- Equation rendering is handled by nabla, so disable it
  opts = { latex = { enable = false } },

  -- For blink.cmp's completion
  -- source
  -- dependencies = {
  --     "saghen/blink.cmp"
  -- },
}
