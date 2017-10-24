augroup plugins
  autocmd!
  " File explorer
  autocmd VimEnter * packadd nerdtree
  " Git
  autocmd BufReadPre * packadd vim-fugitive
  autocmd BufRead * packadd git-nerdtree
  autocmd BufRead * packadd vim-gitgutter
  " Lang
  autocmd BufReadPre *.yml packadd ansible-vim
  autocmd BufReadPre *.twig packadd vim-twig
  autocmd BufReadPre,BufRead *.j2 packadd Vim-Jinja2-Syntax
  autocmd BufReadPre,BufRead *.css,scss packadd csscomplete.vim
  autocmd BufReadPre,BufRead * packadd vim-system-copy
  autocmd BufReadPre *.md packadd vim-livedown
  autocmd BufReadPre *.nginx packadd nginx.vim
  " Edit
  autocmd BufReadPre * packadd clever-f.vim
  autocmd BufRead * packadd vim-rsi
  autocmd BufRead * packadd vim-surround
  autocmd BufRead * packadd vim-commentary
  autocmd BufRead * packadd vim-dispatch
  autocmd BufRead * packadd vim-repeat
  autocmd InsertLeave,InsertChange * packadd lessspace.vim
  autocmd BufReadPre,InsertEnter * packadd delimitMate
  autocmd BufRead * packadd vim-cool
  autocmd VimEnter * packadd vim-layout
  autocmd BufRead * packadd vim-niceblock
  autocmd BufRead * packadd vim-easy-align
  " Completion and snippets
  " autocmd InsertEnter * packadd vim-kompleter
  autocmd InsertEnter * packadd supertab
  autocmd InsertEnter * packadd ultisnips
  autocmd InsertEnter * packadd vim-snippets
  " Search
  autocmd BufRead * packadd the_silver_searcher
  autocmd BufRead * packadd vim-ags
  autocmd BufRead * packadd vim-easygrep
  " Lint
  autocmd BufRead * packadd ale
augroup END

