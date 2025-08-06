local M = {}

vim.o.showtabline = 2
vim.o.tabline = "%!v:lua.require('config.tabline').render()"

local num_icons = {
    "󰎤 ",
    "󰎧 ",
    "󰎪 ",
    "󰎭 ",
    "󰎱 ",
    "󰎳 ",
    "󰎶 ",
    "󰎹 ",
    "󰎼 ",
    "󰽽 ",
}

function M.render()
    local current = vim.fn.tabpagenr()
    local total = vim.fn.tabpagenr("$")
    local out = {}

    for tab = 1, total do
        local hl = (tab == current) and "%#TabLineSel#" or "%#TabLine#"
        local icon = num_icons[tab] or tostring(tab)

        local names = {}
        for _, buf in ipairs(vim.fn.tabpagebuflist(tab)) do
            if vim.fn.buflisted(buf) == 1 then
                local n = vim.fn.bufname(buf)
                if n == "" then
                    n = "[No Name]"
                end
                table.insert(names, vim.fn.fnamemodify(n, ":t"))
            end
        end
        table.insert(out, string.format("%s %s %s ", hl, icon, table.concat(names, " ")))
    end
    hl_str = function(hl, str)
        return "%#" .. hl .. "#" .. str .. "%*"
    end
    return hl_str("TabLineFill", "     ") .. table.concat(out) .. "%#TabLineFill#"
end

return M
