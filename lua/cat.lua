cat = {}

-- mut
cat.packages = {}

-- constant
cat.config = {}

-- combine packages and config
cat.modules = {}

cat.set_options = function(name)
        for index, config in pairs(cat.packages) do
                if index == name then
                        cat.modules[#cat.modules+1] = vim.tbl_deep_extend("force", vim.tbl_extend("force", {index}, config), cat.config[name])
                end
        end

        return cat.modules
end


----------- setting path ------------------
local home = os.getenv("HOME")
cat.path = {
        home = home,
        config = vim.fn.stdpath("config"),
        modules = vim.fn.stdpath("config") .. "/modules",
        data = string.format("%s/catsite/", vim.fn.stdpath("data")),
        cache = home .. "/.cache/nvim",
        sqlite3 = home .. "/scoop/apps/sqlite/current/sqlite3.dll",
}
