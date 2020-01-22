" motions for selecting heading of current section
onoremap ih :<c-u>execute "normal! ?^[(==)(\\-\\-)]\\+$\r:nohlsearch\rkvg_"<cr>
onoremap ah :<c-u>execute "normal! ?^[(==)(\\-\\-)]\\+$\r:nohlsearch\rg_vk0"<cr>
