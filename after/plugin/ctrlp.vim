scriptencoding utf-8

command! Ctrlp packadd ctrlp.vim
nnoremap <C-p> :Ctrlp<CR>:CtrlP<CR>
nnoremap <BS> :Ctrlp<CR>:CtrlPBuffer<CR>
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
