return vim.schedule_wrap(function()

        -- local variable
        local ssh_active = require("core.settings").ssh_active

        -- Fold code method
        vim.api.nvim_set_option_value("foldmethod", "expr", {})
        vim.api.nvim_set_option_value("foldexpr", "nvim_treesitter#foldexpr()", {})

        require( "nvim-treesitter.configs").setup({
          -- A list of parser names, or "all" (the five listed parsers should always be installed)
          ensure_installed = {
                  "bash",
                  "c",
                  "lua",
                  "rust",
                  "wgsl",
                  "wgsl_bevy",
                  "toml",
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

          -- config for nvim-ts-rainbow plugin
            rainbow = {
                enable = true,
                -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
                extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
                max_file_lines = 7000, -- Do not enable for files with more than n lines, int
                -- colors = {}, -- table of hex strings
                -- termcolors = {} -- table of colour name strings
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
