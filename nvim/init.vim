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
set colorcolumn=120

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


set smartindent

set nocompatible
set encoding=utf-8  
set t_Co=256
filetype indent on


set relativenumber
set scrolloff=4

" disable concealing for vim markdown
" let g:indentLine_conceallevel = 0
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0


" leader
let mapleader=" "


" vim plug config
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'sheerun/vim-polyglot' "A collection of language packs for Vim.
Plug 'tpope/vim-surround'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdcommenter'
Plug 'majutsushi/tagbar'
Plug 'easymotion/vim-easymotion'
Plug 'yggdroot/indentline'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']} " markdown preview
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'tpope/vim-surround'
Plug 'neovim/nvim-lspconfig'
Plug 'ellisonleao/glow.nvim'
Plug 'morhetz/gruvbox'
Plug 'williamboman/nvim-lsp-installer'
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'simrat39/symbols-outline.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'sainnhe/gruvbox-material'

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
colorscheme gruvbox-material

" IndentLine: https://github.com/Yggdroot/indentLine/issues/59
" set conceallevel=1
" let g:indentLine_conceallevel=1

" map jj to ESC
imap jj <Esc>

" auto close vim if NERDTree is the only window open
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" NERDTree
" map <F4> :NERDTreeToggle<CR>
" map <C-n> :NERDTreeToggle<CR>
" map <leader>r :NERDTreeFind<cr>


" make clipboard work
set clipboard=unnamed

" shortcuts
" Find files using Telescope command-line sugar.
nnoremap <silent> ;f <cmd>Telescope find_files hidden=true<cr>
nnoremap <silent> ;r <cmd>Telescope live_grep<cr>
nnoremap <silent> \\ <cmd>Telescope buffers<cr>
nnoremap <silent> ;; <cmd>Telescope help_tags<cr>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" TagBar
nmap <F8> :TagbarToggle<CR>

" easymotion
nmap ss <Plug>(easymotion-s2)

" autocmd BufWrite *.md TableFormat

lua require'nvim-tree'.setup {}

lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
}
EOF


lua <<EOF
local lsp_installer = require("nvim-lsp-installer")

-- Include the servers you want to have installed by default below
local servers = {
  "pyright",
  "tsserver",
  "terraformls"
}

for _, name in pairs(servers) do
  local server_is_found, server = lsp_installer.get_server(name)
  if server_is_found and not server:is_installed() then
    print("Installing " .. name)
    server:install()
  end
end

-- Register a handler that will be called for each installed server when it's ready (i.e. when installation is finished
-- or if the server is already installed).
lsp_installer.on_server_ready(function(server)
    local opts = {}

    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end

    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    -- This setup() function will take the provided server configuration and decorate it with the necessary properties
    -- before passing it onwards to lspconfig.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
end)

EOF

let g:coq_settings = { 'auto_start': v:true }
source ~/.config/nvim/nvim-tree-config.vim
