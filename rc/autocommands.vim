augroup plugins
  autocmd!
  autocmd VimEnter * packadd nerdtree
  autocmd BufRead * packadd git-nerdtree
  autocmd BufReadPre *.yml packadd ansible-vim
  autocmd BufReadPre *.twig packadd vim-twig
  autocmd BufReadPre *.jinja packadd vim-Jinja2-Syntax
  autocmd BufReadPre *.md packadd vim-livedown
  autocmd BufReadPre *.nginx packadd nginx.vim
  autocmd BufRead * packadd vim-rsi
  autocmd BufRead * packadd vim-surround
  autocmd BufRead * packadd vim-commentary
  autocmd BufRead * packadd vim-dispatch
  autocmd BufRead * packadd vim-repeat
  autocmd BufReadPre * packadd vim-fugitive
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
augroup END

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

command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update()
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()
nmap ,u :PackUpdate<CR>
nmap ,c :PackClean<CR>
