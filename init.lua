vim.opt.compatible = false
vim.opt.cmdheight = 2
vim.opt.encoding = "utf-8"
vim.opt.mouse = "a"
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.ignorecase = true
vim.opt.termguicolors = true
vim.opt.showtabline = 10
vim.opt.swapfile = false
vim.opt.wrap = false
vim.opt.smartcase = true
vim.opt.cursorline = true
vim.opt.relativenumber = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.guifont = "CaskaydiaCove Nerd Font"
-- vim.opt.guifont = "DroidSansMono Nerd Font 11"

vim.cmd("syntax enable")

-- Enable transparent background
vim.g.transparent_enabled = true

vim.g.airline_powerline_fonts = 1

-- Set path to nodejs
vim.g.coc_node_path = vim.fn.trim(vim.fn.system('which node'))

-- Configuration hexokinase
vim.g.Hexokinase_highlighters = { 'backgroundfull' }

-- Show hidden file
vim.g.NERDTreeShowHidden = 1

vim.g.LanguageClient_serverCommands = {
    sql = { 'sql-language-server', 'up', '--method', 'stdio' },
}

-- Plugin setup
vim.cmd [[packadd packer.nvim]]

require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use { 'dracula/vim', as = 'dracula' }
    use { 'catppuccin/nvim', as = 'catppuccin' }
    use 'navarasu/onedark.nvim'

    use 'styled-components/vim-styled-components'
    use { 'rrethy/vim-hexokinase', run = 'make hexokinase' }
    use 'gertjanreynaert/cobalt2-vim-theme'
    use 'nyoom-engineering/oxocarbon'
    use 'Rigellute/shades-of-purple.vim'
    use 'xiyaowong/nvim-transparent'
    use 'nvim-tree/nvim-tree.lua'
    use { 'neoclide/coc.nvim', branch = 'release' }
    use 'fangjunzhou/comment-divider.nvim'
    use 'vim-airline/vim-airline'
    use 'vim-airline/vim-airline-themes'
    use 'jiangmiao/auto-pairs'
    use 'voldikss/vim-floaterm'
    use { 'junegunn/fzf', run = function() vim.fn['fzf#install']() end }
    use 'junegunn/fzf.vim'
    use { 'prettier/vim-prettier', run = 'yarn install --frozen-lockfile --production' }
    use 'KabbAmine/vCoolor.vim'
    use 'ryanoasis/vim-devicons'

    use {
      'nvim-tree/nvim-tree.lua',
      requires = {
        'nvim-tree/nvim-web-devicons', -- optional
      },
    }
    use 'DaikyXendo/nvim-material-icon'

    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
end)

require('Comment').setup(
    {
        toggler = {
            line = '<C-_>',
            block = '<C-_>',
        },
    }
)

require('onedark').load()

for _, source_file in ipairs(vim.fn.split(vim.fn.glob('~/.config/nvim/sources/*.vim'))) do
    vim.cmd('source ' .. source_file)
end

for _, source_file in ipairs(vim.fn.split(vim.fn.glob('~/.config/nvim/sources/*.lua'))) do
    vim.cmd('source ' .. source_file)
end

if not vim.g.airline_symbols then
    vim.g.airline_symbols = {}
end

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true
