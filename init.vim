let g:python3_host_prog = '/usr/local/bin/python3'

source $HOME/.config/nvim/plugin/vim-plug.vim

" leader remap {{{
let mapleader=','
noremap \ ,
let maplocalleader=' '
" }}}

" line numbers {{{
set numberwidth=6
set number relativenumber
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
" }}}

" default tab spacing {{{
set tabstop=4
set shiftwidth=4
set softtabstop=2
set expandtab
" }}}

set foldcolumn=0
set history=200
set linebreak

" %% expands to the path of the active buffer
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" arrow keys {{{
function Up()
    if line('.') != 1
        normal ddkP
    endif
endfunction

noremap <up> :call Up()<cr>
noremap <down> ddp
noremap <left> <nop>
noremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
" }}}

set hlsearch
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

nnoremap & :&&<CR>
xnoremap & :&&<CR>

set lazyredraw
set termguicolors " enable 24bit colors
set dictionary+=/usr/share/dict/words

" nontext characters {{{
set list
set listchars=eol:¬,tab:▏\ ,trail:▅,nbsp:⎵
" }}}

" smooth scroll {{{
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 15, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 15, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 15, 2)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 15, 2)<CR>
" }}}

inoremap <C-u> <esc>viw~ea
inoremap <esc> <nop>
inoremap jk <esc>

" quick edit $MYVIMRC {{{
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

nnoremap <leader>sv :source $MYVIMRC<cr>:nohlsearch<cr>
nnoremap <leader>sc :source %<cr>:nohlsearch<cr>
" }}}

" window navigation {{{
nnoremap <leader>] :bn<cr>
nnoremap <leader>[ :bp<cr>
nnoremap <leader>. <c-w>w
" }}}

" abbreviations {{{
iabbrev ture true
iabbrev Ture True
iabbrev flase false
iabbrev Flase False

cabbrev W w
" }}}

" Eatchar() {{{
" utility for abbreviations: allows ignoring of space character
function! Eatchar(pat)
    let c = nr2char(getchar(0))
    return (c =~ a:pat) ? '' : c
endfunction
" }}}

" Preserve() {{{
" Restore cursor position, window position, and last search after running a command.
function! Preserve(command)
    " Save the last search.
    let search = @/

    " Save the current cursor position.
    let cursor_position = getpos('.')

    " Save the current window position.
    normal! H
    let window_position = getpos('.')
    call setpos('.', cursor_position)

    " Execute the command.
    execute a:command

    " Restore the last search.
    let @/ = search

    " Restore the previous window position.
    call setpos('.', window_position)
    normal! zt

    " Restore the previous cursor position.
    call setpos('.', cursor_position)
endfunction
" }}}

" Indent() {{{
" Re-indent the whole buffer.
function! Indent()
    call Preserve('normal gg=G')
endfunction
" }}}

" search with verymagic
nnoremap / /\v

" escape the terminal
tnoremap <esc> <c-\><c-n>:bd!<cr>
tnoremap <c-w> <c-\><c-n><c-w>w

" close current buffer
nnoremap <leader>q<cr> :bd<cr>
