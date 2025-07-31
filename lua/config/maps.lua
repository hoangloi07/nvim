local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Normal mode mappings
map('n', '<leader><Tab>', ':tabNext<CR>', opts)
map('n', '<leader><S-Tab>', ':tabprevious<CR>', opts)

-- Terminal mode: Esc returns to normal mode
map('t', '<Esc>', "<C-\\><C-n>", opts)

