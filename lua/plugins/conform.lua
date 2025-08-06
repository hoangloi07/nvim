return {
    "stevearc/conform.nvim",
    config = function()
        require("conform").setup {
            formatters_by_ft = {
                c = { "clangd" },
                lua = { "stylua" },
                python = { "isort", "black" },
                -- rust = { "rustfmt", lsp_format = "fallback" },
                javascript = { "prettierd", "prettier", stop_after_first = true },
            },
        }
    end,
}
