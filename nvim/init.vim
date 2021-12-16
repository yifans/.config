" ref: 
" - A good vimrc: https://dougblack.io/words/a-good-vimrc.html


" ====
" Baisc configuration
" ====
" Colors
syntax enable           " enable syntax processing
" Space and Tabs
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set expandtab       " tabs are spaces

" UI Config
set number              " show line numbers
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
filetype indent on      " load filetype-specific indent files
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]

" Searching
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
" turn off search highlight
" nnoremap <LEADER><space> :nohlsearch<CR>

" Folding
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
" space open/closes folds
" nnoremap z za
set foldmethod=indent   " fold based on indent level


" basic config
set nocompatible  " 不与 Vi 兼容（采用 Vim 自己的操作命令）
set mouse=a


set nocompatible
set encoding=utf-8  
set t_Co=256
filetype indent on


set relativenumber
set scrolloff=4

" disable concealing for vim markdown
let g:indentLine_conceallevel = 0

" leader
let mapleader=","


" vim plug config
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot' "A collection of language packs for Vim.
Plug 'tpope/vim-surround'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdcommenter'
Plug 'majutsushi/tagbar'
Plug 'easymotion/vim-easymotion'
Plug 'yggdroot/indentline'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']} " markdown preview
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'christoomey/vim-tmux-navigator'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'


" Initialize plugin system
call plug#end()

" python
"
" let g:python_host_prog='/usr/local/bin/python'
let g:python_host_prog='/Users/yifans/.config/nvim/nvim_venv2/bin/python'
let g:python3_host_prog='/Users/yifans/.config/nvim/nvim_venv3/bin/python'

" color
syntax on
set t_Co=256
" Use onehalfdark or onehalflight
colorscheme onehalfdark
let g:airline_theme='onehalfdark'
" lightline
let g:lightline = { 'colorscheme': 'onehalfdark' }

" IndentLine: https://github.com/Yggdroot/indentLine/issues/59
" set conceallevel=1
" let g:indentLine_conceallevel=1

" map jj to ESC
imap jj <Esc>

" auto close vim if NERDTree is the only window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" NERDTree
" map <F4> :NERDTreeToggle<CR>
map <C-n> :NERDTreeToggle<CR>


" fzf.vim
nnoremap <silent> <C-p> :GFiles<CR>
nnoremap <silent> <Leader>f :Files<CR>
nnoremap <silent> <Leader>b :Buffers<CR>

" TagBar
nmap <F8> :TagbarToggle<CR>

" easymotion
nmap ss <Plug>(easymotion-s2)

" include Coc configuration from github
source ~/.config/nvim/coc_config.vim
