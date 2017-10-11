augroup plugins
  autocmd!
  autocmd VimEnter * packadd nerdtree
  autocmd VimEnter * packadd ranger.vim
  autocmd VimEnter * packadd toogle-maximize.vim
  autocmd BufRead * packadd git-nerdtree
  autocmd BufReadPre *.yml packadd ansible-vim
  autocmd BufReadPre *.twig packadd vim-twig
  autocmd BufReadPre *.jinja packadd vim-Jinja2-Syntax
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
  autocmd BufReadPre,InsertEnter * packadd vim-AutoCorrect
  " autocmd InsertEnter * packadd completor.vim | CompletorEnable
  autocmd InsertEnter * packadd neocomplcache.vim
  autocmd BufRead * packadd the_silver_searcher
  autocmd BufRead * packadd vim-ags
  autocmd BufRead * packadd vim-cool
  autocmd BufRead * packadd vim-gitgutter
  autocmd BufRead * packadd ale
  autocmd BufRead * packadd ttoc_vim
  autocmd BufRead * packadd tcommand_vim
augroup END

" omnifuncs
augroup omnifuncs
  au!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
  autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
augroup end

" Cursor shape
if has('vim_starting')
  let &t_SI .= "\e[6 q"
  let &t_EI .= "\e[2 q"
  let &t_SR .= "\e[4 q"
endif

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
