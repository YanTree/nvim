local const = {}

-- get type of os(eg: window or linux or mac)
local os_name = vim.loop.os_uname().sysname

function const:load_variables()
        -- is mac device?
        self.is_mac = os_name == "Darwin"
        -- is linux device?
        self.is_linux = os_name == "Linux"
        -- is windows device?
        self.is_windows = os_name == "Windows_NT"
        -- is wsl environment?
        self.is_wsl = vim.fn.has("wsl") == 1

        -- windows use "\\" as path separator
        local path_sep = self.is_windows and "\\" or "/"

        -- get 'config' path. The path is "HOME/.config/nvim" on linux,
        -- "home/USERNAME/appdata/local/nvim" on windows. If you use pwsh,
        -- can set variable "$Env:XDG_CONFIG_HOME = $CONFIGPATH" to keep
        -- same path on linux for windows.
        self.vim_path = vim.fn.stdpath("config")

        -- get 'home' path. Try get "USERPROFILE" environment value on
        -- windows(on my PC is nil), try get "HOME" environment for the
        -- rest of device.
        local home = self.is_windows and os.getenv("USERPROFILE") or os.getenv("HOME")

        -- set nvim cache dir on "HOME/.cache/nvim"(eg: undo action data)
        self.cache_dir = home .. path_sep .. ".cache" .. path_sep .. "nvim" .. path_sep
        -- set modules dir on "config/modules", put all third plugin settings
        -- on this directory
        self.modules_dir = self.vim_path .. path_sep .. "modules"
        -- set home dir
        self.home = home
        -- set data dir on neovim "data" path
        self.data_dir = string.format("%s/site/", vim.fn.stdpath("data"))
end

const:load_variables()

return const
