local const = require("core.const")

-- Create cache dir and data dirs
local createdir = function()
	local data_dir = {
		const.cache_dir .. "backup",
		const.cache_dir .. "session",
		const.cache_dir .. "swap",
		const.cache_dir .. "tags",
		const.cache_dir .. "undo",
	}

	-- Only check whether cache_dir exists, this would be enough
	if vim.fn.isdirectory(const.cache_dir) == 0 then
		os.execute("mkdir - p " .. const.cache_dir)
		for _, v in pairs(data_dir) do
			if vim.fn.isdirectory(v) == 0 then
				os.execute("mkdir -p " .. v)
			end
		end
	end
end

local disable_distribution_plugins = function()
	-- Whether to load netrw by default
	vim.g.loaded_netrw = 1
	-- vim.g.loaded_netrwFileHandlers = 1
	vim.g.loaded_netrwPlugin = 1
	-- vim.g.loaded_netrwSettings = 1
	-- newtrw liststyle: https://medium.com/usevim/the-netrw-style-options-3ebe91d42456
	-- vim.g.netrw_liststyle = 3
end

local leader_map = function()
	vim.g.mapleader = " "                                       -- Leader key 设置为空格键
	vim.api.nvim_set_keymap("n", " ","", {noremap = true})      -- NORMAL MODE 下的空格键置空
	vim.api.nvim_set_keymap("x", " ","", {noremap = true})      -- X MODE 下的空格键置空

end


local load_core = function()
	-- Font setting for GUI version
	vim.api.nvim_set_option_value("guifont", "Hack NFM:h10", {})

	createdir()
	disable_distribution_plugins()
	leader_map()

	require("core.options")
	require("core.mapping")
	require("keymap")
	require("core.lazy")

	-- Load theme setting
	local colorscheme = require("core.settings").colorscheme
	vim.api.nvim_command("colorscheme " .. colorscheme)
end

load_core()
