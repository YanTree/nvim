-- tools/which-key/config.lua

local config = {
        lazy = true,
        event = { "VeryLazy" },
  
        opts = {
                plugins = { spelling = true },
        },

        config = function(_, opts)
                local wk = require("which-key")
                wk.setup(opts)
                -- wk.register(opts.defaults)
        end,
}

cat.config["folke/which-key.nvim"] = config
cat.set_options("folke/which-key.nvim")
