" File finding
" Provides tab completion for file related tasks
" Use tab to :find by partial match
" Use * to make it fuzzy
"set path+=**
set wildignore=*.o,*.obj,*~,*.pyc,*.bin "stuff to ignore when tab completing
set wildignore+=**/node_modules/**
set wildignore+=/node_modules/**
set wildignore+=__pycache__/
set wildignore+=.git,.gitkeep
set wildignore+=.venv
set wildignore+=.vscode/
set wildignore+=.idea/
set wildignore+=.serverless/
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*.egg,*.egg-info
set wildignore+=*DS_Store*

" Find doesn't filter on wildignore (just hides in menu)
" The below will set the path to include what's in wildignore
autocmd VimEnter * call s:set_path()
function! s:set_path() abort
  let l:dirs = filter(systemlist('find . -maxdepth 1 -type d'), {_,dir ->
        \ !empty(dir) && empty(filter(split(&wildignore, ','), {_,v -> v =~? dir[2:]}))
        \ })

  if !empty(l:dirs)
    let &path = &path.','.join(map(l:dirs, 'v:val[2:]."/**"'), ',')
  endif
endfunction

" Display all matching files when we tab complete
" :b lets you autocomplete any open buffer
set wildmenu
