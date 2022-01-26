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
  -- Disable arrow keys
  ["<Up>"] = "<NOP>",
  ["<Down>"] = "<NOP>",
  ["<Left>"] = "<NOP>",
  ["<Right>"] = "<NOP>",
  ["<C-s>"] = "<ESC>:w<CR>a",
}

lvim.keys.normal_mode = {
  -- Resize with arrows
  ["<Up>"] = ":resize +1<CR>",
  ["<Down>"] = ":resize -1<CR>",
  ["<Left>"] = ":vertical resize +1<CR>",
  ["<Right>"] = ":vertical resize -1<CR>",
  ["<C-s>"] = ":w<CR>",
}

lvim.keys.term_mode = {}

lvim.keys.visual_mode = {}

lvim.keys.visual_block_mode = {}

-- lvim.builtin.which_key.mappings["W"] = {
--   "<cmd>w !sudo tee % > /dev/null<CR>", "Save as root"
-- }

-- Predefined plugins
lvim.builtin.dashboard.active = true
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

-- treesitter parsers
lvim.builtin.treesitter.ensure_installed = {}
lvim.builtin.treesitter.ignore_install = {}
lvim.builtin.treesitter.highlight.enabled = true

-- LSP settings
lvim.lsp.automatic_servers_installation = false

-- colorscheme
lvim.colorscheme = "tokyonight"

-- Additional Plugins
lvim.plugins = {
  { "folke/tokyonight.nvim" },
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

  {
    "ray-x/lsp_signature.nvim",
    opt = true,
    event = "BufRead",
    config = function()
      require("lsp_signature").setup()
    end,
  },
  {
    "simrat39/symbols-outline.nvim",
    opt = true,
    cmd = "SymbolsOutline",
  },
}
