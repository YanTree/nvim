local tools = {}
local conf = require("modules.tools.config")

tools["nvim-lua/plenary.nvim"] = {opt = false}
tools["nvim-telescope/telescope.nvim"] = {
    opt = true,
    cmd = "Telescope",
    config = conf.telescope,
    requires = {
        {"nvim-lua/plenary.nvim", opt = false},
        {"nvim-lua/popup.nvim", opt = true}
    }
}
tools["nvim-telescope/telescope-fzf-native.nvim"] = {
    opt = true,
    run = "make",
    after = "telescope.nvim",
    config = function() require("telescope").load_extension("fzf") end
}
tools["nvim-telescope/telescope-project.nvim"] = {
    opt = true,
    after = "telescope.nvim",
    config = function() require("telescope").load_extension("project") end
}
tools["nvim-telescope/telescope-frecency.nvim"] = {
    opt = true,
    after = "telescope.nvim",
    requires = {{"tami5/sqlite.lua", opt = true}},
    config = function() require("telescope").load_extension("frecency") end
}
tools["jvgrootveld/telescope-zoxide"] = {
    opt = true,
    after = "telescope.nvim",
    config = function() require("telescope").load_extension("zoxide") end
}
tools["thinca/vim-quickrun"] = {opt = true, cmd = {"QuickRun", "Q"}}
tools["michaelb/sniprun"] = {
    opt = true,
    run = "bash ./install.sh",
    cmd = {"SnipRun", "'<,'>SnipRun"}
}
tools["folke/which-key.nvim"] = {
    opt = true,
    keys = ",",
    config = function() require("which-key").setup {} end
}
tools["folke/trouble.nvim"] = {
    opt = true,
    cmd = {"Trouble", "TroubleToggle", "TroubleRefresh"},
    config = conf.trouble
}
tools["dstein64/vim-startuptime"] = {opt = true, cmd = "StartupTime"}
tools["gelguy/wilder.nvim"] = {
    event = "CmdlineEnter",
    config = conf.wilder,
    requires = {{"romgrk/fzy-lua-native", after = "wilder.nvim"}}
}
tools["famiu/bufdelete.nvim"] = {opt = true, cmd = {"Bdelete", "Bwipeout"}}

return tools
