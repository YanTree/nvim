return function()
        -- local variable
        local telescope_title = require("core.settings").telescope_title

        local icons = {
                ui = require("core.lib.icons").get("ui", true)
        }
        local telescope = require("telescope")
        local actions = require("telescope.actions")

        -- setup
        telescope.setup({
                defaults = {
                        layout_strategy = "center",
                        layout_config = {
                                prompt_position = "bottom",
                                height = 0.4,
                        },

                        -- show title?
                        dynamic_preview_title = telescope_title.preview,
                        results_title = telescope_title.results,
                        prompt_title = telescope_title.prompt,

                        path_display = { "absolute" },
                        file_ignore_patterns = { ".git/" },

                        -- key binddings
                        mappings = {
                                i = {
                                        ["<C-n>"] = actions.cycle_history_next,
                                        ["<C-p>"] = actions.cycle_history_prev,

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
                                previewer = false,
                        },

                        git_files = {
                                previewer = false,
                        }
		},
                extensions = {
                        -- fuzzy match plugin
                        fzf = {
                                fuzzy = true,                   -- false will only do exact matching
                                override_generic_sorter = true, -- override the generic sorter
                                override_file_sorter = true,    -- overider the file sorter
                                case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
                        },
                        -- sortet find files cmd with rencently
                        frecency = {
                                show_scores = true,
                                show_unindexed = true,
                                ignore_patterns = { "*.git/*", "*/tmp/*" },
                        },
                }
        })

        require("project_nvim").setup({
                manual_mode = false,
                detection_methods = { "lsp", "pattern" },
                patterns = { ".git", ".svn", "Makefile", "package.json" },
                ignore_lsp = { "efm" },
                exclude_dirs = {},
                show_hidden = false,
                silent_chdir = true,
                scope_chdir = "global",
                datapath = vim.fn.stdpath("data"),
        })

        -- load extension fzf
        telescope.load_extension("fzf")
        -- load extension frecency
        telescope.load_extension("frecency")
        -- load extension projects
        telescope.load_extension("projects")
end
