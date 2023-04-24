local M = {}

local config = require("config")

M.echo = function (str)
        vim.cmd("redraw")
        vim.api.nvim_echo({{str, "bold"}},true,{})
end


M.load_lazy = function(install_path)
        local modules = cat.modules
        print(vim.inspect(modules))

        --------- lazy.nvim ---------------
        M.echo "  Installing lazy.nvim & plugins ..."
        local repo = "https://github.com/folke/lazy.nvim.git"
        vim.fn.system { "git", "clone", "--filter=blob:none", "--branch=stable", repo, install_path }

        vim.opt.rtp:prepend(install_path)
        
        local lazy_setting = config.lazy_setting
        -- install packages
        require("lazy").setup(modules, lazy_setting)
        vim.api.nvim_command("colorscheme " .. config.ui.theme)
end

return M