call plug#begin('~/.config/nvim/.vim/plugged')
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
Plug 'NLKNguyen/papercolor-theme'
Plug 'tpope/vim-vividchalk'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'chriskempson/base16-vim'
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'

" Typescript stuff
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/plenary.nvim'
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'
" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }

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

" Tree
nnoremap <F2> :NvimTreeToggle<CR>
