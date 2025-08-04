local modes = {
  ["n"] = "NORMAL",
  ["no"] = "NORMAL",
  ["v"] = "VISUAL",
  ["V"] = "VISUAL LINE",
  [""] = "VISUAL BLOCK",
  ["s"] = "SELECT",
  ["S"] = "SELECT LINE",
  [""] = "SELECT BLOCK",
  ["i"] = "INSERT",
  ["ic"] = "INSERT",
  ["R"] = "REPLACE",
  ["Rv"] = "VISUAL REPLACE",
  ["c"] = "COMMAND",
  ["cv"] = "VIM EX",
  ["ce"] = "EX",
  ["r"] = "PROMPT",
  ["rm"] = "MOAR",
  ["r?"] = "CONFIRM",
  ["!"] = "SHELL",
  ["t"] = "TERMINAL",
}
-- Define EVA-01 palette highlights
vim.api.nvim_set_hl(0, "StatuslineNormalEVA",   { fg = "#FFFFFF", bg = "#5B2C6F", bold = true })   -- Purple
vim.api.nvim_set_hl(0, "StatuslineInsertEVA",   { fg = "#1C1C1C", bg = "#7CFC00", bold = true })   -- Neon green
vim.api.nvim_set_hl(0, "StatuslineVisualEVA",   { fg = "#1C1C1C", bg = "#FF6600", bold = true })   -- Orange
vim.api.nvim_set_hl(0, "StatuslineReplaceEVA",  { fg = "#1C1C1C", bg = "#FF0033", bold = true })   -- Red
vim.api.nvim_set_hl(0, "StatuslineCmdlineEVA",  { fg = "#1C1C1C", bg = "#FFD700", bold = true })   -- Gold/yellow for command
vim.api.nvim_set_hl(0, "StatuslineTerminalEVA", { fg = "#1C1C1C", bg = "#7FFFD4", bold = true })   -- Aqua for terminal

vim.api.nvim_set_hl(0, "GitAddEVA",    { fg = "#7CFC00", bg = "#5B2C6F", bold = true })
vim.api.nvim_set_hl(0, "GitChangeEVA", { fg = "#3399FF", bg = "#5B2C6F", bold = true })
vim.api.nvim_set_hl(0, "GitDeleteEVA", { fg = "#FF0033", bg = "#5B2C6F", bold = true })

local function mode()
  local current_mode = vim.api.nvim_get_mode().mode
  return string.format(" %s ", modes[current_mode]):upper()
end

-- Update mode → color mapping
local function update_mode_colors()
  local current_mode = vim.api.nvim_get_mode().mode
  local mode_color = "%#StatuslineNormalEVA#"

  if current_mode == "n" then
      mode_color = "%#StatuslineNormalEVA#"
  elseif current_mode == "i" or current_mode == "ic" then
      mode_color = "%#StatuslineInsertEVA#"
  elseif current_mode == "v" or current_mode == "V" or current_mode == "\22" then
      mode_color = "%#StatuslineVisualEVA#"
  elseif current_mode == "R" then
      mode_color = "%#StatuslineReplaceEVA#"
  elseif current_mode == "c" then
      mode_color = "%#StatuslineCmdlineEVA#"
  elseif current_mode == "t" then
      mode_color = "%#StatuslineTerminalEVA#"
  end

  return mode_color
end


-- local function update_mode_colors()
--   local current_mode = vim.api.nvim_get_mode().mode
--   local mode_color = "%#StatusLineAccent#"
--   if current_mode == "n" then
--       mode_color = "%#StatuslineAccent#"
--   elseif current_mode == "i" or current_mode == "ic" then
--       mode_color = "%#StatuslineInsertAccent#"
--   elseif current_mode == "v" or current_mode == "V" or current_mode == "" then
--       mode_color = "%#StatuslineVisualAccent#"
--   elseif current_mode == "R" then
--       mode_color = "%#StatuslineReplaceAccent#"
--   elseif current_mode == "c" then
--       mode_color = "%#StatuslineCmdLineAccent#"
--   elseif current_mode == "t" then
--       mode_color = "%#StatuslineTerminalAccent#"
--   end
--   return mode_color
-- end

local function filepath()
  local fpath = vim.fn.fnamemodify(vim.fn.expand "%", ":~:.:h")
  if fpath == "" or fpath == "." then
      return " "
  end

  return string.format(" %%<%s/", fpath)
end

local function filename()
  local fname = vim.fn.expand "%:t"
  if fname == "" then
      return ""
  end
  return fname .. " "
end

local function lsp()
  local count = {}
  local levels = {
    errors = "Error",
    warnings = "Warn",
    info = "Info",
    hints = "Hint",
  }

  for k, level in pairs(levels) do
    count[k] = vim.tbl_count(vim.diagnostic.get(0, { severity = level }))
  end

  local errors = ""
  local warnings = ""
  local hints = ""
  local info = ""

  if count["errors"] ~= 0 then
    errors = " %#LspDiagnosticsSignError#  " .. count["errors"]
  end
  if count["warnings"] ~= 0 then
    warnings = " %#LspDiagnosticsSignWarning#  " .. count["warnings"]
  end
  if count["hints"] ~= 0 then
    hints = " %#LspDiagnosticsSignHint# 󰌵 " .. count["hints"]
  end
  if count["info"] ~= 0 then
    info = " %#LspDiagnosticsSignInformation#  " .. count["info"]
  end

  return  errors .. warnings .. hints .. info .. " " .. "%#Normal#"
end

-- local function filetype()
--   return string.format(" %s ", vim.bo.filetype):upper()
-- end

local function lineinfo()
  if vim.bo.filetype == "alpha" then
    return ""
  end
  return " %P %l:%c "
end

local function vcs()
  local git_info = vim.b.gitsigns_status_dict
  if not git_info or git_info.head == "" then
    return ""
  end
  local added   = git_info.added   and ("%#GitAddEVA#+" .. git_info.added .. " ") or ""
  local changed = git_info.changed and ("%#GitChangeEVA#~" .. git_info.changed .. " ") or ""
  local removed = git_info.removed and ("%#GitDeleteEVA#-" .. git_info.removed .. " ") or ""
  if git_info.added == 0 then
    added = ""
  end
  if git_info.changed == 0 then
    changed = ""
  end
  if git_info.removed == 0 then
    removed = ""
  end
  return table.concat {
     "%#GitAddEVA#",
     " ",
     added,
     changed,
     removed,
     " ",
     "%#StatuslineNormalEVA# ",
     git_info.head,
     " %#Normal#",
  }
end

Statusline = {}

Statusline.active = function()
  return table.concat {
    "%#Statusline#",
    update_mode_colors(),
    mode(),
    "%#Normal# ",
    filepath(),
    filename(),
    "%#Normal#",
    lsp(),
    "%=%#StatusLineExtra#",
    "%#StatuslineNormalEVA#",
    vcs(),
    lineinfo(),
  }
end

function Statusline.inactive()
  return " %F"
end

function Statusline.short()
  return "%#StatusLineNC#   NvimTree"
end

vim.api.nvim_exec([[
  augroup Statusline
  au!
  au WinEnter,BufEnter * setlocal statusline=%!v:lua.Statusline.active()
  au WinLeave,BufLeave * setlocal statusline=%!v:lua.Statusline.inactive()
  au WinEnter,BufEnter,FileType NvimTree setlocal statusline=%!v:lua.Statusline.short()
  augroup END
]], false)
