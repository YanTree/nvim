-- ui/rgb/config.lua

local color_config = {
        lazy = true,
        event = "BufReadPre",
        opts = {
                -- colorizer all files, exclude lazy/neo-tree
                filetypes = { "*", "!lazy", "!neo-tree" },
                -- exclude prompt and popup buftypes from highlight
                buftype = { "*", "!prompt", "!nofile" },

                user_default_options = {
                        names = false, -- "Name" codes like Blue or blue
                        RRGGBBAA = true, -- #RRGGBBAA hex codes
                        AARRGGBB = true, -- 0xAARRGGBB hex codes
                },
        },

        config = function(_, opts)
                require("colorizer").setup(opts)
        end,
}

local rainbow_config = {
        lazy = true,
        event = "BufReadPre",
}

cat.config["NvChad/nvim-colorizer.lua"] = color_config
cat.config["mrjones2014/nvim-ts-rainbow"] = rainbow_config
cat.set_options("NvChad/nvim-colorizer.lua")
cat.set_options("mrjones2014/nvim-ts-rainbow")
