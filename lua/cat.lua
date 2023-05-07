cat = {}

-- constant, hold all packages
cat.packages = {}

-- constant, hold config for all packages
cat.config = {}

-- combine packages and config to a table
cat.modules = {}

-- constant, hold all keybinding
cat.mappings = {}

-- constant, hold all icons
cat.icons = {}

-- constant 
cat.ui = {
        indent = 8,
        colorscheme = "gruvbox",
}
cat.border = {
        solid_line = { '┌', '─', '┐', '│', '┘', '─', '└', '│'},
        dot_line = { '+', '-', '+', '¦', '+', '-', '+', '¦'},
}

cat.lspservers = {
        "lua_ls",
        "rust_analyzer",
        "wgsl_analyzer",
        -- "csharp_ls",
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

----------- functions ------------------
cat.set_options = function(name)
        for index, config in pairs(cat.packages) do
                if index == name then
                        cat.modules[#cat.modules+1] = vim.tbl_deep_extend("force", vim.tbl_extend("force", {index}, config), cat.config[name])
                end
        end

        return cat.modules
end

cat.set_mappings = function(map_tbl)
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

                        vim.keymap.set(mode, keymap, cmd, map_opts)
                end
        end
end

---Get a specific icon set.
---@param category "kind"|"type"|"documents"|"git"|"ui"|"diagnostics"|"misc"|"cmp"|"dap"
---@param add_space? boolean @Add trailing space after the icon.
cat.get_icon = function(category, add_space)
        if add_space then
                return setmetatable({}, {
                        __index = function(_, key)
                                return cat.icons[category][key] .. " "
                        end,
                })
        else
                return cat.icons[category]
        end
end
