-- lua/plugins/oil.lua
return {
    "stevearc/oil.nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local oil = require("oil")
        oil.setup {
            columns = { "permissions", "size", "mtime" },
            view_options = {
                show_hidden = true,
            },
            delete_to_trash = true, -- Enable delete to trash
            skip_confirm_for_simple_edits = true, -- Skip confirmation for simple edits
        }

        -- Map <leader>e to open Oil
        vim.keymap.set("n", "<leader>e", function()
            oil.open()
        end, { noremap = true, desc = "Open Oil" })
    end,
}
