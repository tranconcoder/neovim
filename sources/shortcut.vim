"	Nerd tree plugin
map <silent><F2> :NERDTreeToggle<CR>

" 	Toggle Funzzy finder window
nnoremap <C-p> :Files <CR>

" 	Search text in all file
noremap <leader>s :Ag <CR>
noremap <leader>f :Rg <CR>

noremap <silent> <C-s> :w! <bar> silent PrettierAsync <CR>
noremap <silent> <F5> :w! <bar> source ~/.config/nvim/init.vim <CR>

" ----- Custom shorcut -----
"
" Resize Tab
nmap <M-Right> :vertical resize +1<CR>    
nmap <M-Left> :vertical resize -1<CR>
nmap <M-Down> :resize +1<CR>
nmap <M-Up> :resize -1<CR>

" Switch Tab
nnoremap <M-l> <C-w>l
nnoremap <M-h> <C-w>h

" Close Tab
nnoremap <C-w> :bd <CR>

" 	Move line up and donw
nnoremap m :m+ <CR>
nnoremap n :m-2 <CR>
