let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'mode_map': { 'c': 'NORMAL' },
      \ 'component': {
      \   'lineinfo': '⭡ %3l:%-2v',
      \ },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
      \ },
      \ 'inactive': {
      \   'left': [ [ 'absolutepath', 'winnum' ] ]
      \ },
      \ 'component_function' : {
      \   'modified'     : 'ModifiedStatusLine',
      \   'readonly'     : 'ReadonlyStatusLine',
      \   'fugitive'     : 'FugitiveStatusLine',
      \   'filename'     : 'FilenameStatusLine',
      \   'absolutepath' : 'AbsolutepathStatusLine',
      \   'winnum'       : 'WinnrStatusLine',
      \   'fileformat'   : 'FileformatStatusLine',
      \   'filetype'     : 'FiletypeStatusLine',
      \   'fileencoding' : 'FileencodingStatusLine',
      \   'mode'         : 'ModeStatusLine'
      \ },
      \ 'separator'    : { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator' : { 'left': '⮁', 'right': '⮃' }
      \ }

augroup LightLineColorScheme
  autocmd!
  autocmd ColorScheme * call s:lightline_update()
augroup END

function! s:lightline_update()
  let g:lightline.colorscheme = 'wombat'
  call lightline#init()
  call lightline#colorscheme()
  call lightline#update()
endfunction

function! ReadonlyStatusLine()
  return &readonly ? '⭤' : ''
endfunction

function! FugitiveStatusLine()
  if exists('*fugitive#head') && &ft != 'nerdtree' && &ft != 'agsv'
    let _ = fugitive#head()
    return strlen(_) ? '⭠ '._ : ''
  endif
  return ''
endfunction

function! ModeStatusLine()
  let fname = expand('%:t')
  return fname == '__Tagbar__' ? 'Tagbar' :
        \ fname == 'ControlP' ? 'CtrlP' :
        \ fname == '__Gundo__' ? 'Gundo' :
        \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
        \ fname =~ 'NERD_tree' ? 'NERDTree' :
        \ &ft == 'unite' ? 'Unite' :
        \ &ft == 'vimfiler' ? 'VimFiler' :
        \ &ft == 'vimshell' ? 'VimShell' :
        \ &ft == 'agsv' ? 'AgsView' :
        \ &ft == 'agse' ? 'AgsEdit' :
        \ winwidth(0) > 30 ? lightline#mode() : ''
endfunction

function! FilenameStatusLine()
  return ('' != ReadonlyStatusLine() ? ReadonlyStatusLine() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \  &ft == 'agsv' ? ags#get_status_string() :
        \  &ft == 'agse' ? '' :
        \  &ft == 'nerdtree' ? '' :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != ModifiedStatusLine() ? ' ' . ModifiedStatusLine() : '')
endfunction

function! AbsolutepathStatusLine()
  return &ft == 'nerdtree' ? 'NERDTree' : expand('%:p')
endfunction

function! ModifiedStatusLine()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! WinnrStatusLine()
  return winnr()
endfunction

function! FileformatStatusLine()
  return winwidth(0) > 90 ? &fileformat : ''
endfunction

function! FiletypeStatusLine()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! FileencodingStatusLine()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

