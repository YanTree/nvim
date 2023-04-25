local lazy_setting = {
        default = {
                lazy = true,
        },
        -- directory where plugins will be installed
        root = cat.path.data .. "lazy",
        install = {
                -- install missing plugins on startup. This doesn't increase startup time.
                missing = true,
                colorscheme = { cat.ui.colorscheme, "habamax" },
        },
}

local M = {}

M.echo = function(str)
  vim.cmd "redraw"
  vim.api.nvim_echo({ { str, "Bold" } }, true, {})
end

M.load_lazy = function(lazy_path)
        --------- lazy.nvim ---------------
        M.echo "  Installing lazy.nvim & plugins ..."
        local repo = "https://github.com/folke/lazy.nvim.git"
        vim.fn.system { "git", "clone", "--filter=blob:none", "--branch=stable", repo, lazy_path }

        vim.opt.rtp:prepend(lazy_path)
        -- install packages
        M.fire_lazy()
end

M.fire_lazy = function()
        require("lazy").setup(cat.modules, lazy_setting)
        vim.api.nvim_command("colorscheme " .. cat.ui.colorscheme)
end

return M
