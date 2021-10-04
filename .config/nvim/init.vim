" -- Plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'joshdick/onedark.vim'
Plug 'sainnhe/edge'
Plug 'b4skyx/serenade'
Plug 'sainnhe/gruvbox-material'
Plug 'https://github.com/rakr/vim-one'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mikelue/vim-maven-plugin'

Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'jiangmiao/auto-pairs'
Plug 'ashzero2/VimPilot'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'mhinz/vim-startify'
Plug 'tpope/vim-commentary'
Plug 'akinsho/nvim-bufferline.lua'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'glepnir/spaceline.vim'
Plug 'kyazdani42/nvim-web-devicons'
call plug#end()

" colorscheme & syntax
colorscheme onedark
syntax on
syntax enable
set hidden
set modeline
set modelines=5
set shortmess+=c
set noshowmode

" remove that dumb ~ 
highlight EndOfBuffer ctermfg=black ctermbg=black
hi EndOfBuffer guifg=#1e222a

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup
set cmdheight=1

" some important settings
set splitright
set splitbelow
set termguicolors
set guioptions-=e
set noswapfile
set clipboard+=unnamedplus
set expandtab sw=2
set mouse=a

"" misc btw
set numberwidth =3
set number
set completeopt=menuone,noselect

set cursorline
highlight clear CursorLine

hi CocWarningSign  ctermfg=red guifg=#dbbc7f
hi CocErrorSign  ctermfg=red guifg=#e67e80

lua require'colorizer'.setup()
source ~/.config/nvim/maps.vim
source ~/.config/nvim/after/plugin/remains.vim


