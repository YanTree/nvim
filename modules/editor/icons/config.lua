-- editor/icons/config.lua

local icons = {
        kind = {
                Class = "",
                Color = "",
                Constant = "",
                Constructor = "",
                Enum = "",
                EnumMember = "",
                Event = "",
                Field = "",
                File = "",
                Folder = "",
                Function = "",
                Interface = "",
                Keyword = "",
                Method = "",
                Module = "󰏖",
                Namespace = "",
                Number = "",
                Operator = "",
                Package = "",
                Property = "",
                Reference = "",
                Snippet = "󰩫",
                Struct = "",
                Text = "",
                TypeParameter = "",
                Unit = "",
                Value = "",
                Variable = "",
        },
        type = {
                Array = "",
                Boolean = "",
                Null = "ﳠ",
                Number = "",
                Object = "",
                String = "",
        },
        documents = {
                Default = "",
                File = "",
                Files = "󰥧",
                FileTree = "פּ",
                Import = "",
                Symlink = "",
        },
        git = {
                Add = "",
                Branch = "",
                Diff = "",
                Git = "",
                Ignore = "",
                Mod = "M",
                ModAlt = "",
                Remove = "",
                Rename = "",
                Repo = "",
                Unmerged = "שׂ",
                Untracked = "ﲉ",
                Unstaged = "",
                Staged = "",
                Conflict = "",
        },
        ui = {
                ArrowClosed = "",
                ArrowOpen = "",
                BigCircle = "",
                BigUnfilledCircle = "",
                BookMark = "",
                Bug = "",
                Calendar = "",
                Check = "",
                ChevronRight = "",
                Circle = "",
                Close = "",
                CloseAlt = "",
                CloudDownload = "",
                Comment = "",
                CodeAction = "",
                Dashboard = "",
                Emoji = "",
                EmptyFolder = "",
                EmptyFolderOpen = "",
                File = "",
                Fire = "",
                Folder = "",
                FolderOpen = "",
                Gear = "",
                History = "",
                Incoming = "",
                Indicator = "",
                Keyboard = "",
                Left = "",
                List = "",
                Square = "",
                SymlinkFolder = "",
                Lock = "",
                Modified = "✥",
                Modified_alt = "",
                NewFile = "",
                Newspaper = "",
                Note = "",
                Outgoing = "",
                Package = "",
                Pencil = "",
                Perf = "",
                Play = "",
                Project = "",
                Right = "",
                RootFolderOpened = "",
                Search = "",
                Separator = "",
                DoubleSeparator = "",
                SignIn = "",
                SignOut = "",
                Sort = "",
                Spell = "暈",
                Symlink = "",
                Table = "",
                Telescope = "",
        },
        diagnostics = {
                Error = "",
                Warning = "",
                Information = "",
                Question = "",
                Hint = "",
                -- Holo version
                ErrorAlt = "",
                WarningAlt = "",
                InformationAlt = "",
                QuestionAlt = "",
                HintAlt = "",
        },
        misc = {
                Campass = "",
                Code = "",
                EscapeST = "✺",
                Gavel = "",
                Glass = "",
                PyEnv = "",
                Squirrel = "",
                Tag = "",
                Tree = "",
                Watch = "",
                Lego = "",
                Vbar = "│",
                Add = "+",
                Added = "",
                Ghost = "",
                ManUp = "",
                Vim = "",
        },
        cmp = {
                Codeium = "",
                TabNine = "",
                Copilot = "",
                CopilotAlt = "",
                nvim_lsp = "",
                nvim_lua = "",
                path = "",
                buffer = "",
                spell = "暈",
                luasnip = "",
                treesitter = "",
        },
        dap = {
                Breakpoint = "",
                BreakpointCondition = "ﳁ",
                BreakpointRejected = "",
                LogPoint = "",
                Pause = "",
                Play = "",
                RunLast = "↻",
                StepBack = "",
                StepInto = "",
                StepOut = "",
                StepOver = "",
                Stopped = "",
                Terminate = "ﱢ",
        },
}

cat.icons = icons
