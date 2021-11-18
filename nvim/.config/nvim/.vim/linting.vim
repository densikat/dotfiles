" :make to lint
" :cl to list errors
" :cc# to jump to error by number
" :cn :cp to nav forward and back
autocmd FileType javascript setlocal makeprg=eslint\ --format\ compact
autocmd FileType typescript setlocal makeprg=eslint\ --format\ compact
autocmd FileType python setlocal makeprg=pylint\ --output-format=parseable

