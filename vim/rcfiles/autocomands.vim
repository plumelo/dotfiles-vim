autocmd FileType nerdtree let b:cursorword=0
autocmd InsertEnter * let b:cursorword=0
autocmd InsertLeave * let b:cursorword=1

autocmd WinEnter,InsertLeave * set cursorline
autocmd WinLeave,InsertEnter * set nocursorline

" More eager than 'autoread'.
autocmd WinEnter,FocusGained * checktime

" Update filetype on save if empty
autocmd BufWritePost * nested
      \ if &l:filetype ==# '' || exists('b:ftdetect')
      \ |   unlet! b:ftdetect
      \ |   filetype detect
      \ | endif


" Reload Vim script automatically if setlocal autoread
autocmd BufWritePost,FileWritePost *.vim nested
      \ if &l:autoread > 0 | source <afile> |
      \   echo 'source '.bufname('%') |
      \ endif


" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
autocmd BufReadPost *
      \ if &ft !~ '^git\c' && ! &diff && line("'\"") > 0 && line("'\"") <= line("$")
      \|   exe 'normal! g`"zvzz'
      \| endif

" Disable paste and/or update diff when leaving insert mode
autocmd InsertLeave *
      \ if &paste | setlocal nopaste mouse=a | echo 'nopaste' | endif |
    \ if &l:diff | diffupdate | endif

