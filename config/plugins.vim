" NeoBundle check and auto install
let fullBundle=1
let NeoBundle_readme=expand('~/.vim/bundle/neobundle.vim/README.md')
if !filereadable(NeoBundle_readme)
    echo "Installing NeoBundle.."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
    let fullBundle=0
endif

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim', {
      \   'depends': ['Shougo/vimproc.vim'],
      \ }

NeoBundle 'Shougo/vimproc.vim', {
      \   'build' : {
      \'linux' : 'make',
      \   },
      \ }

NeoBundle 'junegunn/fzf', {
      \ 'base' : '~/.fzf',
      \ 'directory' : 'fzf',
      \ 'name' : 'fzf',
      \ 'regular_name' : 'fzf',
      \ }

NeoBundle 'junegunn/fzf.vim'
if neobundle#tap('fzf.vim')
  function! neobundle#tapped.hooks.on_source(bundle)
    let g:fzf_layout = { 'down': '~40%' }
    let g:fzf_colors =
          \ { 'fg':      ['fg', 'Normal'],
          \ 'bg':      ['bg', 'Normal'],
          \ 'hl':      ['fg', 'Comment'],
          \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
          \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
          \ 'hl+':     ['fg', 'Statement'],
          \ 'info':    ['fg', 'PreProc'],
          \ 'prompt':  ['fg', 'Conditional'],
          \ 'pointer': ['fg', 'Exception'],
          \ 'marker':  ['fg', 'Keyword'],
          \ 'spinner': ['fg', 'Label'],
          \ 'header':  ['fg', 'Comment'] }
    let g:fzf_buffers_jump = 1
    command! -bang -nargs=* Rg
          \ call fzf#vim#grep(
          \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
          \   <bang>0 ? fzf#vim#with_preview('up:60%')
          \           : fzf#vim#with_preview('right:50%:hidden', '?'),
          \   <bang>0)
    nmap ,p :Rg<space>

    command! -bang -nargs=? -complete=dir Files
          \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
    nmap <Leader>] :Files<CR>
    nmap <Leader>[ :FZF<space>
    command! -bang Colors
          \ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 30%,0'}, <bang>0)
    nmap ,k :Colors<cr>
    nmap ,l :Buffers<cr>
    nmap ,m :Marks<cr>
    nmap ,h :History<cr>
    nmap ,f :Filetypes<cr>
  endfunction
  call neobundle#untap()
endif
NeoBundle 'rafi/vim-tinyline'

NeoBundle 'maralla/completor.vim', {
      \   'on_i': 1,
      \ }

NeoBundle 'maralla/completor-neosnippet', {
      \ 'depends': 'Shougo/neosnippet.vim',
      \ 'on_i': 1,
      \ }

NeoBundle 'Shougo/neosnippet.vim', {
      \   'depends': ['maralla/completor.vim', 'Shougo/neosnippet-snippets'],
      \   'on_cmd': 'NeoSnippetEdit',
      \   'on_i': 1,
      \ }
if neobundle#tap('neosnippet.vim')
  function! neobundle#tapped.hooks.on_source(bundle)
    let g:neosnippet#snippets_directory = '~/.vim/snippets'
    imap <expr><TAB>
          \ pumvisible() ? "\<C-n>" :
          \ neosnippet#expandable_or_jumpable() ?
          \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
    smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
          \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
    if has('conceal')
      set conceallevel=2 concealcursor=niv
    endif
  endfunction
  call neobundle#untap()
endif

NeoBundle 'Shougo/neosnippet-snippets'

NeoBundle 'Raimondi/delimitMate'
NeoBundle 'gorkunov/smartpairs.vim'

NeoBundle 'pearofducks/ansible-vim'
if neobundle#tap('ansible-vim')
  function! neobundle#tapped.hooks.on_source(bundle)
    let g:ansible_unindent_after_newline = 1
  endfunction
  call neobundle#untap()
endif

NeoBundle 'scrooloose/nerdtree'
nnoremap <silent> - :<C-u>NERDTreeToggle<CR>
nnoremap <silent> <Leader>- :<C-u>NERDTreeFind<CR>
if neobundle#tap('nerdtree')
  function! neobundle#tapped.hooks.on_source(bundle)
    let g:NERDTreeHijackNetrw = 0
    let g:NERDTreeWinSize = 27
    let g:NERDTreeMinimalUI = 1
    let g:NERDTreeChDirMode = 1
    let g:NERDTreeMapCWD = "cd"
    let g:NERDTreeShowHidden = 1
    let g:NERDTreeAutoDeleteBuffer = 1
    let g:NERDTreeMouseMode=3
  endfunction
  call neobundle#untap()
endif

NeoBundle 'ggreer/the_silver_searcher'
NeoBundle 'gabesoft/vim-ags', {
      \   'depends': 'ggreer/the_silver_searcher',
      \   'on_cmd': 'Ags',
      \ }
nmap ,g :Ags

NeoBundle 'w0rp/ale'
if neobundle#tap('ale')
  function! neobundle#tapped.hooks.on_source(bundle)
    let g:ale_sign_column_always = 1
    let g:ale_sign_error = '!!'
    let g:ale_sign_warning = '=='
    highlight clear ALEErrorSign
    highlight clear ALEWarningSign
  endfunction
  call neobundle#untap()
endif

NeoBundle 'tpope/vim-fugitive'

NeoBundle 'tpope/vim-surround', {
      \ 'lazy': 1,
      \ 'mappings': [['n', 'ys', 'ds', 'cs'], ['x', 'S']],
      \ }

NeoBundle 'tpope/vim-rsi'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'bronson/vim-visual-star-search'
NeoBundle 'justinmk/vim-sneak'
if neobundle#tap('vim-sneak')
  function! neobundle#tapped.hooks.on_source(bundle)
    let g:sneak#label = 1
  endfunction
  call neobundle#untap()
endif

NeoBundleLazy 'osyo-manga/vim-anzu', { 'autoload' : {
      \ 'mappings' : [
      \   ['n', '<Plug>(anzu-n-with-echo)'],
      \   ['N', '<Plug>(anzu-N-with-echo)'],
      \   ['*', '<Plug>(anzu-star-with-echo)'],
      \   ['#', '<Plug>(anzu-sharp-with-echo)'],]
      \ }}

NeoBundle 'tpope/vim-commentary', {
      \ 'lazy': 1,
      \ 'mappings': [['nx', 'gc', 'gC']],
      \ }

NeoBundle 'romainl/vim-cool'
NeoBundle 'gregsexton/gitv'
NeoBundle 'junegunn/vim-easy-align'

NeoBundle 'thirtythreeforty/lessspace.vim'
NeoBundle 'mtth/scratch.vim'
NeoBundle 'skywind3000/asyncrun.vim'
nmap ,q :AsyncRun<Space>
if neobundle#tap('skywind3000/asyncrun.vim')
  function! neobundle#tapped.hooks.on_source(bundle)
    autocmd MyAutoGroup QuickFixCmdPost * botright copen 15
  endfunction
  call neobundle#untap()
endif

NeoBundle 'osyo-manga/vim-over'
nmap ,j :OverCommandLine<CR>

if fullBundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :NeoBundleInstall
endif

call neobundle#end()

NeoBundleCheck
