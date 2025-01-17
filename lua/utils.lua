local M = {}

M.modules_dofile = function(list)
        if type(list) == "table" then
                for _, file in ipairs(list) do
                        dofile(file)
                end
        end
end

M.dofile_modules_packages = function()
        -- return a list with all packages.lua files under 'modules_path' directory
        local packages_list = vim.split(vim.fn.glob(cat.path.modules_path .. "/*/*/packages.lua"), "\n")
        M.modules_dofile(packages_list)
end


M.dofile_modules_config = function()
        -- return a list with all config.lua files under 'modules_path' directory
        local config_list = vim.split(vim.fn.glob(cat.path.modules_path .. "/*/*/config.lua"), "\n")
        M.modules_dofile(config_list)
end

M.create_cache_folder = function()
        -- code
        local folder_list = {
                cat.path.cache_path .. "backup",
                cat.path.cache_path .. "session",
                cat.path.cache_path .. "swap",
                cat.path.cache_path .. "tags",
                cat.path.cache_path .. "undo",
        }

        -- Only check whether cache_dir exists, this would be enough
        if vim.fn.isdirectory(cat.path.cache_path) == 0 then
                os.execute("mkdir - p " .. cat.path.cache_path)
                for _, v in pairs(folder_list) do
                        if vim.fn.isdirectory(v) == 0 then
                                os.execute("mkdir -p " .. v)
                        end
                end
        end
end

return M
