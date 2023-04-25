require("cat")
require("init")

local lazy_path = cat.path.data .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazy_path) then
        require("cat_lazy").load_lazy(lazy_path)
end

vim.opt.rtp:prepend(lazy_path)
require("cat_lazy").fire_lazy()
