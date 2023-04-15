local editor = {}

editor["numToStr/Comment.nvim"] = {
        lazy = true,
        event = { "CursorHold", "CursorHoldI" },
        config = require("editor.comment"),
}

editor["nvim-treesitter/nvim-treesitter"] = {
        lazy = true,
        build = function()
                if #vim.api.nvim_list_uis() ~= 0 then
                        vim.api.nvim_command("TSUpdate")
                end
        end,
        event = { "CursorHold", "CursorHoldI" },
        -- config = require("editor.treesitter"),
        dependencies = {
                { "nvim-treesitter/nvim-treesitter-textobjects" },
                {
                        "NvChad/nvim-colorizer.lua",
                        -- config = require("editor.colorizer"),
                },
        }
}
return editor
