augroup plugins
  autocmd!
  autocmd VimEnter * packadd nerdtree
  autocmd BufRead * packadd git-nerdtree
  autocmd BufReadPre *.yml packadd ansible-vim
  autocmd BufReadPre *.twig packadd vim-twig
  autocmd BufReadPre,BufRead *.j2 packadd Vim-Jinja2-Syntax
  autocmd BufReadPre,BufRead * packadd vim-system-copy
  autocmd BufReadPre *.md packadd vim-livedown
  autocmd BufReadPre *.nginx packadd nginx.vim
  autocmd BufReadPre * packadd clever-f.vim
  autocmd BufRead * packadd vim-rsi
  autocmd BufRead * packadd vim-surround
  autocmd BufRead * packadd vim-commentary
  autocmd BufRead * packadd vim-dispatch
  autocmd BufRead * packadd vim-repeat
  autocmd BufReadPre * packadd vim-fugitive
  autocmd InsertLeave,InsertChange * packadd lessspace.vim
  autocmd BufReadPre,InsertEnter * packadd delimitMate
  autocmd InsertEnter * packadd vim-autocomplpop
  autocmd InsertEnter * packadd vim-localcomplete
  autocmd BufRead * packadd the_silver_searcher
  autocmd BufRead * packadd vim-ags
  autocmd BufRead * packadd vim-cool
  autocmd BufRead * packadd vim-gitgutter
  autocmd BufRead * packadd ale
  autocmd BufRead * packadd vim-niceblock
  autocmd BufRead * packadd vim-easy-align
  autocmd VimEnter * packadd tiler.vim
augroup END


