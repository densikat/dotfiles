" Basic setup

" Turn off VI compatibility
set nocompatible

" Plug

let data_dir = '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif"

" GUI stuff
autocmd vimenter * colorscheme torte
highlight Pmenu ctermbg=gray guibg=gray
set background=dark

" Highlight incremental search and search terms
set is hls

" Mouse
set mouse=a "improves mouse scroll behaviour in terminal

" Enable syntax and and plugins (for netrw)
syntax enable
filetype on
filetype plugin on
filetype indent on

" Tags
source ~/.vim/plugins.vim

" Autocomplete
source ~/.vim/autocomplete.vim

" Override default backspace behaviour
set backspace=indent,eol,start

" Turn of auto-commenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Line number settings
set number

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
