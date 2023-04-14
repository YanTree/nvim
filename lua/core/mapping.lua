local bindkey = require("core.lib.bindkey")
local map_cr = bindkey.map_cr
local map_cu = bindkey.map_cu
local map_cmd = bindkey.map_cmd

local core_map = {
        ["n|<esc>"] = map_cmd(":nohl<CR>"):with_desc("Edit N: Quit highlight state"),
	["n|<C-h>"] = map_cmd("<C-w>h"):with_noremap():with_desc("window: Focus left"),
	["n|<C-l>"] = map_cmd("<C-w>l"):with_noremap():with_desc("window: Focus right"),
	["n|<C-j>"] = map_cmd("<C-w>j"):with_noremap():with_desc("window: Focus down"),
	["n|<C-k>"] = map_cmd("<C-w>k"):with_noremap():with_desc("window: Focus up"),

	["n|<leader>wv"] = map_cmd("<C-w>v"):with_desc("Window: Split window vertically"),
	["n|<leader>wh"] = map_cmd("<C-w>s"):with_desc("Window: Split window horizontal"),

	-- Visual mode
	["v|J"] = map_cmd(":m '>+1<CR>gv=gv"):with_desc("Edit V: Move this line down"),
	["v|K"] = map_cmd(":m '<-2<CR>gv=gv"):with_desc("Edit V: Move this line up"),

	["v|<"] = map_cmd("<gv"):with_desc("Edit V: Decrease indent"),
	["v|>"] = map_cmd(">gv"):with_desc("Edit V: Increase indent"),

}

bindkey.nvim_load_mapping(core_map)
