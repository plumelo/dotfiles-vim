scriptencoding utf-8

" For Undo Revision, Break Undo Sequence "{{{
inoremap <CR> <C-g>u<CR>
inoremap <C-h> <C-g>u<C-h>
inoremap <BS> <C-g>u<BS>
inoremap <Del> <C-g>u<Del>
inoremap <C-d> <C-g>u<Del>
inoremap <C-w> <C-g>u<C-w>
inoremap <C-u> <C-g>u<C-u>
"}}}

" Emacs-like cursor move in insert/command-line mode "{{{
" :h mapmode-ic
noremap! <C-b> <Left>
noremap! <C-f> <Right>
noremap! <C-a> <Home>
noremap! <C-e> <End>
" }}}

" Command line History {{{
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
"}}}

" Yank from cursor position to end of line
nnoremap Y y$

" Yank with keeping cursor position in visual mode {{{
function! s:keepcursor_visual_wrapper(command)
  execute 'normal! gv' . a:command
  execute "normal! gv\<ESC>"
endfunction
xnoremap <silent> y :<C-u>call <SID>keepcursor_visual_wrapper('y')<CR>
xnoremap <silent> Y :<C-u>call <SID>keepcursor_visual_wrapper('Y')<CR>
"}}}

" Repeat on every line {{{
" repeat last command for each line of a visual selection
vnoremap . :normal .<CR>
" replay @q macro for each line of a visual selection
vnoremap @q :normal @q<CR>
"}}}

" clear status
nnoremap <silent><Esc><Esc> :<C-u>nohlsearch<CR>

" Select pasted text
nnoremap <expr>gp '`['.strpart(getregtype(),0,1).'`]'

" Don't use register by x
nnoremap x "_x

" Enter insert mode at the end of line (repeatable)
nnoremap gA A<C-g>U<Left>

" quickfix
nnoremap [q :cprevious<CR>
nnoremap ]q :cnext<CR>
nnoremap [Q :cpfile<CR>
nnoremap ]Q :cnfile<CR>

function! s:on_FileType_quickfix()
  noremap <buffer> p  <CR>zz<C-w>p
endfunction

autocmd vimrc FileType qf call s:on_FileType_quickfix()

nnoremap ;b :<C-u>ls<CR>:b<Space>

" reload vim and file
nmap <leader><leader> :source $MYVIMRC<cr>
nmap ,, :e<CR>

" physical moving
noremap j gj
noremap k gk
nmap 0 ^
nmap 9 $

" indent
nnoremap > >>
nnoremap < <<
xnoremap > >gv
xnoremap < <gv

" quick save, quit and undo
nnoremap <silent> <c-s> :<C-u>update<CR>
nnoremap <silent> <c-q> :<C-u>bd<CR>
inoremap <silent> <c-s> <Esc>:<C-u>update<CR>
imap <silent> <c-z> <c-o>u

" avoid mistyping commands
command! W w
command! Wq wq
command! Bd bd
command! Q q
command! Qa qa

" widows
nnoremap [Window] <Nop>
nmap z [Window]
nnoremap <silent> [Window]v  :<C-u>vsplit<CR>:wincmd w<CR>
nnoremap <silent> [Window]o  :<C-u>only<CR>
nnoremap <silent> <Tab>      :wincmd w<CR>
nnoremap <silent><expr> q winnr('$') != 1 ? ':<C-u>close<CR>' : ""

" visual select
nmap vv viw
vmap <Space> <esc>
nmap vl ^vg_

" don't use commands.
noremap ZZ <Nop>
noremap ZQ <Nop>
noremap <C-z> <Nop>
noremap <F1> <Nop>

"""" Select most recent paste
nmap gV vgb

"""" Copy to system clipboard
nnoremap <Leader>y "+y
vnoremap <Leader>y "+y

"""" Paste from system clipboard
nnoremap <Leader>p "+p
vnoremap <Leader>p "+p
nnoremap <Leader>P "+P
vnoremap <Leader>P "+P
