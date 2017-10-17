augroup plugins
  autocmd!
  autocmd VimEnter * packadd nerdtree
  autocmd VimEnter * packadd ranger.vim
  autocmd BufRead * packadd git-nerdtree
  autocmd BufReadPre *.yml packadd ansible-vim
  autocmd BufReadPre *.twig packadd vim-twig
  autocmd BufReadPre,BufRead *.j2 packadd Vim-Jinja2-Syntax
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
  autocmd InsertEnter * packadd vim-mucomplete
  autocmd BufRead * packadd the_silver_searcher
  autocmd BufRead * packadd vim-ags
  autocmd BufRead * packadd vim-cool
  autocmd BufRead * packadd vim-gitgutter
  autocmd BufRead * packadd ale
  autocmd BufRead * packadd vim-niceblock
  autocmd BufRead * packadd vim-easy-align
augroup END

augroup filetype
  au!
  autocmd BufNewFile,BufRead *Vagrantfile set filetype=ruby
augroup END

" omnifuncs
augroup omnifuncs
  au!
  autocmd FileType css,scss setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
  autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
augroup end

augroup cursorline
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
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

" Statusline
function! s:statusline_expr()
  let mod = "%{&modified ? '[+] ' : !&modifiable ? '[x] ' : ''}"
  let ro  = "%{&readonly ? '[RO] ' : ''}"
  let ft  = "%{len(&filetype) ? '['.&filetype.'] ' : ''}"
  let fug = "%{exists('g:loaded_fugitive') ? fugitive#head() : ''}"
  let sep = ' %= '
  let pos = ' %-12(%l : %c%V%) '
  let pct = ' %P'

  return '[%n] %f %<'.mod.ro.ft.fug.sep.pos.'%*'.pct
endfunction
let &statusline = s:statusline_expr()

command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update()
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()
nmap ,u :PackUpdate<CR>
nmap ,c :PackClean<CR>

" Initial message
augroup InitialMessage
  autocmd!
  autocmd VimEnter * echo "vasy enjoy vimming!"
augroup END
