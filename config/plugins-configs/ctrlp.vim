" CtrlP
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_map = '<C-p>'
let g:ctrlp_working_path_mode = 'ra'
if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif

nmap ,l :CtrlPBuffer<CR>

