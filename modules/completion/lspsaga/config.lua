-- completion/lspsaga/config.lua

local dependencies = {
      {"nvim-tree/nvim-web-devicons"},
      --Please make sure you install markdown and markdown_inline parser
      {"nvim-treesitter/nvim-treesitter"}
}

local config = {
        lazy = true,
        event = { "LspAttach" },
        dependencies = dependencies,
        opts = function()
                local icons = {
                        cmp = cat.get_icon("cmp", true),
                        diagnostics = cat.get_icon("diagnostics", true),
                        kind = cat.get_icon("kind", true),
                        type = cat.get_icon("type", true),
                        ui = cat.get_icon("ui", true),
                }

                local function set_sidebar_icons()
                        -- Set icons for sidebar.
                        local diagnostic_icons = {
                                Error = icons.diagnostics.ErrorAlt,
                                Warn = icons.diagnostics.WarningAlt,
                                Info = icons.diagnostics.InformationAlt,
                                Hint = icons.diagnostics.HintAlt,
                        }
                        for type, icon in pairs(diagnostic_icons) do
                                local hl = "DiagnosticSign" .. type
                                vim.fn.sign_define(hl, { text = icon, texthl = hl })
                        end
                end

                set_sidebar_icons()

                return {
                        ui = {
                                title = false,
                                border = "single", -- Can be single, double, rounded, solid, shadow.
                                winblend = 0,
                                actionfix = icons.ui.Spell,
                                expand = icons.ui.ArrowClosed,
                                collapse = icons.ui.ArrowOpen,
                                code_action = icons.ui.CodeAction,
                                incoming = icons.ui.Incoming,
                                outgoing = icons.ui.Outgoing,
                                kind = {
                                        -- Kind
                                        Class = { icons.kind.Class, "LspKindClass" },
                                        Constant = { icons.kind.Constant, "LspKindConstant" },
                                        Constructor = { icons.kind.Constructor, "LspKindConstructor" },
                                        Enum = { icons.kind.Enum, "LspKindEnum" },
                                        EnumMember = { icons.kind.EnumMember, "LspKindEnumMember" },
                                        Event = { icons.kind.Event, "LspKindEvent" },
                                        Field = { icons.kind.Field, "LspKindField" },
                                        File = { icons.kind.File, "LspKindFile" },
                                        Function = { icons.kind.Function, "LspKindFunction" },
                                        Interface = { icons.kind.Interface, "LspKindInterface" },
                                        Key = { icons.kind.Keyword, "LspKindKey" },
                                        Method = { icons.kind.Method, "LspKindMethod" },
                                        Module = { icons.kind.Module, "LspKindModule" },
                                        Namespace = { icons.kind.Namespace, "LspKindNamespace" },
                                        Number = { icons.kind.Number, "LspKindNumber" },
                                        Operator = { icons.kind.Operator, "LspKindOperator" },
                                        Package = { icons.kind.Package, "LspKindPackage" },
                                        Property = { icons.kind.Property, "LspKindProperty" },
                                        Struct = { icons.kind.Struct, "LspKindStruct" },
                                        TypeParameter = { icons.kind.TypeParameter, "LspKindTypeParameter" },
                                        Variable = { icons.kind.Variable, "LspKindVariable" },
                                        -- Type
                                        Array = { icons.type.Array, "LspKindArray" },
                                        Boolean = { icons.type.Boolean, "LspKindBoolean" },
                                        Null = { icons.type.Null, "LspKindNull" },
                                        Object = { icons.type.Object, "LspKindObject" },
                                        String = { icons.type.String, "LspKindString" },
                                        -- ccls-specific icons.
                                        TypeAlias = { icons.kind.TypeAlias, "LspKindTypeAlias" },
                                        Parameter = { icons.kind.Parameter, "LspKindParameter" },
                                        StaticMethod = { icons.kind.StaticMethod, "LspKindStaticMethod" },
                                        -- Microsoft-specific icons.
                                        Text = { icons.kind.Text, "LspKindText" },
                                        Snippet = { icons.kind.Snippet, "LspKindSnippet" },
                                        Folder = { icons.kind.Folder, "LspKindFolder" },
                                        Unit = { icons.kind.Unit, "LspKindUnit" },
                                        Value = { icons.kind.Value, "LspKindValue" },
                                },
                        },
        }
        end,
        config = function(_, opts)
                require("lspsaga").setup(opts)
        end,
}

cat.config["nvimdev/lspsaga.nvim"] = config
cat.set_options("nvimdev/lspsaga.nvim")
