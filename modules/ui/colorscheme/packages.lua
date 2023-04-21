-- ui/colorscheme/packages.lua

packages["ellisonleao/gruvbox.nvim"] = {
        pin = true,
        commit = "42e92960a334c36cf588f096b5821bc63c98293d",
}

local list = {
        "packagename",
        pin = true,
        tag = "0.2.1",
}

local module = {}

for k, v in pairs(packages) do
        module[#module+1] = vim.tbl_extend("force", {k}, v)
        print(vim.inspect(k))
        print(vim.inspect(v))
        print(vim.inspect(module))
end
-- print(vim.inspect(packages))
-- print(vim.inspect(list))
