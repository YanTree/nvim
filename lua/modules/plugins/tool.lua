local tool = {}

-- 弹出弹窗，显示当前能够触发的按键
tool["folke/which-key.nvim"] = {
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = require("tool.which-key"),
}

tool["nvim-tree/nvim-tree.lua"] = {
	lazy = true,
	cmd = {
		"NvimTreeToggle",
		"NvimTreeOpen",
		"NvimTreeFindFile",
		"NvimTreeFindFileToggle",
		"NvimTreeRefresh",
	},
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = require("tool.nvim-tree"),
}
return tool
