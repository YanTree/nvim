return function()
        local icon = require("core.lib.icons")
        local icons = {
                ui = icon.get("ui"),
                misc = icon.get("misc"),
        }
        require("which-key").setup({
                plugins = {
                        presets = {
                                operators = true,
                                motions = true,
                                text_objects = true,
                                windows = true,
                                nav = false,
                                z = true,
                                g = true,
                        },
                },
                icons = {
                        breadcrumb = icons.ui.Separator,
                        separator = " ",
                        group = icons.misc.Add,
                },
                window = {
                        border = "none",
                        position = "bottom",
                        margin = { 1, 0, 1, 0 },
                        padding = { 1, 2, 1, 2 },
                        winblend = 0,
                },
        })
end
