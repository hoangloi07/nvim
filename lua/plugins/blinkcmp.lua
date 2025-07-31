return {
  'saghen/blink.cmp',
  dependencies = { 'rafamadriz/friendly-snippets' },

  version = '1.*',
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = 'enter',
    },
    -- enabled = function() return not vim.tbl_contains({ "lua", "markdown" }, vim.bo.filetype) end,

    cmdline = { enabled = false },

    completion = {
      keyword = { range = 'full' },

      accept = { auto_brackets = { enabled = false }, },

      list = { selection = { preselect = false, auto_insert = true } },
      list = { selection = { preselect = function(ctx) return vim.bo.filetype ~= 'markdown' end } },

      menu = {
        auto_show = true,
        draw = {
          columns = {
          { "label", "label_description", gap = 1 },
          { "kind" }
          },
        }
      },
      documentation = { auto_show = true, auto_show_delay_ms = 500 },
      ghost_text = { enabled = true },
    },

    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },

    snippets = { preset = 'default' },

    signature = { enabled = true }
}

}
