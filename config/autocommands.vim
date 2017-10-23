augroup filetype
  au!
  autocmd BufNewFile,BufRead *Vagrantfile set filetype=ruby
  autocmd FileType jinja setlocal commentstring=#\ %s
augroup END

" omnifuncs
augroup omnifuncs
  au!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd BufNewFile,BufRead *.scss             set ft=scss.css
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

" Minpac
command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update()
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()
nmap ,u :PackUpdate<CR>
nmap ,c :PackClean<CR>

function! s:matchit(...) abort
    if !exists('s:matchit_loaded')
        runtime macros/matchit.vim
        let s:matchit_loaded = 1
    endif
    let default_pairs = [&matchpairs]
    let b:match_words = get(b:, 'match_words', '') . ',' . join(default_pairs, ',') . ',' . join(a:000, ',')
endfunction

