set encoding=UTF-8
set mouse=a
set tabstop=4
set shiftwidth=4
set number
set ignorecase
set termguicolors
set showtabline=10
set noswapfile
set nowrap
" 	Case insensitive
set ignorecase
set smartcase
			
syntax enable

" 	Set path to nodejs
let g:coc_node_path = trim(system('which node'))

" 	Configuration hexokinase
let g:Hexokinase_highlighters = ['backgroundfull']

" 	Show hidden file
let NERDTreeShowHidden=1

call plug#begin('~/.config/nvim/plugged')
	" 	Theme
	Plug 'dracula/vim', { 'as': 'dracula' }
	Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
	Plug 'joshdick/onedark.vim'
	Plug 'styled-components/vim-styled-components'
	Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
	Plug 'gertjanreynaert/cobalt2-vim-theme'
	Plug 'nyoom-engineering/oxocarbon'
	Plug 'Rigellute/shades-of-purple.vim'

	"	NerdTree
	Plug 'preservim/nerdtree'
	Plug 'Xuyuanp/nerdtree-git-plugin'
	Plug 'ryanoasis/vim-devicons'
	Plug 'scrooloose/nerdtree-project-plugin'
	Plug 'PhilRunninger/nerdtree-buffer-ops'
	Plug 'PhilRunninger/nerdtree-visual-selection'
	Plug 'scrooloose/nerdtree-project-plugin'

	"	VimCOC and Emmet (suggest code)
	Plug 'neoclide/coc.nvim', {'branch': 'release'}

	" 	Airline status bar
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'

	" 	Auto close bracket
	Plug 'jiangmiao/auto-pairs'

	" 	Float terminal
	Plug 'voldikss/vim-floaterm'

	" Fuzzy finder
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'

	" 	Prettier
	Plug 'prettier/vim-prettier', { 'do': 'npm install --frozen-lockfile --production' }

	" 	Color picker
	Plug 'KabbAmine/vCoolor.vim'
call plug#end()

colorscheme dracula

for source_file in split(glob('~/.config/nvim/command/*.command.vim'))
	execute 'source' source_file
endfor

for source_file in split(glob('~/.config/nvim/sources/*.vim'))
	execute 'source' source_file
endfor

  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif
