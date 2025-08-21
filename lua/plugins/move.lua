return {
    "fedepujol/move.nvim",
    opts = {
        line = {
            enable = true, -- Enables line movement
            indent = true, -- Toggles indentation
        },
        block = {
            enable = true, -- Enables block movement
            indent = true, -- Toggles indentation
        },
        word = {
            enable = true, -- Enables word movement
        },
        char = {
            enable = true, -- Enables char movement
        }, --- Config
    },
    keys = {
        -- Normal Mode
        -- { "<A-down>", ":MoveLine(1)<CR>", desc = "Move Line Up" },
        { "<C-S-j>", ":MoveLine(1)<CR>", desc = "Move Line Up" },
        -- { "<A-up>", ":MoveLine(-1)<CR>", desc = "Move Line Down" },
        { "<C-S-k>", ":MoveLine(-1)<CR>", desc = "Move Line Down" },
        -- { "<A-left>", ":MoveHChar(-1)<CR>", desc = "Move Character Left" },
        -- { "<A-right>", ":MoveHChar(1)<CR>", desc = "Move Character Right" },
        { "<C-S-h>", ":MoveHChar(-1)<CR>", desc = "Move Character Left" },
        { "<C-S-l>", ":MoveHChar(1)<CR>", desc = "Move Character Right" },
        { "<leader>wf", ":MoveWord(-1)<CR>", mode = { "n" }, desc = "Move Word Left" },
        { "<leader>wb", ":MoveWord(1)<CR>", mode = { "n" }, desc = "Move Word Right" },
        -- Visual Mode
        -- { "<A-down>", ":MoveBlock(1)<CR>", mode = { "v" }, desc = "Move Block Up" },
        { "<C-S-j>", ":MoveBlock(1)<CR>", mode = { "v" }, desc = "Move Block Up" },
        -- { "<A-up>", ":MoveBlock(-1)<CR>", mode = { "v" }, desc = "Move Block Down" },
        { "<C-S-k>", ":MoveBlock(-1)<CR>", mode = { "v" }, desc = "Move Block Down" },
        -- { "<A-left>", ":MoveHBlock(-1)<CR>", mode = { "v" }, desc = "Move Block Left" },
        -- { "<A-right>", ":MoveHBlock(1)<CR>", mode = { "v" }, desc = "Move Block Right" },
        { "<C-S-h>", ":MoveBlock(-1)<CR>", mode = {"v"}, desc = "Move Block Left" },
        { "<C-S-l>", ":MoveBlock(1)<CR>",  mode = {"v"}, desc = "Move Block Right" },
    },
}
