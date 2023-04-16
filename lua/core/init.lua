local const = require("core.const")

-- Create cache dir and data dirs
local createdir = function()
        local data_dir = {
                const.cache_dir .. "backup",
                const.cache_dir .. "session",
                const.cache_dir .. "swap",
                const.cache_dir .. "tags",
                const.cache_dir .. "undo",
        }

        -- Only check whether cache_dir exists, this would be enough
        if vim.fn.isdirectory(const.cache_dir) == 0 then
                os.execute("mkdir - p " .. const.cache_dir)
                for _, v in pairs(data_dir) do
                        if vim.fn.isdirectory(v) == 0 then
                                os.execute("mkdir -p " .. v)
                        end
                end
        end
end

local leader_map = function()
        -- setting 'space' key as Leader key
        vim.g.mapleader = " "
end

local disable_distribution_plugins = function()
        -- disable netrw at the very start, use nvim-tree instead 
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
end

local load_core = function()
        -- font setting for GUI version
        vim.api.nvim_set_option_value("guifont", "Hack NFM:h10", {})

        -- create dir to put nvim data file
        createdir()
        -- disable few setting on init
        disable_distribution_plugins()
        -- setting about leader map
        leader_map()

        -- import nvim options(eg: cursorline = true) setting
        require("core.options")
        -- import nvim key bindding(eg: resize window) setting without third plugin
        require("core.mapping")
        -- import folder of keymap, put all third plugin(eg: telescope) key bindding setting
        require("keymap")
        -- heart of config, third plugin 'lazy.nvim'. one manager to handle all third plugins
        require("core.lazy")

        -- get colorscheme from settings file
        local colorscheme = require("core.settings").colorscheme
        -- apply colorscheme from settings file
        vim.api.nvim_command("colorscheme " .. colorscheme)
end

-- fire core setting
load_core()
