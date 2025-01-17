local settings = {}
local home = require("core.const").home

-- Set it to false if you want to use https to update plugins and treesitter parsers.
---@type boolean
settings["ssh_active"] = true

-- Font with size for neovim gui app
---@type string
settings["font"] = "MesloLGMDZ NFM:h10"

-- Set the colorscheme to use here.
-- Available values are: `catppuccin`, `catppuccin-latte`, `catppucin-mocha`, `catppuccin-frappe`, `catppuccin-macchiato`, `monokai-pro`
---@type string
settings["colorscheme"] = "monokai-pro"

-- Set pop window frame style
-- Check below link search more style
-- https://github.com/hrsh7th/nvim-cmp/pull/472 
settings["borderchar"] = {
        completion =  {'┌', '─', '┐', '│', '┘', '─', '└', '│'},
}

-- Set the telescope style
--
-- @type boolean
settings["telescope_title"] = {
        preview = false,
        results = false,
        prompt = true,
}

-- Set the language servers that will be installed during bootstrap here
-- check the below link for all the supported LSPs:
-- https://github.com/neovim/nvim-lspconfig/tree/master/lua/lspconfig/server_configurations
---@type string[]
settings["lsp_deps"] = {
        "bashls",
        "powershell_es",
        "lua_ls",
}

return settings
