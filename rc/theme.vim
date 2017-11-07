set t_Co=256

if !has('nvim')
  set term=xterm-256color

  " Change cursor shape.
  let &t_SI = "\<Esc>[6 q"
  let &t_SR = "\<Esc>[4 q"
  let &t_EI = "\<Esc>[0 q"
endif

" Enable true color
if exists('+termguicolors')
  set termguicolors
endif

set background=dark
let g:kolor_italic=1
let g:kolor_inverted_matchparen=1
colorscheme kolor
