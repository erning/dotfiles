-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

if vim.lsp.inlay_hint then
  LazyVim.toggle.map("<C-S-h>", LazyVim.toggle.inlay_hints)
end
