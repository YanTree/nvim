-- lang/rust/config.lua

local dependencies = { "nvim-lua/plenary.nvim" }

local config = {
        lazy = true,
        ft = "rust",
        dependencies = dependencies,
        opts = {
        },
        config = function(_, opts)
                require("rust-tools").setup(opts)
        end,
}

cat.config["simrat39/rust-tools.nvim"] = config
cat.set_options("simrat39/rust-tools.nvim")
