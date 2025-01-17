return function()
        -- local variable
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        dashboard.section.header.val = {
                -- "                                                                                ",
                -- "                                                                                ",
                -- "                                                                                ",
                "         @@                                                           @@        ",
                "        @@@@@@                                                     @@@@@@       ",
                "       @@@@@@@@@                                                 @@@@@@@@@      ",
                "      @@@@@@@@@@@@@                                            @@@@@@@@@@@      ",
                "      @@@@@@@@@@@@@@@@                                     @@@@@@@@@@@@@@@@     ",
                "      @@@@@@@@@@@@@@@@@@@@@@@@@@@#######(///////@@@@@@@@@@@@@@@@@@@@@@@@@@@     ",
                "     @@@@@@@@@@@@@@@@@@@@@@@############(///////////@@@@@@@@@@@@@@@@@@@@@@@     ",
                "     @@@@@@@@@@@@@@@@@@@@###############(//////////////@@@@@@@@@@@@@@@@@@@@     ",
                "     @@@@@@@@@@@@@@@@@@@################(///////////////@@@@@@@@@@@@@@@@@@@     ",
                "      @@@@@@@@@@@@@@@@@@################(////////////////@@@@@@@@@@@@@@@@@@     ",
                "      @@@@@@@@@@@@@@@@@#################(/////////////////@@@@@@@@@@@@@@@@@     ",
                "      @@@@@@@@@@@@@@@@@#################(/////////////////@@@@@@@@@@@@@@@@@     ",
                "     @@@@@@@@@@@@@@@@@@#################(/////////////////@@@@@@@@@@@@@@@@@@    ",
                "    @@@@@@@@@@@@@@@@@@@@################(/////////////////@@@@@@@@@@@@@@@@@@@   ",
                "   @@@@@@@@@@@@@@@@@@@@@################(////////////////@@@@@@@@@@@@@@@@@@@@@  ",
                "  @@@@@@@@@@@@@@@@@@@@@@@@##############(//////////////@@@@@@@@@@@@@@@@@@@@@@@@ ",
                " @@@@@@@@@@@@@@@@@@@@@@@@@@@@###########(///////////@@@@@@@@@@@@@@@@@@@@@@@@@@@ ",
                " @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@######(///////@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@",
                "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@",
        }

	dashboard.section.header.opts.hl = "Type"

	local function button(sc, txt, leader_txt, keybind, keybind_opts)
		local sc_after = sc:gsub("%s", ""):gsub(leader_txt, "<leader>")

		local opts = {
			position = "center",
			shortcut = sc,
			cursor = 10,
			width = 50,
			align_shortcut = "right",
			hl_shortcut = "Constant",
		}

		if nil == keybind then
			keybind = sc_after
		end
		keybind_opts = vim.F.if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
		opts.keymap = { "n", sc_after, keybind, keybind_opts }

		local function on_press()
			-- local key = vim.api.nvim_replace_termcodes(keybind .. '<Ignore>', true, false, true)
			local key = vim.api.nvim_replace_termcodes(sc_after .. "<Ignore>", true, false, true)
			vim.api.nvim_feedkeys(key, "t", false)
		end

		return {
			type = "button",
			val = txt,
			on_press = on_press,
			opts = opts,
		}
	end

        local leader = " "

	dashboard.section.buttons.val = {
		button("SPC q l", " Reload last session", leader, nil, {
			noremap = true,
			silent = true,
			nowait = true,
			callback = function()
				-- require("telescope.builtin").colorscheme()
			end,
		}),
		button("SPC f r", " Recently opened files", leader, nil, {
			noremap = true,
			silent = true,
			nowait = true,
			callback = function()
                                -- TODO: frecency on window not support, becaseue sqlite.dll
                                -- require("telescope").extensions.frecency.frecency()
                                require("telescope.builtin").oldfiles()
			end,
		}),
                button("SPC p p", " Open project", leader, nil, {
                        noremap = true,
                        silent = true,
                        nowait = true,
                        callback = function()
                                require("telescope").extensions.projects.projects({})
                        end,
                }),
		button("SPC f f", " Open find", leader, nil, {
			noremap = true,
			silent = true,
			nowait = true,
			callback = function()
				require("telescope.builtin").find_files()
			end,
		}),
		button("SPC f n", " File new", leader, nil, {
			noremap = true,
			silent = true,
			nowait = true,
			callback = function()
				vim.api.nvim_command("enew")
			end,
		}),
		button("q", " Quit neovim", leader, nil, {
			noremap = true,
			silent = true,
			nowait = true,
			callback = function()
				vim.api.nvim_command("qa")
			end,
		}),
	}
	dashboard.section.buttons.opts.hl = "Keyword"

	local function footer()
		local stats = require("lazy").stats()
		local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                return {
                       "Neovim loaded   " .. stats.count ..  " plugins in " .. ms .. " ms",
                        -- " " .. "󰄛" .. " ",
                }
	end

	dashboard.section.footer.val = footer()
	dashboard.section.footer.opts.hl = "Comment"

        local head_butt_padding = 2
	local occu_height = #dashboard.section.header.val + 2 * #dashboard.section.buttons.val + head_butt_padding
	local header_padding = math.max(0, math.ceil((vim.fn.winheight("$") - occu_height) * 0.25))
	local foot_butt_padding = 1

	dashboard.config.layout = {
		{ type = "padding", val = header_padding },
		dashboard.section.header,
		{ type = "padding", val = head_butt_padding },
		dashboard.section.buttons,
		{ type = "padding", val = foot_butt_padding },
		dashboard.section.footer,
	}

	alpha.setup(dashboard.opts)

	vim.api.nvim_create_autocmd("User", {
		pattern = "LazyVimStarted",
		callback = function()
			dashboard.section.footer.val = footer()
			pcall(vim.cmd.AlphaRedraw)
		end,
	})
end
