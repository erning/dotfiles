set nocompatible
filetype off

set encoding=UTF-8
set nomodeline
set noswapfile
set nobackup
set viminfo=

let mapleader = " "
let maplocalleader = " "
set timeoutlen=250

"""
call plug#begin('~/.vim/plugged')
Plug 'joshdick/onedark.vim'             " color scheme
Plug 'sheerun/vim-polyglot'             " syntax highlight
Plug 'editorconfig/editorconfig-vim'    " editorconfig
Plug 'itchyny/lightline.vim'            " statusline
Plug 'liuchengxu/vim-which-key'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
if has('macunix')
  Plug 'ybian/smartim'
endif
call plug#end()


"""
if has('gui_running')
  " set guifont=PragmataPro_Liga:h18
  set guifont=JetBrainsMono_Nerd_Font:h18
  set guioptions-=m  "remove menu bar
  set guioptions-=T  "remove toolbar
  set guioptions-=r  "remove right-hand scroll bar
  set guioptions-=L  "remove left-hand scroll bar
endif

"""" enable 24bit true color
" If you have vim >=8.0 or Neovim >= 0.1.5
if has("termguicolors")
  set termguicolors
endif
" rxvt dost not support 24-bit color yet?
if $TERM =~ "rxvt"
  set notermguicolors
endif

"Disable arrow keys in Normal mode
no <Up> <Nop>
no <Down> <Nop>
no <Left> <Nop>
no <Right> <Nop>

"Disable arrow keys in Insert mode
ino <Up> <Nop>
ino <Down> <Nop>
ino <Left> <Nop>
ino <Right> <Nop>

" number
" set number
set relativenumber

" scheme
syntax on
" silent! color gruvbox
silent! colorscheme onedark
set background=dark

" search
set incsearch
set ignorecase
set smartcase
set hlsearch
" press esc twice to turn off search highlight
nnoremap <esc><esc> :silent! nohls<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => lightline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2
set noshowmode

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => WhichKey
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 8 spaces
set shiftwidth=4
set tabstop=8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Uncomment to autostart the NERDTreefault
" autocmd vimenter * NERDTree
nnoremap <Leader>e :NERDTreeToggle<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable='▸'
let g:NERDTreeDirArrowCollapsible='▾'
let NERDTreeShowLineNumbers=0
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => fzf
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>fb :Buffers<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mouse and Clipboard
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set mouse=nicr
"set mouse=a
"vnoremap Y y:'<,'>w !pbcopy<CR><CR>
" set clipboard=unnamed

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Splits and Tabbed Files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set splitbelow splitright
