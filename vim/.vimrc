" Turn off VI compatibility
set nocompatible

" Enable syntax and plugins
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
autocmd vimenter * colorscheme base16-brewer
set background=dark
set textwidth=79

" Tmux related settings
if exists('+termguicolors') && ($TERM == "screen-256color" || $TERM == "tmux-256color")
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

" Change cursor shape on insert mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" Unwanted characters
" https://vim.fandom.com/wiki/Highlight_unwanted_spaces
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Default split behaviour
set splitbelow
set splitright

" No swap file
set noswapfile

" allow backgrounding buffers without writing them
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

" Polyglot
let g:polyglot_disabled = ['csv']

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

" My helper functions
source ~/.vim/functions.vim

" Tags
source ~/.vim/tags.vim

" Linting
source ~/.vim/linting.vim

" Status line
source ~/.vim/statusline.vim

" X86 Assembly
source ~/.vim/asmx86.vim

" Abbreviations
source ~/.vim/abbreviations.vim
