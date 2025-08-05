-- init.lua

local modules = {
    "config.maps",
    "config.options",
    "config.lsp",
    "config.lazy",
    "config.statuslineEVA",
    "config.tabline",
}

for _, mod in ipairs(modules) do
    local ok, _ = pcall(require, mod)
    if not ok then
        vim.notify("Could not load module: " .. mod, vim.log.levels.ERROR)
        return nil
    end
end
