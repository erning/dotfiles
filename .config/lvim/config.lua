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

vim.opt.colorcolumn = "80"
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.cmdheight = 1

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

  -- Stay in indent mode
  ["<"] = "<gv",
  [">"] = ">gv",

  -- Replace paste
  ["p"] = '"_dP',
}

lvim.keys.visual_block_mode = {
  ["<C-g>"] = "<ESC>",
}

-- Predefined plugins
lvim.builtin.notify.active = true

lvim.builtin.terminal.active = true
lvim.builtin.terminal.shade_terminals = true

lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- treesitter parsers
lvim.builtin.treesitter.ensure_installed = {}
lvim.builtin.treesitter.ignore_install = {}
lvim.builtin.treesitter.highlight.enabled = true

-- LSP settings
lvim.lsp.automatic_servers_installation = false

-- colorscheme
-- lvim.colorscheme = "onedarker"
lvim.colorscheme = "onedark"

-- Additional Plugins
lvim.plugins = {
  { "navarasu/onedark.nvim" },
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
