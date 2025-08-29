-- init.lua

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local modules = {
    "config.keymap",
    "config.options",
    "config.lazy",
    "config.lsp",
    "config.statusline",
    -- "config.tabline",
}

for _, mod in ipairs(modules) do
    local ok, _ = pcall(require, mod)
    if not ok then
        vim.notify("Could not load module: " .. mod, vim.log.levels.ERROR)
        -- return nil
    end
end
