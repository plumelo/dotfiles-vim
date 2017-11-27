function! ondemand#nerdtree()
  packadd nerdtree
  let g:NERDTreeShowHidden = 1
  let g:NERDTreeChDirMode = 1
  let g:NERDTreeMinimalUI = 1
  let g:NERDTreeMouseMode = 3
endfunction

function! ondemand#completion()
  packadd neocomplete.vim
  NeoCompleteEnable
  let g:acp_enableAtStartup = 0
  let g:neocomplete#enable_at_startup = 0
  let g:neocomplete#enable_smart_case = 1
  let g:neocomplete#sources#syntax#min_keyword_length = 3
  let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
  inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"
  inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endfunction

function! ondemand#linting()
  packadd ale
  let g:ale_sign_error = '*'
  let g:ale_sign_warning = '⚠'
endfunction

function! ondemand#gitgutter()
  packadd vim-gitgutter
endfunction


function! ondemand#search()
  packadd vim-ags
endfunction

function! ondemand#sign()
  packadd vim-sign-deferred
endfunction

function! ondemand#lessspace()
  packadd lessspace.vim
endfunction

function! ondemand#delimitmate()
  packadd delimitMate
  let g:delimitMate_expand_cr = 2
  let g:delimitMate_expand_space = 1
endfunction

function! ondemand#tiler()
  packadd tiler.vim
endfunction

function! ondemand#minisnip()
  packadd vim-minisnip
  let g:minisnip_trigger = '<C-g>'
endfunction

" Strip the newline from the end of a string
function! Chomp(str)
  return substitute(a:str, '\n$', '', '')
endfunction

" Find a file and pass it to cmd
function! ondemand#DmenuOpen(cmd)
  let fname = Chomp(system("git ls-files | dmenu -i -l 20 -p " . a:cmd))
  if empty(fname)
    return
  endif
  execute a:cmd . " " . fname
endfunction
