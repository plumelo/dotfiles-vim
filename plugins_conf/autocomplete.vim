Plug 'Shougo/neocomplete.vim'

" Better Completion
set complete=.,w,b,u,t
set completeopt=longest,menuone

let g:neocomplete#enable_at_startup = 1
let g:neocomplete#auto_completion_start_length = 1
let g:neocomplete#sources#buffer#cache_limit_size = 500000
let g:neocomplete#data_directory = $HOME.'/.vim/cache/neocompl'
let g:neocomplete#min_keyword_length = 4
let g:neocomplete#sources#syntax#min_keyword_length = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_fuzzy_completion = 0
let g:neocomplete#enable_refresh_always = 1

augroup omnicomplete
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup END
