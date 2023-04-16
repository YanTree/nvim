local ui = {}

-- one customize theme
ui["catppuccin/nvim"] = {
        lazy = false,
        name = "catppuccin",
        config = require("ui.catppuccin")
}

-- one customize dashboard
ui["goolord/alpha-nvim"] = {
	lazy = true,
	event = "BufWinEnter",
	config = require("ui.alpha"),
}

return ui
