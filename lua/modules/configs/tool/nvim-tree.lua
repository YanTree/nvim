return function()
	require("nvim-tree").setup({
                filters = {
                        -- Ignore '.git' and '.DS_Store' folder
                        custom = { ".git", ".DS_Store"},
                }
        })
end
