-- require("cat")
--
-- local util = require("utils")
--
-- util.dofile_modules_packages()
-- util.dofile_modules_config()
--
-- print(print(vim.inspect(cat.packages)))
-- print(print(vim.inspect(cat.config)))
-- print(vim.inspect(packages))

if not vim.g.vscode then
	require("core")
end
