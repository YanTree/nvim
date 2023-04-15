local bindkey = require("core.lib.bindkey")
local map_cr = bindkey.map_cr
local map_cu = bindkey.map_cu
local map_cmd = bindkey.map_cmd

local core_map = {

        -- buffer
        ["n|<leader>bN"] = map_cu(":enew"):with_noremap():with_silent():with_desc("New empty buffer"),

        -- resize window
        ["n|<C-UP>"] = map_cr("resize -2"):with_noremap():with_desc("Decrease window -2 horizontally"),
        ["n|<C-Down>"] = map_cr("resize +2"):with_noremap():with_desc("Increase window +2 horizontally"),
        ["n|<C-Left>"] = map_cr("vertical resize -2"):with_noremap():with_desc("Decrease window -2 vertically"),
        ["n|<C-Right>"] = map_cr("vertical resize +2"):with_noremap():with_desc("Increase window +2 vertically"),

        ["n|<esc>"] = map_cmd(":nohl<CR>"):with_desc("Quit highlight state"),

        -- navigate window
        ["n|<C-h>"] = map_cmd("<C-w>h"):with_noremap():with_desc("Move to lef window"),
        ["n|<C-l>"] = map_cmd("<C-w>l"):with_noremap():with_desc("Move to right window"),
        ["n|<C-j>"] = map_cmd("<C-w>j"):with_noremap():with_desc("Move to down window"),
        ["n|<C-k>"] = map_cmd("<C-w>k"):with_noremap():with_desc("Move to up window"),

        ["n|<leader>wv"] = map_cmd("<C-w>v"):with_desc("Split window vertically"),
        ["n|<leader>wh"] = map_cmd("<C-w>s"):with_desc("Split window horizontal"),

        -- Visual mode
        ["v|J"] = map_cmd(":m '>+1<CR>gv=gv"):with_desc("Move this line down"),
        ["v|K"] = map_cmd(":m '<-2<CR>gv=gv"):with_desc("Move this line up"),

        ["v|<"] = map_cmd("<gv"):with_desc("Decrease indent"),
        ["v|>"] = map_cmd(">gv"):with_desc("Increase indent"),

}

bindkey.nvim_load_mapping(core_map)
