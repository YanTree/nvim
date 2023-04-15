local bindkey = require("core.lib.bindkey")
local map_cr = bindkey.map_cr
local map_cu = bindkey.map_cu
local map_cmd = bindkey.map_cmd
local map_callback = bindkey.map_callback

local plug_map = {
        -- plugin: telescope
	["n|<leader>fr"] = map_callback(function()
			require("telescope").extensions.frecency.frecency()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("File: Recently files"),
        ["n|<leader>ff"] = map_cu("Telescope find_files"):with_noremap():with_silent():with_desc("File: File in project"),
        ["n|<leader>fg"] = map_cu("Telescope git_files"):with_noremap():with_silent():with_desc("File: File in git"),

        ["n|<leader>bb"] = map_cu("Telescope buffers"):with_noremap():with_silent():with_desc("Buffer: Switch buffer"),

        ["n|<leader>sd"] = map_cu("Telescope grep_string"):with_noremap():with_silent():with_desc("Search: Search string current Directory"),

        -- Plugin: nvim-tree
        ["n|tt"] = map_cr("NvimTreeToggle"):with_noremap():with_silent():with_desc("FileTree: Toggle"),
}

bindkey.nvim_load_mapping(plug_map)
