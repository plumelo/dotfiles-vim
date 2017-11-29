scriptencoding utf-8
autocmd FileType yaml call ondemand#linting()
autocmd FileType ansible call ondemand#linting()
autocmd FileType vim call ondemand#linting()
autocmd FileType jinja call ondemand#linting()
autocmd FileType css call ondemand#linting()
autocmd FileType scss call ondemand#linting()
autocmd FileType javascript call ondemand#linting()
autocmd FileType php call ondemand#linting()
autocmd FileType ruby call ondemand#linting()
" autocmd BufReadPre,BufRead *.yml packadd vim-ansible-yaml | set filetype=ansible
autocmd BufReadPre,BufRead *.yml packadd vim-yaml
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

let g:ags_agexe = 'ag'

let g:indentLine_char = ''
let g:indentLine_enabled = 0
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '·'
let g:indentLine_fileType = ['ansible', 'yaml', 'javascript', 'twig', 'scss', 'css', 'html', 'php']
