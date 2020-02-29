set nocompatible
filetype off

set encoding=UTF-8
set nomodeline
set noswapfile
set nobackup
set viminfo=


"""
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'                  " color scheme
Plug 'sheerun/vim-polyglot'             " syntax highlight
Plug 'editorconfig/editorconfig-vim'    " editorconfig
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'          " Airline
" Plug 'vim-airline/vim-airline-themes' " Airline Themes
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
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
if (has("termguicolors"))
  set termguicolors
endif
" set notermguicolors  " mosh doesn't support 24-bit color yet

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
set number
set relativenumber

" scheme
syntax on
silent! color gruvbox
set background=dark

" search
set incsearch
set ignorecase
set smartcase
set hlsearch
" press esc twice to turn off search highlight
nnoremap <esc><esc> :silent! nohls<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
" let g:airline_theme='angr'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Uncomment to autostart the NERDTreefault
" autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable='▸'
let g:NERDTreeDirArrowCollapsible='▾'
let NERDTreeShowLineNumbers=0
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => CtrlP
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_show_hidden=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mouse and Clipboard
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set mouse=nicr
set mouse=a
set clipboard=unnamed

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Splits and Tabbed Files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set splitbelow splitright
