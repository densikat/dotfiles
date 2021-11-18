" Basic setup

" Turn off VI compatibility
set nocompatible

" Plug

let data_dir = '~/.config/nvim/.vim/'
if empty(glob(data_dir . 'autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif"

" GUI stuff
autocmd vimenter * colorscheme base16-brewer
set background=dark
let base16colorspace=256  " Access colors present in 256 colorspace

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
let plugin_path = glob(data_dir.'plugins.vim')
let autocomplete_path = glob(data_dir.'autocomplete.vim')
let filetype_path = glob(data_dir.'filetype.vim')
let filesearch_path = glob(data_dir.'filesearch.vim')
let tags_path = glob(data_dir.'tags.vim')
let netrw_path = glob(data_dir.'netrw.vim')
let linting_path = glob(data_dir.'linting.vim')
let statusline_path = glob(data_dir.'statusline.vim')
let asmx86_path = glob(data_dir.'asmx86.vim')

exec "source " . plugin_path

" Autocomplete
exec "source " . autocomplete_path

" Language specific filestype stuff (tabs, spaces etc)
exec "source " . filetype_path

" Set path for :find command, includes ignores etc
exec "source " . filesearch_path

" Tags
exec "source " . tags_path

" File explorer
exec "source " . netrw_path

" Linting
exec "source " . linting_path

" Status line
exec "source " . statusline_path

" X86 Assembly
exec "source " . asmx86_path

highlight Pmenu ctermbg=gray guibg=gray
hi MatchParen ctermfg=black
hi MatchParen ctermbg=white

" Override default backspace behaviour
set backspace=indent,eol,start

" Turn of auto-commenting
set formatoptions-=cro

" Line number settings
set number
