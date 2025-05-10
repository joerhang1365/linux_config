" .vimrc - Joseph Hanger

" SETTINGS ---------------------------------------------------------------- {{{

set nocompatible            " disable vi compatibility
set nobackup                " donot sace backup files
syntax enable               " enable syntax processing
filetype plugin indent on   " enable filetype detection and plugins

" visual
set number                  " show line numbers
set cursorline              " highlight current line
set showcmd                 " show command in bottom bar
set showmode                " show mode used on last line
set showmatch               " show matching words during a search
set wildmenu                " visual autocomplete for command menu
set lazyredraw              " redraw only when needed
set nowrap                  " allow long lines to extend
set signcolumn=yes          " always show sign column (for gitgutter, linters)
set colorcolumn=80          " show 80 character limit
set background=dark
set foldmethod=marker
set guifont=FiraCode\ Nerd\ Font\ Mono:h12

" enable true color support
if has('termguicolors')
    set termguicolors
endif

let g:catppuccin_flavour = "frappe"

" editing
set tabstop=4               " number of visual spaces per TAB
set softtabstop=4           " number of spaces in tab when editing
set shiftwidth=4            " number of spaces for autoindent
set expandtab               " convert tabs to spaces
set autoindent              " autoindent new lines
set smartindent             " smart autoindenting
set backspace=indent,eol,start " make backspace work normally
set splitbelow              " horizontal splits open below
set splitright              " vertical splits open to the right
set scrolloff=10            " disable cursor scrolling N below last line
set wildmode=list:longest   " behave like similar BASH completion
set wildignore=*.exe
set history=1000            " number of comands to save in history
set clipboard=unnamed
set undofile                " save previous changes
set undodir=~/.vim/undodir

" search
set incsearch               " search as characters are entered
set hlsearch                " highlight matches
set ignorecase              " case-insensitive search
set smartcase               " case-sensitive if search contains uppercase

" performance
set hidden                  " allow background buffers without saving
set updatetime=300          " faster completion (default 4000ms)
set ttyfast                 " faster redrawing
set lazyredraw

" NERDTree
let NERDTreeShowHidden=1

" vim-gitgutter
set updatetime=100

" }}}

" KEY MAPPINGS ------------------------------------------------------------ {{{
"
let mapleader = "\\"         " set leader key to space

" escape insert mode
inoremap jj <ESC>

" pressing space types ':' in command mode
nnoremap <space> :

" auto complete brackets and such
inoremap \' \'\'<left>
inoremap \" \"\"<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<cr> {<cr>}<esc>O

" split window using 'CTRL+j' 'CTRL+k' 'CTRL+h' 'CTRL+l'
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" resize split windows using arrow keys
noremap <c-up> <c-w>+
noremap <c-down> <c-w>-
noremap <c-left> <c-w>>
noremap <c-right> <c-w><

" buffers
nnoremap <leader>bl :buffers<CR>
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>
nnoremap <leader>bd :bdelete<CR>

" clear search highlights
nnoremap <silent> <leader>/ :nohlsearch<CR>

" NERDTree toggle open and close
nnoremap <F3> :NERDTreeToggle<cr>

" fzf.vim
nnoremap <C-p> :Files<CR>
nnoremap <leader>ff :Rg<CR>

" }}}

" PLUGINS ----------------------------------------------------------------- {{{

" automatically install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'

if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" start vim-plug
call plug#begin('~/.vim/plugged')

" file navigation
Plug 'preservim/nerdtree'              " file explorer
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'                " fuzzy finder

" color scheme
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

" git integration
Plug 'airblade/vim-gitgutter'          " git diff markers

call plug#end()

colorscheme catppuccin_frappe

" }}}

" VIMSCRIPT --------------------------------------------------------------- {{{

" enable code folding using the marker method
" 'zo' to open; 'zc' to close; 'zR' to open all; 'zM' to close all;
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" }}}

" AUTOCMD ----------------------------------------------------------------- {{{

" NERDTree
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" remove trailing whitespaces on save
autocmd BufWritePre * %s/\s\+$//e

" when editing RISCV assembly set tab
autocmd FileType RISCV setlocal shiftwidth=5 tabstop=5

" }}}

" STATUS LINE ------------------------------------------------------------- {{{

set statusline=
set statusline+=\ %F\ %M\ %Y\ %R
set statusline+=%=
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%
set laststatus=2    " show the staus on the second to last line

" }}}
