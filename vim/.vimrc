" Basic setup

" Turn off VI compatibility
set nocompatible

" GUI stuff
autocmd vimenter * colorscheme torte
highlight Pmenu ctermbg=gray guibg=gray
set background=dark

" Enable syntax and and plugins (for netrw)
syntax enable
filetype on
filetype plugin on
filetype indent on

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

" Autocomplete
source ~/.vim/autocomplete.vim

" File explorer
source ~/.vim/netrw.vim

" Auto close brackets
source ~/.vim/autoclosebrackets.vim

" Linting
source ~/.vim/linting.vim

" Status line
source ~/.vim/statusline.vim

