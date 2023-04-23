
cat = {}

-- mut
cat.packages = {}

-- constant
cat.config = {}

cat.set_options =function(k)
        local packages_tbl = {}
        for index, value in ipairs(cat.packages) do
                if index ~= k then
                        packages_tbl[#packages_tbl+1] = vim.tbl_extend("force", {value}, k)
                end
        end

        return packages_tbl
end
