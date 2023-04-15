local completion = {}

-- completion plugin
completion["hrsh7th/nvim-cmp"] = {
        lazy = true,
        event = { "InsertEnter", "CmdlineEnter",},
        config = require("completion.cmp"),
        dependencies = {
                -- Plugins for nvim-cmp
                { "hrsh7th/cmp-buffer" },       -- completion all buffer string
                { "hrsh7th/cmp-path" },         -- completion file directory
                { "hrsh7th/cmp-nvim-lua" },     -- completion neovim lua api
                { "saadparwaiz1/cmp_luasnip" }, -- luasnip plugin for nvim-cmp

                -- Snippets for snippet
                {
                        "L3MON4D3/LuaSnip",     -- snippet engine
                        dependencies = { "rafamadriz/friendly-snippets" },
                        config = require("completion.luasnip"),
                },
        },
}

return completion
