local const = require("core.const")
local indent = 8                                        -- a tab equal eight space

-- Type ':help options' look for nevim doc
local function load_options()
        local global_options = {
                backup = false,                         -- disable to creates a backup file
                writebackup = false,                    -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited 

                undodir = const.cache_dir .. "undo/",   -- reset undo file directory
                undofile = true,                        -- enable persistent undo

                fileencoding = "utf-8",                 -- the encoding written to a file
                mouse = "a",                            -- mouse will alway available in neovim
                clipboard = "unnamedplus",              -- neovim avabile access the system clipboard
                signcolumn = "yes",                     -- always show the sign column, otherwise it would shift the text each time
                completeopt = { "menuone", "noselect" },-- mostly just for cmp
                showtabline = 2,                        -- never show tabline on top left corner (2: always, 1: leaset two tabs pages, 0: never)
                -- laststatus = 1,                         -- TODO:
                conceallevel = 0,                       -- so that `` is visible in markdown files
                swapfile = false,                       -- disable to creates a swapfile
                showcmd = false,                        -- TODO:hide (partial) command in the last line of the screen (for performance)
                wrap = false,                           -- display lines as one long line without wrap

                scrolloff = 8,                          -- minimal number of screen lines to keep above and below the cursor
                sidescrolloff = 12,                     -- minimal number of screen columns to keep to the left and right of the cursor if wrap is `false`

                timeout = true,                         -- enable timeout for a key pressed
                timeoutlen = 300,                       -- time to wait for a mapped sequence to complete (in milliseconds)

                updatetime = 400,                       -- faster completion (4000ms default)

                smartindent = true,                     -- make indenting smarter again
                expandtab = true,                       -- convert tabs to spaces
                tabstop = indent,                       -- insert 'indent' spaces for a tab

                shiftwidth = indent,                    -- the number of spaces inserted for each indentation

                cursorline = true,                      -- hight the current line

                number = true,                          -- show line of number at left
                relativenumber = true,                  -- set line of number mode to relative

                splitbelow = true,                      -- force all horizontal splits to go below current window
                splitright = true,                      -- force all vertical splits to go to the right of current window

                ignorecase = true,                      -- ignore case in search patterns
                smartcase = true,                       -- smart case

                termguicolors = true,                   -- set term gui colors (most terminals support this)

                foldenable = true,                      -- default not fold code 
                foldlevelstart = 99,                    -- 
        }

        -- Load options setting
        for name, value in pairs(global_options) do
                vim.opt[name] = value
        end
end

load_options()
