return function()
        local transparent_background = false -- Set background transparency here!
      
        require("catppuccin").setup({
                compile_path = vim.fn.stdpath("cache") .. "/catppuccin",

                transparent_background = false,
                
                flavour = "mocha", -- latte, frappe, macchiato, mocha
               
                background = { -- :h background
                        light = "latte",
                        dark = "mocha",
                },

                show_end_of_buffer = false, -- show the '~' characters after the end of buffers
                term_colors = true,

                dim_inactive = {
                        enabled = false,
                        shade = "dark",
                        percentage = 0.15,
                },

                styles = {
                        comments = { "italic" },
                        conditionals = { "bold" },
                        loops = {"bold"},
                        functions = {"bold"},
                        keywords = {"italic"},
                        strings = {},
                        variables = {},
                        numbers = {},
                        booleans = {"bold", "italic"},
                        properties = {"italic"},
                        types = {},
                        operators = {"bold"},
                },

                color_overrides = {},

                custom_highlights = {},

                integrations = {
                        cmp = true,
                        gitsigns = true,
                        nvimtree = true,
                        telescope = true,
                        notify = false,
                        mini = false,
                },
})
end
