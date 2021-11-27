let mapleader=" "

nnoremap <F2> :NERDTreeToggle<CR>
nnoremap <leader>ff :CtrlP<CR>
nnoremap <leader>ft :CtrlPTag<CR> " Fuzzy tag search
nnoremap <leader>rr :so $MYVIMRC<CR> " Reload vimrc
nnoremap <leader>h :noh<CR>  " Clear highlighting
nnoremap <leader>sw :call CSwitchToOppositePair()<CR>  " Switch between c/h file in C
nnoremap <leader>cg :call CGuard()<CR>  " Insert header guard in c file

" Make sure visual mode is retained when indenting
" https://vim.fandom.com/wiki/Shifting_blocks_visually
" Allows for easier indenting
vnoremap > >gv
vnoremap < <gv

