-- editor/snippets/config.lua

local dependencies = {
        "rafamadriz/friendly-snippets",
}

local config = {
        lazy = true,
        event = "InsertEnter",

        dependencies = dependencies,

        opts = function()
                require("luasnip.loaders.from_vscode").lazy_load()
                return {
                        history = true,
                        updateevents = "TextChanged, TextChangedI",
                }
        end,

        config = function(_, opts)
                require("luasnip").config.set_config(opts)
        end,
}

cat.config["L3MON4D3/LuaSnip"] = config
cat.set_options("L3MON4D3/LuaSnip")
