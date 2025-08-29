local M = {}

vim.o.showtabline = 2
vim.o.tabline = "%!v:lua.require('config.tabline').render()"

function M.render()
    local current = vim.fn.tabpagenr()
    local total = vim.fn.tabpagenr("$")
    local out = {}

    for tab = 1, total do
        local hl = (tab == current) and "%#TabLineSel#" or "%#TabLine#"
        local icon = tostring(tab) .. "."

        local names = {}
        for _, buf in ipairs(vim.fn.tabpagebuflist(tab)) do
            if vim.fn.buflisted(buf) == 1 then
                local n = vim.fn.bufname(buf)
                if n == "" then
                    n = "[None]"
                end
                table.insert(names, vim.fn.fnamemodify(n, ":t"))
            end
        end
        table.insert(out, string.format("%s %s %s ", hl, icon, table.concat(names, " ")))
    end
    local hl_str = function(hl, str)
        return "%#" .. hl .. "#" .. str .. "%*"
    end
    -- 
    return hl_str("TabLineFill", "   ") .. "%#TabLineFill#" .. "%=" .. table.concat(out)
end

return M
