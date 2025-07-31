-- init.lua

local modules = {
  "config.options",
  "config.maps",
  "config.lsp",
  "config.lazy",
  "config.statusline",
  "config.tabline",
}

for _, mod in ipairs(modules) do
    local ok, _ = pcall(require, mod)
    if not ok then
      vim.notify("Could not load module: " .. mod, vim.log.levels.ERROR)
      return nil
    end
end
