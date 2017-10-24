let g:gruvbox_italic=1

let s:colors = [
      \ 'NeoSolarized',
      \ 'monokai',
      \ 'kolor',
      \ 'onedark',
      \ 'seattle',
      \ 'badwolf',
      \ 'carbonized-dark',
      \ 'desertEx',
      \ 'earendel',
      \ 'golden',
      \ 'jellybeans',
      \ 'lucius',
      \ 'mango',
      \ 'molokai',
      \ 'mustang',
      \ 'sourcerer',
      \ 'space-vim-dark',
      \ 'smyck',
      \ 'tomorrow-night',
      \ 'wombat256',
      \ 'zenburn',
      \ ]

function! colors#_change(index)
  let l:idx = a:index
  if idx < 0
    let l:idx = len(s:colors) - 1
  elseif idx > len(s:colors) - 1
    let l:idx = 0
  endif

  let l:name = s:colors[idx]
  silent! execute "colorscheme ".name
endfunction

function! colors#_callback()
  hi MatchParen cterm=underline ctermbg=none ctermfg=none gui=underline guifg=NONE guibg=NONE
endfunction

function! colors#next()
  let l:next_index = index(s:colors, g:colors_name) + 1
  call colors#_change(next_index)
endfunction

function! colors#prev()
  let l:prev_index = index(s:colors, g:colors_name) - 1
  call colors#_change(prev_index)
endfunction

function! colors#toggle_background()
  if &background == 'light'
    set background=dark
  else
    set background=light
  endif
endfunction

function! colors#peek()
  echo g:colors_name . ' - ' . &background
endfunction

command! ColorsPrev call colors#prev()
command! ColorsNext call colors#next()
command! ColorsToggleBG call colors#toggle_background()
command! ColorsPeek call colors#peek()

map <silent><F2> :ColorsPrev<cr>
map <silent><F3> :ColorsNext<cr>
map <silent><F4> :ColorsToggleBG<cr>
map <silent><F5> :ColorsPeek<cr>
set background=dark

if has('termguicolors')
  set termguicolors
  if &term =~# '^screen'
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  endif
endif
autocmd! ColorScheme * silent! call colors#_callback()

try
  colorscheme NeoSolarized
catch
endtry
