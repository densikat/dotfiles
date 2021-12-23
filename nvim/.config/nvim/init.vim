" Basic setup

" Turn off VI compatibility
set nocompatible

" Plug

let data_dir = '~/.config/nvim/.vim/'
if empty(glob(data_dir . 'autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" GUI stuff
autocmd vimenter * colorscheme base16-brewer
set background=dark
let base16colorspace=256  " Access colors present in 256 colorspace
"
" Highlight on yank
augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank { timeout = 130}
augroup END

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

" Time out on key codes but not mappings. Makesterminal Vim work sanely
set notimeout
set ttimeout
 
" Highlight incremental search and search terms
set is hls

" Mouse
set mouse=a "improves mouse scroll behaviour in terminal

" Enable syntax and and plugins (for netrw)
syntax enable
filetype on
filetype plugin on
filetype indent on

set clipboard^=unnamed,unnamedplus

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
let treesitter_path = glob(data_dir.'lua/treesitter.lua')
let pairclose_path = glob(data_dir.'lua/pairclose.lua')
let comment_path = glob(data_dir.'lua/comment.lua')
let mappings_path = glob(data_dir.'mappings.vim')
let functions_path = glob(data_dir.'functions.vim')

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

" Treesitter
exec "source " . treesitter_path

" Comment
exec "source " . comment_path

" Pairs
exec "source " . pairclose_path

" Mappings
exec "source " . mappings_path

" Functions
exec "source " . functions_path

"highlight Pmenu ctermbg=gray guibg=gray
"hi MatchParen ctermfg=black
"hi MatchParen ctermbg=white

" Override default backspace behaviour
set backspace=indent,eol,start

" Turn of auto-commenting
set formatoptions-=cro

" Line number settings
set number

