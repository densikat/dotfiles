call plug#begin('~/.vim/plugged')
" Python Plugins
Plug 'psf/black', { 'branch': 'stable' }
Plug 'lifepillar/vim-mucomplete'
Plug 'davidhalter/jedi-vim'
Plug 'hashivim/vim-terraform'
Plug 'sheerun/vim-polyglot'
Plug 'jdsimcoe/hyper.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'jiangmiao/auto-pairs'
Plug 'fladson/vim-kitty'
call plug#end()

" Python Settings
" Requires Jedi to be installed via pip
autocmd BufWritePre *.py execute ':Black'
let g:jedi#popup_on_dot = 0

" Terraform Settings
" Requires terraform installed on the path
let g:terraform_align = 1
let g:terraform_fmt_on_save = 1

" Yank highlighting
let g:highlightedyank_highlight_duration = 150

