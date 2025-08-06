-- lua/plugins/eyeliner.lua
return {
    "jinh0/eyeliner.nvim",
    config = function()
        require("eyeliner").setup {
            highlight_on_key = true, -- enable highlight after pressing f/F/t/T
            dim = true, -- dim all other characters (recommended) :contentReference[oaicite:0]{index=0}
            max_length = 9999,
            disabled_filetypes = {},
            disabled_buftypes = {},
            default_keymaps = true,
        }
    end,
}
