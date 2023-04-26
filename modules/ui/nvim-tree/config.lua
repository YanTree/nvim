-- ui/nvim-tree/config.lua

local dependencies = {
        {"nvim-tree/nvim-web-devicons"},
}

local config = {
        lazy = true,
        cmd = {
                "NvimTreeOpen",
                "NvimTreeToggle",
                "NvimTreeFindFile",
                "NvimTreeFindFileToggle",
                "NvimTreeRefresh",
        },
        dependencies = dependencies,

        init = function()
        -- not preferct soultion for auto close nvim, when nvim-tree side is last buffer
        vim.api.nvim_create_autocmd("QuitPre", {
                callback = function()
                local invalid_win = {}
                local wins = vim.api.nvim_list_wins()
                for _, w in ipairs(wins) do
                        local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
                        if bufname:match("NvimTree_") ~= nil then
                                table.insert(invalid_win, w)
                        end
                end
                if #invalid_win == #wins - 1 then
                        -- Should quit, so we close all invalid windows.
                        for _, w in ipairs(invalid_win) do vim.api.nvim_win_close(w, true) end
                end
        end
        })
        end,

        opts = {
                -- keep cursor on the first letter of the filename, when moving in the tree
                hijack_cursor = true,
                -- when buffer unnamed is empty, can open it 
                hijack_unnamed_buffer_when_opening = false,
                -- Changes the tree root directory on `DirChanged` and refreshes the tree.
                sync_root_with_cwd = true,

                -- Update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file.
                update_focused_file = {
                        enable = true,
                        update_root = false,
                },
                git = {
                        enable = false,
                        ignore = true,
                },
                -- window / buffer setup
                view = {
                        adaptive_size = false,
                        side = "left",
                        width = 30,
                        preserve_window_proportions = true,
                },
                actions = {
                        open_file = {
                                resize_window = true,
                        },
                },
                renderer = {
                        -- compact folder that only contain a single folder into one node in the file tree
                        group_empty = true,
                        -- list of filenames that gets highlighted with `NvimTreeSpecialFile`
                        special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
                        -- show indent mark on explore
                        indent_markers = {
                                enable = false,
                        },
                },
        },

        config = function(_, opts)
            require("nvim-tree").setup(opts)
        end,
}

cat.config["nvim-tree/nvim-tree.lua"] = config
cat.set_options("nvim-tree/nvim-tree.lua")
