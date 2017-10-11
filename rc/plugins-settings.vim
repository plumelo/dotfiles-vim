" NerdTree
nnoremap - :NERDTreeToggle<CR>
nnoremap <Leader>- :NERDTreeFind<CR>
let g:NERDTreeMinimalUI = 1
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeMouseMode=3
let g:NERDTreeWinSize=25
let g:NERDTreeShowHidden=1
let g:NERDTreeKeepTreeInNewTab=1
let g:NERDTreeDirArrows=0

" Search Ags
nmap ,g :<C-u>Ags<Space>
nmap <silent> ,w :<C-u>Ags<CR>

" Markdown preview
let g:mkdp_path_to_chrome = "chromium"
map <silent> <f9> :<C-u>MarkdownPreview<CR>

" Ansible
let g:ansible_unindent_after_newline = 1

" CtrlP
nmap ,l :CtrlPBuffer<CR>

" Delimitmate
let g:delimitMate_autoclose = 1
let g:delimitMate_matchpairs = "(:),[:],{:},<:>"
let g:delimitMate_jump_expansion = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_expand_cr = 2
let g:delimitMate_expand_inside_quotes = 1

" tree style file explorer
let g:netrw_liststyle=3
let g:netrw_browse_split=4
let g:netrw_winsize=25

" Cursor shape konsole
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Cursor shape gnome
" let &t_SI = "\<Esc>[6 q"
" let &t_SR = "\<Esc>[4 q"
" let &t_EI = "\<Esc>[2 q"
