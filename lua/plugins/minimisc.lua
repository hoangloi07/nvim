return {
    "echasnovski/mini.misc",
    version = "*",
    init = function()
        -- Set termnial's background sync with neovim
        require("mini.misc").setup_termbg_sync()
    end,
}
