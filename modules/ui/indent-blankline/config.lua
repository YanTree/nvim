-- ui/indent-blankline/config.lua

local config = {
        lazy = true,
        event = "BufReadPost",

        opts = {
                indent_enable = 1,
                filetype_exclude = {
                        "help",
                        "terminal",
                        "lazy",
                        "lspinfo",
                        "TelescopePrompt",
                        "TelescopeResults",
                        "mason",
                        "NvimTree",
                        "dashboard",
                        "markdown",
                        "txt",
                        "",
                },
                buftype_exclude = { "terminal" },
                show_trailing_blankline_indent = false,
                show_first_indent_level = false,
                show_current_context = false,
                show_current_context_start = false,
        },

        config = function(_, opts)
                require("indent_blankline").setup(opts)
        end,
}

cat.config["lukas-reineke/indent-blankline.nvim"] = config
cat.set_options("lukas-reineke/indent-blankline.nvim")

