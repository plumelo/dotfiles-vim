" Leader
let mapleader = " "

" General {{{
set autoread
set autowrite     " Automatically :write before running commands
set backspace=2   " Backspace deletes like most programs in insert mode
set complete=.,w,b,t
set history=50
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set lazyredraw
set mouse=nvi
set mousemodel=popup
set nofoldenable
set nostartofline

" Backup {{{1
set history=200
set backup backupdir=~/.vim/backup/
set undofile undodir=~/.vim/backup/undo/
set noswapfile

set nrformats-=octal
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set termguicolors
set timeoutlen=1200 " A little bit more time for macros
set ttimeoutlen=50  " Make Esc work faster
set title
set wildmenu
set wildmode=list:longest,list:full

" Airline
let g:airline#extensions#tabline#enabled = 1
set hidden
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='oceanicnext'

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

if filereadable(expand("~/.vim/vimrc.bundles"))
  source ~/.vim/vimrc.bundles
endif

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

filetype plugin indent on

" Theme
colorscheme OceanicNext
set background=dark

"airlines
let g:airline_theme='jellybeans'

" Speed
nnoremap <CR> :

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile Appraisals set filetype=ruby
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile .{jscs,jshint,eslint}rc set filetype=json
augroup END

" When the type of shell script is /bin/sh, assume a POSIX-compatible
" shell for syntax highlighting purposes.
let g:is_posix = 1

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Display extra whitespace
set list listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·,eol:¬

" Use one space, not two, after punctuation.
set nojoinspaces

" FZF {{{
if has('nvim')
  let $FZF_DEFAULT_OPTS .= ' --inline-info'
  " let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" nnoremap <silent> <Leader><Leader> :Files<CR>
nnoremap <silent> <expr> <Leader><Leader> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Files\<cr>"
nnoremap <silent> <Leader><Enter>  :Buffers<CR>
nnoremap <silent> <Leader>w       :Ag <C-R><C-W><CR>
nnoremap <silent> <Leader>       :Ag <C-R><C-A><CR>
xnoremap <silent> <Leader>ag       y:Ag <C-R>"<CR>
nnoremap <silent> <Leader>`        :Marks<CR>
" nnoremap <silent> q: :History:<CR>
" nnoremap <silent> q/ :History/<CR>

inoremap <expr> <c-x><c-t> fzf#complete('tmuxwords.rb --all-but-current --scroll 500 --min 5')
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

function! s:plugs_sink(line)
  let dir = g:plugs[a:line].dir
  for pat in ['doc/*.txt', 'README.md']
    let match = get(split(globpath(dir, pat), "\n"), 0, '')
    if len(match)
      execute 'tabedit' match
      return
    endif
  endfor
  tabnew
  execute 'Explore' dir
endfunction

command! PlugHelp call fzf#run(fzf#wrap({
  \ 'source':  sort(keys(g:plugs)),
  \ 'sink':    function('s:plugs_sink')}))
" }}}

" Make it obvious where 80 characters is
" set textwidth=80
" set colorcolumn=+1

" Numbers
set number

" Numbers
set number
let g:NumberToggleTrigger="<F5>"

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
" [neocomplete] Use tab to select a completion, Ctrl+K to expand a snippet,
" Ctrl+H to close Neocomplete
let g:neocomplete#enable_at_startup = 1
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
imap <expr><TAB>
\ pumvisible() ? "\<C-n>" :
\ neosnippet#expandable_or_jumpable() ?
\    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
inoremap <expr><C-h> pumvisible() ? "\<C-y>" : "\<C-h>"
" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/plugged/neosnippet-snippets/neosnippets, ~/.vim/plugged/vim-snippets/snippets'
" Load CraftCMS Snippets
let g:neosnippet#scope_aliases = {}
let g:neosnippet#scope_aliases['twig'] = 'twig,jinja,html,js,css,craft'

" Linting {{{
let g:ale_enabled=0
nnoremap <F7> :ALEToggle<CR>

" NERDTree {{{
map <silent> - :NERDTreeToggle<CR>
map <silent> <F2> :NERDTreeFind<CR>
"autocmd StdinReadPre * let s:std_in=1
" let NERDTreeShowHidden=1
let g:NERDTreeWinSize=30
let g:NERDTreeAutoDeleteBuffer=1
let g:NERDTreeMouseMode=3

" Nerdcommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDCommentEmptyLines = 1
let g:NERDDefaultAlign = 'left'

" Tabular
nnoremap <Leader>t :Tabularize /
vnoremap <Leader>t :Tabularize /

" Indent guide
"autocmd InsertEnter * let save_cwd = getcwd() | set autochdir
"autocmd InsertLeave * set noautochdir | execute 'cd' fnameescape(save_cwd)
let g:indentLine_char='│'

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Buffers
nnoremap <C-right> : bnext<cr>
nnoremap <C-left>  : bprev<cr>

" <tab> / <s-tab> | Circular windows navigation
nnoremap <tab>   <c-w>w
nnoremap <S-tab> <c-w>W

" Always use vertical diffs
set diffopt+=vertical

" Remove trailing whitespace
nnoremap <leader>z m`:%s/\s\+$//<CR>:let @/=''<CR>``

