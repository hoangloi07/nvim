-- lua/plugins/leap.lua
return {
  "ggandor/leap.nvim",
  lazy = false,
  config = function()
    require("leap").set_default_keymaps()
  end,
}

