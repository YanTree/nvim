local M = {}

M.echo = function (str)
        vim.cmd("redraw")
        vim.api.nvim_echo({{str, "bold"}},true,{})
end


M.load_lazy = function(path)
        --------- lazy.nvim ---------------
        M.echo "  Installing lazy.nvim & plugins ..."
        local repo = "https://github.com/folke/lazy.nvim.git"
        vim.fn.system { "git", "clone", "--filter=blob:none", "--branch=stable", repo, path }
        vim.opt.rtp:prepend(path)

        local lazy_setting = require("config").lazy_setting
        require("lazy").setup(cat.modules, lazy_setting)
end

