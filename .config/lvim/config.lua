-- General
vim.opt.guifont = "JetBrainsMono Nerd Font:h16"
vim.opt.shell = "/bin/sh"

vim.opt.backup = false
vim.opt.undofile = false

vim.opt.shiftwidth = 4
vim.opt.tabstop = 8
vim.opt.expandtab = true
vim.opt.smarttab = true

vim.opt.number = true
vim.opt.relativenumber = true

lvim.log.level = "warn"
lvim.format_on_save = false

-- Key Mappings
lvim.leader = "space"

lvim.keys.insert_mode = {
  ["<C-g>"] = "<ESC>",
}

lvim.keys.normal_mode = {
  ["<C-g>"] = "<ESC>",
}

lvim.keys.term_mode = {
  ["<C-g>"] = "<ESC>",
}

lvim.keys.visual_mode = {
  ["<C-g>"] = "<ESC>",
}

lvim.keys.visual_block_mode = {
  ["<C-g>"] = "<ESC>",
}

-- Predefined plugins
lvim.builtin.notify.active = false

lvim.builtin.terminal.active = true
lvim.builtin.terminal.shade_terminals = false

lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

-- treesitter parsers
lvim.builtin.treesitter.ensure_installed = {}
lvim.builtin.treesitter.ignore_install = {}
lvim.builtin.treesitter.highlight.enabled = true

-- LSP settings
lvim.lsp.automatic_servers_installation = false

-- colorscheme
-- lvim.colorscheme = "onedarker"
lvim.colorscheme = "one-nvim"
-- lvim.colorscheme = "tokyonight"

-- Additional Plugins
lvim.plugins = {
  { "Th3Whit3Wolf/one-nvim" },
  {
    "folke/tokyonight.nvim",
    config = function()
      vim.g.tokyonight_style = "storm"
      -- vim.g.tokyonight_italic_comments = false
      -- vim.g.tokyonight_italic_keywords = false
      -- vim.g.tokyonight_italic_functions = false
      -- vim.g.tokyonight_italic_variables = false
    end,
  },
  {
    "editorconfig/editorconfig-vim",
    opt = true,
    event = "BufRead",
  },
  {
    "simrat39/rust-tools.nvim",
    opt = true,
    ft = { "rust" },
    config = function()
      require("rust-tools").setup {}
    end,
  },
}
