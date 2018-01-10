scriptencoding utf-8

set t_Co=256

" Enable true color
if has('termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[0 q"

" colorscheme base16-monokai
" colorscheme base16-spacemacs
" colorscheme base16-gruvbox-dark-pale
" colorscheme dko
" colorscheme base16-onedark
colorscheme apprentice

highlight ALEErrorSign guifg=red guibg=#262626
highlight ALEWarningSign guifg=yellow guibg=#262626
