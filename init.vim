set encoding=UTF-8
set mouse=a
set tabstop=4
set shiftwidth=4
set expandtab
set number
set ignorecase
set termguicolors
set showtabline=10
set noswapfile
set nowrap
set ignorecase
set smartcase
set cursorline
set relativenumber
set autoindent
set smartindent

syntax enable

" 	Enable transparent background
let g:transparent_enabled = v:false

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
	Plug 'xiyaowong/nvim-transparent'

    " Style for code
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}


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

	" 	Generate Lorem paragraph

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
	Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }

	" 	Color picker
	Plug 'KabbAmine/vCoolor.vim'
call plug#end()

colorscheme onedark

" Setup to use font ligatures
set guifont=Fira\ Code\ NFM
syntax match Conceal /\(\%uE0A0\|\%uE0A1\|\%uE0A2\|\%uE0A3\|\%uE0A4\|\%uE0A5\|\%uE0A6\|\%uE0A7\|\%uE0A8\|\%uE0A9\|\%uE0AA\|\%uE0AB\|\%uE0AC\|\%uE0AD\|\%uE0AE\|\%uE0AF\|\%uE0B0\|\%uE0B1\|\%uE0B2\|\%uE0B3\|\%uE0B4\|\%uE0B5\|\%uE0B6\|\%uE0B7\|\%uE0B8\|\%uE0B9\|\%uE0BA\|\%uE0BB\|\%uE0BC\|\%uE0BD\|\%uE0BE\|\%uE0BF\)/ conceal cchar=

for source_file in split(glob('~/.config/nvim/command/*.command.vim'))
	execute 'source' source_file
endfor

for source_file in split(glob('~/.config/nvim/sources/*.vim'))
	execute 'source' source_file
endfor

  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif  

autocmd FileType php let b:prettier_ft_default_args = {
\ 'parser': 'php',
\ }
