-- completion/lsp/config.lua

local mason_config = {
        lazy = true,
        cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
        opts = function()
                local icons = {
                        ui = cat.get_icon("ui", true),
                        misc = cat.get_icon("misc", true),
                }

                -- code
                return {
                        ui = {
                                icons = {
                                        package_pending = icons.ui.ModifiedAlt,
                                        package_installed = icons.ui.Check,
                                        package_uninstalled = icons.misc.Ghost,
                                },
                        },
        }
        end,

        config = function(_, opts)
                require("mason").setup(opts)
        end,
}

local malsp_config = {
        lazy = true,
        event = { "BufReadPre", "BufAdd", "BufNewFile" },
        init = function()
                local util = require("cat_utils")
                util.dofile_modules_servers()
        end,
        config = function (_)
                require("mason-lspconfig").setup({
                        ensure_installed = cat.lspservers,
                })
        end
}

local lsp_config = {
        lazy = true,
}

cat.config["williamboman/mason.nvim"] = mason_config
cat.config["williamboman/mason-lspconfig.nvim"] = malsp_config
cat.config["neovim/nvim-lspconfig"] = lsp_config
cat.set_options("williamboman/mason.nvim")
cat.set_options("williamboman/mason-lspconfig.nvim")
cat.set_options("neovim/nvim-lspconfig")
