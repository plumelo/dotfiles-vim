if &compatible
  set nocompatible
endif

set shell=sh

set packpath^=~/.vim
silent! packadd minpac

if empty(glob('~/.vim/pack/minpac/opt/'))
  silent !git clone https://github.com/k-takata/minpac.git ~/.vim/pack/minpac/opt/minpac
endif

if exists('*minpac#init')
  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  "Theme
  call minpac#add('rafi/vim-tinyline')

  "Tree/Files
  call minpac#add('scrooloose/nerdtree', {'type': 'opt'})
  call minpac#add('Xuyuanp/git-nerdtree', {'type': 'opt'})
  call minpac#add('ctrlpvim/ctrlp.vim')

  "Syntax
  call minpac#add('pearofducks/ansible-vim', {'type': 'opt'})
  call minpac#add('Glench/Vim-Jinja2-Syntax', {'type': 'opt'})
  call minpac#add('qbbr/vim-twig', {'type': 'opt'})
  " call minpac#add('iamcco/markdown-preview.vim', {'type': 'opt'})
  call minpac#add('shime/vim-livedown', {'type': 'opt'})
  " call minpac#add('iamcco/mathjax-support-for-mkdp')

  " Others
  call minpac#add('thirtythreeforty/lessspace.vim', {'type': 'opt'})
  call minpac#add('Raimondi/delimitMate', {'type': 'opt'})
  call minpac#add('tpope/vim-rsi', {'type': 'opt'})
  call minpac#add('tpope/vim-surround', {'type': 'opt'})
  call minpac#add('tpope/vim-commentary', {'type': 'opt'})
  call minpac#add('tpope/vim-repeat', {'type': 'opt'})
  call minpac#add('romainl/vim-cool', {'type': 'opt'})
  call minpac#add('mhinz/vim-signify', {'type': 'opt'})
  call minpac#add('thinca/vim-zenspace', {'type': 'opt'})
  call minpac#add('tpope/vim-dispatch', {'type': 'opt'})
  call minpac#add('google/vim-searchindex', {'type': 'opt'})
  call minpac#add('tomtom/ttoc_vim', {'type': 'opt'})
  call minpac#add('tomtom/tcommand_vim', {'type': 'opt'})
  call minpac#add('tomtom/tlib_vim')

  " Completion
  call minpac#add('maxboisvert/vim-simple-complete', {'type': 'opt'})

  " Git
  call minpac#add('tpope/vim-fugitive', {'type': 'opt'})

  " Linter
  call minpac#add('w0rp/ale', {'type': 'opt'})

  " Search
  call minpac#add('ggreer/the_silver_searcher', {'type': 'opt'})
  call minpac#add('gabesoft/vim-ags', {'type': 'opt'})

endif

filetype plugin indent on
syntax on
colorscheme smyck
hi Comment cterm=italic
hi PmenuSel cterm=reverse ctermfg=33 ctermbg=222 gui=reverse guifg=#3399ff guibg=#f0e68c

if has('termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

if &encoding !=? 'utf-8'
  let &termencoding = &encoding
  set encoding=utf-8
endif

scriptencoding utf-8
set guioptions-=M

set ignorecase smartcase incsearch hlsearch
set shiftround softtabstop=-1 shiftwidth=0 tabstop=2 expandtab
set backspace=indent,eol,start whichwrap=b,s,<,>,[,] nostartofline
set list listchars=tab:▸\ ,trail:.
set sidescroll=1 sidescrolloff=1 cursorline
set splitbelow splitright switchbuf& switchbuf+=useopen hidden
set completeopt-=longest
set completeopt+=menuone
set completeopt-=menu
set completeopt-=preview
if &completeopt !~# 'noinsert\|noselect'
  set completeopt+=noselect
endif
set wildmenu wildmode=longest,full
set timeoutlen=1000 ttimeoutlen=50 lazyredraw
set noswapfile nobackup viminfo='500,<500,s50,h,rA:,rB:
set number mouse=a
set laststatus=2

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

" konsole change cursor on insert mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Close immediately by q, set non-modifiable settings
augroup quick
  autocmd!
  autocmd FileType help,qf,man,ref nnoremap <buffer> q :q!<CR>
  autocmd FileType help,qf,man,ref setlocal nospell ts=8 nolist ro nomod noma
augroup END

" " Jump to last known cursor position
if has("autocmd")
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line ("'\"") <= line("$") |
        \   exe "normal! g'\"" |
        \ endif
endif

" Quick edit vimrc in a new vertical split
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" Functions
" Automatically reload vimrc file
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

" Toggle between relative line numbering and normal
function! NumberToggle()
  if &relativenumber
    set number
    set norelativenumber
  else
    set relativenumber
    set nonumber
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>

augroup plugins
  autocmd!
  autocmd VimEnter * packadd nerdtree
  autocmd BufRead * packadd git-nerdtree
  autocmd BufReadPre *.yml packadd ansible-vim
  autocmd BufReadPre *.twig packadd vim-twig
  autocmd BufReadPre *.jinja packadd vim-Jinja2-Syntax
  autocmd BufReadPre *.md packadd vim-livedown
  autocmd BufRead * packadd vim-rsi
  autocmd BufRead * packadd vim-surround
  autocmd BufRead * packadd vim-commentary
  autocmd BufRead * packadd vim-dispatch
  autocmd BufReadPre * packadd vim-fugitive
  autocmd BufRead * packadd vim-repeat
  autocmd InsertLeave,InsertChange * packadd lessspace.vim
  autocmd BufReadPre,InsertEnter * packadd delimitMate
  autocmd InsertEnter * packadd vim-simple-complete
  autocmd BufRead * packadd the_silver_searcher
  autocmd BufRead * packadd vim-ags
  autocmd BufRead * packadd vim-cool
  autocmd BufRead * packadd vim-signify
  autocmd BufRead * packadd ale
  autocmd BufRead * packadd ttoc_vim
  autocmd BufRead * packadd tcommand_vim
  autocmd BufRead * packadd vim-searchindex

	command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update()
	command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()

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

" Slash
if has('timers')
  " Blink 2 times with 50ms interval
  noremap <expr> <plug>(slash-after) slash#blink(2, 50)
endif
