
local linters = require "lvim.lsp.null-ls.linters"
local formatters = require "lvim.lsp.null-ls.formatters"

linters.setup {
  { command = "flake8", filetypes = { "python" } },
}

formatters.setup {
  { command = "black", filetypes = { "python" } },
}

vim.cmd [[ setlocal tabstop=4 shiftwidth=4 ]]
