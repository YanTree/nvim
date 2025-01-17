return function()
require("monokai-pro").setup({
  transparent_background = false,
  terminal_colors = true,
  devicons = true, -- highlight the icons of `nvim-web-devicons`

  styles = {
    comment = { italic = true },
    keyword = { italic = false}, -- any other keyword
    type = { italic = true }, -- (preferred) int, long, char, etc
    storageclass = { italic = false }, -- static, register, volatile, etc
    structure = { italic = false }, -- struct, union, enum, etc
    parameter = { italic = false }, -- parameter pass in function
    annotation = { italic = false },
    tag_attribute = { italic = false }, -- attribute of tag in reactjs
  },

  inc_search = "background", -- underline | background
  filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum

  -- Enable this will disable filter option
  day_night = {
    enable = false, -- turn off by default
    day_filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
    night_filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
  },

  background_clear = {
    -- "float_win",
    "toggleterm",
    -- "telescope",
    -- "which-key",
    -- "renamer"
  },-- "float_win", "toggleterm", "telescope", "which-key", "renamer", "neo-tree"
  -- plugins = {
  --   bufferline = {
  --     underline_selected = false,
  --     underline_visible = false,
  --   },
  --   indent_blankline = {
  --     context_highlight = "default", -- default | pro
  --     context_start_underline = false,
  --   },
  -- },

  ---@param c Colorscheme
  -- override = function(c) end,
})
end
