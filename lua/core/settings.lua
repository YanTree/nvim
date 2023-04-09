local settings = {}
local home = require("core.const").home

-- Set it to false if you want to use https to update plugins and treesitter parsers.
---@type boolean
settings["ssh_active"] = true

-- Set the colorscheme to use here.
-- Available values are: `tokyonight`, `tokyonight-night`, `tokyonight-storm`, `tokyonight-day`, `tokyonight-moon`.
---@type string
settings["colorscheme"] = "tokyonight"

return settings
