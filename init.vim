

"     _______________________________________   
"    |                                       |
"    |          (_)                          |
"    |   __   __ _  _ __ ___   _ __   ___    |
"    |   \ \ / /| || '_ ` _ \ | '__| / __|   |
"    |    \ V / | || | | | | || |   | (__    |
"    |     \_/  |_||_| |_| |_||_|    \___|   |
"    |                                       |
"    |_______________________________________|



" Basic Defaults

syntax on

set guifont=FiraMono_NF:h11:cANSI
set relativenumber
set clipboard=unnamed
set noerrorbells
set tabstop=4 softtabstop=4 
set expandtab
set shiftwidth=4
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set scrolloff=10
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set nocompatible
set encoding=UTF-8
filetype plugin on

highlight colorcolumn ctermbg=0 guibg=lightgrey

"PLugin Initialized
call plug#begin('~/.vim/plugged')

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" File Explorer for vim
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Themes and visual asthetics.
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'morhetz/gruvbox'

"Plugin for my custom snippets and there are also language specifc
"snippets prebuilt.
Plug 'honza/vim-snippets'

"fuzzy finder for vim
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" vim-wiki plugin to create notes
Plug 'vimwiki/vimwiki'

" AutoCompletion Plugin for vim 
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Plugin for the auto close of the brackets and quotes
Plug 'vim-scripts/delimitMate.vim'

"Plugin for syntax checker
Plug 'vim-syntastic/syntastic' 

"git-wrapper for vim
Plug 'tpope/vim-fugitive'

"starter page for nvim.
Plug 'mhinz/vim-startify'

" Initialize plugin system
call plug#end()
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='simple'

"Syntastics settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let wiki_1 = {}
let wiki_1.path = '~/vimwiki/'
let wiki_1.syntax = 'markdown'
let wiki_1.ext = '.md'

let wiki_2 = {}
let wiki_1.syntax = 'default'
let wiki_2.ext = '.wiki'

let g:vimwiki_list = [wiki_1, wiki_2]
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}

"Setting up my leader.
let mapleader=','

"Toggle between windows.
noremap<leader>h :wincmd h<CR>
noremap<leader>j :wincmd j<CR>
noremap<leader>k :wincmd k<CR>
noremap<leader>l :wincmd l<CR>

"source the file.
noremap<leader>s :source %<CR>

"Change pwd to current file directory.
noremap<leader>pwd :cd %:p:h<CR>

"Buffer List
noremap<leader>b :Buffers<CR>

"Custom Commands.

"Open the _vimrc file.
command Config :edit ~/.config/nvim/init.vim

"Delete current buffer.
command Delete :bdelete

"Toggle between themes.
command ThemeDark :colorscheme base16-gruvbox-dark-hard
command ThemeLight :colorscheme base16-github
command ThemeDefault :colorscheme base16-onedark

"Default theme
colorscheme gruvbox

"Basic key map

"Toggle the File Explorer => ctrl + n
map <C-n> :NERDTreeToggle<CR>

"Toggle between fullscreen => <F4>
map <F4> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>

"Hide menu bar => ctrl + m
map<C-m> :set guioptions-=m<CR>

"Hide Toolbar => ctrl + t
map<C-t> :set guioptions-=T<CR>

"Set colorscheme to default
map<C-d> :colorscheme default<CR>

"Open fuzzy file finder
map<C-f> :FZF<CR>

"Buffer next
map<C-Tab> :bn<CR>

"Cpp compile and run
map<F5> :w <CR> :!cls && g++ % && a.exe<CR>
