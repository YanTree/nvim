return function()
        -- local variable
        local const = require("core.const")
        local title_active = require("core.settings").telescope_title

        local icons = {
                ui = require("core.lib.icons").get("ui", true)
        }
        local telescope = require("telescope")
        local actions = require("telescope.actions")

        -- setup
        telescope.setup({
                defaults = {
                        prompt_prefix = " " .. icons.ui.Telescope .. " ",
                        selection_caret = icons.ui.ChevronRight,

                        sorting_strategy = "ascending",
                        layout_strategy = "horizontal",
                        -- layout_strategy = {
                        --         height = 0.9,
                        --         preview_cutoff = 120,
                        --         prompt_position = "top",
                        --         with = 0.8,
                        -- },
                        layout_config = {
                                prompt_position = "top",
                                height = 0.4,
                                -- preview_cutoff = 1,
                                --
                                -- width = function (_, max_columns, _)
                                --         return math.min(max_columns, 80)
                                -- end,
                                --
                                -- height = function (_, _, max_lines)
                                --         return math.min(max_lines, 15)
                                -- end,
                        },

                        -- show title?
                        dynamic_preview_title = title_active.preview,
                        results_title = title_active.results,
                        prompt_title = title_active.prompt,

                        path_display = { "absolute" },
                        file_ignore_patterns = { ".git/", ".cache", },

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

                        -- git_files = {
                        --         previewer = false,
                        -- }
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

        -- config for project, telescope swith projects
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

        -- fix: sqlite.lua look for sqlite3.dll on windows correctly
        if const.is_windows then
                -- sqlite3 config for 
                vim.g.sqlite_clib_path = const.sqlite3
        end

        -- load extension fzf
        telescope.load_extension("fzf")
        -- load extension frecency
        telescope.load_extension("frecency")
        -- load extension projects
        telescope.load_extension("projects")
end
