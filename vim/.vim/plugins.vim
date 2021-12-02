call plug#begin('~/.vim/plugged')
" BETTER FILE TREE
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" WHICH KEY
Plug 'liuchengxu/vim-which-key'

" SURROUND THINGS
Plug 'tpope/vim-surround'

" GIT
Plug 'tpope/vim-fugitive'

" Uses native completion
Plug 'lifepillar/vim-mucomplete'

" Basic terraform plugin
Plug 'hashivim/vim-terraform'

" Python formatting
Plug 'psf/black', { 'branch': 'stable' }

" Syntax highlighting
Plug 'sheerun/vim-polyglot'

" Highlight yanked buffer
Plug 'machakann/vim-highlightedyank'

" CLOSE PAIRS
Plug 'tmsvg/pear-tree'

" Fuzzy find
Plug 'ctrlpvim/ctrlp.vim'

" THEMES
Plug 'chriskempson/base16-vim'
call plug#end()

" Python Settings
" Requires Jedi to be installed via pip
autocmd BufWritePre *.py execute ':Black'

" Terraform Settings
" Requires terraform installed on the path
let g:terraform_align = 1
let g:terraform_fmt_on_save = 1

" Yank highlighting
let g:highlightedyank_highlight_duration = 120

" Define default completion chain
let g:mucomplete#chains = { 'default':
            \ [ 'omni','tags','keyn','keyp','path','line'] }

" Polyglot
let g:polyglot_disabled = ['autoindent']

" CtrlP
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_by_filename = 1
let g:ctrlp_use_caching = 1
