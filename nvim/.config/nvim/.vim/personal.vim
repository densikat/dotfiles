" ------------------------------------------
" Inserts C header guard based on file name
" ------------------------------------------
function! CGuard()
    let filename = toupper(expand('%:r'))
    call setline(".","#ifndef " . filename . "_H")
    call append("$","#define " . filename . "_H")
    call append("$","")
    :normal 2gg
    :normal o
    :normal o
    :startinsert
    call append("$","#endif")
endfunction

nnoremap <leader>cg :call CGuard()<CR>
" ------------------------------------------
