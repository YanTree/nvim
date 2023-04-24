-- ui/neotree/config.lua

local dependencies = {
    {"nvim-lua/plenary.nvim"},
    {"nvim-tree/nvim-web-devicons"},
    {"MunifTanjim/nui.nvim"},
}

local config = {
    lazy = true,
    cmd = { "Neotree" },
    dependencies = dependencies,
  
    init = function()
        vim.g.neo_tree_remove_legacy_commands = 1
        if vim.fn.argc() == 1 then
                local stat = vim.loop.fs_stat(vim.fn.argv(0))
                if stat and stat.type == "directory" then
                        require("neo-tree")
                end
        end
    end,

    opts = {
        -- Close Neo-tree if it is the last window left in the tab
        -- I love this feature
        close_if_last_window = true,
        sources = {
                "filesystem",
                "buffers",
                "git_status",
        },
        filesystem = {
                -- true creates a 2-way binding between vim's cwd and neo-tree's root
                bind_to_cwd = true,
                -- when true, empty folders will be grouped together, it's not frendly
                group_empty_dirs = false, 

                -- use os level file watchers to detect changes instead of relying on nvim autocmd events.
                use_libuv_file_watcher = true,

                -- find and focus the file in the active buffer every time the current file is changed
                -- while the tree is open.
                follow_current_file = true,

                filtered_items = {
                        hide_dotfiles = false,
                        hide_gitignored = false,
                        hide_by_name = {
                        },
                        hide_by_pattern = {
                                "*.meta",
                        },
                },
        },
    },

    config = function(_, opts)
            vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

            require("neo-tree").setup(opts)
    end,
}

cat.config["nvim-neo-tree/neo-tree.nvim"] = config
cat.set_options("nvim-neo-tree/neo-tree.nvim")
