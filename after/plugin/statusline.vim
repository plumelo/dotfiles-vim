scriptencoding utf-8

if exists('g:loaded_statline_plugin')
  finish
endif
let g:loaded_statline_plugin = 1

"filename
hi default link User1 Special
" flags
hi default link User2 Constant
" errors
hi default link User3 Error
" fugitive
hi default link User4 Special
" new alert
hi default link User5 ErrorMsg

" ====== basic info ======

" ---- set default value of variable ----
function s:SetDefaultVal(var, val)
  if !exists({'a:var'})
    let {a:var} = a:val
  endif
endfunction

" ---- number of buffers : buffer number ----

function! StatlineBufCount()
  if !exists('s:statline_n_buffers')
    let s:statline_n_buffers = len(filter(range(1,bufnr('$')), 'buflisted(v:val)'))
  endif
  return s:statline_n_buffers
endfunction

set statusline=[%{StatlineBufCount()}\:%n]\ %<
" only calculate buffers after adding/removing buffers
augroup statline_nbuf
  autocmd!
  autocmd BufAdd,BufDelete * unlet! s:statline_n_buffers
augroup END

" ---- filename (relative or tail) ----

set statusline+=%1*[%f]%*

" ---- flags ----

" (h:help:[help], w:window:[Preview], m:modified:[+][-], r:readonly:[RO])
set statusline+=%2*%h%w%m%r%*

" ---- filetype ----

set statusline+=\ %y

" ---- file format → file encoding ----

if &encoding == 'utf-8'
  let g:statline_encoding_separator = '→'
else
  let g:statline_encoding_separator = ':'
endif

if !exists('g:statline_show_encoding')
  let g:statline_show_encoding = 1
endif
if !exists('g:statline_no_encoding_string')
  let g:statline_no_encoding_string = 'NoEnc'
endif
if g:statline_show_encoding
  set statusline+=[%{&ff}%{g:statline_encoding_separator}%{strlen(&fenc)?&fenc:g:statline_no_encoding_string}]
endif

" ---- Fugitive ----

set statusline+=%4*%{exists('g:loaded_fugitive')?fugitive#statusline():''}%*

" ---- paste mode ---
call s:SetDefaultVal('g:statline_show_paste', '1')
call s:SetDefaultVal('g:statline_show_paste_string', '[PASTE!]')
if g:statline_show_paste
  set statusline+=\ %5*%{&paste?(g:statline_show_paste_string):''}%*
endif

" ---- separation between left/right aligned items ----

set statusline+=%=

" ---- current line and column ----

" (-:left align, 14:minwid, l:line, L:nLines, c:column)
set statusline+=%-14(\ L%l/%L:C%c\ %)

" ----  scroll percent ----

set statusline+=%P

" ====== custom errors ======
" ---- mixed indenting ----

if !exists('g:statline_mixed_indent')
  let g:statline_mixed_indent = 1
endif

if !exists('g:statline_mixed_indent_string')
  let g:statline_mixed_indent_string = '[mix]'
endif

"return '[&et]' if &et is set wrong
"return '[mixed-indenting]' if spaces and tabs are used to indent
"return an empty string if everything is fine
function! StatlineTabWarning()
  if !exists('b:statline_indent_warning')
    let b:statline_indent_warning = ''

    if !&modifiable
      return b:statline_indent_warning
    endif

    let l:tabs = search('^\t', 'nw') != 0

    "find spaces that arent used as alignment in the first indent column
    let l:spaces = search('^ \{' . &tabstop . ',}[^\t]', 'nw') != 0

    if l:tabs && l:spaces
      let b:statline_indent_warning = g:statline_mixed_indent_string
    elseif (l:spaces && !&expandtab) || (l:tabs && &expandtab)
      let b:statline_indent_warning = '[&et]'
    endif
  endif
  return b:statline_indent_warning
endfunction

if g:statline_mixed_indent
  set statusline+=%3*%{StatlineTabWarning()}%*

  " recalculate when idle and after writing
  augroup statline_indent
    autocmd!
    autocmd cursorhold,bufwritepost * unlet! b:statline_indent_warning
  augroup END
endif

" --- trailing white space ---

if !exists('g:statline_trailing_space')
  let g:statline_trailing_space = 1
endif

function! StatlineTrailingSpaceWarning()
  if !exists('b:statline_trailing_space_warning')
    if search('\s\+$', 'nw') != 0
      let b:statline_trailing_space_warning = '[\s]'
    else
      let b:statline_trailing_space_warning = ''
    endif
  endif
  return b:statline_trailing_space_warning
endfunction

if g:statline_trailing_space
  set statusline+=%3*%{StatlineTrailingSpaceWarning()}%*

  " recalculate when idle, and after saving
  augroup statline_trail
    autocmd!
    autocmd cursorhold,bufwritepost * unlet! b:statline_trailing_space_warning
  augroup END
endif
