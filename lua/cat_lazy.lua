local lazy_path = cat.path.data .. "/lazy/lazy.nvim"

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

M.fire_lazy = function()
        if not vim.loop.fs_stat(lazy_path) then
		local lazy_repo = "https://github.com/folke/lazy.nvim.git "
		vim.api.nvim_command("!git clone --filter=blob:none --branch=stable " .. lazy_repo .. lazy_path)
        end


        vim.opt.rtp:prepend(lazy_path)
        require("lazy").setup(cat.modules, lazy_setting)

        vim.api.nvim_command("colorscheme " .. cat.ui.colorscheme)
end

return M
