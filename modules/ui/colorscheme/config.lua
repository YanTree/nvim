-- ui/colorscheme/config.lua

local config = {
        lazy = true,


        opts = {
                undercurl = true,
                underline = true,
                bold = true,
                italic = {
                strings = true,
                comments = true,
                operators = false,
                folds = true,
                },
                strikethrough = true,
                invert_selection = false,
                invert_signs = false,
                invert_tabline = false,
                invert_intend_guides = false,
                inverse = true, -- invert background for search, diffs, statuslines and errors
                contrast = "", -- can be "hard", "soft" or empty string
                palette_overrides = {},
                overrides = {},
                dim_inactive = false,
                transparent_mode = false,
        },

        config = function(_, opts)
                require("gruvbox").setup(opts)
        end,
}

cat.config["ellisonleao/gruvbox.nvim"] = config
cat.set_options("ellisonleao/gruvbox.nvim")
-- print("ellisonleao/gruvbox.nvim")

