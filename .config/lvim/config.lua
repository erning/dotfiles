
-- General
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
lvim.colorscheme = "onedarker"

-- Key Mappings
lvim.leader = "space"

lvim.keys.normal_mode["<C-s>"] = ":w<CR>"
lvim.keys.insert_mode["<C-s>"] = "<ESC>:w<CR>a"
lvim.keys.normal_mode["<ESC>"] = ":silent! nohls<CR>"
lvim.keys.normal_mode["<TAB>"] = ":bnext<CR>"
lvim.keys.normal_mode["<S-TAB>"] = ":bprevious<CR>"

-- Predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

-- treesitter parsers
lvim.builtin.treesitter.ensure_installed = {
  "lua",
  "vim",

  "go",
  "gomod",
  "python",
  "java",
  "kotlin",
  "typescript",
  "javascript",
  "c",
  "cpp",
  "rust",

  "bash",
  "fish",

  "css",
  "html",
  "vue",

  "dockerfile",
  "toml",
  "yaml",
  "json",
  "latex",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- LSP settings
lvim.lsp.automatic_servers_installation = false

-- Additional Plugins
lvim.plugins = {
  {"editorconfig/editorconfig-vim"},
  {
    "simrat39/rust-tools.nvim",
    config = function() require('rust-tools').setup({}) end
  },
}

