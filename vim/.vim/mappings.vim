let mapleader=" "

nnoremap <F2> :NERDTreeToggle<CR>
nnoremap <leader>ff :CtrlPMixed<CR>
nnoremap <leader>ft :CtrlPTag<CR> " Fuzzy tag search
nnoremap <leader>rr :so $MYVIMRC<CR> " Reload vimrc
nnoremap <leader>h :noh<CR>  " Clear highlighting

" Make sure visual mode is retained when indenting
" https://vim.fandom.com/wiki/Shifting_blocks_visually
" Allows for easier indenting
vnoremap > >gv
vnoremap < <gv

