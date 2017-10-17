" Vim 8 defaults
unlet! skip_defaults_vim
silent! source $VIMRUNTIME/defaults.vim

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
  " call minpac#add('rafi/vim-tinyline')
  " call minpac#add('t9md/vim-ezbar')
  " call minpac#add('itchyny/lightline.vim')

  "Tree/Files
  call minpac#add('scrooloose/nerdtree', {'type': 'opt'})
  call minpac#add('Xuyuanp/git-nerdtree', {'type': 'opt'})
  call minpac#add('francoiscabrol/ranger.vim', {'type': 'opt'})
  call minpac#add('ctrlpvim/ctrlp.vim')

  "Syntax
  call minpac#add('pearofducks/ansible-vim', {'type': 'opt'})
  call minpac#add('Glench/Vim-Jinja2-Syntax', {'type': 'opt'})
  call minpac#add('qbbr/vim-twig', {'type': 'opt'})
  call minpac#add('shime/vim-livedown', {'type': 'opt'})
  call minpac#add('chr4/nginx.vim', {'type': 'opt'})

  " Others
  call minpac#add('Yggdroot/indentLine')
  call minpac#add('thirtythreeforty/lessspace.vim', {'type': 'opt'})
  call minpac#add('Raimondi/delimitMate', {'type': 'opt'})
  call minpac#add('tpope/vim-rsi', {'type': 'opt'})
  call minpac#add('tpope/vim-surround', {'type': 'opt'})
  call minpac#add('tpope/vim-commentary', {'type': 'opt'})
  call minpac#add('tpope/vim-repeat', {'type': 'opt'})
  call minpac#add('romainl/vim-cool', {'type': 'opt'})
  call minpac#add('rhysd/clever-f.vim', {'type': 'opt'})
  call minpac#add('airblade/vim-gitgutter', {'type': 'opt'})
  call minpac#add('tpope/vim-dispatch', {'type': 'opt'})
  call minpac#add('kana/vim-niceblock', {'type': 'opt'})
  call minpac#add('junegunn/vim-easy-align', {'type': 'opt'})


  " Completion
  " call minpac#add('Shougo/neocomplcache.vim', {'type': 'opt'})
  call minpac#add('lifepillar/vim-mucomplete', {'type': 'opt'})

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
colorscheme onedark
hi Comment cterm=italic

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

" function! s:matchit(...) abort
"     if !exists('s:matchit_loaded')
"         runtime macros/matchit.vim
"         let s:matchit_loaded = 1
"     endif
"     let default_pairs = [&matchpairs]
"     let b:match_words = get(b:, 'match_words', '') . ',' . join(default_pairs, ',') . ',' . join(a:000, ',')
" endfunction

