" Tree
nnoremap <F2> :NERDTreeToggle<CR>

" Reload config
nnoremap <leader>rr :so $MYVIMRC<CR>
"
" Clear highlighting
nnoremap <leader>h :noh<CR>  

" Telescope
nnoremap <leader>ff <cmd>Telescope git_files<cr>
nnoremap <leader>fa <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" LSP
nnoremap <leader>gd <cmd>lua vim.lsp.buf.definition()<cr>
nnoremap <leader>rn <cmd>lua vim.lsp.buf.rename()<cr>

" Trouble
nnoremap <leader>xd <cmd>TroubleToggle lsp_document_diagnostics<cr>

" Custom functions
nnoremap <leader>sw :call CSwitchToOppositePair()<CR>  " Switch between c/h file in C
nnoremap <leader>cg :call CGuard()<CR>  " Insert header guard in c file

" Make sure visual mode is retained when indenting
" https://vim.fandom.com/wiki/Shifting_blocks_visually
" Allows for easier indenting
vnoremap > >gv
vnoremap < <gv

