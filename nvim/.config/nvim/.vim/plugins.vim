call plug#begin('~/.config/nvim/.vim/plugged')
" Python Plugins
Plug 'psf/black', { 'branch': 'stable' }
Plug 'hashivim/vim-terraform'
Plug 'windwp/nvim-autopairs'
Plug 'fladson/vim-kitty'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'chriskempson/base16-vim'
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'nvim-telescope/telescope.nvim' " Fuzzy search
Plug 'itchyny/lightline.vim' " Status line
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-orgmode/orgmode'

" Vim Script
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/trouble.nvim'

"Typescript stuff
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/plenary.nvim'
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/cmp-buffer'

"
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }

call plug#end()

" Python Settings
" Requires Jedi to be installed via pip
autocmd BufWritePre *.py execute ':Black'

" Terraform Settings
" Requires terraform installed on the path
let g:terraform_align = 1
let g:terraform_fmt_on_save = 1

" Yank highlighting
"let g:highlightedyank_highlight_duration = 150
