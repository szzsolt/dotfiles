-- Disable search highlights
-- as they cause unintended side effects
-- https://github.com/folke/flash.nvim/issues/314
-- https://github.com/LazyVim/LazyVim/issues/1862
return {
  {
    "folke/flash.nvim",
    opts = {
      modes = {
        search = {
          enabled = false,
        },
      },
    },
  },
}
