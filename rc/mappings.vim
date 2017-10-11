" Mappings
nmap <leader><leader> :source $MYVIMRC<cr>
" Physical moving
noremap j gj
noremap k gk
" Yank to the end of line. (It is same as C and D)
nnoremap Y y$
" Very magic by default.
nnoremap / /\v
nnoremap ? ?\v

" Repeat on Visual-mode.
vnoremap <silent> . :normal .<CR>
vnoremap <silent> @q :normal @q<CR>

" Scroll + Move
nnoremap <C-j> <C-e>gj
nnoremap <C-k> <C-y>gk

" Don't use commands.
noremap ZZ <Nop>
noremap ZQ <Nop>
noremap <C-z> <Nop>
noremap <F1> <Nop>

" Quick save, quit and undo
nnoremap <silent> <c-s> :<C-u>update<CR>
nnoremap <silent> <c-q> :<C-u>bd<CR>
inoremap <silent> <c-s> <Esc>:<C-u>update<CR>
imap <silent> <c-z> <c-o>u

" avoid mistyping commands
command! W w
command! Wq wq
command! Bd bd
command! Q q

" Move between splits
nnoremap <tab> <c-w>w
