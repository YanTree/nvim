local ui = {}

ui["folke/tokyonight.nvim"] = {
	lazy = false,
	priority = 1000,
	config = require("ui.tokyonight")
}

return ui
