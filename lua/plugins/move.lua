return { 
    'fedepujol/move.nvim',
    keys = {
      -- Normal Mode
      { "<A-down>", ":MoveLine(1)<CR>", desc = "Move Line Up" },
      { "<A-up>", ":MoveLine(-1)<CR>", desc = "Move Line Down" },
      { "<A-left>", ":MoveHChar(-1)<CR>", desc = "Move Character Left" },
      { "<A-right>", ":MoveHChar(1)<CR>", desc = "Move Character Right" },
      { "<leader>wf", ":MoveWord(-1)<CR>", mode = { "n" }, desc = "Move Word Left" },
      { "<leader>wb", ":MoveWord(1)<CR>", mode = { "n" }, desc = "Move Word Right" },
      -- Visual Mode
      { "<A-down>", ":MoveBlock(1)<CR>", mode = { "v" }, desc = "Move Block Up" },
      { "<A-up>", ":MoveBlock(-1)<CR>", mode = { "v" }, desc = "Move Block Down" },
      { "<A-left>", ":MoveHBlock(-1)<CR>", mode = { "v" }, desc = "Move Block Left" },
      { "<A-right>", ":MoveHBlock(1)<CR>", mode = { "v" }, desc = "Move Block Right" },
    },
    opts = {
        line = {
            enable = true, -- Enables line movement
            indent = true  -- Toggles indentation
        },
        block = {
            enable = true, -- Enables block movement
            indent = true  -- Toggles indentation
        },
        word = {
            enable = true, -- Enables word movement
        },
        char = {
            enable = false -- Enables char movement
        } --- Config
    }
}
