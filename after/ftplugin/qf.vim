hi QuickFixLine cterm=None ctermbg=256 guibg=None

" from inside qf window {{{
nnoremap <buffer><silent> q :cclose<CR>
nnoremap <buffer><silent> O <CR>:cclose<CR>
" }}}

" from anywhere {{{
nnoremap <leader>cn :cnext<cr>
nnoremap <leader>cp :cprevious<cr>
nnoremap <leader>cc :cclose<cr>
" }}}
