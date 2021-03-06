scriptencoding utf-8

AutoCmd Filetype yaml packadd ale
AutoCmd FileType ansible packadd ale
AutoCmd FileType vim packadd ale
AutoCmd FileType jinja packadd ale
AutoCmd FileType css packadd ale
AutoCmd FileType scss packadd ale
AutoCmd FileType javascript packadd ale
AutoCmd FileType php packadd ale
AutoCmd FileType ruby packadd ale
AutoCmd FileType json packadd ale
AutoCmd FileType coffee packadd ale
AutoCmd FileType html packadd ale
AutoCmd FileType twig packadd ale

let g:ale_sign_error = '→'
let g:ale_sign_warning = '→'

let g:ale_fixers = {
\   'javascript': ['eslint'],
\}
let g:ale_fix_on_save = 1
let g:ale_linters = {
      \ 'html': ['eslint'],
      \ 'twig': ['eslint'],
      \ 'html.twig': ['eslint']
      \}
let g:ale_linter_aliases = {
      \ 'html': 'javascript',
      \ 'twig': 'javascript',
      \ 'html.twig': 'javascript'
      \}
" let g:ale_linters = {'twig': ['eslint']}
" let g:ale_linter_aliases = {'twig': 'javascript'}
