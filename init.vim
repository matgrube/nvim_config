syntax on

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set hidden
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set colorcolumn=80
set signcolumn=yes
set completeopt=menuone,noinsert,noselect

highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.config/nvim/plugged')
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'gruvbox-community/gruvbox'

Plug 'preservim/nerdtree'

Plug 'frazrepo/vim-rainbow'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1

Plug 'ryanoasis/vim-devicons'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = ['coc-tsserver', 'coc-json', 'coc-git', 'coc-css', 'coc-python']
Plug 'tpope/vim-fugitive'
Plug 'zivyangll/git-blame.vim'

Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', {'branch': 'main'}
Plug 'jparise/vim-graphql'

Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

call plug#end()

colorscheme gruvbox
highlight Normal guibg=none

let mapleader = " "
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep for > ")})<cr>

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
