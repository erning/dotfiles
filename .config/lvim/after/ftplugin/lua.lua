local formatters = require "lvim.lsp.null-ls.formatters"

formatters.setup {
  { command = "stylua", filetypes = { "lua" } },
}

vim.cmd [[ setlocal tabstop=2 shiftwidth=2 ]]
