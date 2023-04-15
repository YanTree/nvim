local ui = {}

-- Theme
ui["catppuccin/nvim"] = {
        lazy = false,
        name = "catppuccin",
        config = require("ui.catppuccin")
}

return ui
