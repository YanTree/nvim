local lang = {}

lang["simrat39/rust-tools.nvim"] = {
        lazy = true,
        ft = "rust",
        config = require("lang.rust"),
        dependencies = {"nvim-lua/plenary.nvim"},
}
return lang
