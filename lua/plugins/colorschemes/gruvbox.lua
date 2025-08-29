return {
    "sainnhe/gruvbox-material",
    dependencies = { "luisiacc/gruvbox-baby" },
    config = function()
        vim.cmd([[let g:gruvbox_material_better_performance = 1]])
        vim.cmd([[let g:gruvbox_material_dim_inactive_windows = 0]])
        vim.cmd([[let g:gruvbox_material_background = 'hard']])
        vim.cmd([[let g:gruvbox_material_transparent_background = 0]])
        -- vim.cmd [[colorscheme gruvbox-material]]
    end,
}
