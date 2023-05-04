--tools/gitsigns/config.lua

local dependencies = { "nvim-lua/plenary.nvim" }

local neogit_config = {
        lazy = true,
        dependencies = dependencies,
        cmd = { "Neogit" },
        opts = {},
        config = function(_, opts)
                require("neogit").setup(opts)
        end
}

local gitsigns_config = {
        lazy = true,
        ft = "gitcommit",
        init = function()
                vim.api.nvim_create_autocmd({ "BufRead" }, {
                        group = vim.api.nvim_create_augroup("GitSignsLazyLoad", { clear = true }),
                        callback = function()
                                vim.fn.system("git -C " .. '"' .. vim.fn.expand "%:p:h" .. '"' .. " rev-parse")
                                if vim.v.shell_error == 0 then
                                        vim.api.nvim_del_augroup_by_name("GitSignsLazyLoad")
                                        vim.schedule(function()
                                                require("lazy").load({ plugins = { "gitsigns.nvim" }})
                                        end)
                                end
                        end,
                })
        end,
        opts = {
        },

        config = function(_, opts)
                require("gitsigns").setup(opts)
        end,
}

cat.config["TimUntersberger/neogit"] = neogit_config
cat.config["lewis6991/gitsigns.nvim"] = gitsigns_config
cat.set_options("TimUntersberger/neogit")
cat.set_options("lewis6991/gitsigns.nvim")
