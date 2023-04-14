local bindkey = require("core.lib.bindkey")
local map_cr = bindkey.map_cr
local map_cu = bindkey.map_cu
local map_cmd = bindkey.map_cmd
local map_callback = bindkey.map_callback

local plug_map = {
	-- Plugin: nvim-tree
	["n|tt"] = map_cr("NvimTreeToggle"):with_noremap():with_silent():with_desc("FileTree: Toggle"),
}

bindkey.nvim_load_mapping(plug_map)
