" run program in the current buffer {{{
nnoremap <Leader>rr :w<cr>:!racket %<cr>
nnoremap <Leader>re :w<cr>:call Repl()<cr>

function Repl()
    let @"="(enter! \"./" . expand("%") . "\")"
    execute "vsplit | term racket -i"
    execute "normal! j$pa\<C-m>\<cr>\<nl>\^M"
endfunction
" }}}

nnoremap <silent><buffer> <Leader>i :call Indent()<cr>

" abbreviations {{{
iabbrev <buffer> def (define
iabbrev <buffer> dis (display
iabbrev <buffer> let (let ((<c-r>=Eatchar('\s')<cr>
iabbrev <buffer> set (set!
iabbrev <buffer> cond (cond ((<c-r>=Eatchar('\s')<cr>
iabbrev <buffer> lam (lambda (<c-r>=Eatchar('\s')<cr>
iabbrev <buffer> if (if (<c-r>=Eatchar('\s')<cr>
iabbrev <buffer> req (#%require (file
iabbrev <buffer> prov (#%provide
" }}}

setlocal lispwords-=if

" " goto  definition -- replaced with CoC (same binding) {{{
" nnoremap <silent> <localleader>gd :echo '<c-r><c-w>'<cr>:call Grep('\(define \(?<c-r><c-w>')<cr>
" " }}}

" toggle parinfer between paren and smart modes {{{
nnoremap <buffer><silent> <C-p> :call ToggleParinferMode()<cr>

function! ToggleParinferMode()
    if g:parinfer_mode == 'smart'
        execute "let g:parinfer_mode = 'paren'"
    else
        execute "let g:parinfer_mode = 'smart'"
    endif
    echom "parinfer_mode = " . g:parinfer_mode
endfunction
" }}}

" paste code properly formatted {{{
nnoremap <buffer><silent> <localleader>v :call ToggleParinferMode()<cr>:call PBPaste()<cr>A<esc>:call ToggleParinferMode()<cr>
inoremap <buffer><silent> <C-v> <esc>:call ToggleParinferMode()<cr>:call PBPaste()<cr>:call ToggleParinferMode()<cr>A

function! PBPaste()
    set paste
    execute "r !pbpaste"
    set nopaste
endfunction
" }}}

" slurp -- unfinished
" TODO: if we created a blank line, delete it
" TODO: imap vs nmap

nnoremap <buffer><silent> <localleader>sl :call Slurp()<cr>

function! Slurp()
    execute "normal! mO"
    call SetParinferMode('paren')
    call SExprEnd()
    execute "normal! mP"
    execute "normal! /\\V[\\|(\\|'\\|\"\\|\\w\<cr>"
    call SelectSExpr()
    execute "normal! d`Pi\<space>\<esc>p"
    call SExprEnd()
    execute "normal! h"
    call DeleteSpaces()
    execute "normal! `O"
    call SExprEnd()
    execute "normal! l"
    call DeleteSpaces()
    execute "normal! i\<space>"
    execute "normal! `O"
    set nohlsearch
    call SetParinferMode('smart')
endfunction

function! DeleteSpaces()
    while GetChar(0) == 32    " space
        execute "normal! x"
    endwhile
endfunction

function! SetParinferMode(mode)
    let g:parinfer_mode = a:mode
endfunction

function! SExprStart()
    execute "normal! ?\\V[\\|(\<cr>"
endfunction

function! SExprEnd()
    call SExprStart()
    execute "normal! %"
endfunction

function! SelectSExpr()
    let l:char = GetChar(0)
    if l:char == 40 || l:char == 91     " ) or ]
        execute "normal! v%"
    elseif l:char == 39                 " '
        let l:nextchar = GetChar(1)
        if l:nextchar == 40 || l:char == 91
            execute "normal! vl%"
        else
            execute "normal! viw"
        endif
    else
        execute "normal! viw"
    endif
endfunction

function GetChar(right)
    return char2nr(matchstr(getline('.'), '\%' . str2nr(col('.') + a:right) . 'c.'))
endfunction

" TODO: barf
" nnoremap <buffer><silent> <localleader>ba :call Barf()<cr>
" TODO: backward slurp
" nnoremap <buffer><silent> <localleader>Sl :call BackwardSlurp()<cr>
" nnoremap <buffer><silent> <localleader>SL :call BackwardSlurp()<cr>
" TODO: backward barf
" nnoremap <buffer><silent> <localleader>Ba :call BackwardBarf()<cr>
" nnoremap <buffer><silent> <localleader>BA :call BackwardBarf()<cr>
