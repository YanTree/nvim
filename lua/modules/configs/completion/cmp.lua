return function()

        -- local variables
        local luasnip = require("luasnip")
        local cmp = require("cmp")
        local lspkind = require("lspkind")
        local icon = require("core.lib.icons")

        local icons = {
                kind = icon.get("kind"),
                type = icon.get("type"),
                cmp = icon.get("cmp"),
        }

        -- local function
        local check_backspace = function()
                local col = vim.fn.col "." - 1
                return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
        end

        -- fire up nvim-cmp plugin
        cmp.setup({
                -- customize completion pop window style
                window = {
                        completion = cmp.config.window.bordered(),
                        documentation = cmp.config.window.bordered(),
                },
                -- customize completion for snippets
                snippet = {
                        -- REQUIRED - you must specify a snippet engine
                        expand = function(args)
                                -- For `luasnip` users.
                                luasnip.lsp_expand(args.body)
                        end,
                },
                -- customize keymap on active pop window of completion
                mapping = cmp.mapping.preset.insert({
                        -- "CTRL j/k" to select previous or next item
                        ["<C-j>"] = cmp.mapping.select_prev_item(),
                        ["<C-k>"] = cmp.mapping.select_next_item(),

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
                                elseif check_backspace() then
                                        fallback()
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
                -- customize format of completion list
                formatting = {
                        fields = { "kind", "abbr", "menu" },
                        format = function(entry, vim_item)
                                local kind = lspkind.cmp_format({
                                        mode = "symbol_text",
                                        maxwidth = 50,
                                        symbol_map = vim.tbl_deep_extend("force", icons.kind, icons.type, icons.cmp),
                                })(entry, vim_item)

                                local strings = vim.split(kind.kind, "%s", { trimempty = true })
                                kind.kind = "" .. strings[1] .. " "
                                kind.menu = "    (" .. strings[2] .. ")"
                                return kind
                        end,
                },
                sources = {
                        -- completion LSP (cmp-nvim-lua plugin)
                        { name = "nvim_lsp" },
                        -- completion neovim lua api(cmp-nvim-lua plugin)
                        { name = "nvim_lua"},
                        -- completion snippets(luasnip plugin)
                        { name = "luasnip"},
                        -- completion all buffer string(cmp-buffer plugin)
                        { name = "buffer"},
                        -- completion file directory(cmp-path plugin)
                        { name = "path"},
                },
                confirm_opts = {
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = false,
                },
        })
end
