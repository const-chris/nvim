" use ag in place of grep {{{
if executable('ag')
    set grepprg=ag\ --vimgrep
endif
" }}}

" grep skeleton {{{
function Grep(term)
    silent execute "grep! " . shellescape(a:term) . " ."
    copen
endfunction
" }}}

" grep operator {{{
nnoremap <leader>g :set operatorfunc=<SID>GrepOperator<cr>g@
vnoremap <leader>g :<c-u>call <SID>GrepOperator(visualmode())<cr>

function! s:GrepOperator(type)
    let saved_unnamed_register = @@

    if a:type ==# 'v'
        normal! `<v`>y
    elseif a:type ==# 'char'
        normal! `[y`]
    else
        return
    endif

    call Grep(@@)

    let @@ = saved_unnamed_register
endfunction
" }}}

" grep new search term {{{
nnoremap <leader>/ :call <SID>GrepTerm()<cr>

function! s:GrepTerm()
    let grep_term = input("Enter " . split(expand(&grepprg))[0] . " search term: ")
    if !empty(grep_term)
        call Grep(grep_term)
    endif
endfunction
" }}}
