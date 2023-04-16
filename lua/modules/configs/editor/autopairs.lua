-- link
-- https://github.com/windwp/nvim-autopairs
--

return function()

        -- local variable
        local npairs = require("nvim-autopairs")
        local rule = require("nvim-autopairs.rule")

        npairs.setup({
                -- treesitter integration
                check_ts = true,
                -- disable on pop telescope search window
                disable_filetype = { "TelescopePrompt" },
                ts_config = {
                        -- it will not add a pair on that treesitter node
                        lua = { "string" },
                        javascript = {"template_string"},
                        -- don't check treesitter on java
                        java = false,
                },
                -- TODO: fast_wrap feature
        })

        -- integration with nvim-cmp plugin
        local cmp_autopairs = require("nvim-autopairs.completion.cmp")
        local cmp = require("cmp")

        cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done{})
end
