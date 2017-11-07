command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update()
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()

if empty(glob('~/.vim/pack/minpac/opt/'))
  silent !git clone https://github.com/k-takata/minpac.git ~/.vim/pack/minpac/opt/minpac
endif

if exists('*minpac#init')
  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})
 " theme
  call minpac#add('millermedeiros/vim-statline')
  " call minpac#add('Yggdroot/indentLine')

  " files
  call minpac#add('scrooloose/nerdtree', {'type': 'opt'})
  call minpac#add('francoiscabrol/ranger.vim', {'type': 'opt'})
  call minpac#add('junegunn/fzf.vim', {'type': 'opt'})
  call minpac#add('junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' })

  " git
  call minpac#add('tpope/vim-fugitive')
  call minpac#add('airblade/vim-gitgutter', {'type': 'opt'})
  call minpac#add('Xuyuanp/nerdtree-git-plugin')
  call minpac#add('gregsexton/gitv')

  " syntax
  call minpac#add('pearofducks/ansible-vim', {'type': 'opt'})
  call minpac#add('Glench/Vim-Jinja2-Syntax', {'type': 'opt'})
  call minpac#add('othree/csscomplete.vim', {'type': 'opt'})
  call minpac#add('qbbr/vim-twig', {'type': 'opt'})
  call minpac#add('shime/vim-livedown', {'type': 'opt'})
  call minpac#add('chr4/nginx.vim', {'type': 'opt'})

  " enhancemets
  call minpac#add('thirtythreeforty/lessspace.vim', {'type': 'opt'})
  call minpac#add('Raimondi/delimitMate', {'type': 'opt'})
  call minpac#add('tpope/vim-rsi', {'type': 'opt'})
  call minpac#add('tpope/vim-surround')
  call minpac#add('tpope/vim-commentary')
  call minpac#add('tpope/vim-repeat')
  call minpac#add('rhysd/clever-f.vim', {'type': 'opt'})
  call minpac#add('kana/vim-niceblock')
  call minpac#add('junegunn/vim-easy-align')
  call minpac#add('zhamlin/tiler.vim', {'type': 'opt'})

  " " completion
  call minpac#add('dirkwallenstein/vim-autocomplpop', {'type': 'opt'})
  call minpac#add('KeyboardFire/vim-minisnip', {'type': 'opt'})
  call minpac#add('vim-scripts/L9')

  " linter
  call minpac#add('w0rp/ale', {'type': 'opt'})

  " search
  call minpac#add('yegappan/greplace', {'type': 'opt'})
  call minpac#add('jremmen/vim-ripgrep')

endif

if !has('vim_starting')
  syntax enable
  filetype plugin indent on
endif
