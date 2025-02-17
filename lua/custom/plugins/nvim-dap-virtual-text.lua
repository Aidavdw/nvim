-- When debugging, show values inline as virtual text.
return {
  {
    'theHamsta/nvim-dap-virtual-text',
    opts = {
      -- Re-show at later re-defenitions. Ex. un-mut'ing a thing in rust, you want it to show up again.
      only_first_definition = true,
    },
  },
}
