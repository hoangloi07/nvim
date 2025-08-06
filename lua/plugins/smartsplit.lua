-- lua/plugins/smart-splits.lua
return {
    "mrjones2014/smart-splits.nvim",
    lazy = false,
    opts = {
        ignored_buftypes = { "nofile", "quickfix", "prompt" },
        ignored_filetypes = { "NvimTree" },
        default_amount = 3,
        at_edge = "wrap",
        float_win_behavior = "previous",
        move_cursor_same_row = false,
        cursor_follows_swapped_bufs = false,
    },
    config = function(_, opts)
        require("smart-splits").setup(opts)

        -- Resizing splits (Alt + h/j/k/l)
        vim.keymap.set("n", "<A-h>", require("smart-splits").resize_left, { desc = "Resize split left" })
        vim.keymap.set("n", "<A-j>", require("smart-splits").resize_down, { desc = "Resize split down" })
        vim.keymap.set("n", "<A-k>", require("smart-splits").resize_up, { desc = "Resize split up" })
        vim.keymap.set("n", "<A-l>", require("smart-splits").resize_right, { desc = "Resize split right" })

        -- Moving cursor between splits (Ctrl + h/j/k/l)
        vim.keymap.set("n", "<C-h>", require("smart-splits").move_cursor_left, { desc = "Move to left split" })
        vim.keymap.set("n", "<C-j>", require("smart-splits").move_cursor_down, { desc = "Move to below split" })
        vim.keymap.set("n", "<C-k>", require("smart-splits").move_cursor_up, { desc = "Move to upper split" })
        vim.keymap.set("n", "<C-l>", require("smart-splits").move_cursor_right, { desc = "Move to right split" })
        vim.keymap.set("n", "<C-\\>", require("smart-splits").move_cursor_previous, { desc = "Move to previous split" })

        -- Swapping buffers between windows (leader-leader + direction)
        vim.keymap.set("n", "<leader><leader>h", require("smart-splits").swap_buf_left, { desc = "Swap buffer left" })
        vim.keymap.set("n", "<leader><leader>j", require("smart-splits").swap_buf_down, { desc = "Swap buffer down" })
        vim.keymap.set("n", "<leader><leader>k", require("smart-splits").swap_buf_up, { desc = "Swap buffer up" })
        vim.keymap.set("n", "<leader><leader>l", require("smart-splits").swap_buf_right, { desc = "Swap buffer right" })
    end,
}
