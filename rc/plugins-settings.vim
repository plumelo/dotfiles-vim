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

" Tcommand
nmap <silent> ,t :<C-u>TCommand<CR>

" Outline
nmap ,o :<C-u>TToC<CR>

" CtrlP
nmap ,l :CtrlPBuffer<CR>

" Lightline
" let g:lightline = {
"       \ 'colorscheme': 'wombat',
"       \ 'active': {
"       \   'left': [ [ 'mode', 'paste' ],
"       \             [ 'gitbranch', 'readonly', 'relativepath', 'modified' ] ]
"       \ },
"       \ 'component_function': {
"       \   'gitbranch': 'fugitive#head'
"       \ },
"       \ }

let g:lightline = {
  \ 'colorscheme': 'wombat',
  \ 'active': {
  \   'left': [ [ 'relativepath' ],
  \             [ 'linter',  'gitbranch' ] ],
  \   'right': [ [ 'percent', 'lineinfo' ],
  \              [ 'fileencoding', 'filetype' ] ]
  \ },
  \ 'component_function': {
  \   'modified': 'WizMod',
  \   'readonly': 'WizRO',
  \   'gitbranch': 'WizGit',
  \   'filename': 'WizName',
  \   'filetype': 'WizType',
  \   'fileencoding': 'WizEncoding',
  \   'mode': 'WizMode',
  \ },
  \ 'component_expand': {
  \   'linter': 'WizErrors',
  \ },
  \ 'component_type': {
  \   'readonly': 'error',
  \   'linter': 'error'
  \ },
  \ 'separator': { 'left': '▓▒░', 'right': '░▒▓' },
  \ 'subseparator': { 'left': '▒', 'right': '░' }
  \ }
" \ 'separator': { 'left': '▊▋▌▍▎', 'right': '▎▍▌▋▊' },

function! WizGit()
  return exists('*fugitive#head') ? fugitive#head() : ''
endfunction

function! WizName()
  let l:name = expand('%:t')
  if l:name =~ 'NetrwTreeListing'
    return ''
  endif
  return ('' != WizRO() ? WizRO() : WizMod()) .
        \ ('' != expand('%:t') ? expand('%:t') : '[none]')
endfunction

function! WizType()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : '') : ''
endfunction

function! WizEncoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &enc : &enc) : ''
endfunction

function! WizErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  return l:counts.total == 0 ? '' : printf('×%d', l:counts.total)
endfunction

augroup alestatus
  au!
  autocmd User ALELint call lightline#update()
augroup END

" Delimitmate
let g:delimitMate_autoclose = 1
let g:delimitMate_matchpairs = "(:),[:],{:},<:>"
let g:delimitMate_jump_expansion = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_expand_cr = 2
let g:delimitMate_expand_inside_quotes = 1

let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_ignore_case = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_auto_select = 1
let g:neocomplcache_enable_fuzzy_completion = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_fuzzy_completion_start_length = 1
let g:neocomplcache_auto_completion_start_length = 1
let g:neocomplcache_manual_completion_start_length = 1
let g:neocomplcache_min_keyword_length = 1
let g:neocomplcache_min_syntax_length = 1
" complete with workds from any opened file
let g:neocomplcache_same_filetype_lists = {}
let g:neocomplcache_same_filetype_lists._ = '_'

" tree style file explorer
let g:netrw_liststyle=3
let g:netrw_browse_split=4
let g:netrw_winsize=25

" linting
let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '× '
let g:ale_sign_warning = '> '
"let g:ale_open_list = 1
"let g:ale_lint_on_text_changed = 'never'
highlight ALEErrorSign ctermbg=234 ctermfg=magenta

" Clever-f
let g:clever_f_smart_case = 1
let g:clever_f_across_no_line = 1

" Maximize
map <silent> <C-m> :call ToggleMaximizeCurrentWindow()<CR>
