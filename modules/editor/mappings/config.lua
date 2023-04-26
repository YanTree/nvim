local maps = { i = {}, n = {}, v = {}, t = {} }

-- editor
maps.n["<Esc>"]         = { ":noh <CR>",                    desc = "Clear highlights" }
maps.v["p"]             = { '"_dP',                         desc = "Alway paste context from clipboard" }
maps.v["J"]             = { ":m '>+1<CR>gv=gv",             desc = "Move this line down" }
maps.v["K"]             = { ":m '<-2<CR>gv=gv",             desc = "Move this line up" }
maps.v["<"]             = { "<gv",                          desc = "Decrease indent" }
maps.v[">"]             = { ">gv",                          desc = "Increase indent" }

-- window
maps.n["<leader>wv"]    = { "<C-w>v",                       desc = "Split window vertically" }
maps.n["<leader>wh"]    = { "<C-w>s",                       desc = "Split window horizontal" }
maps.n["<C-h>"]         = { "<C-w>h",                       desc = "Move cursor to left window" }
maps.n["<C-h>"]         = { "<C-w>h",                       desc = "Move cursor to left window" }
maps.n["<C-l>"]         = { "<C-w>l",                       desc = "Move cursor to right window" }
maps.n["<C-l>"]         = { "<C-w>j",                       desc = "Move cursor to down window" }
maps.n["<C-l>"]         = { "<C-w>k",                       desc = "Move cursor to up window" }

maps.n["<C-Up>"]        = { "<cmd>resize -2<CR>",           desc = "Resize split up" }
maps.n["<C-Down>"]      = { "<cmd>resize +2<CR>",           desc = "Resize split down" }
maps.n["<C-Left>"]      = { "<cmd>vertical resize -2<CR>",  desc = "Resize split left" }
maps.n["<C-Right>"]     = { "<cmd>vertical resize +2<CR>",  desc = "Resize split right" }

cat.mappings = maps
cat.set_mappings(maps)

