" run program in the current buffer {{{
nnoremap <Leader>rr :w<cr>:!racket %<cr>
" }}}

nnoremap <Leader>i :call Indent()<cr>

au BufWritePre <buffer> call Indent()

" abbreviations {{{
iabbrev def (define
iabbrev dis (display
iabbrev let (let ((<c-r>=Eatchar('\s')<cr>
iabbrev set (set!
iabbrev cond (cond ((<c-r>=Eatchar('\s')<cr>
iabbrev lam (lambda (<c-r>=Eatchar('\s')<cr>
iabbrev if (if (<c-r>=Eatchar('\s')<cr>
iabbrev req (#%require (file
iabbrev prov (#%provide
" }}}

setlocal lispwords-=if

" goto  definition {{{
nnoremap <silent> <localleader>gd :echo '<c-r><c-w>'<cr>:call Grep('\(define \(?<c-r><c-w>')<cr>
" }}}
