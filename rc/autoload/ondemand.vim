function! ondemand#nerdtree()
  packadd nerdtree
endfunction

function! ondemand#fzf()
  packadd fzf.vim
endfunction

function! ondemand#completion()
  packadd vim-autocomplpop
endfunction

function! ondemand#linting()
  packadd ale
  let g:ale_sign_error = '*'
  let g:ale_sign_warning = '⚠'
endfunction

function! ondemand#gitgutter()
  packadd vim-gitgutter
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
endfunction
