return function()
	require("which-key").setup({
		plugins = {
			presets = {
				operators = true,
				motions = true,
				text_objects = true,
				windows = true,
				nav = false,
				z = true,
				g = true,
			},
		},

		window = {
			border = "none",
			position = "bottom",
			margin = { 1, 0, 1, 0 },
			padding = { 1, 2, 1, 2 },
			winblend = 0,
		},
	})
end
