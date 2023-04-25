local M = {}

-- M.keymap["leaderkey"] = " "

-- M.keymap["core"] = {
--         n = {
--                 -- clear highlights
--                 ["<Esc>"] = { ":noh <CR>", "Clear highlights" },
--                 -- switch between windows
--                 ["<C-h>"] = { "<C-w>h", "Move to left window" },
--                 ["<C-l>"] = { "<C-w>l", "Move to right window" },
--                 ["<C-j>"] = { "<C-w>j", "Move to down window" },
--                 ["<C-k>"] = { "<C-w>k", "Move to up window" },
--         },
--         v = {
--                 -- always paste context from clipboard
--                 ["p"] = { '"_dP', "Paste const context"},
--                 -- multiple lines move down/up
--                 ["J"] = { ":m '>+1<CR>gv=gv", "Move lines down"},
--                 ["K"] = { ":m '<-2<CR>gv=gv", "Move lines up"},
--                 -- indent multiple lines
--                 ["<"] = { "<gv", "Decrease indent"},
--                 [">"] = { ">gv", "Increase indent"},
--         },
-- }

return M
