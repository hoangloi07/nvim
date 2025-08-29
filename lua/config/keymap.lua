local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Normal mode mappings
map("n", "<leader><tab>", ":tabNext<CR>", opts)
map("n", "<leader><S-tab>", ":tabprevious<CR>", opts)
map("n", "<leader>t", ":tabnew<CR>", opts)
map("n", "<C-s>", ":w<cr>")
map("i", "<C-s>", "<esc>:w<cr>")

-- Terminal mode: Esc returns to normal mode
map("t", "<Esc>", "<C-\\><C-n>", opts)

map("n", "<leader>k", ":bd!<cr>", opts)
