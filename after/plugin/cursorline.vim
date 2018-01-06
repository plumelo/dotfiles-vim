scriptencoding utf-8

augroup cline
  au!
  au WinLeave,InsertEnter * set nocursorline
  au WinEnter,BufWinEnter,InsertLeave * set cursorline
augroup END
