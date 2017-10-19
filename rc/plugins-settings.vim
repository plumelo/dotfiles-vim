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
let g:ags_edit_show_line_numbers = 1
let g:ags_no_stats = 1
let g:ags_stats_max_ln = 10000
nmap ,g :<C-u>Ags<Space>
nmap <silent> ,w :<C-u>Ags<CR>

" Markdown preview
let g:mkdp_path_to_chrome = "chromium"
map <silent> <f9> :<C-u>MarkdownPreview<CR>

" Ansible
let g:ansible_unindent_after_newline = 1

" CtrlP
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_map = '<C-p>'
let g:ctrlp_working_path_mode = 'ra'
if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif

nmap ,l :CtrlPBuffer<CR>

"clever f
let g:clever_f_repeat_last_char_inputs = ["\<CR>", "\<Tab>"]
let g:clever_f_across_no_line=0

" Delimitmate
let g:delimitMate_autoclose = 1
let g:delimitMate_matchpairs = "(:),[:],{:},<:>"
let g:delimitMate_jump_expansion = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_expand_cr = 2
let g:delimitMate_expand_inside_quotes = 1

" Simple complete
let g:mucomplete#enable_auto_at_startup = 1
inoremap <expr> <c-e> mucomplete#popup_exit("\<c-e>")
inoremap <expr> <c-y> mucomplete#popup_exit("\<c-y>")
inoremap <expr>  <cr> mucomplete#popup_exit("\<cr>")

" tree style file explorer
let g:netrw_liststyle=3
let g:netrw_browse_split=4
let g:netrw_winsize=25

" IndentLine
let g:indentLine_char = '┊'
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '·'

" Cursor shape konsole
" let &t_SI = "\<Esc>]50;CursorShape=1\x7"
" let &t_SR = "\<Esc>]50;CursorShape=2\x7"
" let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Cursor shape gnome
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

" Esearch
" let g:esearch = {
"   \ 'adapter':    'rg',
"   \ 'backend':    'vimproc',
"   \ 'out':        'win',
"   \ 'batch_size': 1000,
"   \ 'use':        ['visual', 'hlsearch', 'last'],
"   \}
