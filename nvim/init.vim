call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'connorholyday/vim-snazzy'
Plug 'mbbill/undotree'
Plug 'dhruvasagar/vim-table-mode'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'mhinz/vim-startify'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" Initialize plugin system
call plug#end()

colorscheme snazzy

" basic config
set mouse=a

let mapleader=" "
syntax on
set number
set norelativenumber

" window
" open new window
map sl :set splitright<CR>:vsplit<CR>
map sh :set nosplitright<CR>:vsplit<CR>
map sk :set nosplitbelow<CR>:split<CR>
map sj :set splitbelow<CR>:split<CR>

" 
map <LEADER>l <C-w>l
map <LEADER>k <C-w>k
map <LEADER>h <C-w>h
map <LEADER>j <C-w>j

map sv <C-w>t<C-w>H
map sh <C-w>t<C-w>K

" change window size
map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>

" tab
map tu :tabe<CR>
map th :-tabnext<CR>
map tl :+tabnext<CR>

