local M = {}

local modules_path = require("config").path.modules

M.modules_dofile = function(list)
        if type(list) == "table" then
                for _, file in ipairs(list) do
                        dofile(file)
                end
        end
end

M.dofile_modules_packages = function()
        -- return a list with all packages.lua files under 'modules_path' directory
        local packages_list = vim.split(vim.fn.glob(modules_path .. "/*/*/packages.lua"), "\n")
        M.modules_dofile(packages_list)
end


M.dofile_modules_config = function()
        -- return a list with all config.lua files under 'modules_path' directory
        local config_list = vim.split(vim.fn.glob(modules_path .. "/*/*/config.lua"), "\n")
        M.modules_dofile(config_list)
end

return M
