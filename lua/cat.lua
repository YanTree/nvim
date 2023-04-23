
cat = {}

-- mut
cat.packages = {}

-- constant
cat.config = {}

cat.packages_tbl = {}

cat.set_options =function(name)
        for index, config in pairs(cat.packages) do
                if index == name then
                        cat.packages_tbl[#cat.packages_tbl+1] = vim.tbl_deep_extend("force", vim.tbl_extend("force", {index}, config), cat.config[name])
                end
        end

        return cat.packages_tbl
end
