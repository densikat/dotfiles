" Tag jumping
" ctrl+] to jump to symbol under curdor
" g+ctrl+] to show all definitions of symbol (if there are multiple)
" ctrl+t to jump back to tag stack
" ProjectTags needs silver searcher
command! MakeTags !ctags -R --exclude=node_modules --exclude=__pycache__ --exclude=build --exclude=.meteor --exclude='packages/*/.build/' .
command! ProjectTags !ag -l | ctags --links=no -L- 
