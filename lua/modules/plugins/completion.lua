local completion = {}

-- completion plugin
completion["hrsh7th/nvim-cmp"] = {
        lazy = true,
        event = { "InsertEnter", "CmdlineEnter",},
        config = require("completion.cmp"),
        dependencies = {
                -- Plugins for nvim-cmp
                { "hrsh7th/cmp-nvim-lsp" },     -- completion for LSP servers
                { "hrsh7th/cmp-buffer" },       -- completion all buffer string
                { "hrsh7th/cmp-path" },         -- completion file directory
                { "hrsh7th/cmp-nvim-lua" },     -- completion neovim lua api
                { "saadparwaiz1/cmp_luasnip" }, -- luasnip plugin for nvim-cmp
                { "onsails/lspkind.nvim" },     -- vscode-like pictograms for neovim lsp completion items
                -- Snippets for snippet
                {
                        -- snippet engine
                        "L3MON4D3/LuaSnip",
                        -- some useful snippets
                        dependencies = { "rafamadriz/friendly-snippets" },
                        config = require("completion.luasnip"),
                },
        },
}

-- LSP plugin
completion["neovim/nvim-lspconfig"] = {
        lazy = true,
        event = { "BufReadPost", "BufAdd", "BufNewFile" },
        config = require("completion.lsp"),
        dependencies = {
                { "williamboman/mason.nvim" },              -- manager(like lazy) for LSP servers, DAP servers, linters, and formatters
                { "williamboman/mason-lspconfig.nvim" },    -- easier to config nvim-lspconfig
        },
}

return completion
