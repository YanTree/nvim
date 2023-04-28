-- tools/telescope/config.lua

local dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, 
        { "nvim-telescope/telescope-project.nvim" }, 
}

local config = {
        lazy = true,
        cmd = "Telescope",
        dependencies = dependencies,

        opts = function()
	local actions = require("telescope.actions")

        require('telescope.pickers.layout_strategies').horizontal_merged = function(picker, max_columns, max_lines, layout_config)
                local layout = require('telescope.pickers.layout_strategies').horizontal(picker, max_columns, max_lines, layout_config)
                layout.results.line = layout.results.line - 1
                layout.results.height = layout.results.height + 1
                layout.results.title = ''
                layout.prompt.title = ''
                -- layout.preview.title = ''
	        return layout
        end

	return {
                defaults = {
                        selection_caret = " ",
                        sorting_strategy = "ascending",
                        layout_strategy = "horizontal_merged",
                        borderchars = {
                        { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
                                prompt = {"─", "│", " ", "│", '┌', '┐', "│", "│"},
                                results = {"─", "│", "─", "│", "├", "┤", "┘", "└"},
                                preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
                        },
                        layout_config = {
                                anchor = "S",
                                prompt_position = "top",
                                height = 0.7,
                        },
                        -- key binddings
                        mappings = {
                                i = {
                                        ["<C-j>"] = actions.move_selection_next,
                                        ["<C-k>"] = actions.move_selection_previous,

                                        ["<C-e>"] = actions.close,

                                        ["<Down>"] = actions.move_selection_next,
                                        ["<Up>"] = actions.move_selection_previous,
                                },
                        },
                },
                pickers = {
                        find_files = {
                                prompt_prefix = " Files " .. " ",
                                previewer = false,
                        },
                        buffers = {
                                prompt_prefix = " Buffers " .. " ",
                                previewer = false,
                        },
                        git_files = {
                                prompt_prefix = " Git files " .. " ",
                                -- previewer = false,
                        },
                        oldfiles = {
                                prompt_prefix = " Recent files " .. " ",
                                previewer = false,
                        },
                        project = {
                                prompt_prefix = " Projects " .. " ",
                                previewer = false,
                        },
                        grep_string = {
                                prompt_prefix = " Grep string " .. " ",
                                -- previewer = false,
                        },
                },
                extensions = {
                        fzf = {
                                fuzzy = true,                   -- false will only do exact matching
                                override_generic_sorter = true, -- override the generic sorter
                                override_file_sorter = true,    -- overider the file sorter
                                case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
                        },
                        project = {
                                base_dirs = {
                                        "~/.config/",
                                        "~/Library/",
                                        "~/.doom.d/",

                                        -- windows
                                        "~/AppData/Local/",
                                        "~/AppData/Roaming/",
                                },
                                hidden_files = false,
                                theme = "ivy",
                                order_by = "recent", -- "asc", "desc"
                                search_by = "title", -- "title", "path"
                                sync_with_nvim_tree = true,
                        },
                },
        }
	end,

        config = function(_, opts)
                local telescope = require("telescope")
                telescope.setup(opts)

                -- telescope extensions
                telescope.load_extension("fzf")
                telescope.load_extension("project")
        end,
}

cat.config["nvim-telescope/telescope.nvim"] = config
cat.set_options("nvim-telescope/telescope.nvim")
