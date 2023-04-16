return function()
        -- local variable
        local icon = require("core.lib.icons")
        local icons = {
                diagnostics = icon.get("diagnostics"),
                documents = icon.get("documents"),
                git = icon.get("git"),
                ui = icon.get("ui"),
        }

        require("nvim-tree").setup({
                -- keep cursor on the first letter of the filename, when moving in the tree
                hijack_cursor = true,
                -- when buffer unnamed is empty, can open it 
                hijack_unnamed_buffer_when_opening = true,

                -- render UI setup
                renderer = {
                        -- compact folder that only contain a single folder into one node in the file tree
                        group_empty = true,
                        -- the root dir style "h/U/.c/nvim"
                        root_folder_label = ":~:s?$?/..?",
                        -- list of filenames that gets highlighted with `NvimTreeSpecialFile`
                        special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
                        -- show indent mark on explore
                        indent_markers = {
                                enable = true,
                        },
                        -- icon setup
                        icons = {
                                symlink_arrow = "  ",
                                glyphs = {
                                        default = icons.documents.Default,
                                        symlink = icons.documents.Symlink,
                                        bookmark = icons.ui.BookMark,

                                        -- git icon
                                        git = {
                                                unstaged = icons.git.Mod_alt,
                                                staged = icons.git.Add,
                                                unmerged = icons.git.Unmerged,
                                                renamed = icons.git.Untracked,
                                                deleted = icons.git.Remove,
                                                ignored = icons.git.Ignore,
                                        },

                                        -- folder icon
                                        folder = {
                                                arrow_open = "",
                                                arrow_closed = "",
                                                default = icons.ui.Folder,
                                                open = icons.ui.FolderOpen,
                                                empty = icons.ui.EmptyFolder,
                                                empty_open = icons.ui.EmptyFolderOpen,
                                                symlink = icons.ui.SymlinkFolder,
                                                symlink_open = icons.ui.FolderOpen,
                                        }
                                }
                        },
                },
                -- 
                update_focused_file = {
                        enable = false,
                        update_root = false,
                        ignore_list = {},
                },
                -- show lsp and coc diagnostics in the signcolum
                diagnostics = {
                        enable = false,
                        show_on_dirs = false,
                        debounce_delay = 50,
                        icons = {
                                hint = icons.diagnostics.Hint_alt,
                                info = icons.diagnostics.Information_alt,
                                warning = icons.diagnostics.Warning_alt,
                                error = icons.diagnostics.Error_alt,
                        }
                },
                -- filtering options
                filters = {
                        dotfiles = false,
                        git_clean = false,
                        no_buffer = false,
                        custom = {".DS_Store"},
                        exclude = {},
                },
                -- 
                filesystem_watchers = {
                        enable = true,
                        debounce_delay = 50,
                        ignore_dirs = {},
                },
                -- git integration with icons and colors
                git = {
                        enable = true,
                        ignore = true,
                        show_on_dirs = true,
                        show_on_open_dirs = true,
                        timeout = 400,
                },
                -- various actions
                actions = {
                        use_system_clipboard = true,
                        change_dir = {
                                enable = true,
                                global = false,
                                restrict_above_cwd = false,
                        },
                        open_file = {
                                quit_on_open = false,
                                resize_window = false,
                                window_picker = {
                                        enable = true,
                                        picker = "default",
                                        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
                                        exclude = {
                                                filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
                                                buftype = { "nofile", "terminal", "help" },
                                        },
                                },
                        },
                        remove_file = {
                                close_window = true,
                        },
                },
                -- 
                trash = {
                        cmd = "gio trash",
                },
                -- 
                live_filter = {
                        prefix = "[FILTER]: ",
                        always_show_folders = true,
                },
                -- 
                log = {
                        enable = false,
                        truncate = false,
                        types = {
                                all = false,
                                config = false,
                                copy_paste = false,
                                dev = false,
                                diagnostics = false,
                                git = false,
                                profile = false,
                                watcher = false,
                        },
                },
        })
end
