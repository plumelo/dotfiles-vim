
" Key-mappings
"---------------------------------------------------------

" Non-standard {{{
" ------------
" Speed
nnoremap ; :

" No Highlight
nmap <silent> <Esc><Esc> :nohlsearch<CR>

" Toggle fold
nnoremap <CR> za

" Focus the current fold by closing all others
nnoremap <S-Return> zMza

" Use backspace key for matchit.vim
nmap <BS> %
xmap <BS> %

"}}}
" Global niceties {{{
" ---------------

" Improve scroll, credits: https://github.com/Shougo
nnoremap <expr> zz (winline() == (winheight(0)+1) / 2) ?
	\ 'zt' : (winline() == 1) ? 'zb' : 'zz'

" }}}
" File operations {{{
" ---------------

" When pressing <leader>cd switch to the directory of the open buffer
map <Leader>cd :lcd %:p:h<CR>:pwd<CR>

" }}}
" Editor UI {{{
" ---------

" Show highlight names under cursor
nmap gh :echo 'hi<'.synIDattr(synID(line('.'), col('.'), 1), 'name')
	\.'> trans<'.synIDattr(synID(line('.'), col('.'), 0), 'name').'> lo<'
	\.synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name').'>'<CR>

" }}}
" Totally Custom {{{
" --------------

" Duplicate lines
nnoremap <Leader>d m`YP``
vnoremap <Leader>d YPgv

" Drag current line/s vertically and auto-indent
vnoremap <C-Up> :m-2<CR>gv=gv
vnoremap <C-Down> :m'>+<CR>gv=gv
noremap  <C-Up> :m-2<CR>
noremap  <C-Down> :m+<CR>

" Indent
vnoremap <TAB> >gv
vnoremap <S-TAB> <gv

" }}}

function! s:BufferEmpty() "{{{
	let l:current = bufnr('%')
	if ! getbufvar(l:current, '&modified')
		enew
		silent! execute 'bdelete '.l:current
	endif
endfunction "}}}
" }}}

" vim: set ts=2 sw=2 tw=80 noet :
