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
vim.opt.guifont = "CaskaydiaCove Nerd Font 18"
-- vim.opt.guifont = "DroidSansMono Nerd Font 11"
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false

vim.cmd("syntax enable")

-- Set path to nodejs
vim.g.coc_node_path = vim.fn.trim(vim.fn.system('which node'))

-- Plugin setup
vim.cmd [[packadd packer.nvim]]

require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use { 'dracula/vim', as = 'dracula' }
    use { 'catppuccin/nvim', as = 'catppuccin' }
    use 'navarasu/onedark.nvim'
    use { "catppuccin/nvim", as = "catppuccin" }
    use 'Rigellute/shades-of-purple.vim'
    use 'xiyaowong/transparent.nvim'

    --[[ Toggle term ]]
    use {"akinsho/toggleterm.nvim", tag = '*', config = function()
      require("toggleterm").setup()
    end}

    use 'styled-components/vim-styled-components'
    use { 'rrethy/vim-hexokinase', run = 'make hexokinase' }
    use 'gertjanreynaert/cobalt2-vim-theme'
    use 'nyoom-engineering/oxocarbon'
    use 'xiyaowong/nvim-transparent'
    use { 'neoclide/coc.nvim', branch = 'release' }
    use 'jiangmiao/auto-pairs'
    use { 'junegunn/fzf', run = function() vim.fn['fzf#install']() end }
    use 'junegunn/fzf.vim'
    use { 'prettier/vim-prettier', run = 'yarn install --frozen-lockfile --production' }
    use 'KabbAmine/vCoolor.vim'

    --[[ Comment ]]
    use 'fangjunzhou/comment-divider.nvim'

    --[[ Nvim tree ]]
    use 'nvim-tree/nvim-web-devicons'
    use 'nvim-tree/nvim-tree.lua'
    use 'DaikyXendo/nvim-material-icon'

    use 'numToStr/Comment.nvim'


    --[[ Lualine ]]
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    --[[ Barbar ]]
    --[[ use 'lewis6991/gitsigns.nvim'
    use 'romgrk/barbar.nvim' ]]


    use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}
end)

for _, source_file in ipairs(vim.fn.split(vim.fn.glob('~/.config/nvim/sources/*.vim'))) do
    vim.cmd('source ' .. source_file)
end

for _, source_file in ipairs(vim.fn.split(vim.fn.glob('~/.config/nvim/sources/*.lua'))) do
    vim.cmd('source ' .. source_file)
end

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true
