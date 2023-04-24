require("cat")
require("init")

local config = require("config")
local lazypath = cat.path.data .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
        require("lazy").load_lazy(lazypath)
        print("not start lazy path")
end

vim.opt.rtp:prepend(lazypath)
require("lazy").setup(cat.modules, config.lazysetting)
vim.api.nvim_command("colorscheme " .. config.ui.theme)