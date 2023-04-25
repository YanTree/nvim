-- completion/nvim-cmp/config.lua

local dependencies = {
        -- completion for lsp server
        {"hrsh7th/cmp-nvim-lsp"},
        -- completion for buffer context
        {"hrsh7th/cmp-buffer"},
        -- completion file directory
        {"hrsh7th/cmp-path"},
        -- completion neovim lua api
        {"hrsh7th/cmp-nvim-lua"},
        -- bridge of luasnip engine and cmp
        { "saadparwaiz1/cmp_luasnip" },
        {
                -- snippet engine
                "L3MON4D3/LuaSnip",
                -- some useful snippets
                dependencies = { "rafamadriz/friendly-snippets" },
        },
}

local config = {
        lazy = true,
        event = "InsertEnter",

        dependencies = dependencies,

        opts = function()
                local cmp = require("cmp")
                local luasnip = require("luasnip")

                -- local function
                local function has_words_before()
                        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
                end

                return {
                        completion = {
                                completeopt = "menu,menuone,noinsert",
                        },
                        -- customize keymap on active pop window of completion
                        mapping = cmp.mapping.preset.insert({
                        -- "CTRL j/k" to select previous or next item
                        ["<C-k>"] = cmp.mapping.select_prev_item(),
                        ["<C-j>"] = cmp.mapping.select_next_item(),

                        -- "CTRL b/f" to move prview window
                        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
                        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),

                        -- "CTRL space" give you all possible seletions
                        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
                        -- "CTRL e" to close completion window
                        ["<C-e>"] = cmp.mapping {
                                i = cmp.mapping.abort(),
                                c = cmp.mapping.close(),
                        },
                        -- "<CR>" = "Enter" to accept currently selected item. Set `select` to `false` to only confirm explicitly selected items
                        ["<CR>"] = cmp.mapping.confirm({ select = true }),

                        -- super tab
                        ["<Tab>"] = cmp.mapping(function(fallback)
                                if cmp.visible() then
                                        cmp.select_next_item()
                                elseif luasnip.expandable() then
                                        luasnip.expand()
                                elseif luasnip.expand_or_jumpable() then
                                        luasnip.expand_or_jump()
                                elseif has_words_before() then
                                        cmp.complete()
                                else
                                        fallback()
                                end
                        end, { "i", "s", }),
                        -- super shift tab
                        ["<S-Tab>"] = cmp.mapping(function(fallback)
                                if cmp.visible() then
                                     cmp.select_prev_item()
                                elseif luasnip.jumpable(-1) then
                                     luasnip.jump(-1)
                                else
                                     fallback()
                                end
                        end, { "i", "s", }),
                        }),
                        sources = {
                                -- completion LSP (cmp-nvim-lsp plugin)
                                { name = "nvim_lsp" },
                                -- completion snippets(luasnip plugin)
                                { name = "luasnip"},
                                -- completion neovim lua api(cmp-nvim-lua plugin)
                                { name = "nvim_lua"},
                                -- completion all buffer string(cmp-buffer plugin)
                                { name = "buffer"},
                                -- completion file directory(cmp-path plugin)
                                { name = "path"},
                        },
                        -- integration nvim-cmp with luasnip(engine) through cmp_luasnip
                        snippet = {
                                expand = function(args)
                                        luasnip.lsp_expand(args.body)
                                end,
                        },
                }
        end,

        config = function(_, opts)
                require("cmp").setup(opts)
        end,
}

cat.config["hrsh7th/nvim-cmp"] = config
cat.set_options("hrsh7th/nvim-cmp")
