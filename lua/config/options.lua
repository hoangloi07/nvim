-- lua/config/options.lua
local opt = vim.opt

-- Editor UI behavior
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.cursorcolumn = false

-- Scrolling behavior
opt.scrolloff = 10
opt.sidescrolloff = 8

-- Search behavior
opt.ignorecase = true
opt.smartcase = true

-- Tab / indentation
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.smartindent = true

-- Text formatting
opt.wrap = false
opt.breakindent = true

-- Undo & backups
opt.swapfile = false
opt.backup = false
opt.undofile = true

-- Completion & command preview
opt.completeopt = { "menuone", "noselect" }
opt.incsearch = true
opt.inccommand = "split"

-- Clipboard and mouse
opt.clipboard = "unnamedplus"
opt.mouse = "a"

-- Whitespace visualization
opt.list = true
opt.listchars = {
    tab = "→ ",
    trail = "·",
    space = "·",
}

-- -- Message behavior
-- opt.shortmess:append({ I = true })
-- opt.lazyredraw = true

opt.linebreak = true
opt.breakindent = true
-- opt.laststatus = 1

vim.cmd([[set nohlsearch]])
opt.fillchars:append { eob = " " }

opt.cmdheight = 0
opt.shell = "zsh"
-- opt.formatoptions:remove({ "c", "r", "o" })  -- no automatic comment wrapping :contentReference[oaicite:3]{index=3}

vim.filetype.add {
    extension = {
        ["df"] = "javascript", -- uses JS grammar for highlighting
    },
}
