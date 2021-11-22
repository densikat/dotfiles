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
let linting_path = glob(data_dir.'linting.vim')
let personal_path = glob(data_dir.'personal.vim')
let asmx86_path = glob(data_dir.'asmx86.vim')
let lsp_path = glob(data_dir.'lua/lsp.lua')
let tree_path = glob(data_dir.'lua/nvimtree.lua')
let treesitter_path = glob(data_dir.'lua/treesitter.lua')
let pairclose_path = glob(data_dir.'lua/pairclose.lua')

" LEADER KEY
let mapleader = " " " map leader to Space

exec "source " . plugin_path

" Autocomplete
exec "source " . autocomplete_path

" Language specific filestype stuff (tabs, spaces etc)
exec "source " . filetype_path

" Set path for :find command, includes ignores etc
exec "source " . filesearch_path

" Tags
exec "source " . tags_path

" My functions
exec "source " . personal_path

" Linting
exec "source " . linting_path

" X86 Assembly
exec "source " . asmx86_path

" LSP (for typescript)
exec "source " . lsp_path

" NVIM tree
exec "source " . tree_path

" Treesitter
exec "source " . treesitter_path

highlight Pmenu ctermbg=gray guibg=gray
hi MatchParen ctermfg=black
hi MatchParen ctermbg=white

" Override default backspace behaviour
set backspace=indent,eol,start

" Turn of auto-commenting
set formatoptions-=cro

" Line number settings
set number
