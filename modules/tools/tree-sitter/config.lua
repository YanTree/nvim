-- tools/tree-sitter/config.lua

local dependencies = {
    {"JoosepAlviste/nvim-ts-context-commentstring"},
    {"mrjones2014/nvim-ts-rainbow"},
    {"norcalli/nvim-colorizer.lua"},
}

local config = {
        lazy = true,
        -- last release is way too old and doesn't work on windows
        version = false,
        cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
        build = ":TSUpdate",
        event = { "BufRead", "BufWinEnter", "BufNewFile" },

        dependencies = dependencies,
  
        opts = {
                highlight = {
                        enable = true,
                        disable = function(lang, buf)
                                local max_filesize = 100 * 1024 -- 100 KB
                                local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                                if ok and stats and stats.size > max_filesize then
                                return true
                                end
                        end,   
                },
                -- A list of parser names, or "all" (the 13 listed parsers should always be installed)
                ensure_installed = { "bash", "c", "lua", "vim", "vimdoc", "python", "rust", "wgsl", "wgsl_bevy", "toml", "scheme", "racket", "c_sharp", },

                -- integration with nvim-ts-rainbow plugin
                rainbow = {
                        enable = true,
                        -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
                        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
                        max_file_lines = 7000, -- Do not enable for files with more than n lines, int
                        -- colors = {}, -- table of hex strings
                        -- termcolors = {} -- table of colour name strings
                },
                -- integration with Comment.nvim plugin
                context_commentstring = {
                        enable = true,
                        enable_autocmd = false,
                },
        },

        config = function(_, opts)
                require("nvim-treesitter.configs").setup(opts)
        end,
}

cat.config["nvim-treesitter/nvim-treesitter"] = config
cat.set_options("nvim-treesitter/nvim-treesitter")
