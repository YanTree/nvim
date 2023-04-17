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

-- show buffer state(add, delete, modify) at signcolumn
-- navigation/stage/preview hunks, blame line, and so
ui["lewis6991/gitsigns.nvim"] = {
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = require("ui.gitsigns"),
}

return ui
