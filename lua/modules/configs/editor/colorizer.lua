return function()
        require("colorizer").setup({
                -- highlight on all files
                filetypes = { "*" },
                -- change default config
                user_default_options = {
                        -- disable highlight with string(eg: blue)
                        names = false,
                },
                -- all the sub-options of filetypes apply to buftypes
                -- buftypes = {},
        })
end
