return {
    "maxmx03/solarized.nvim",
    config = function()
        require("solarized").setup({
            transparent = {
              enabled = true,
            },
            variant = 'autumn'
        })
        vim.cmd([[ colorscheme solarized ]])
    end
}
