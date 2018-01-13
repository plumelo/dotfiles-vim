scriptencoding utf-8

" Clear hlsearch
nnoremap <silent> <Esc><Esc> :nohlsearch<CR>

" reload vim and file
nmap <leader><leader> :source $MYVIMRC<cr>
nmap ,, :e<CR>

" physical moving
noremap j gj
noremap k gk

" indent
xnoremap > >gv
xnoremap < <gv

" quick save, quit and undo
nnoremap <C-s> :<C-u>update<CR>
nnoremap <C-q> :<C-u>bw<CR>
inoremap <C-s> <Esc>:<C-u>update<CR>
vnoremap <C-s> <C-C>:<C-u>update<CR>
inoremap <C-z> <C-o>u

" Easier to type
noremap H ^
noremap L $
vnoremap L g_

" avoid mistyping commands
command! W w
command! Wq wq
command! Bd bd
command! Q q
command! Qa qa

" widows
nnoremap <silent> <Tab>      :wincmd w<CR>
nnoremap <silent> <S-Tab>      :wincmd W<CR>
nnoremap <silent><expr> ,q winnr('$') != 1 ? ':<C-u>close<CR>' : ""
nnoremap <silent> <C-Up> :vertical resize +1<CR>
nnoremap <silent> <C-Down> :vertical resize -1<CR>

" visual select
nmap vv viw
vmap <Space> <esc>

" repeat last command for each line of a visual selection
vnoremap . :normal .<CR>

" numbers
noremap ,n :set invnumber<CR>

" snippets
let g:minisnip_trigger = '<C-Space>'
