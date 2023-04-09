local const = require("core.const")
local indent = 8

local function load_options()
	local global_options = {
                smartindent = true,              -- 自动缩进
                expandtab = true,                -- 使用空格替换 tab
                tabstop = indent,                -- 一个 tab 使用多少个空格
                

		shiftround = true,
		shiftwidth = indent,             -- autoindent 时缩进的长度

		encoding = "utf-8",              -- 编码格式

		cursorline = true,               -- 高亮光标当前行

		number = true,                   -- 左边栏显示行号
		relativenumber = true,           -- 行号显示模式为 relative
		signcolumn = "yes",              -- 行号左边留部分空间做标识用

		mouse = "a",                     -- 终端模式下启用光标
		clipboard = "unnamedplus",       -- 系统剪贴板里的内容可直接粘贴到 neovim 里

		splitbelow = true,               -- 上下分割窗口时，新窗口放在下边
		splitright = true,               -- 左右分割窗口时，新窗口放在右边

		ignorecase = true,               -- 搜索时不用区分大小写
		smartcase = true,                -- 搜索时输入大写字符，那么搜索包含大写字符的结果

		termguicolors = true,            -- 终端模式下启用真彩色

		backup = false,                  -- 关闭自动备份

		foldenable = true,               -- 开启折叠代码功能
		foldlevelstart = 99,             -- 能折叠代码的层级

		undofile = true,
		undodir = const.cache_dir .. "undo/",  --
	}

	-- Load options setting
	for name, value in pairs(global_options) do
		vim.o[name] = value
	end
end

load_options()
