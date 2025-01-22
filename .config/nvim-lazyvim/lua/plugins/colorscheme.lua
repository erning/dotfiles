return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = {
      styles = {
        comments = { italic = false },
        keywords = { italic = false },
      },
    },
  },
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      no_italic = true,
    },
  },
}
