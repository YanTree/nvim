local editor = {}

editor["numToStr/Comment.nvim"] = {
        lazy = true,
        event = { "CursorHold", "CursorHoldI" },
        config = require("editor.comment"),
}

-- syntax highlight(maybe) plugin
editor["nvim-treesitter/nvim-treesitter"] = {
        lazy = true,
        build = function()
                if #vim.api.nvim_list_uis() ~= 0 then
                        vim.api.nvim_command("TSUpdate")
                end
        end,
        event = { "CursorHold", "CursorHoldI" },
        config = require("editor.treesitter"),
        dependencies = {

                -- rainbow pair(eg: {} [] ())
                { "mrjones2014/nvim-ts-rainbow" },
                {
                        -- hex color value(eg: #fff372) paint with real color
                        "NvChad/nvim-colorizer.lua",
                        config = require("editor.colorizer"),
                },
        }
}

-- automatic close pair(eg: ()[]{})
-- extra: config for cmp and treesitter
editor["windwp/nvim-autopairs"] = {
        lazy = true,
        event = { "CursorHold", "CursorHoldI" },
        config = require("editor.autopairs"),
}

return editor
