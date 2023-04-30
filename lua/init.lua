----------- leaderkey -------------------------
vim.g.mapleader = " "
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local utils = require("cat_utils")
local opt = vim.opt

utils.create_cache_folder()
utils.dofile_modules_packages()
utils.dofile_modules_config()

----------- options -------------------------
opt.backup = false                         -- disable to creates a backup file
opt.writebackup = false                    -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited 

opt.undodir = cat.path.cache .. "/undo"   -- reset undo file directory
opt.undofile = true                        -- enable persistent undo

opt.fileencoding = "utf-8"                 -- the encoding written to a file
opt.mouse = "a"                            -- mouse will alway available in neovim
opt.clipboard = "unnamedplus"              -- neovim avabile access the system clipboard
opt.signcolumn = "yes"                     -- always show the sign column, otherwise it would shift the text each time
opt.completeopt = { "menuone", "noselect" }-- mostly just for cmp
-- opt.showtabline = 2                        -- never show tabline on top left corner (2: always, 1: leaset two tabs pages, 0: never)
-- opt.laststatus = 1                         -- TODO:
opt.conceallevel = 0                       -- so that `` is visible in markdown files
opt.swapfile = false                       -- disable to creates a swapfile
opt.showcmd = false                        -- TODO:hide (partial) command in the last line of the screen (for performance)
opt.wrap = false                           -- display lines as one long line without wrap

opt.scrolloff = 8                          -- minimal number of screen lines to keep above and below the cursor
opt.sidescrolloff = 12                     -- minimal number of screen columns to keep to the left and right of the cursor if wrap is `false`

opt.timeout = true                         -- enable timeout for a key pressed
opt.timeoutlen = 300                       -- time to wait for a mapped sequence to complete (in milliseconds)

opt.updatetime = 400                       -- faster completion (4000ms default)

opt.smartindent = true                     -- make indenting smarter again
opt.expandtab = true                       -- convert tabs to spaces
opt.tabstop = cat.ui.indent             -- insert 'indent' spaces for a tab

opt.shiftwidth = cat.ui.indent          -- the number of spaces inserted for each indentation

opt.cursorline = true                      -- hight the current line

opt.number = true                          -- show line of number at left
opt.relativenumber = true                  -- set line of number mode to relative

opt.splitbelow = true                      -- force all horizontal splits to go below current window
opt.splitright = true                      -- force all vertical splits to go to the right of current window

opt.ignorecase = true                      -- ignore case in search patterns
opt.smartcase = true                       -- smart case

opt.termguicolors = true                   -- set term gui colors (most terminals support this)

opt.foldenable = true                      -- default not fold code 
opt.foldlevelstart = 99                    -- 


----------- options -------------------------
vim.filetype.add({extension = { wgsl = "wgsl"}})

require("cat_lazy").fire_lazy()
