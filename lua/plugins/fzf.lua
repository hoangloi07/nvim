return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    vim.api.nvim_set_keymap("n", "<leader>ff", ":FzfLua files<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>fb", ":FzfLua buffers<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>fg", ":FzfLua git_files<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>ft", ":FzfLua tags<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>fh", ":FzfLua help_tags<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>fm", ":FzfLua marks<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>fl", ":FzfLua lines<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>fw", ":FzfLua live_grep<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>fp", ":FzfLua grep_project<CR>", { noremap = true, silent = true })
   end
}
