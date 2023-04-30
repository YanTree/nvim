cat = {}

-- constant, hold all packages
cat.packages = {}

-- constant, hold config for all packages
cat.config = {}

-- combine packages and config to a table
cat.modules = {}

-- constant, hold all keybinding
cat.mappings = {}

-- constant, hold all property of lazy.nvim package
cat.cmd = {}

cat.keys = {}

cat.event = {}

-- constant 
cat.ui = {
        indent = 8,
        colorscheme = "gruvbox"
}

----------- setting path ------------------
local home = os.getenv("HOME")
cat.path = {
        home = home,
        config = vim.fn.stdpath("config"),
        modules = vim.fn.stdpath("config") .. "/modules",
        snippets = vim.fn.stdpath("config") .. "/snippets",
        data = string.format("%s/catsite/", vim.fn.stdpath("data")),
        cache = home .. "/.cache/nvim",
        sqlite3 = home .. "/scoop/apps/sqlite/current/sqlite3.dll",
}

-- functions
cat.set_options = function(name)
        for index, config in pairs(cat.packages) do
                if index == name then
                        cat.modules[#cat.modules+1] = vim.tbl_deep_extend("force", vim.tbl_extend("force", {index}, config), cat.config[name])
                end
        end

        return cat.modules
end

cat.set_mappings = function(map_tbl, wk_queue)
        -- iterate over the first keys for each mode
        for mode, maps in pairs(map_tbl) do
                -- iterate over each keybinding set in the current mode
                for keymap, options in pairs(maps) do
                        local cmd = options
                        local map_opts = {}

                        -- set normal keybinding
                        if type(options) == "table" then
                                cmd = options[1]
                                map_opts = vim.tbl_deep_extend("force", map_opts, options)
                                map_opts[1] = nil
                        end

                        -- add keybinding to which-key package
                        -- if not cmd or map_opts then
                        --         if not wk_queue then wk_queue = {} end
                        --         if not wk_queue[mode] then wk_queue[mode] = {} end
                        --         wk_queue[mode][keymap] = map_opts
                        -- end

                        vim.keymap.set(mode, keymap, cmd, map_opts)
                end
        end
end
