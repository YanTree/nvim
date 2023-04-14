return function()
        -- load customize snips
        local path = vim.fn.stdpath("config") .. "/snips/"
        if not vim.tbl_contains(vim.opt.rtp:get(), path) then
                vim.opt.rtp:append(path)
        end
        
        -- load snips
        require("luasnip/loaders/from_vscode").lazy_load()
end
