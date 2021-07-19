local config = {}
local exec = vim.api.nvim_command

function config.go()
    exec('augroup gosettings')
    exec('autocmd!')
    exec('autocmd FileType go nmap <leader>mbb <Plug>(go-build)')
    exec('autocmd FileType go nmap <leader>mbr <Plug>(go-run)')
    exec('autocmd FileType go nmap <leader>mds :GoDebugStart<cr>')
    exec('autocmd FileType go nmap <leader>mdb :GoDebugBreakpoint<cr>')
    exec('autocmd FileType go nmap <leader>mdc :GoDebugContinue<cr>')
    exec('autocmd FileType go nmap <leader>mdo :GoDebugStepOut<cr>')
    exec('autocmd FileType go nmap <leader>mdt :GoDebugStop<cr>')
    exec('augroup END')
end

function config.rust()
    exec('augroup rustsettings')
    exec('autocmd!')
    exec(
        "autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost * lua require'lsp_extensions'.inlay_hints{ prefix = ' >> ', highlight = 'Comment', enabled = {'TypeHint', 'ChainingHint', 'ParameterHint'} }")
    exec('autocmd FileType rust nmap <leader>mbb :Cbuild<cr>')
    exec('autocmd FileType rust nmap <leader>mbt :Ctest<cr>')
    exec('autocmd FileType rust nmap <leader>mbr :Crun<cr>')
    exec('augroup END')
end

function config.org()
    require('orgmode').setup({
        org_agenda_files = {'~/Sync/org/*'},
        org_default_notes_file = '~/Sync/org/refile.org'
    })
end

function config.markdown()
    vim.g.mkdp_auto_start = 0
    vim.api.nvim_set_keymap('n', '<F12>', 'MarkdownPreviewToggle',
                            {noremap = true, silent = false})
end

return config
