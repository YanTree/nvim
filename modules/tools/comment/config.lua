-- tools/comment/config.lua

local tscomment_config = {
        lazy = true,
}

local comment_config = {
        lazy = true,
        event = { "CursorHold", "CursorHoldI" },

        opts = function()
                local commentstring_avail, commentstring = pcall(require, "ts_context_commentstring.integrations.comment_nvim")
                return {
                        ---Add a space b/w comment and the line
                        padding = true,
                        ---Whether the cursor should stay at its position
                        sticky = true,
                        ---Lines to be ignored while (un)comment
                        ignore = nil,
                        ---LHS of toggle mappings in NORMAL mode
                        toggler = {
                            ---Line-comment toggle keymap
                            line = 'gcc',
                            ---Block-comment toggle keymap
                            block = 'gbc',
                        },
                        ---LHS of operator-pending mappings in NORMAL and VISUAL mode
                        opleader = {
                            ---Line-comment keymap
                            line = 'gc',
                            ---Block-comment keymap
                            block = 'gb',
                        },
                        ---LHS of extra mappings
                        extra = {
                            ---Add comment on the line above
                            above = 'gcO',
                            ---Add comment on the line below
                            below = 'gco',
                            ---Add comment at the end of line
                            eol = 'gcA',
                        },
                        ---Enable keybindings
                        ---NOTE: If given `false` then the plugin won't create any mappings
                        mappings = {
                            ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
                            basic = true,
                            ---Extra mapping; `gco`, `gcO`, `gcA`
                            extra = true,
                        },
                        ---Function to call before (un)comment
                        -- integration with treesitter plugin
                        -- TODO: below code support almost language, but tsx/jsx
                        pre_hook = commentstring.create_pre_hook(),
                        ---Function to call after (un)comment
                        post_hook = nil,
            }
        end,

        config = function(_, opts)
                require("Comment").setup(opts)
        end,
}

cat.config["JoosepAlviste/nvim-ts-context-commentstring"] = tscomment_config
cat.config["numToStr/Comment.nvim"] = comment_config
cat.set_options("JoosepAlviste/nvim-ts-context-commentstring")
cat.set_options("numToStr/Comment.nvim")
