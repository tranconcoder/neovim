let g:floaterm_title = '╣ TERMINAL ╠'
let g:floaterm_width = 0.6
let g:floaterm_height = 0.6
let g:floaterm_position = 'bottomright'
let g:floaterm_borderchars = "═║═║╔╗╝╚"

nnoremap <silent> <leader>t :FloatermToggle<CR>
tnoremap <silent> <leader>t <C-\><C-n>:FloatermToggle<CR>

" Compile and excute java file
nnoremap <silent> <leader>j :FloatermSend clear && javac % && java % <CR> <bar> :FloatermToggle <CR>

autocmd BufEnter * :hi FloatermBorder guibg=transparent<CR>
