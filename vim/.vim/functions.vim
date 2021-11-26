" For C ifndef guard
function! CGuard()
    let filename = toupper(expand('%:r'))
    call setline(".","#ifndef " . filename . "_H")
    call append("$","#define " . filename . "_H")
    call append("$","")
    call append("$","#endif")
endfunction
