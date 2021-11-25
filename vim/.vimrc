" Turn off VI compatibility
set nocompatible

" Enable syntax and and plugins (for netrw)
syntax enable
filetype on
filetype plugin on
filetype indent on

" Plug

let data_dir = '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif"
" GUI stuff
autocmd vimenter * colorscheme torte
set background=dark
set textwidth=79
"set t_Co=256

" allow backgrounding buffers without writing thempp" allow backgrounding buffers without writing them
set hidden

" have some context around the current line always on screen
set scrolloff=3

" Time out on key codes but not mappings. Makes terminal Vim work sanely
set notimeout
set ttimeout
set ttimeoutlen=100

" Highlight incremental search and search terms
set is hls
set ignorecase
set smartcase

" Override default backspace behaviour
set backspace=indent,eol,start

" Turn of auto-commenting
set formatoptions-=cro

" Line number settings
set number

" Set modelines off
set modelines=0

" Mouse
set mouse=a "improves mouse scroll behaviour in terminal

" Key Mappings
source ~/.vim/mappings.vim

" Tags
source ~/.vim/plugins.vim

" Autocomplete
source ~/.vim/autocomplete.vim

" Language specific filestype stuff (tabs, spaces etc)
source ~/.vim/filetype.vim

" Set path for :find command, includes ignores etc
source ~/.vim/filesearch.vim

" Tags
source ~/.vim/tags.vim

" File explorer
source ~/.vim/netrw.vim

" Linting
source ~/.vim/linting.vim

" Status line
source ~/.vim/statusline.vim

" X86 Assembly
source ~/.vim/asmx86.vim
