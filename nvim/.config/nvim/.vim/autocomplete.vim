" Autocomplete
"
" ctrl+n -> basic autocomplete
" ctrl+x+n -> autocomplete in current file
" ctrl+x+f -> filenames
" ctrl+x+] -> tags
" ctrl+x ctrl+o -> omnifunc
set omnifunc=syntaxcomplete#Complete

"MuComplete settings
set completeopt+=menuone
set shortmess+=c
set belloff+=ctrlg

" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
