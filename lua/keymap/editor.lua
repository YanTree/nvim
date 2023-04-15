local bindkey = require("core.lib.bindkey")
local map_cr = bindkey.map_cr
local map_cu = bindkey.map_cu
local map_cmd = bindkey.map_cmd
local map_callback = bindkey.map_callback
local et = bindkey.escape_termcode

local plug_map = {
        -- Plugin: comment.nvim
        ["n|gcc"] = map_callback(function()
                        return vim.v.count == 0 and et("<Plug>(comment_toggle_linewise_current)")
                                or et("<Plug>(comment_toggle_linewise_count)")
                end)
                :with_silent()
                :with_noremap()
                :with_expr()
                :with_desc("Comment this line"),
        ["n|gbc"] = map_callback(function()
                        return vim.v.count == 0 and et("<Plug>(comment_toggle_blockwise_current)")
                                or et("<Plug>(comment_toggle_blockwise_count)")
                end)
                :with_silent()
                :with_noremap()
                :with_expr()
                :with_desc("Comment visual block"),
        ["n|gc"] = map_cmd("<Plug>(comment_toggle_linewise)")
                :with_silent()
                :with_noremap()
                :with_desc("Comment line with operator"),
        ["n|gb"] = map_cmd("<Plug>(comment_toggle_blockwise)")
                :with_silent()
                :with_noremap()
                :with_desc("Comment block with operator"),
        ["x|gc"] = map_cmd("<Plug>(comment_toggle_linewise_visual)")
                :with_silent()
                :with_noremap()
                :with_desc("Comment line with selection"),
        ["x|gb"] = map_cmd("<Plug>(comment_toggle_blockwise_visual)")
                :with_silent()
                :with_noremap()
                :with_desc("Comment block with selection"),
}

bindkey.nvim_load_mapping(plug_map)
