" Language specific stuff

" for C-like  programming where comments have explicit end
" characters, if starting a new line in the middle of a comment automatically
" insert the comment leader characters:
autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0
autocmd FileType c,cpp,java set formatoptions+=ro shiftwidth=2 softtabstop=2
autocmd FileType c set omnifunc=ccomplete#Complete


" fixed indentation should be OK for XML and CSS. People have fast internet
" anyway. Indentation set to 2.
autocmd FileType html,xhtml,css,xml,xslt set shiftwidth=2 softtabstop=2

" two space indentation for some files
autocmd FileType vim,lua,nginx set shiftwidth=2 softtabstop=2

" ensure normal tabs in assembly files
" and set to NASM syntax highlighting
autocmd FileType asm set noexpandtab shiftwidth=8 softtabstop=0 syntax=nasm ft=nasm

" Python
autocmd FileType python setlocal shiftwidth=4 softtabstop=4 expandtab

" Tabs and spaces
set tabstop=4 " display 4 spaces whenever there is a tab
set expandtab " expand tabs to 4 spaces

augroup filetypedetect
      au! BufRead,BufNewFile *.asm       setfiletype nasm
augroup END
