" use ag in place of grep {{{
if executable('ag')
    set grepprg=ag\ --vimgrep
endif
" }}}

" grep skeleton {{{
function s:Grep(term)
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

    call <SID>Grep(@@)

    let @@ = saved_unnamed_register
endfunction
" }}}

" grep new search term {{{
nnoremap <leader>/ :call <SID>GrepTerm()<cr>

function! s:GrepTerm()
    let grep_term = input("Enter " . expand(&grepprg) . " search term: ")
    if !empty(grep_term)
        call <SID>Grep(grep_term)
    endif
endfunction
" }}}
