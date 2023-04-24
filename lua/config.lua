local M = {}

M.ui = {
        indent = 8,
        theme = "gruvbox"
}

M.lazy_setting = {
        root = cat.path.data .. "/lazy",

        install = {
                colorscheme = { "gruvbox" }
        },
}

return M
