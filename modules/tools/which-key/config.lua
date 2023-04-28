--uffer tools/which-key/config.lua

local config = {
        lazy = true,
        event = { "VeryLazy" },
  
        opts = {
                plugins = { spelling = true },
                sections = {
                        mode = { "n", "v" },
                        ["<leader>f"] = { name = "+File"},
                        ["<leader>w"]= { name = "+Window"},
                        ["<leader>s"] = { name = "+Search"},
                        ["<leader>g"] = { name = "+Git"},
                        ["<leader>b"] = { name = "+Buffer"},
                        ["<leader>p"] = { name = "+Project"},
                        ["<leader>o"] = { name = "+Open"},
                },
        },

        config = function(_, opts)
                local wk = require("which-key")
                wk.setup(opts)
                wk.register(opts.sections)
        end,
}

cat.config["folke/which-key.nvim"] = config
cat.set_options("folke/which-key.nvim")
