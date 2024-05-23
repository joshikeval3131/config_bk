-- import lualine plugin safely
local status, lualine = pcall(require, "lualine")
if not status then
  return
end

-- get lualine nightfly theme
local lualine_grvubox = require("lualine.themes.gruvbox")

-- configure lualine with modified theme
lualine.setup({
  options = {
    theme = lualine_grvubox,
  },
tabline = {
  lualine_a = {'buffers'},
  lualine_b = {},
  lualine_c = {'filename'},
  lualine_x = {},
  lualine_y = {},
  lualine_z = {'tabs'}
},
})
