if empty(glob('~/.vim/pack/minpac/opt/'))
  silent !git clone https://github.com/k-takata/minpac.git ~/.vim/pack/minpac/opt/minpac
endif

set packpath^=~/.vim
silent! packadd minpac

if exists('*minpac#init')
  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})

 " files
  call minpac#add('scrooloose/nerdtree', {'type': 'opt'})
  call minpac#add('francoiscabrol/ranger.vim', {'type': 'opt'})
  call minpac#add('ctrlpvim/ctrlp.vim', {'type': 'opt'})

  " git
  call minpac#add('tpope/vim-fugitive')
  call minpac#add('Xuyuanp/nerdtree-git-plugin')
  call minpac#add('airblade/vim-gitgutter', {'type': 'opt'})

  " syntax
  call minpac#add('Glench/Vim-Jinja2-Syntax', {'type': 'opt'})
  call minpac#add('lumiliet/vim-twig', {'type': 'opt'})
  call minpac#add('othree/html5.vim', { 'type': 'opt' })
  call minpac#add('gabrielelana/vim-markdown', {'type': 'opt'})
  call minpac#add('chr4/nginx.vim', {'type': 'opt'})
  call minpac#add('dag/vim-fish', { 'type': 'opt' })
  call minpac#add('pocke/iro.vim', { 'type': 'opt' })
  call minpac#add('kchmck/vim-coffee-script', { 'type': 'opt' })
  call minpac#add('othree/yajs.vim', { 'type': 'opt' })

  " enhancemets
  call minpac#add('itchyny/vim-parenmatch', {'type': 'opt'})
  call minpac#add('jiangmiao/auto-pairs', {'type': 'opt'})
  call minpac#add('tpope/vim-rsi', {'type': 'opt'})
  call minpac#add('tpope/vim-surround', {'type': 'opt'})
  call minpac#add('tpope/vim-commentary', {'type': 'opt'})
  call minpac#add('tpope/vim-repeat', {'type': 'opt'})
  call minpac#add('kana/vim-niceblock', {'type': 'opt'})
  call minpac#add('lumiliet/vim-smart-object', { 'type': 'opt' })
  call minpac#add('junegunn/vim-easy-align', {'type': 'opt'})
  call minpac#add('editorconfig/editorconfig-vim', {'type': 'opt'})
  call minpac#add('vimplugin/project.vim', {'type': 'opt'})
  call minpac#add('sgur/cmdline-completion', {'type': 'opt'})
  call minpac#add('henrik/vim-indexed-search', { 'type': 'opt' })
  " call minpac#add('rodrigoperazzo/vim-whitespaces', { 'type': 'opt' })
  " call minpac#add('adonis0147/prettyGuides', { 'type': 'opt' })

  " completion
  call minpac#add('Shougo/neocomplete.vim', {'type': 'opt'})
  call minpac#add('Shougo/neco-syntax', { 'type': 'opt' })
  call minpac#add('KeyboardFire/vim-minisnip', { 'type': 'opt' })

  " linter
  call minpac#add('w0rp/ale', { 'type': 'opt' })

  " search
  call minpac#add('gabesoft/vim-ags', { 'type': 'opt' })
endif

if has('gui_running')
  set guioptions=Mc
endif

com! PackClean     packadd minpac | call minpac#clean()
com! PackUpdate    packadd minpac | call minpac#clean() | call minpac#update()

if has('autocmd')
  filetype plugin on
  filetype indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif
