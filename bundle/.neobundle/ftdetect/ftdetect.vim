augroup agsResultsWindowEdit
  autocmd!
  autocmd BufNewFile,BufRead,BufEnter *.agse set filetype=agse
  autocmd BufWriteCmd *.agse call ags#edit#write()
augroup END

augroup agsResultsWindowView
  autocmd!
  autocmd BufNewFile,BufRead,BufEnter *.agsv set filetype=agsv
  autocmd BufEnter,BufWinEnter *.agsv call ags#navigateResultsOnLine()
  autocmd CursorHold,CursorMoved,BufLeave,BufWinLeave *.agsv call ags#cleanYankedText()
augroup END
" Detect syntax file.
autocmd BufNewFile,BufRead *.snip,*.snippets set filetype=neosnippet
