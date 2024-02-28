return {
  -- add gruvbox
  {
    "lalitmee/cobalt2.nvim",
    event = { "ColorSchemePre" }, -- if you want to lazy load
    dependencies = { "tjdevries/colorbuddy.nvim" },
    init = function()
      require("colorbuddy").colorscheme("cobalt2")
    end,
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "cobalt2",
    },
  },
}
