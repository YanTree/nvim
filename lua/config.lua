local M = {}

local home = os.getenv("HOME")

M.path = {
        home = home,
        config = vim.fn.stdpath("config"),
        modules = vim.fn.stdpath("config") .. "/modules",
        data = string.format("%s/site/", vim.fn.stdpath("data")),
        sqlite3 = home .. "/scoop/apps/sqlite/current/sqlite3.dll",
}

M.ui = {
        theme = "gruvbox"
}


return M
