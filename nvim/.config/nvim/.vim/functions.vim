" For C ifndef guard
function! CGuard()
    let filename = toupper(expand('%:t:r'))
    call setline(".","#ifndef " . filename . "_H")
    call append("$","#define " . filename . "_H")
    call append("$","")
    call append("$","#endif")
endfunction

" Switch to .c if its a header and the inverse
function! CSwitchToOppositePair()
    let filename = expand('%:p')
    let ext = expand('%:e')
    if ext ==? "c"
        let filetoswitch = substitute(filename, "\.c$", ".h", "")
        execute "edit " . filetoswitch
    endif

    if ext ==? "h"
        let filetoswitch = substitute(filename, "\.h$", ".c", "")
        execute "edit " . filetoswitch
    endif
endfunction

