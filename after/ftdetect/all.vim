autocmd BufReadPre,BufNewFile *.vim,.yaml,.jinja,.ansible call ondemand#linting()
" autocmd BufReadPre,BufRead *.yml packadd ansible-vim
autocmd BufReadPre,BufRead *.yml packadd vim-ansible-yaml
let g:ansible_unindent_after_newline = 1
autocmd BufReadPre,BufRead *.twig packadd vim-twig
autocmd BufReadPre,BufRead *.j2 packadd Vim-Jinja2-Syntax
autocmd BufReadPre,BufRead *.css,scss packadd csscomplete.vim
autocmd BufReadPre,BufRead *.md packadd vim-markdown
autocmd BufReadPre,BufRead *.nginx packadd nginx.vim
autocmd BufReadPre,BufRead *.fish packadd vim-fish

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" editorconfig
let g:EditorConfig_core_mode = 'python_builtin'

" matchparen
let g:loaded_matchparen = 1

