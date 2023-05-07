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
        -- bridge of luasnip(engine) and nvim-cmp
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
                local icons = {
                        kind = cat.get_icon("kind"),
                        type = cat.get_icon("type"),
                        cmp = cat.get_icon("cmp"),
                }

                -- local function
                local function has_words_before()
                        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
                end

                local function cmp_format(opts)
                        opts = opts or {}

                        return function(entry, vim_item)
                                if opts.before then
                                        vim_item = opts.before(entry, vim_item)
                                end

                                local kind_symbol = opts.symbol_map[vim_item.kind] or icons.kind.Undefined
                                local source_symbol = opts.symbol_map[entry.source.name] or icons.cmp.Undefined

                                vim_item.menu = " " .. source_symbol
                                vim_item.kind = string.format("  「%s %s」", kind_symbol, vim_item.kind)

                                if opts.maxwidth ~= nil then
                                        if opts.ellipsis_char == nil then
                                                vim_item.abbr = string.sub(vim_item.abbr, 1, opts.maxwidth)
                                        else
                                                local label = vim_item.abbr
                                                local truncated_label = vim.fn.strcharpart(label, 0, opts.maxwidth)
                                                if truncated_label ~= label then
                                                        vim_item.abbr = truncated_label .. opts.ellipsis_char
                                                end
                                        end
                                end
                                return vim_item
                        end
                end

                return {
                        --
                        -- nvim-cmp settings
                        window = {
                                completion = cmp.config.window.bordered({
                                        border = cat.border.solid_line,
                                }),
                                documentation = cmp.config.window.bordered({
                                        border = cat.border.dot_line,
                                })
                        },
                        completion = {
                                completeopt = "menu,menuone,noinsert",
                        },
                        formatting = {
                                -- item.kind icons + compeltion word + item.kind type 
                                field = { "menu", "abbr", "kind" },
                                format = function(entry, vim_item)
                                        local kind_map = vim.tbl_deep_extend("force", icons.kind, icons.type, icons.cmp)
                                        local kind = cmp_format({
                                                maxwidth = 50,
                                                symbol_map = kind_map,
                                        })(entry, vim_item)
                                        return kind
                                end,
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

                        --
                        -- packages settings

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
