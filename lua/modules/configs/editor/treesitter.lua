return vim.schedule_wrap(function()
	local ssh_active = require("core.settings").ssh_active

	-- Fold code method
	vim.api.nvim_set_option_value("foldmethod", "expr", {})
	vim.api.nvim_set_option_value("foldexpr", "nvim_treesitter#foldexpr()", {})

	require( "nvim-treesitter.configs").setup({
	  -- A list of parser names, or "all" (the five listed parsers should always be installed)
	  ensure_installed = {
		  "bash",
		  "c",
		  --"json",
		  "lua",
		  "python",
		  "rust",
		  "vimdoc",
	  },
	  highlight = {
			enable = true,
			disable = function(ft, bufnr)
				if vim.tbl_contains({ "vim" }, ft) then
					return true
				end

				local ok, is_large_file = pcall(vim.api.nvim_buf_get_var, bufnr, "bigfile_disable_treesitter")
				return ok and is_large_file
			end,
			additional_vim_regex_highlighting = { "c", "cpp" },
	  },
		textobjects = {
		    select = {
		      enable = true,
		      keymaps = {
			-- You can use the capture groups defined in textobjects.scm
			["af"] = "@function.outer",
			["if"] = "@function.inner",
			["ac"] = "@class.outer",
			-- You can optionally set descriptions to the mappings (used in the desc parameter of
			-- nvim_buf_set_keymap) which plugins like which-key display
			["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
		      },
		   },
		  },

	})
	require("nvim-treesitter.install").prefer_git = true
	-- Use SSH
	if ssh_active then
		local parsers = require("nvim-treesitter.parsers").get_parser_configs()
		for _, p in pairs(parsers) do
			p.install_info.url = p.install_info.url:gsub("https://github.com/", "git@github.com:")
		end
	end
end)
