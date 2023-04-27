local maps = { i = {}, n = {}, v = {}, t = {} }

local sections = {
        f = { desc = "File"},
        w = { desc = "Window"},
        s = { desc = "Search"},
        g = { desc = "Git"},
        b = { desc = "Buffer"},
}

-- editor
maps.n["<Esc>"]         = { ":noh <CR>",                    desc = "Clear highlights" }
maps.v["p"]             = { '"_dP',                         desc = "Alway paste context from clipboard" }
maps.v["J"]             = { ":m '>+1<CR>gv=gv",             desc = "Move this line down" }
maps.v["K"]             = { ":m '<-2<CR>gv=gv",             desc = "Move this line up" }
maps.v["<"]             = { "<gv",                          desc = "Decrease indent" }
maps.v[">"]             = { ">gv",                          desc = "Increase indent" }

-- window
-- maps.n["<Leader>w"]     = sections.w
maps.n["<leader>wv"]    = { "<C-w>v",                       desc = "Split window vertically" }
maps.n["<leader>wh"]    = { "<C-w>s",                       desc = "Split window horizontal" }
maps.n["<C-h>"]         = { "<C-w>h",                       desc = "Move cursor to left window" }
maps.n["<C-l>"]         = { "<C-w>l",                       desc = "Move cursor to right window" }
maps.n["<C-j>"]         = { "<C-w>j",                       desc = "Move cursor to down window" }
maps.n["<C-k>"]         = { "<C-w>k",                       desc = "Move cursor to up window" }

maps.n["<C-Up>"]        = { "<cmd>resize -2<CR>",           desc = "Resize split up" }
maps.n["<C-Down>"]      = { "<cmd>resize +2<CR>",           desc = "Resize split down" }
maps.n["<C-Left>"]      = { "<cmd>vertical resize -2<CR>",  desc = "Resize split left" }
maps.n["<C-Right>"]     = { "<cmd>vertical resize +2<CR>",  desc = "Resize split right" }

-- packages
--
-- nvim-tree
maps.n["<leader>op"]     = { "<cmd>NvimTreeToggle<CR>",  desc = "Open files tree" }

-- telescope
maps.n["<leader>ff"]     = { "<cmd>Telescope find_files<CR>",  desc = "Search files" }
maps.n["<leader>bb"]     = { "<cmd>Telescope buffers<CR>",  desc = "Search buffers" }

cat.mappings = maps
cat.set_mappings(maps)

