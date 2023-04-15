local tool = {}

-- find, filter, preview, pick all the thing at one plugin
tool["nvim-telescope/telescope.nvim"] = {
	lazy = true,
        event = "BufEnter",
	cmd = "Telescope",
	config = require("tool.telescope"),
	dependencies = {
		{ "nvim-tree/nvim-web-devicons" },     -- provide icons
		{ "nvim-lua/plenary.nvim" },           -- a lua lib
		{
			"ahmedkhalf/project.nvim",     -- switch project
			event = "BufReadPost",
		},
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- sort telescope use fzf sorter
		{ "nvim-telescope/telescope-frecency.nvim", dependencies = {    -- select recently file
			{ "kkharji/sqlite.lua" },
		} },
	},
}

-- when press one key, pop a window to show all relative key binddings
tool["folke/which-key.nvim"] = {
        lazy = true,
        event = { "CursorHold", "CursorHoldI" },
        config = require("tool.which-key"),
}


-- tool["nvim-tree/nvim-tree.lua"] = {
--      lazy = true,
--      cmd = {
--              "NvimTreeToggle",
--              "NvimTreeOpen",
--              "NvimTreeFindFile",
--              "NvimTreeFindFileToggle",
--              "NvimTreeRefresh",
--      },
--      dependencies = { "nvim-tree/nvim-web-devicons" },
--      config = require("tool.nvim-tree"),
-- }
return tool
