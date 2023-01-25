set encoding=UTF-8
set mouse=a
set tabstop=4
set shiftwidth=4
set number
set ignorecase
set showtabline=10
set termguicolors
set noswapfile
set nowrap
" 	Case insensitive
set ignorecase
set smartcase

" 	Set path to nodejs
let g:coc_node_path = trim(system('which node'))

" 	Configuration airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'LanguageClient'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'

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
	Plug 'duane9/nvim-rg'

	" 	Prettier
	Plug 'prettier/vim-prettier', { 'do': 'npm install --frozen-lockfile --production' }

	" 	Color picker
	Plug 'KabbAmine/vCoolor.vim'
call plug#end()

" 	Set colorscheme
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

  " unicode symbols
  let g:airline_left_sep = '»'
  let g:airline_left_sep = '▶'
  let g:airline_right_sep = '«'
  let g:airline_right_sep = '◀'
  let g:airline_symbols.colnr = ' ㏇:'
  let g:airline_symbols.colnr = ' ℅:'
  let g:airline_symbols.crypt = '🔒'
  let g:airline_symbols.linenr = '☰'
  let g:airline_symbols.linenr = ' ␊:'
  let g:airline_symbols.linenr = ' ␤:'
  let g:airline_symbols.linenr = '¶'
  let g:airline_symbols.maxlinenr = ''
  let g:airline_symbols.maxlinenr = '㏑'
  let g:airline_symbols.branch = '⎇'
  let g:airline_symbols.paste = 'ρ'
  let g:airline_symbols.paste = 'Þ'
  let g:airline_symbols.paste = '∥'
  let g:airline_symbols.spell = 'Ꞩ'
  let g:airline_symbols.notexists = 'Ɇ'
  let g:airline_symbols.notexists = '∄'
  let g:airline_symbols.whitespace = 'Ξ'

  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.colnr = ' ℅:'
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ' :'
  let g:airline_symbols.maxlinenr = '☰ '
  let g:airline_symbols.dirty='⚡'


