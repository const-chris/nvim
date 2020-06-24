" Change these if you want
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = 'δ'

" Faster sign updates on CursorHold/CursorHoldI
set updatetime=100

nnoremap <leader>gd :SignifyDiff<cr>
nnoremap <leader>gh :SignifyHunkDiff<cr>
nnoremap <leader>gu :SignifyHunkUndo<cr>

" hunk jumping
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)

" hunk text object
omap ih <plug>(signify-motion-inner-pending)
xmap ih <plug>(signify-motion-inner-visual)
omap ah <plug>(signify-motion-outer-pending)
xmap ah <plug>(signify-motion-outer-visual)

